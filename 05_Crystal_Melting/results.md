# Results

## Stability of Crystal Phases

The crystal structures for the trimer molecule
have been found using an isopointal search algorithm[@Jennings2015]
which finds the best packing of the shape.
It has been assumed that the structures resulting from
the optimal packing of hard shapes
will be closely related to the lowest energy structures
of the molecules with the Lennard Jones potential.

The best packed structures have the following potential energies

Crystal Packing Fraction Potential Energy per Molecule
------- ---------------- -------------
p2
p2gg
pg

Table: The potential energy for each molecule for the crystal structures with the best
packing fractions. The potential energy was evaluated at a temperature of 0.1 and
a pressure of 1.00. {#tbl:potential_energy}


While the potential energy gives the ground state crystal structure
molecules will often have a range of crystal structures
which are stable in different temperature regimes.
This means evaluating the stability of each of the crystal phases
at the conditions we are interested in.

Additionally another method of finding the most stable crystal
is the crystal which has the highest melting point.
So this is a method of narrowing down the melting point of the crystal.

- Figure: tracking the proportion of each crystal phase in a simulation.

Most notable is the behaviour of the p2gg crystal
which undergoes a solid state phase transition
at a rate which significantly exceeds the melting rate.

The p2 crystal appears to be the lowest energy crystal structure.

## Melting Rates

The above simulations show that the p2 crystal
is the most stable,
so this is the crystal used
for further analysis of the melting rate.
The isotropic melting rate of the p2 crystal
is the chosen metric,
measured using an estimated radius,
found from the volume
by assuming a circular crystal.
@fig:melting_radius shows the time dependence
which is linear,
fitting the expected behaviour,
over all temperatures.

![This figure shows the change in the estimated radius of the crystal as a
function of time. The radius is estimated from the volume assuming a circular crystal.
Each set of conditions is repeated five times starting from independent
configurations, which are used to estimate the confidence intervals. The change in
the radius is expected to change linearly, which is reflected in all the data.
](../Projects/Crystal_Melting/figures/melting_radius.pdf){#fig:melting_radius}

With the time dependence of the estimated radius
matching the expected linear dependence,
the crystal growth rate is the slope of a linear fit.
@fig:growth_rates shows the growth rates and their respective errors.
The normalisation of the melting point
brings both pressures onto a single curve,
which is the same result seen for the dynamic quantities.

This is the observation for temperatures
still well above the melting point.
I will include more temperatures
as the results from the
longer crystal melting simulations are finished.

![The crystal growth rates normalised by the melting point. For clarity a light grey
line has been marked at a growth rate of 0. These results are for both high and low
pressure melting, which collapse onto the same curve when normalising the temperature by
the melting point.
](../Projects/Crystal_Melting/figures/growth_rates_err.pdf){#fig:growth_rates}

The normalisation by the temperature allows
for the comparison between different pressures,
while a normalisation by the dynamics
shows how the process of crystal growth changes
as a function of temperature (@fig:normalised_melting).
This is now the distance the interface travels
in the relaxation time.
As the temperature decreases the distance
tends to get smaller,
which is the expected behaviour.

![This normalises both the temeprature by the melting point, and the growth rate by the
rotational relaxation. This figure shows the growth rate slowing faster than
can be explained by the dynamics, which is indicated by the values approaching zero.
](../Projects/Crystal_Melting/figures/normalised_melting_err.pdf){#fig:normalised_melting}

Theory which describes the temperature dependence of the melting rate,
formulated from a characteristic dynamic timescale of the system
and the chemical potential energy difference between the phases.
The chemical energy difference is often replaced with
the potential energy difference at the melting point.

Pressure:                    1.00   13.50
----------                 ------  ------
Crystal Potential Energy   -1.991  -1.111
Liquid Potential Energy    -1.811  -1.045
Difference $\Delta h_m$    -0.180  -0.066

Table: The potential energy of the liquid and the crystal at the melting point for both
pressures. {#tbl:potential_energy_difference}

Using the results in @tbl:potential_energy_difference
to fit the points in @fig:normalised_melting
gives the curves shown in @fig:normalised_melting,
with each pressure getting a different curve.

The Wilson-Frenkel[@Wilson1900,@Frenkel1926] theory of crystal growth,
describes the velocity $V$ of an interface

$$ V(T) = k(T)[1-\e^{\beta \Delta u}] $$ {#eq:wilson_frenkel_growth}

where $\beta = \frac{1}{k_{\text{B}} T}$
with $k_{\text{B}}$ being the Boltzmann Constant,
and $\Delta u$ being the change in chemical potential.
A standard method @Tang2013 of estimating the chemical potential $\Delta u$ is

$$ \Delta u = \frac{(T_m - T) \Delta h_m}{T_m} $$

allowing, with some rearrangement, to express @eq:wilson_frenkel_growth as

$$ V(T^*)\tau_C(T^*) = c\left [ 1-\exp{\frac{(1-T^*)\Delta h_m}{T^*}} \right ]$$ {#eq:normalised_growth}

where $T^* = T/T_m$ the normalised temperature,
$c$ is a constant
$\Delta h_m$ is the free energy from the liquid to the crystal
at the melting point,
$V(T^*)$ is the velocity of the interface,
and $\tau_C(T^*)$ is the crystallisation rate.
This represents a theoretical description
of the points in @fig:normalised_melting.

Using the points from @fig:normalised_melting
and the values from @tbl:potential_energy_difference,
the unknown parameter of @eq:normalised_growth
was found using the Levenberg-Marquardt algorithm [@Levenberg1944,@Marquardt1963,@More1978,@Jones2001],
for least squares fitting of non-linear functions.
This gives the lines of fit in @fig:normalised_melting.

The lines depicting the fit of
the Wilson-Frenkel theory in @fig:normalised_melting
deviate from the data in a some significant ways.
Firstly, while it appears
that both pressures display a single melting rate curve
from the simulation data,
the theory displays two separate curves,
reflecting the different potential energy differences $\Delta h_m$
of the crystal and liquid at the melting point.
Secondly, the shape of each of the curves
is not a good fit for either dataset,
with the concavity of the data
not matching that of the curves based on the theoretical result.
The higher temperature values $T/T_m > 1.50$
emphasise the poorness of the fit,
with results that are a long way from the theoretical value,
suggesting that the Wilson-Frenkel theory
doesn't describe the high temperature melting dynamics
of this liquid.

An alternative method for the analysis
of the theoretical values
is to fit both the constant $c$ and the free energy difference $\Delta h_m$
in @eq:normalised_growth
to the collected data.
When using the Levenberg-Marquardt algorithm for the fit
taking into account the uncertainty of each point
gives a value for the free energy difference
close to the experimental value.
This highlights that while the high temperature values
are a long way from the expected theoretical value,
they also have a correspondingly large uncertainty.
