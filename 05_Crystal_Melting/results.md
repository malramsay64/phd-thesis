# Results

While one of the main goals of this thesis
is to understand the slow crystal growth associated with glass formation,
one of the notable results is the complete lack of any crystal growth.
Because of the lack of crystal growth,
crystal structures for the trimer molecule
have been found using an isopointal search algorithm, [@Jennings2015]
finding the best hard packing of the shape.
It is assumed that the optimal hard packing
closely matches the crystal structure of the Lennard Jones potential.
Comparing the packing fraction of each structure
with the resulting potential energy, [@tbl:potential_energy]
the best packed structure (p2gg) does not have the lowest potential energy,
with that going to the p2 structure.
The worst packed structure (pg) has the highest potential energy
which is in line with our expectations.

Crystal| Packing Fraction |Potential Energy per Molecule
-------| ---------------- |-------------
p2     | 0.938            | -0.198
p2gg   | 0.945            | -0.190
pg     | 0.927            | -0.084

Table: The potential energy for each molecule for the crystal structures with the best
packing fractions. The potential energy was evaluated at a temperature of 0.1 and
a pressure of 1.00. {#tbl:potential_energy}

## Transport Coefficients

Both the Wilson--Frenkel and the Semi-empirical density functional theories of growth
include a term for a transport coefficient,
which is normally the diffusion constant $D$.

The crystallisation of the Lewis--Wahnström model [@Pedersen2011]
uses the structural relaxation time $\tau_S$
as the characteristic timescale.
As discussed in @sec:coupling-of-translational-and-rotational-motion
the Trimer model has a breakdown in the Stokes--Einstein--Debye relations
meaning there are different temperature dependences
for the structural, rotational, and diffusive relaxation times.
Crystallisation is dominated by short range motions,
particles translating to the nearest crystal site
or rotating to match orientation with the rest of the particles.
This means that although the short timescale relaxation times
of the structural relaxation $\tau_S$ and rotational relaxation $\tau_R$
are dominated by jump dynamics,
their timescale best represents the process of crystallisation.

When comparing the timescales of the Lewis--Wahnström model (LW)
to that of the trimer, (@tbl:relaxation_timescales)
there is a noticeable difference
in the ratio of the rotational and structural relaxations.
The LW model has a rotational relaxation time about half
of the structural relaxation time,
while the Trimer has a structural relaxation
about half of the rotational relaxation.
For the Trimer, the rotational motion
is the limiting contributor to the relaxations
so it makes sense to use that as characteristic timescale.

Model                  | $\tau_S$ (s)   | $\tau_R$ (s)
------                 |----------   |---------
LW [@Pedersen2011]     | \num{2e-8}  | \num{8.7e-9}
Trimer [@sec:Dynamics] | \num{2.3e-7} | \num{5.6e-7}

Table: Comparison of the structural and rotational relaxation times
of the Lewis--Wahnström (LW) and Trimer molecules.
The values for the Lewis--Wahnström model
and are for a simulation with a density of \SI{1.135}{\gram\per\milli\liter}
and at \SI{375}{\kelvin}, well below the melting point of 816 K.
The value for the Trimer are at a pressure of \num{1.00}
and temperature of \num{0.36} being the melting point.
The real units are to model ortho-terphenyl as presented in @Pedersen2011. {#tbl:relaxation_timescales}

The timescales presented in @tbl:relaxation_timescales
are at very different temperature ranges
since that is the data available in publications.
However the significantly longer relaxation timescales
even when the trimer is at the melting point
do help explaining the lack of crystallisation,
the timescales are beyond the limit of computational simulations.
@Pedersen2011a documents the diffusive timescale
at the melting point of the Lewis--Wahnström model,
allowing for a comparison of the dynamics at the melting point.
The Lewis--Wahnström model has a melting point diffusion constant
of \num{3e-2} in reduced Lennard--Jones units,
while for the Trimer this of \num{1.2e-5}, 2000 times slower.

## Characteristic Temperatures

When studying melting it is important to understand
the range of temperatures over which the melting is well defined.
At the lower bound this is the melting point $T_m$,
the temperature at which the crystal neither melts or grows.
The upper bound of melting is the spinodal point.

In characterising crystal growth
the most important temperature is the melting point $T_m$
at which both the liquid and crystals phases
exist at equilibrium.
That is, the rate of particles attaching to the interface
is equal to the number of particles detaching from the interface.
The melting point can be found through simulation
as the temperature at which the growth rate goes from negative to positive.

In @sec:supercooled_liquids it was discussed that
a liquid can exist as a metastable state below the melting point.
The same is also true of the crystal above the melting point.
At some temperature above the melting point,
the crystal is no longer metastable,
spontaneously melting to form the liquid.
The temperature at which this spontaneous melting occurs
is known as the spinodal temperature.
When a crystal is surrounded by liquid above the melting point,
melting will occur at the liquid--crystal interface.
This interfacial melting is explained by
the Wilson-Frenkel theory of crystal growth.
It is when the melting is not only occurring at the interface,
at many points within the crystal itself
that the temperature is above the spinodal.

Along with the crystal existing as
a metastable state above the melting point.
The liquid exists as a metastable state
below the melting point.
Like the crystal above the melting point,
at some temperature below the melting point,
the liquid will spontaneously crystallise,
another spinodal temperature.

### Spinodal temperature

The melting we are modelling is that which occurs
at the liquid--crystal interface.
The upper limit of the interfacial melting is
the temperature at which the crystal phase is no longer metastable,
where it spontaneously melts.

<div id="fig:spinodal" class="subfigures">

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/melting_disorder_P1.00-T0.55.svg){#fig:melting_disorderA width=45%}
![](../Projects/Crystal_Melting/figures/melting_disorder_P1.00-T0.50.svg){#fig:melting_disorderB width=45%}
<!-- markdownlint-enable MD045 -->

Melting behaviour above (a) and below (b) the spinodal. These are configurations from a
melting simulation at a pressure of 1.0, with (a) at a temperature of 0.55 and (b) at a
temperature of 0.50. While (b) shows defects within the crystal, these are transient,
retuning the crystal to its original structure as they move along the lattice
dimension. This is unlike in (a) where the defects are persistent and support the
propagation of melting in the surrounding crystal.

</div>

Pressure  Spinodal Temperature
-------- ---------------------
1.00            0.55
13.50           2.00

Table: The temperatures at which the spinodal occurs for the crystal structure at both
pressures. {#tbl:crystal_spinodal}

The Spinodal temperatures in @tbl:crystal_spinodal represents
the temperature where is is no longer possible to study melting
at an interface as a result of
nucleation of the liquid phase within the crystal.
This is the temperature at which a simulation of
the crystal phase will spontaneously melt
from the formation of the defects
within the crystal structure.

This is well above the range of melting rates
measured in simulations of 3D systems;

- @Benjamin2015 go up to $T/T_m = 1.06$,
- @Kerrache2008 goes up to $T/T_m = 1.07$,
- @Rozmanov2011 go up to $T/T_m = 1.08$,
- @Jackson2002 go up to $T/T_m = 1.08$, and
- @Ramakrishnan2017 go up to $T/T_m = 1.12$.
- @Iwamatsu1999 observes nucleation at $T/T_m = 1.11$

which are all in agreement with @Abraham1981,
in determining the spinodal of
the 2D Lennard Jones to be $T/T_m = 1.08$

Along with comparable melting studies,
@Lu1998 find the onset homogeneous nucleation,
that is the spinodal temperature,
for a range of metals at $T/T_m = 1.2$.
And as another example
@Norman2002 study rates of nucleation within the crystal
up to $T/T_m = 1.25$.
From a comparison with all these studies
it would appear that the spinodal temperature $T/T_m = 1.6$
is highly unusual and well above any other materials.

### Melting Point

The melting point $T_m$ is the temperature
at which the rate of crystal growth
is the same as the rate of melting---the equilibrium state.
Typically the melting rate is the temperature
at which the measurement of the growth rate
crosses from negative (melting) to positive (growth).
No crystallisation has been observed for this molecule
so the melting rate is the temperature
at which the melting rate is no longer measurable.
I consider the limit of measuring the melting
rate being the removal of a single layer of crystal
over the timescale of the simulation, a rate of \num{1e-6}.
The timescale cannot be extended as a technical limit of HOOMD-blue [@hoomd_counter]
which can only store numbers up to $2^{32}-1$, slightly more than 4 billion.
In concert with the technical limitation
there is a practical limitation with simulations taking multiple weeks to run.

The melting points are tabulated in @Tbl:crystal_melting_point
with the values for the tables extracted
from @fig:melting_point_rates.

Pressure  Melting Point $T_m$
-------- ---------------------
1.00            0.36
13.50           1.35

Table: The melting points of the crystals
for both pressures studied in this thesis. {#tbl:crystal_melting_point}

![The melting rates of the p2 crystal close to the melting point
for pressures of 1.00 and 13.50.
A melting rate of \num{1e-9}
is less than a layer of crystal
over the course of the simulation.
](../Projects/Crystal_Melting/figures/melting_point_rates.svg){width=80% #fig:melting_point_rates}

## Melting Rates

The simulations in @sec:polymorphic-stability show the p2 crystal to be most stable,
so is used for further analysis of the melting rate.
The isotropic melting rate of the p2 crystal
is the chosen metric,
measured using an estimated radius,
found from the volume
by assuming a circular crystal.
@fig:melting_radius shows a linear time dependence
fitting the expected behaviour,
over all temperatures.

![This figure shows the change in the estimated radius of the crystal as a
function of time. The radius is estimated from the volume assuming a circular crystal.
Each set of conditions is repeated five times starting from independent
configurations, which are used to estimate the confidence intervals. The change in
the radius is expected to change linearly, which is reflected in all the data.
](../Projects/Crystal_Melting/figures/melting_radius.svg){#fig:melting_radius}

With the time dependence of the estimated radius
matching the expected linear dependence,
the crystal growth rate is the slope of a linear fit.
@fig:melting_rates shows the growth rates and their respective errors.
The normalisation of the melting point
brings both pressures onto a single curve,
the same result as seen for the dynamic quantities.

This is the observation for temperatures
still well above the melting point.
I will include more temperatures
as the results from the
longer crystal melting simulations are finished.

![The crystal growth rates normalised by the melting point. For clarity a light grey.
These results are for both high and low
pressure melting, which collapse onto the same curve when normalising the temperature by
the melting point.
](../Projects/Crystal_Melting/figures/melting_rates_err.svg){#fig:melting_rates}

The normalisation by the temperature allows
for the comparison between different pressures,
while a normalisation by the dynamics
shows how the process of crystal growth changes
as a function of temperature. [@fig:normalised_melting_fit]
This is now the distance the interface travels
in the relaxation time.
As the temperature decreases the distance
tends to get smaller,
matching the expected behaviour.

## Anomalously Slow Growth Rates

In the study of many different crystals,
the growth rates between the different crystal faces
can vary by as much as three orders of magnitude. [@Reinhart2018;@Burke1988]
This huge difference between growth rates
indicates that the growth of the crystal
is significantly more

In a study of two similar alloys @Tang2013
attributed the difference in crystal growth rates to
the ordering of atoms in the interface,
with the faster glass former displaying ordering
much further from the boundary of the crystal.
This observation is supported by the work of @Reinhart2018
where in studying Janis particles,
the stricter the geometric constraints of the crystal phase,
the slower the growth rate.
While in work on Lennard Jones Particles,
@Burke1988 attribute the slow growth rate of the (111) crystal face
to the degeneracy of fcc and hcp stacking,
with many stacking faults arising during the freezing process as a result.

While the Wilson-Frenkel theory has a characteristic timescale of diffusion
it may be that for more complicated crystal structures,
such as Janus Particles, [@Reinhart2018] clathrates [@Yagasaki2016] and molecular crystals
the diffusion may no longer be the relevant characteristic timescale.
This is important for molecular crystals,
where one of the major results has been the decoupling
of the rotational relaxation time and the diffusion constant,
with the rotational relaxation getting slower much faster than the dynamics.

### Comparison to Lewis--Wahnström

While it is difficult to make a direct comparison to the Lewis--Wahnström model
as there is no data published on crystal melting rates, only growth rates. [@Pedersen2011]
The growth of a Lewis--Wahnström crystal from zero to all 356 molecules in the simulation
occurs over a period of $\approx 5\tau_S$.
The *fastest* melting rate measured for the trimer molecule is $\approx 0.4 \tau_R$
meaning in the same timescale less than 2 layers of the crystal will have melted.
As an estimate, the dynamics of the melting and growth
of the Trimer molecule are at least an order of magnitude slower
than for the Lewis--Wahnström model.

It is interesting to compare the growth of Lennard--Jones discs,
in 2D the crystal forms almost instantaneously, [@cite]
with simulations using binary mixtures to prevent the crystallisation.
In 3D, DJ particles create the crystal far slower
often introducing packing defects.
It is intriguing that this relationship flips for a molecular system.

The 2D molecules are so much slower
as a result of the rotational constraints.
As presented in @sec:Dynamics,
rotational motion is required for translational motion to occur,
and being two dimensional, the trimer can lock up.
In 3D, the rotations are not so constrained,
with alternate degrees of freedom available
to allow further rotation.

The melting rates measured are the slowest melting rates
measured by molecular dynamics simulation.
With simulation timescales orders of magnitude longer
than comparable studies. [@Reinhart2018;@Benjamin2015;@Tang2013;@Yagasaki2016]

## Modelling Melting Rates

Theoretical models of the melting rates
are able to help understand which aspects
of the melting behaviour are important
allowing an explanation of the slow rate of the trimer.
These theories require the difference in enthalpy
between the liquid and crystal
as an estimate of the chemical potential energy.

Pressure:                    1.00   13.50
----------                 ------  ------
Crystal Potential Energy   -1.991  -1.111
Liquid Potential Energy    -1.811  -1.045
Difference $\Delta h_m$    -0.180  -0.066

Table: The potential energy of the liquid and the crystal at the melting point for both
pressures. {#tbl:potential_energy_difference}

### Classical theory

The classical theory of crystal describes growth
normalised by a relaxation time [@eq:normalised_growth].
Using the points from @fig:melting_rates and the values from @tbl:potential_energy_difference,
the unknown parameter $c$ of @eq:normalised_growth was found using the
Levenberg--Marquardt algorithm [@Levenberg1944;@Marquardt1963;@More1978;@Jones2001] for least squares fitting of non-linear functions.
This gives the lines of fit displayed in @fig:normalised_melting_fit.
The parameters of the fit displayed in @tbl:rate_coefficient.

Pressure            $c$
-----------     -----------------
1.0             \num{-0.77(5)}
13.50           \num{-1.5(5)}

Table: The constant defining the rate of crystal growth
for each of the pressures.
These values are obtained from the fitting in
@fig:normalised_melting_fit {#tbl:rate_coefficient}

The lines depicting the fit of
the Wilson-Frenkel theory in @fig:normalised_melting_all
predict significantly slower melting rates
than observed in the simulations
for temperatures $T/T_m > 1.20$.
A possible cause for this would be the onset of spinodal
with the melting occurring throughout the structure,
through this is not observed.
When only looking at the temperatures close to the melting point
[@fig:normalised_melting_zoom]
the data would seem to fit a melting point at 0.97,
slightly lower than was predicted by observing melting.
Without observing crystal growth,
the melting point is going to be an estimated value,
and the current estimate is within the error of the simulations.

:::{class=subfigures id=fig:normalised_melting_fit}

![All the melting rates.](../Projects/Crystal_Melting/figures/normalised_melting_fit.svg){#fig:normalised_melting_all}

![Melting rates which fit the
model.](../Projects/Crystal_Melting/figures/normalised_melting_fit_low.svg){#fig:normalised_melting_zoom}

This normalises both the temperature by the melting point, and the growth rate by the
rotational relaxation. This figure shows the growth rate slowing faster than
can be explained by the dynamics, indicated by the values approaching zero.

:::

### Semi-empirical Density Functional

The incredibly high spinodal point of the trimer,
is indicative of a highly constrained crystal structure
with very little fluctuation.
An analysis of the fluctuations within the structure
can provide more information on this.

Measuring the fluctuation of the Trimer molecule
is done using the Orientational order parameter $O_\theta$

$$ O_\theta = \frac{1}{N} \left\langle \sum_{i=1}^N \cos^2(\theta_i - \theta_0) \right\rangle $$

normalised such that
the mean orientational order of the liquid
$\langle O_\theta \rangle_\text{liquid} = 0$
and the mean orientational order of the crystal
$\langle O_\theta \rangle_\text{crystal} = 1$.
The distributions of these values are shown in @Fig:trimer_fluctuation
where the distribution of the crystal phase
is far narrower than that of the liquid phase,
with very little overlap.

![Distribution of the orientational order parameter $O_\theta$
for the liquid and the crystal phases at the melting point $T=1.35$.
](../Projects/Crystal_Melting/figures/fluctuation_normalised.svg){#fig:trimer_fluctuation width=80%}

Fitting the fluctuation model to the melting rates
gives the curves in @fig:fluctuation_rate.
This predicts the melting over the entire temperature range
interfacial melting was observed.

:::{id=fig:fluctuation_rate class=subfigures}

![fluctuation
modelling](../Projects/Crystal_Melting/figures/fluctuation_rate_fit.svg){width=80%}

![fluctuation
modelling](../Projects/Crystal_Melting/figures/fluctuation_rate_fit_low.svg){width=80%}

The melting rates fitted to the fluctuation model

:::

## Slow Melting Rates

The melting rates of the Trimer are significantly slower
than what is predicted by the classical theory,
yet the ideas are captured by the fluctuation theory.
How is this so different to a Lennard--Jones liquid?
As a point of comparison,
similar calculations for the fluctuations can be made for 2D Lennard-Jones discs,
though a different order parameter is required,
in this case using the hexatic order parameter, [@Strandburg1984;@Tobochnik1982]
indicative of the bond orientational order.
The hexatic order parameter is given as

$$ \psi_6 = \left|\frac{1}{6} \sum_j^n \exp(i 6 \theta)\right| $$

again normalised such that
the mean orientational order of the liquid
$\langle \psi_6 \rangle_\text{liquid} = 0$
and the mean orientational order of the crystal
$\langle \psi_6 \rangle_\text{crystal} = 1$.
The distribution of these values are shown in @Fig:disc_fluctuation.

![Distributions of the hexatic order parameter $\psi_6$
in the 2D Lennard-Jones disc at the melting point $D=0.53$
](../Projects/Crystal_Melting/figures/fluctuation_disc_normalised.svg){#fig:disc_fluctuation width=80%}

The distributions of order parameters
within these two different systems is wildly different.
While the Trimer (@fig:trimer_fluctuation)
has a clear separation of the liquid and crystal phases,
the LJ-Disc (@fig:disc_fluctuation) has a large overlap,
with no clear point distinguishing the two phases.
Additionally the distribution of values within the LJ-Disc
are much wider than that of the Trimer.
A rather interesting feature of the LJ-Disc
is the complexity of the distribution
containing small bumps which deviate from
a Gaussian distribution,
while the Trimer,
despite being a more complex molecule
has a near perfect Gaussian distribution.

Fitting these values to a Gaussian function
allows for a more direct comparison of
the width of the distribution of the order parameter $M$,
allowing it to be expressed as
the curvature of a parabola $\lambda$

$$ P(M) = \sqrt{\frac{\lambda}{2\pi}}
\exp\left[-\frac{\lambda}{2}(M-M_\text{phase})^2\right] $$

where $M_\text{phase}$ is 0 for the liquid, and 1 for the crystal.
These values are tabulated in @Tbl:fluctuation_curvature,
which demonstrates how constrained the Trimer is,
with the curvature of the liquid phase
being larger than the solid phase of the LJ-Disc.

Molecule   Phase  Curvature
-------- ------- ----------
Trimer    Liquid       5.69
Trimer   Crystal    2357.60
LJ-Disc   Liquid       1.26
LJ-Disc  Crystal       2.37

Table: The curvature of the distributions
for the phases of each Molecule. {#tbl:fluctuation_curvature}

These curvatures can be used to create two parabolas,
one for the liquid phase

$$ \omega(M)_\text{liquid} = \frac{\lambda_\text{liquid}}{2} M^2 $$

and another for the solid

$$ \omega(M)_\text{liquid} = \frac{\lambda_\text{crystal}}{2} (M - 1)^2 + \Delta $$

where $\Delta$ is the free energy difference between the two phases
which can be estimated as

$$ \Delta \approx \Delta h_m \left[ 1 - \frac{T}{T_m} \right] $$

and shown in @Fig:fluctuation_harmonic.

:::{id=fig:fluctuation_harmonic class=subfigures}

![LJ-Disc](../Projects/Crystal_Melting/figures/fluctuation_parabola_disc.svg){width=40%}
![Trimer](../Projects/Crystal_Melting/figures/fluctuation_parabola_trimer.svg){width=40%}

A harmonic description of the fluctuations
demonstrating the large difference between
the LJ-Disc and the Trimer.

:::

The intersection of these two parabolas $M_c$
is at 0.95 for the Trimer and 0.42 for the LJ-Disc.

Describing the motion of crystal growth
as the motion of a configuration along the curve $\omega(M)$,
such that it has to pass through the transition state at $M_c$,
we can use describe the fractions of particles
able to make the transition
as a method of comparing the growth rates.
For the Trimer the fraction is 0.18%,
far less than the 34% of the LJ-Disc.
