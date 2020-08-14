# Understanding the breakdown of Stokes--Einstein--Debye {#sec:sed}

Current work in describing the Stokes--Einstein--Debye relations
centers around finding quantities that satisfy
some proportionality criteria. [@Sengupta2013;@Kawasaki2019]
These studies are looking to find the quantity which adheres
to the Stokes--Einstein--Debye relations,
rather than the tangential question of why does it break down?
A foundational assumption of the Stokes--Einstein--Debye relations
is that the particles undergo Brownian motion,
that is, movement occurs as a random sequence of small independent jumps.
It is possible that dynamic heterogeneities result
from only observing a small number of jumps
resulting in far more correlated motion.
The single particle relaxation provides
tools which we can use to investigate this hypothesis.

## Jump Dynamics and Dynamic Heterogeneities {#sec:jump_dynamics}

The presence of jump dynamics in rotational relaxations (see @sec:intro_jump_dynamics)
has been observed in many experiments, [@Zasetsky2010;@Laage2006]
with the quantity $\tau_1/\tau_2$ being a measure of
how much large angular jumps contribute to relaxation,
from $4$ being no contribution, to $1$ being all jump dynamics.
This same quantity can be calculated for the molecular relaxations,
giving $\tau_{T2}/\tau_{T4}$.
These measures of rotational jump dynamics are depicted in @fig:rotational_jumps,
where both quantities describe the rotational relaxation by large angular jumps
at low temperatures.
Plotting the change in displacement and orientation over time,
@fig:molecule_trajectory_fast shows a fast molecule
which exhibits jump dynamics in both rotational motion as described above,
and also translational motion.
This motion can be described by
an occasional large jump to a new local environment
resulting in a change in orientation and position,
followed by a long period in that new environment.
The displacements between each configuration
is the type of irreversible relaxation we are measuring
in the last passage time $\tau_L$.
A notable observation about the positions in @fig:molecule_trajectory_fast
is that each jump appears to be governed by
a relaxation measured by the last passage time.

