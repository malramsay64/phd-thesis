# Results

## Stability of Crystal Phases

One of the notable results of this thesis
is that no crystallisation of any form has been observed.
As a result of this the crystal structures for the trimer molecule
have been found using an isopointal search algorithm [@Jennings2015]
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

Since we haven't observed any crystallisation at all,
are we even looking for the correct structures?

### Clustering of liquid structures

@sec:unsupervised_classification used an unsupervised classification method
to identify crystal structures within the liquid phase.
The same approach can be used to find
any structure commonly found in the liquid.

![Clustering analysis of a sequence of liquid
configurations](../placeholder_figure.png){width=80% #fig:cluster_analysis_liquid}

### Packing Analysis

When initially finding the crystal structures which were likely to grow,
we used the packing of hard molecules
as a model to predict the most stable structures.
This approach has been shown to generate structures
matching those of atomic systems [@cite],
however it has not been confirmed for molecular structures.
It is possible that the complete lack of crystal growth
is a result of seeding the wrong crystal.
As an alternative method of finding crystal structures,
I used the same isopointal search algorithm
as the hard molecule,
only the hard sphere potential (@fig:packing_p2_hard) was replaced with
a Shifted Lennard Jones potential
as used in the molecular dynamics simulation. (@fig:packing_p2_lj)
The Lennard-Jones potential provides a slightly different picture of packing.
Most noticeably the spacing of the molecules
in the Lennard-Jones packing is much greater
than the hard discs.
This is expected,
as the minimum of the Lennard-Jones potential
lies at a distance of $2^{1/6} \approx 1.12$.
The main difference is the relative positioning
of the alternating layers.
In the LJ case the molecules are positioned directly face on
an rearrangement which maximises the positive interactions from
the two smaller molecules.
In comparison, the Hard potential has the molecules
offset so the small particles rest
in the concavity between the small and large particle.

:::{class=subfigures id=fig:packing_p2}

![LJ Potential](../Projects/Crystal_Melting/figures/Trimer-p2-LJ.svg){#fig:packing_p2_lj width=49%}
![Hard](../Projects/Crystal_Melting/figures/Trimer-p2-Hard.svg){#fig:packing_p2_hard width=49%}

A comparison of the packing of the hard and the Lennard Jones potentials.
The molecules coloured in blue are the real copies of the unit cell,
while the molecules in green are the periodic copies.

:::

So have I been using the wrong crystal structure?
Probably not.
The transition from the structure in @fig:packing_p2_hard
to that in @fig:packing_p2_lj can be done by sliding each of the layers,
there is only a small motion for every particle.
Additionally, these two pictures show extreme values,
with the LJ-Discs having no pressure applied,
and the Hard sphere is similar to having a very large pressure applied.
So the lowest energy crystal structure is likely to be
somewhere in the middle.
Additionally, from @fig:solid_state_transition_structure
we know that a larger solid state transition
will spontaneously take place,
making it unreasonable to assume
this is not the equilibrium crystal form.

### Polymorphic Stability

While the potential energy calculations give some idea
of the most stable polymorph,
it would still be useful to compare each of the crystals.

![Comparison of the melting of each of the different crystal types. These values are
compared at a pressure of 13.50 and a temperature of 1.40. The pg crystals melts
significantly faster than either the p2 or p2gg crystals.
](../Projects/Crystal_Melting/figures/melting_crystal_comparison.svg)

![Monitoring the proportion of each crystal within the p2gg crystal at a temperature of
1.40 and a pressure of 13.50 which is slightly above the melting point of 1.36. Tracking all
the different crystals within the configuration shows a transition of the p2gg crystal
structure to the p2 crystal structure.
](../Projects/Crystal_Melting/figures/solid_state_transition-P13.50-T1.40-p2gg.svg){#fig:solid_state_transition width=80%}

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

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-p2gg_init.svg){#fig:transition_init width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-p2gg_process.svg){#fig:transition_process width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-p2gg_end.svg){#fig:transition_end width=33%}
<!-- markdownlint-disable MD045 -->

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

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_0.svg){#fig:pg_melting_0 width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_1.svg){#fig:pg_melting_1 width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_2.svg){#fig:pg_melting_2 width=33%}
<!-- markdownlint-enable MD045 -->

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

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_bottom_0.svg){#fig:pg_crystal_bottom width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_top_0.svg){#fig:pg_crystal_top width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_top_2.svg){#fig:pg_crystal_top_end width=33%}
<!-- markdownlint-enable MD045 -->

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
still remaining after a time of \num{2e6} (@fig:pg_crystal_top_end).

## Characteristic Timescale

When presenting results for crystallisation
an important part of modelling the melting behaviour
is a characteristic timescale.
This is important in evaluating *slow* crystal growth,
is there something interesting occurring,
or is it the dynamics slowing down.

In the crystallisation of the Lewis--Wahnström model [@Pedersen2011]
the structural relaxation time $\tau_S$
is used as the characteristic timescale.
However as discussed in @sec:coupling_of_translational_and_rotational_motion
there is a breakdown in the Stokes--Einstein--Debye relations
meaning there are different temperature dependences
for each of the relaxation times.
Crystallisation is dominated by short range motions,
particles translating to the nearest crystal site
or rotating to match orientation with the rest of the particles.
This means that although the short timescale relaxation times
of the structural relaxation $\tau_S$ and rotational relaxation $\tau_R$
are dominated by jump dynamics,
their timescale best represents crystallisation.
A further concern is the breakdown
in the scaling of the Stokes--Einstein--Debye relations,
with the rotations getting slower at a faster rate
compared to the dynamics. [@fig:trans_rot_trimer]
The additional slowdown of the rotations
is further reasoning for being the characteristic
timescale of melting.

When comparing the timescales of the Lewis--Wahnström model (LW)
to that of the trimer, (@tbl:relaxation_timescales)
there is a noticeable difference
in the ratio of the rotational and structural relaxations.
The timescale of rotations in the LW model
is not significant compared to the structural relaxation,
while for the Trimer model,
rotations have a longer timescale
than the structural relaxation.
A further reason for the choice of rotations
is from watching the melting of the crystals in @sec:polymorphic_stability
the motions that result in melting are the rotations.

Model | $\tau_S$ | $\tau_R$
------|----------|---------
LW [@Pedersen2011]   | \num{2e-8} | \num{8.7e-9}
Trimer [@sec:dynamics] | \num{1.4e5} | \num{3.5e5}

Table: Comparison of the structural and rotational relaxation times
of the Lewis--Wahnström (LW) and Trimer molecules.
The values for the LW model are given in units of seconds,
while the Trimer values are in reduced Lennard--Jones time units. {tbl:relaxation_timescales}

## Characteristic Temperatures

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
is the same as the rate of melting
---the equilibrium state.
Typically the melting rate is the temperature
at which the measurement of the growth rate
crosses from negative (melting) to positive (growth).
No crystallisation has been observed for this molecule
so the melting rate is the temperature
at which the melting rate is no longer measurable.
I consider the limit of measuring the melting
rate being the removal of a single layer of crystal
over the timescale of the simulation, a rate of \num{1e-6}.
The timescale cannot be extended beyond this as
a technical limit of how timesteps are handled in HOOMD-blue [@hoomd_counter]
which can only store numbers up to $2^{32}-1$,
slightly more than 4 billion.
In concert with the technical limitation
there is a practical limitation
with simulations taking multiple weeks to run.

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

The simulations in @sec:?? show the p2 crystal to be most stable,
meaning it is used for further analysis of the melting rate.
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
](../Projects/Crystal_Melting/figures/growth_rates_err.svg){#fig:growth_rates}

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

![This normalises both the temperature by the melting point, and the growth rate by the
rotational relaxation. This figure shows the growth rate slowing faster than
can be explained by the dynamics, which is indicated by the values approaching zero.
](../Projects/Crystal_Melting/figures/normalised_melting_err.svg){#fig:normalised_melting}

### Comparison to Lewis--Wahnström

The growth occurs over a period of $\approx 5\tau_S$ within the Lewis-Wahnström model. [@Pedersen2011]

Here the fastest melting rate is $\approx 0.4 \tau_R$ so in 5 units a single layer will
have melted.

If we were modelling OTP the simulation timescale would be \SI{3e-5}{\seconds}, four
times longer than the results from @Pedersen2011
and we are not even below the melting point.

The growth of crystals in the trimer is at least two orders of magnitude
slower than that of the Lewis--Wahnström model.
It is somewhat difficult to make a comparison
since no publications made their code or data available.

## Modelling Melting Rates

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

### Classical theory

The classical theory of crystal describes growth
normalised by a relaxation time [@eq:normalised_growth].
Using the points from @fig:normalised_melting and the values from @tbl:potential_energy_difference,
the unknown parameter $c$ of @eq:normalised_growth was found using the
Levenberg--Marquardt algorithm [@Levenberg1944;@Marquardt1963;@More1978;@Jones2001] for least squares fitting of non-linear functions.
This gives the lines of fit displayed in @fig:normalised_melting.
The parameters of the fit displayed in @tbl:rate_coefficient.

Pressure            $c$
-----------     -----------------
1.0             \num{-0.77(5)}
13.50           \num{-1.5(5)}

Table: The constant defining the rate of crystal growth
for each of the pressures.
These values are obtained from the fitting in
@fig:normalised_melting {#tbl:rate_coefficient}

The lines depicting the fit of
the Wilson-Frenkel theory in @fig:normalised_melting
predict significantly slower melting rates
than observed in the simulations
for temperatures $T/T_m > 1.20$.
A possible cause for this would be the onset of spinodal
with the melting occurring throughout the structure,
which is definitely not observed.

It should be noted that the high spinodal temperature
doesn't support a super stable crystal state,
the crystal only has a small potential energy benefit over the liquid state
and the melting rate of the crystal
increases well above that predicted
by the Wilson-Frenkel model.
Instead it is indicative of the rarity of nucleation events,
being the formation of defects within the crystal.
There are defects which form within the crystal,
shown in @fig:melting_disorderB,
however these are transient defects,
stable within the crystal structure
and unable propagate melting.
The defects in @fig:melting_disorderB
are similar to the defect
which propagates the solid state phase transition
of the p2gg crystal to the p2 crystal (@fig:solid_state_transition_structure).

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

As a point of comparison,
similar calculations can be made for 2D Lennard-Jones discs,
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

$$ \Delta \approx \Delta h_m \left\langle 1 - \frac{T}{T_m} \right\rangle $$

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

Using this semi-empirical density functional theory
provides some qualitative insight into describing
the slow crystal growth of the Trimer.
However, it is not useful as a quantitative description
of the dynamic processes,
with classical growth theory being a much better predictor.

## Dynamic Heterogeneities and Melting

An important aspect of the melting behaviour in the Trimer molecule
is the onset of dynamic heterogeneities,
which unlike all other materials
occur above the melting point.
Plotting the melting rate as inverse temperature, [@fig:normalised_melting_err_inv]
to allow the comparison with the dynamics quantities [@fig:rotational_time_sub]
the temperature at which the curves deviate
is the same in both cases.

:::{class=subfigures id=fig:comparison}

![melting rates plotted against inverse
temperature](../Projects/Crystal_Melting/figures/normalised_melting_err_inv.svg){width=80% #fig:normalised_melting_err_inv}

![Rotational relaxation times compared with the rotational relaxations
](../Projects/Dynamics/figures/rotational_time.svg){width=80% #fig:rotational_time_sub}

A comparison of the dynamics and the rotational relaxation time.
The unusual behaviour is a result of the fragility of the dynamics.

:::

While it does appear that the dynamic heterogeneities
play a role in the melting behaviour,
that still doesn't explain why
the melting is so much slower than the Lewis--Wahnström model,
when comparing the number of relaxation times.

@Granasy2004

- description of heterogeneities causing
- large translations before rotational decorrelation
- interface growth slow relative to reorientation

### Ordering of Multiple Parameters

Instead of describing crystal growth as a single with a single order parameter
as in @sec:semi-empirical-density-functional,
@Russo2016 posit that multiple order

In the Lewis--Wahnström model,
the ordering of multiple parameters can be ignored,
since the rotational relaxation time
is five orders of magnitude faster than the structural relaxation time. [@Pedersen2011]
For the Trimer model here however,
both relaxations are the same order of magnitude
meaning we have to consider both of them
in the model of crystal growth.
