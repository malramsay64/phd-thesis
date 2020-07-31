# Dynamics of the Trimer Molecule {#sec:dynamics_results}

The dynamics of different materials with a range of melting points
can be compared using the ratio of the temperature to the melting point,
that is;

$$ T/T_m $$

where $T$ is the experimental temperature and $T_m$ is the melting point.
The results within this chapter use the melting points determined in @sec:Crystal_Melting
being $T=0.36$ for a pressure $P=1.00$ and
$T=1.35$ for a pressure $P=13.50$.

## Structural Relaxation and Non-Arrhenius Dynamics {#sec:structural_relaxation}

The structural relaxation (@eq:calc_self_intermediate_scattering_function) is calculated
for a single value of the wave-number $k$.
The value of this wave-number $k$
that is going to give the best measurement [@Widmer-Cooper2008]
is the first maximum in the structure factor $S(k)$,
the single time value of the self-intermediate scattering function.
The different pressures of the simulations
have different values for the wave number $k$.
The low pressure $P=1.0$ has a wave-number $k=2.80$ and
the high pressure $P=13.50$ has a wave-number $k=2.90$.
The wave-number is in reciprocal space,
meaning the larger wave number at a higher pressure
describes particles which are closer together,
inline with expectations.

![The self-intermediate scattering function of the trimer molecule
over a range of temperatures at a pressure $P=13.50$.
The solid line is the mean of all initial configurations,
with the opaque surrounding bars describing an estimate of the error.
For most values the error is not visible in the figure.
This shows the transition from being identical to the initial state, with a value of 1,
to a decorrelation from the initial state, with a value of 0.
As the temperature drops, the process moves from
single step (T=2.5) to two step (T=1.25).
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/scattering_function.svg){width=81% #fig:isf}

The structural relaxation of the Trimer molecule
is shown in @fig:isf.
At low temperatures ($T=1.25$ to $T=1.4$)
the relaxation of the self-intermediate scattering function
takes place through a two-step process,
comprised of an initial relaxation to a plateau that starts around \num{1e4} timesteps,
followed by a secondary relaxation.
This is the same two-step process
observed in the structural relaxation of ortho-terphenyl [@Mapes2006]
and described in @sec:intro_structural.
This indicates that the structural relaxation
is taking place through similar processes as ortho-terphenyl.

![The structural relaxation time $\tau_S$
for a range of temperatures and pressures.
The temperature has been normalised by the melting point
reducing both pressures to a single curve.
The markers represent the mean of all initial configurations,
with the vertical line at the center of each marker
indicating an estimate of the error.
All errors are smaller than the marker size.
A best fit of the Vogel--Tamman--Fulcher relation is
shown as a black line with a fragility $m = 220$.
](../Projects/Dynamics/figures/scattering_function_summary.svg){width=80% #fig:isf_relaxation}

The timescales of the structural relaxation $\tau_S$
are shown in @fig:isf_relaxation,
which include the relaxation from both
high ($P=13.5$) and low ($P=1.0$) pressure simulations.
These structural relaxation times
are excellent examples of the non-Arrhenius
temperature dependence of the dynamics in ortho-terphenyl (@sec:intro_vtf).
The fragility $m=220$ of the Trimer liquid
is much higher than that of ortho-terphenyl,
which makes it an even more interesting candidate.
Ortho-terphenyl has been studied because it
is one of the most fragile glass formers (@fig:angell)
and slowest crystal growth (@fig:growth_rates),
so is going to best express the features of those phenomena.
Having an even more fragile liquid
is a better way of understanding what makes a liquid fragile.
The fragility of the Trimer molecule is so high
that a machine learning algorithm developed to design
the most fragile 3D molecule possible
found a fragility $m=188$ for trimer molecules. [@Meenakshisundaram2019]
While the results are not directly comparable
on account of being 3D compared to our 2D simulations
the Trimer sits amongst the best simulated glass formers.

An interesting observation about the Trimer dynamics
is that the non-Arrhenius dynamics and two-step relaxation
occur above the melting point.
These are behaviours which have been attributed to the supercooled liquid,
[@Ediger2012;@Lubchenko2007;@Debenedetti2001]
yet here are the first known observations of these quantities above the melting point.
Rather than describing the onset of these quantities
as properties of supercooled liquids,
they should instead be described as occurring at the onset
of the glass transition temperature.
This is not entirely surprising when considering the types of relaxations taking place.
The onset of dynamic heterogeneities,
like the glass transition is a kinetic process, [@Debenedetti2001]
describing the motion that takes place.
While the melting point, and supercooled liquids
are a thermodynamic description,
not at all related to the types or frequency
of motions that take place.
We can describe these quantities relative to the glass transition temperature
using the analytical description of the Vogel--Tammann--Fulcher (VTF) relation
to extrapolate to the relaxation time associated with the glass transition, \num{1e14}. [@Meenakshisundaram2019]
This gives an estimate for the glass transition temperature,
shown in @tbl:glass_transition_temp.

Pressure | $T_g$ | $1.2 T_g$ | $T_m$
---------|-------| --------- | ------
1.00     | 0.28  | 0.34      | 0.36
13.50    | 1.05  | 1.26      | 1.35

Table: Estimations of the glass transition temperature $T_g$
for each pressure based on fitting the
Vogel--Tammann--Fulcher relation. {#tbl:glass_transition_temp}

## Dynamic heterogeneities {#sec:dynamic_heterogeneities}

The non-exponential structural relaxation in @fig:isf
also hints at the presence of dynamic heterogeneities.
As the temperature decreases from 2.5 to 1.30,
the maximum value of non-Gaussian parameter increases,
demonstrating an increase in the dynamic heterogeneities,
that is, there is a big difference between
the fastest and the slowest particles.
Along with the increase in
the value of the maximum,
the time at which the maximum occurs
becomes later moving from high temperature to low.

![The non-Gaussian parameter $\alpha$ of the trimer molecule
over a range of temperatures at a pressure of 13.50.
The mean value at each time is displayed through the solid line
while the estimate of the error is shown with an opaque band.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/non_gaussian.svg){width=80% #fig:non-gaussian}

The rotational heterogeneities can be calculated
in the same way as the translational heterogeneities,
describing the deviation of the dynamics
from those expected by a Gaussian distribution.

![The rotational non-Gaussian parameter of the trimer molecule
over a range of temperatures at a pressure of 13.50.
The solid line shows the mean value at each time
with the estimate of the error shown through an opaque band.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/rotational_alpha.svg){width=80% #fig:rotational_non-gaussian}

The rotational heterogeneities (@fig:rotational_non-gaussian)
have a similar shape to the translational heterogeneities (@fig:non-gaussian).
One of the main differences,
is that the curves for the rotational motion
all follow a single curve before branching out
to reach the maximum and decay.
The calculations of the non-Gaussian parameter [@Donati1999;@Horbach1998]
typically have differing behaviour like in @fig:non-gaussian,
so it is interesting that the rotations all obey this single "master curve".

In the study of translational heterogeneities
there has been and understanding
that the heterogeneities are related to the structure,
having a spatial component to their distribution.
The same question could be asked for
the distribution or rotational heterogeneities.
@Fig:spatial_heterogeneities displays the spatial distribution
of both rotational and translational heterogeneities.
It shows that there is a spatial distribution
for both the rotations and the translations,
and more interesting is that
both distributions appear to overlap.
That is regions with large translational motions
also have large rotational motions,
and regions of small translational motion
also see small rotational motions.
This co-location of both translational and rotational motion
makes sense from a potential energy surface description of the structure.
Regions where there are low barriers for movement,
will make use of all the degrees of freedom available to them,
giving rise to the results we observe.

![Map of the spatial distribution
of translational and rotational heterogeneities
of a simulation at D=1.35 and Pp=13.50
at the time of the maximum of the translational non-Gaussian parameter.
The translational motion is denoted by an arrow depicting
the size and the direction of the motion,
while the rotational motion is depicted by the circle
at the start of the motion.
Areas which are white are indicative of no motion,
while coloured areas have lots of motion.
](../Projects/Dynamics/figures/heterogeneities.svg){width=80% #fig:spatial_heterogeneities}

## Decoupling of Translations and Rotations {#sec:trans_rot_decoupling}

### Translational Diffusion

The translational diffusion is characterised by the
Mean Squared Displacement (MSD) of particles shown in @fig:msd.
The two-step relaxation process seen in the structural relaxation (@fig:isf_relaxation)
is also seen in the MSD.
At lower temperatures,
the transition from the initial ballistic region
to the long timescale diffusive region
includes a plateau where the MSD barely increases.
A physical description of this plateau region
describes particles trapped in a cage comprising of its nearest neighbours. [@Cavagna2009]
As the temperature drops the local cage becomes stiffer,
and particles take longer to escape.
The diffusion constants,
found by fitting the long timescale regions
of the mean squared displacement are shown in @fig:diffusion_constant.
The diffusion constant displays the same
non-Arrhenius behaviour as the structural relaxation,
with both pressures described by the same VTF relation
when normalised by the melting point.

![The Mean Squared Displacement of the trimer molecule
over a range of temperatures for a pressure $P=13.50$.
Note the logarithmic scale of both axes.
](../Projects/Dynamics/figures/mean_squared_displacement.svg){width=80% #fig:msd}

![The translational diffusion constant as a function of
normalised temperature for high and low pressures.
](../Projects/Dynamics/figures/diffusion_constant_summary.svg){width=80% #fig:diffusion_constant}

### Rotational Relaxations

The rotational relaxations are given by the relaxation of a dipole (@eq:rot_relax)
and shown in @fig:rotational_relaxation.
Like the structural relaxation and mean squared displacement,
the rotational relaxation is characterised by a two-step process.
The rotational relaxation time is
the time taken for the relaxation function to decay to $1/e$.
When the rotational relaxation function
is approximated as a exponential decay,
the relaxation time is the rate of the decay.

![The rotational relaxation of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/rotational_relaxation.svg){width=80% #fig:rotational_relaxation}

### Decoupling

The relationship between the structural relaxation times,
the rotational relaxation times,
and the diffusion constant
are a component of confirming that
the observed dynamical behaviour is as expected.
The figures showing the rotational relaxation times
and the diffusion constant are shown in @fig:rotational_relaxation and
@fig:diffusion_constant.
While the ratios between the quantities
are displayed in @fig:trans_rot_trimer.
This is interesting
in that the choice of rotational diffusion constant
changes the presence of the breakdown,
with both the rotational and translational diffusion
having the same dependence on the structural relaxation time.
The observed behaviour deviates from the results obtained by @Chang1994.
The breakdown of the Stokes--Einstein--Debye relations
turns out to be a more complex topic.
In a study of the Lewis--Wahnström model,
@Lombardo2006 find that the decoupling of translational and rotational motions
gives different results depending on
the method used to calculate the rotational diffusion,
while in simulations of water
@Kawasaki2019 describe different breakdowns
depending on the choice of the polynomial
used for rotational relaxation.
While the breakdown of the SED model
doesn't match the behaviour of ortho-terphenyl,
it is likely an issue with the methods used to calculate the breakdown
because of the discrepancies in other models. [@Lombardo2006;@Kawasaki2019]
The calculation of the breakdown of rotational and translational motion
is explored further in @sec:sed.

![The divergence in the rotational and translational diffusions
when plotted against the structural relaxation
indicates a breakdown of the Stokes--Einstein--Debye relations.
The rotational diffusion speeds up relative to the translational diffusion
at a given temperature.
](../Projects/Dynamics/figures/trans_rot_trimer.svg){#fig:trans_rot_trimer width=80%}