![The presence of jump dynamics in rotational motion,
found by comparing the relaxation times
$\tau_1/\tau_2$ in the case of Traditional dynamics
and $\tau_T2/\tau_T4$ for Molecular relaxations.
At low temperatures,
both quantities have values close to 4,
indicative of Brownian motion.
This drops close to 1 at low temperatures
describing rotational motions which take place
through large angular jumps.
](../Projects/Dynamics/figures/rotational_jumps.svg){width=80% #fig:rotational_jumps}

![A trajectory of a fast particle with each point marking
the translational and orientational displacement
at a point in time.
The progression of time is described by the colour of the point.
The particle spends long periods of time in one configuration
before quickly moving to the next,
which typically requires both a translational and rotational motion.
](../Projects/Dynamics/figures/molecule_trajectory_fast.svg){width=80% #fig:molecule_trajectory_fast}

With the motion of particles so heavily influenced by Jump dynamics
we can investigate the role they play in dynamic heterogeneities.
In @sec:dynamic_heterogeneities we found that
the presence of dynamic heterogeneities
is a short time phenomenon,
decaying to the expected Gaussian distribution over longer times.
Are the dynamic heterogeneities present
because we are only observing a single jump
rather than the walk of Brownian motion.
To test this hypothesis we can use the distribution of last passage times $\tau_L$
(@fig:relaxation_distribution).
In taking the relaxation time of each particle within a simulation,
we have sampled the distribution of relaxation times that can take place.
This allows us to model the motion like we have observed in @fig:molecule_trajectory_fast.
We can make the assumption
that all relaxations are drawn from the same distribution,
that is, each jump between local environments is equivalent.
This also makes the assumption that once the particle
has undergone relaxation it is completely independent
of its previous configuration.
This sequence of jumps can be modelled
by drawing consecutive relaxation times
from our experimentally determined distribution of relaxation times.
This modelling of consecutive relaxations is shown in @fig:jump_heterogeneities
When we consider motion over enough jumps,
the heterogeneities within the dynamics disappear,
the long relaxation times dominate the averaging
over a single time period,
however they are rare occurrences
so their effect is lower over multiple relaxation times.
The reduction in the dynamic heterogeneities
was also present when plotting the molecular heterogeneities
in @fig:molecular_heterogeneities.
As the length scale increases from $\tau_F$ to $\tau_L$ to $\tau_D$,
the dynamic heterogeneities decrease,
and the same is true of the rotational heterogeneities,
from $\tau_{T4}$ to $\tau_{T3}$ and to $\tau_{T2}$.

![The dynamic heterogeneities present when sampling with replacement
from the distribution of last passage times in @fig:relaxation_distribution.
The number of times sampled from the distribution is indicated by Jumps
where 0 jumps is the mean of the distribution.
With only 2 jumps the dynamic heterogeneities
are nearly reduced to the Gaussian value of 1,
and further jumps get closer to this value.
](../Projects/Dynamics/figures/jump_dynamics.svg){width=80% #fig:jump_heterogeneities}

In the picture of the decoupling of diffusion and rotation @fig:trans_rot_otp
there are quantities on two different length scales,
the diffusion measured over a long distance,
while the rotation is a quantity over a short distance.
Additionally, as we have seen in @fig:molecular_heterogeneities,
the way a quantity is averaged, can play a role
in the resulting value,
with fast particles dominating the diffusion
while slow particles dominate the structural relaxation
and rotational relaxation.

### Do Jump Dynamics solve Stokes--Einstein--Debye

When liquids undergo relaxation by Jump dynamics,
the underlying assumptions of the Stokes--Einstein--Debye (SED) model break down.
@Kawasaki2019 found that changing degree of the Legendre polynomial
used for the rotational relaxation
changes the relationship with the viscosity in models of water.
The first order polynomial, which corresponds to the largest motion
is similar to the diffusion constant,
while the sixth order polynomial, which corresponds to the smallest motion
has a temperature dependence similar to the viscosity.
This dependence on rotational distance
supports the idea that jump dynamics
play an important role in the breakdown of the SED dynamics.
The presence of a length scale dependence
of the rotational and translational motion
would clear up some of the confusion in the literature
of the decoupling of rotations and translations.
[@Chong2009;@Tarjus1995;@Lombardo2006;@Sengupta2013;@Kawasaki2019;@Jose2006]

When calculating the translational diffusion constant
we describe the long timescale behaviour of the mean-squared-displacement
by finding the slope as time goes towards infinity.
The long timescales associated with this calculation
allows many relaxations to take place
limiting the impact of jump dynamics.
The same approach to describing the long timescale behaviour
can also be achieved for rotational motion
using the Einstein formalism for the rotational diffusion constant;
[@Kim2015;@Lombardo2006;@Meyer2019]

$$ D_r = \lim_{t\to\infty} \frac{1}{2tN}\sum^N_{i=1}\langle \Delta \theta^2 \rangle $$

@Kim2015 compared the Debye formalism, described in @sec:intro_sed
to the Einstein formalism described above
finding they calculated the same results for a colloidal system,
where jump dynamics are unlikely to play a role in rotational relaxation.
However, in a simulation study of the Lewis--Wahnström model
for which rotational jump dynamics observed,
@Lombardo2006 find that experiments and simulations
which measure rotational relaxation using the Debye model
display an increase in translational diffusion relative to rotational diffusion,
while when using the Einstein formalism, simulations
display a decrease in translational diffusion relative to rotational diffusion.
We make the same comparison in @fig:trans_rot_diff_trimer,
where both rotational formalisms give similar results.
Rather than failing to describe the decoupling
of the translational and rotational diffusion through jump dynamics,
this tells us that jump dynamics
are not the only contributor to the breakdown of SED.

![Comparison of the structural relaxation vs the
rotational and translational diffusion constants.
The range of rotational metrics describe
different measures of rotational diffusion.
](../Projects/Dynamics/figures/trans_rot_diff_trimer.svg){width=80% #fig:trans_rot_diff_trimer}

## Coupling of translational and rotational motion {#sec:trans_rot_coupling}

In describing dynamics through the Stokes--Einstein--Debye (SED) relations
there are two main assumptions made about the dynamics;

1. the motion is comprised of many small independent steps, and
2. translational and rotational motions are independent.

@Sec:jump_dynamics investigates the first of these assumptions,
finding it not to hold for fragile liquids,
so here we look towards the second.
The observations of decoupling of translational and rotational motion
shown in @fig:trans_rot_otp or @fig:trans_rot_diff_trimer,
describe a macro-scale effect,
the overall temperature dependence of the liquid.
However, on the micro-scale, observing the motions of individual particles
like in @fig:spatial_heterogeneities,
there appears to be a relationship between rotational and translational motion
that is closer to a coupling than the decoupling on the macro-scale.
In investigating the coupling of translational and rotational motion
there are four different levels of confidence
in the coupling of rotational and translational motion;

1. no relation between translational and rotational motion,
2. coincidence, where the rotational and translational motion
  happen to have similar timescales with no connection between them,
3. correlation, where the regions of large rotational motions
  are also the regions of large translational motions, and
4. coupling, where rotations are required for translations to occur.

As we go from 1 to 4,
the requirements for establishing these relationships become more stringent.
The analysis of the translational [@fig:non-gaussian] and
rotational [@fig:rotational_non-gaussian] heterogeneities
provide enough data for the coincidence.
The rotational heterogeneities have a similar shape and timescale
to those of the translational heterogeneities.
In @fig:spatial_heterogeneities we observe that the regions
with a high translational mobility,
also have a high rotational mobility.
The presence within the same regions is sufficient
to describe a correlation between rotations and translations,
though is insufficient to describe coupling,
we are yet to find a direct link between the two types of motion.

Based on work by @Faraone2003 measuring the coupling of
rotational and translational motion in water,
we define the coupling parameter $\gamma$

$$ \gamma = \frac{\langle(\Delta r \Delta\theta)^2 \rangle}
    {\langle\Delta r^2\rangle\langle\Delta\theta^2\rangle} - 1 $$

which is similar to the non-Gaussian parameter $\alpha$.
It provides a method of describing
coupled rotational and translational motion
which is more pronounced than the expected random distribution.
Large values of $\gamma$ required large values for both
the translational component $\Delta r$
and the rotational component $\Delta \theta$.
The coupling parameter of the Trimer molecule is shown in @fig:gamma,
having a very similar shape to that of the non-Gaussian parameter (@fig:non-gaussian).
As the temperature drops,
the coupling between the rotational and translational motions grow
and the timescale of coupling increases.
The coupling of rotational and translational motions
match those found in simulations of water [@Meyer2019;@Faraone2003]
and ionic liquids. [@Griffin2012]

![The coupling parameter $\gamma$ as a function of time.
A molecule undergoing uncoupled relaxation has a value of 0 for all times.
As the temperature decreases the maximum of $\gamma$ increases
and the time at which that maximum occurs also increases.
The solid line describes the mean value,
with the lighter bands indicating an estimate of the error.
](../Projects/Dynamics/figures/gamma.svg){width=80% #fig:gamma}

The coupling of rotational and translational motion
is the idea that both rotational and translational motions
are required for mobility within the liquid.
When studying the trajectory of a particle in @fig:molecule_trajectory_fast,
the motions between stable configurations require
both a translational and rotational displacement.
These irreversible motions are likely giving rise
to the large value of the coupling parameter.
The molecular relaxations described in @sec:molecular_relaxation
provide some tools for investigating
how both translations and rotations contribute to
the irreversible relaxations.
In evaluating the structural relaxation,
we found the first passage time $\tau_F$ represented motions
which were highly reversible and not contributing to the structural relaxation,
while the last passage time $\tau_L$ represents
the motion which did result in an irreversible structural relaxation.
Both of these describe the translations on the same length scale,
the difference being the reversibility of that motion.
The fraction of particles which have undergone
rotational relaxation at their first and last passage time
are displayed in @fig:rotational_displacement.
This is a comparison of the relaxation timescales of each individual particle,
so the presence of dynamic heterogeneities doesn't impact the timescales.
At the first passage time of a particle
only 10\% have undergone the shortest rotational relaxation of $\pi/4$
compared to nearly 80% at the last passage time.
The first and last passage times
describe motion of the same length scale
with the difference being the reversibility of that motion.
@Fig:rotational_displacement shows that the rotations
are a vital part of the translational relaxation,
providing the irreversible part of the relaxation process.

![The fraction of particles which have undergone a rotational relaxation
at the time of their first (left) and last (right) passage time.
These compare the motions of an individual particle
in the liquid at a temperature $T=0.40$ and pressure $P=13.50$.
](../Projects/Dynamics/figures/rotational_displacement.svg){#fig:rotational_displacement width=80%}
