# Dynamics of the Trimer Molecule {#sec:dynamics_results}

The dynamics of different materials with a range of melting points
can be compared using the ratio of the temperature to the melting point,
that is;

$$ T/T_m $$

where $T$ is the experimental temperature and $T_m$ is the melting point.
The results within this chapter use the melting points determined in @sec:Crystal_Melting
being $T=0.36$ for a pressure $P=1.00$ and
$T=1.35$ for a pressure $P=13.50$.

## Structural Relaxation and Non-Arrhenius Dynamics

The structural relaxation (@eq:intermediate_scattering_function) is calculated
for a single value of the wave-number $k$.
The value of this wave-number $k$
that is going to give the best measurement [@Widmer-Cooper2008]
is the first maximum in the structure factor $S(k)$
which is the single time value of the intermediate scattering function.
The different pressures of the simulations
have different values for the wave number $k$.
The low pressure $P=1.0$ has a wave-number $k=2.80$ and
the high pressure $P=13.50$ has a wave-number $k=2.90$.
The wave-number is in reciprocal space,
meaning the larger wave number at a higher pressure
describes particles which are closer together,
which is inline with expectations.

![The intermediate scattering function of the trimer molecule
over a range of temperatures at a pressure $P=13.50$.
Note the logarithmic scale on the time axis.
](../Projects/Dynamics/figures/scattering_function.svg){width=81% #fig:intermediate_scattering_function}

The structural relaxation of the Trimer molecule
is shown in @fig:intermediate_scattering_function.
At low temperatures ($T=1.25$ to $T=1.4$)
the relaxation of the intermediate scattering function
takes place through a two step process,
comprised of an initial relaxation to a plateau that starts around \num{1e4} timesteps,
followed by a secondary relaxation.
This two step relaxation process is present
in experiments [@Mapes2006;@Chang1994;@Sidebottom1993;@Li1992;@Mezei1987]
and simulations [@Chong2004;@Rinaldi2001;@Roland1997;@Donati1999] of supercooled liquids.
The two step process describes two types of relaxations,
fast $\beta$-relaxations which are the relaxations before the plateau
and slow $\alpha$-relaxations being the long timescale relaxations. [@Cavagna2009]
The $\beta$-relaxations are only present at the low temperatures
and are associated with supercooled liquids and the onset of the glass transition.
While the $\alpha$-relaxation is present for all temperatures
and is the relaxation measured by the structural relaxation time $\tau_S$
being the longest timescale relaxation.
The timescales of the structural relaxation $\tau_S$
are shown in @fig:isf_relaxtion,
which includes the relaxation from both
high ($P=13.5$) and low ($P=1.0$) simulations.

![The structural relaxation time $\tau_S$
for a range of temperatures pressures.
The temperature has been normalised by the melting point
reducing both pressures to a single curve.
The black line is a fit of the Vogel--Tammann--Fulcher relation
with a fragility $m$ of 220.
](../Projects/Dynamics/figures/scattering_function_summary.svg){width=80% #fig:isf_relaxation}

The structural relaxation time (@fig:isf_relaxation)
is an excellent example of non-Arrhenius behaviour found in supercooled-liquids.
What is notable for the Trimer
is that it occurs above the melting point,
that is, in a liquid that is not supercooled.
Here we have direct evidence that the onset of non-Arrhenius dynamics
occur close to the glass transition temperature
rather than a property of supercooled liquids.
With the analytical description of the Vogel--Tammann--Fulcher (VTF) relation
allows for extrapolation to the relaxation time associated with the glass transition, \num{1e14}. [@Meenakshisundaram2019]
This provides an estimation of the glass transition temperature,
shown for each pressure in @tbl:glass_transition_temp.
The onset of non-Arrhenius dynamics has been found to occur
at a temperature of $1.2\ T_g$, [@Ediger2000;@Sillescu1999;@Chang1994]
which is very close to the melting point,
further evidence that the supercooled liquid is not important
for non-Arrhenius behaviour.

Pressure | $T_g$ | $1.2 T_g$ | $T_m$
---------|-------| --------- | ------
1.00     | 0.28  | 0.34      | 0.36
13.50    | 1.05  | 1.26      | 1.35

Table: Estimations of the glass transition temperature $T_g$
for each pressure based on fitting the
Vogel--Tammann--Fulcher relation. {#tbl:glass_transition_temp}

The degree to which the non-Arrhenius dynamics
plays a role in the dynamics is measured through the fragility $m$,
which has values ranging from $\approx 16$
for strong liquids and exceeds 200 for fragile liquids. [@Meenakshisundaram2019]
The structural relaxation of the Trimer molecule has a fragility $m=220$,
well into the region of the fragile liquids,
making it an excellent candidate to study
the dynamics of fragile liquids.
The fragility of the Trimer molecule is so high
that a machine learning algorithm developed to design
the most fragile 3D molecule possible
managed a fragility $m=188$ for Trimers. [@Meenakshisundaram2019]
While the results are not directly comparable
on account of being 3D compared to our 2D simulations
the Trimer sits amongst the best simulated glass formers.

## Dynamic heterogeneities

The non-exponential structural relaxation in @fig:intermediate_scattering_function
also hints at the presence of dynamic heterogeneities.
This is where there are multiple timescales within a single material,
that is, some regions of the material are moving fast
while others are moving slow.
Dynamic heterogeneities are a phenomenon
This phenomenon has been observed in a wide range of materials
both simulated and experimental.
The quantity used to measure this is the non-Gaussian parameter $\alpha$,
which is a measure of how far the distribution of motions
deviates from the expected Gaussian distribution [@Donati1999;@Rahman1964].
As the temperature decreases from 2.5 to 1.30,
the maximum value of non-Gaussian parameter increases,
demonstrating an increase in the dynamic heterogeneities,
that is, there is a big difference between
the fastest and the slowest particles.
In addition to the increase in
the value of the maximum,
the time at which the maximum occurs
becomes later moving from high temperature to low.

![The non-Gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/non_gaussian.svg){width=80% #fig:non-gaussian}

The rotational heterogeneities can be calculated
in the same way as the translational heterogeneities,
describing the deviation of the dynamics
from those expected by a Gaussian distribution.

![The rotational non-Gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/rotational_alpha.svg){width=80% #fig:rotational_non-gaussian}

The rotational heterogeneities (@fig:rotational_non-gaussian)
have a very similar shape to that of
the translational heterogeneities (@fig:non-gaussian).
One of the main differences,
is that the curves for the rotational motion
all follow a single curve before branching out
to reach the maximum and decay.
The calculations of the non-Gaussian parameter [@Donati1999;@Horbach1998]
typically have differing behaviour like in @fig:non-gaussian,
so it is interesting that the rotations all obey this single "master curve".

@Lacevic2003
@Glotzer2000
@Ediger2000
@Angell2000
@Sillescu1999
@Perera1999
@Donati1999

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
at the time of the maximum of the translational non-Gaussian.
The translational motion is denoted by an arrow depicting
the size and the direction of the motion,
while the rotational motion is depicted by ...TODO...
Areas which are white are indicative of no motion,
while coloured areas have lots of motion.
](../placeholder_figure.png){width=80% #fig:spatial_heterogeneities}

The Trimer molecule displays dynamics which are
characteristic of experimental fragile liquids like ortho-terphenyl.
The structural relaxation (@fig:isf_relaxation),
the rotational relaxation (@fig:rotational_relaxtion)
and the diffusion constant (@fig:diffusion_constant)
all display non-Arrhenius temperature dependences
like that of ortho-terphenyl.
Additionally the presence of the dynamic heterogeneities
confirms the

in both simulations and experiments of fragile liquids,
demonstrate that this molecule is a good candidate
for further investigation of it's dynamic behaviour
and there are no issues dealing with a simulation in 2D.

The only unusual property is the onset of this fragility
well above the melting point.
This is likely a result of the incredibly slow dynamics at the melting point
the with a timescale barely accessible to simulation.
