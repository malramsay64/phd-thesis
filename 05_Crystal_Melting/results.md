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

### Polymorphic Stability

While the potential energy calculations give some idea
of the most stable polymorph,
it would still be useful to compare each of the crystals.

<!-- TODO -->
fig: Comparison of melting rates

![Monitoring the proportion of each crystal within the p2gg crystal at a temperature of
1.37 and a pressure of 13.50 which is just above the melting point of 1.36. Tracking all
the different crystals within the configuration shows a transition of the p2gg crystal
structure to the p2 crystal structure.
](../Projects/Crystal_Melting/figures/solid_state_transition-P13.50-T1.37-p2gg.pdf){#fig:solid_state_transition width=80%}

The most notable behaviour of the crystal structures,
is the solid state phase transition
that takes place within the p2gg crystal.
The majority of the p2gg crystal phase
is converted to the p2 crystal
at a rate significantly faster than melting.
The phase transition takes place
on a timescale similar to that of the rotational relaxation time.
The Trimer at a temperature $T=1.37$ and pressure $P=13.50$,
has a rotational relaxation time $\tau_R = \num{5.4e6}$,
a timescale over which half the crystal
has undergone the phase transition.
This only possible explanation
for this transition to occur so quickly
is some highly co-ordinated rearrangements.
Another feature of the transition,
is that after the initial transformation,
there are periods of no change
followed by short periods of quick change,
resulting in a stepped pattern
---between \num{1e7} and \num{3e7} timesteps in @fig:solid_state_transition.

<div id="fig:solid_state_transition_structure" class="subfigures">

![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.37-p2gg_init.pdf){#fig:transition_init width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.37-p2gg_process.pdf){#fig:transition_process width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.37-p2gg_end.pdf){#fig:transition_end width=33%}

The process of the solid state phase transition with the colouring denoting the
identified crystal structure. The liquid is blue, the p2 crystal is yellow, the pg
crystal is red and the p2gg crystal is green. The initial configuration (a), shows the
entire central crystal classified as p2gg, with some patches of p2 around the border.
After 4 million timesteps (b), there are now large regions which have been converted to
the p2 crystal structure. In the final configuration (c) the only remaining p2gg crystal
are grain boundaries between the layers of p2 crystals.

</div>

The phase change process can be better understood
by observing how it takes place,
shown in @fig:solid_state_transition_structure.
This shows the rearrangement
for the solid state transition
takes place along the horizontal layers of the crystal.
@Fig:transition_process shows three layers
undergoing the transition,
which started on the right had side,
and are propagating to the left.
This does help explain both
the incredible rate at which the transition takes place
as well as its step-like nature.
Once a single pair of molecules
switches orientations,
from the four layer p2gg structure
to the two layer p2 structure,
this must lower the barrier
for neighbouring pairs of molecules
to undergo this same transformation,
leading to the propagation along
the crystal axis.
Once the initial fast transformation has taken place
there are a smaller number of p2gg molecules
which are able to initialise the phase transition,
resulting in periods of waiting for a 'nucleation' event,
followed by the rapid propagation across the crystal.

Also of note is that there is
no preferred direction for
the solid state transformation.
In the final configuration (@fig:transition_end),
there are still three rows of the p2gg crystal,
which are grain boundaries between
layers of the p2 crystal with different orientations.

While the p2 and the p2gg polymorphs
have relatively comparable melting rates,
mostly as a result of the p2gg structure
undergoing a solid state transition to
the p2 structure,
the pg polymorph has a significantly faster melting rate.
Understanding this may provide some insight
into the phenomenally slow growth rates of the p2 crystal.

<div id="fig:pg_melting" class="subfigures">

![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.42-pg_0.pdf){#fig:pg_melting_0 width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.42-pg_1.pdf){#fig:pg_melting_1 width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.42-pg_2.pdf){#fig:pg_melting_2 width=33%}

This shows the melting of the pg crystal shown in red,
with the liquid shown in blue.
Trace amounts of the p2 and the p2gg crystal
are shown in yellow and green respectively.
This shows the melting from the initial crystal (a),
after \num{2e8} timesteps (b)
and after \num{4e8} timesteps (C).
While the bottom of the crystal melts,
the top layer remains the same throughout.

</div>

@Fig:pg_melting shows configurations
from the melting of the pg crystal,
which shows highly directional melting
of the pg crystal.
In the same time the crystal has melted
the bottom 30 layers (from @fig:pg_melting_0 to @fig:pg_melting_2),
the top layer of the crystal
has remained completely intact,
containing the same molecules as the initial configuration.
So what is the difference between these two faces?

<div id="fig:pg_crystal" class="subfigures">

![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.42-pg_bottom_0.pdf){#fig:pg_crystal_bottom width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.42-pg_top_0.pdf){#fig:pg_crystal_top width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.42-pg_top_2.pdf){#fig:pg_crystal_top_end width=33%}

The structure at the top and bottom of the pg crystal

</div>

The primary difference between
the top and the bottom of the pg crystal,
is the face of the molecule exposed to the liquid.
With the rounded back on the top
and the flatter front on the bottom.
In both the top and the bottom,
molecules are locked in the concavities,
configurations which are fairly similar.
Another possible clue
comes from the shape of the crystal after melting.
@Fig:pg_melting_1 has a crystal shaped like
an arrow pointed downwards,
indicating the melting starts at
the bottom left and right corners
of the crystal.
While it does makes sense
that the corners are 'weak spots'
in the crystal structure
from which the disorganisation of the crystal
has a lower barrier.
It still doesn't entirely explain
the difference between the bottom corners
and the top corners.

Looking past the crystal
to the first layer of the liquid,
the layer of liquid above the top (@fig:pg_crystal_top)
has much more orientational order
than the layer below the bottom (@fig:pg_crystal_bottom).
The orientational order observed
at the start of the simulation
persists throughout the simulation,
still remaining after \num{4e8} timesteps (@fig:pg_crystal_top_end).

### Spinodal

The melting we are studying that which occurs
at the liquid--crystal interface.
This interfacial melting occurs
from the melting point up to the spinodal Temperature,
where the crystal phase is no longer metastable
and starts breaking apart from within.
Before modelling the melting rate over a range of temperatures,
we need the temperature range which displays the expected melting behaviour.

<div id="fig:spinodal" class="subfigures">

![](Projects/Crystal_Melting/figures/melting_disorder_P100-T075.pdf){#fig:melting_disorderB width=45%}
![](Projects/Crystal_Melting/figures/melting_disorder_P100-T060.pdf){#fig:melting_disorderA width=45%}

Melting behaviour above (a) and below (b) the spinodal. These are configurations from a
melting simulation at a pressure of 1.0, with (a) at a temperature of 0.75 and (b) at a
temperature of 0.60. While (b) shows defects within the crystal, these are transient,
retuning the crystal to its original structure as they move along the lattice
dimension. This is unlike in (a) where the defects are persistent and support the
propagation of melting in the surrounding crystal.

</div>

Pressure  Spinodal Temperature
-------- ---------------------
1.00            0.60
13.50           2.20

Table: The temperatures at which the spinodal occurs for the crystal structure at both
pressures. {#tbl:crystal_spinodal}

The Spinodal temperatures in @tbl:crystal_spinodal represents
the highest temperature it is possible to study melting.

### Melting Point

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
@fig:melting_radius shows a linear time dependence
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
the same result as seen for the dynamic quantities.

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
matching the expected behaviour.

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

The Wilson-Frenkel[@Wilson1900;@Frenkel1926] theory of crystal growth,
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
was found using the Levenberg-Marquardt algorithm [@Levenberg1944;@Marquardt1963;@More1978;@Jones2001],
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
