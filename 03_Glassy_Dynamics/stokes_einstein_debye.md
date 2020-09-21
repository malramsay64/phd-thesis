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
from observing a small number of jumps
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
where Traditional and Molecular ratios describe the rotational relaxation by large angular jumps
at low temperatures.
The Molecular relaxations have a value larger than $4$ for high temperatures,
represents rotations from $\pi / 4$ and $\pi / 2$
being slower than expected by Brownian motion.
This slower relaxation could potentially be reversible rotations,
like translations in @sec:structural_reversal,
or an effect of the molecular shape,
with rotations getting slowed by the concavities.
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
and $\tau_{T2}/\tau_{T4}$ for Molecular relaxations.
At low temperatures,
the ratios of both Traditional and Molecular relaxations have values close to 4,
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

With the motion of particles so heavily influenced by jump dynamics
we can investigate the role they play in dynamic heterogeneities.
In @sec:dynamic_heterogeneities_mol we found that
the presence of dynamic heterogeneities
is a short time phenomenon,
decaying to the expected Gaussian distribution over longer times.
This raises the question,
are dynamic heterogeneities present
because we observe a single jump
rather than many jumps for Brownian motion?
The large jumps between long lasting configurations in @fig:molecule_trajectory_fast
motivates the idea that we need more jumps to describe particle motions.
To test the hypothesis that dynamic heterogeneities
are the observation of a single jump,
we sample timescales of jumps
from the distribution of last passage times $\tau_L$
(@fig:relaxation_distribution),
making the assumptions that
the last passage time describes movement between independent configurations, and
that we have sampled the true distribution of relaxation timescales.
In drawing consecutive jumps from this distribution of relaxation times
we can model the effect of dynamic heterogeneities over longer length scales.
The last passage time is the most appropriate here
for describing an irreversible motion,
matching with the idea of jump dynamics
describing irreversible motions between points on an energy landscape.
@Fig:jump_heterogeneities shows the effect of
drawing from the distribution of last passage times,
with two consecutive jumps nearly eliminating
the dynamic heterogeneities across all temperatures.
Further consecutive jumps move the calculation
of the heterogeneities closer to the Gaussian value of 1.
When we consider motion over enough jumps,
the heterogeneities within the dynamics disappear.
Over a single jump,
the long relaxation times dominate the averaging
though they are rare so their effect diminishes over multiple relaxations.
The reduction in the dynamic heterogeneities
is also present plotting the molecular heterogeneities in @fig:molecular_heterogeneities.
As the length scale increases from $\tau_F$ to $\tau_L$ to $\tau_D$,
the presence of dynamic heterogeneities decrease,
with the same being true of the rotational heterogeneities,
from $\tau_{T4}$ to $\tau_{T3}$ and to $\tau_{T2}$.

![The dynamic heterogeneities present when sampling with replacement
from the distribution of last passage times in @fig:relaxation_distribution.
The number of times sampled from the distribution indicated by Jumps,
where 0 Jumps describes the mean of the distribution.
After 2 Jumps the dynamic heterogeneities
are nearly reduced to the Gaussian value of 1,
and further jumps get closer to this value.
](../Projects/Dynamics/figures/jump_dynamics.svg){width=80% #fig:jump_heterogeneities}

### Jump Dynamics and Stokes--Einstein--Debye

In the decoupling of diffusion and rotation described in @sec:trans_rot_coupling,
we measure quantities over two different length scales (@fig:trans_rot_otp)
the translational diffusion $D_t$ measured over a long distance,
and the rotational relaxation $\tau_1$ measured over a short distance.
As we saw in @sec:jump_dynamics,
these two length scales describe two different regimes of dynamic behaviour.
The transition from jump dynamics to Brownian dynamics
describes the length scale dependence of
the translational rotational decoupling observed by @Kawasaki2019.
In @fig:jump_heterogeneities, we find averaging over multiple jumps,
produces a more Brownian description of dynamics.
The diffusion constant describes motion as the long timescale limit (@eq:diffusion_constant)
and the Einstein formalism (@eq:rot_diffusion) describes a method
for calculating the rotational diffusion constant.
In using the diffusion constant to describe both
the translational and rotational motion,
we would expect to reproduce the decoupling of experiments.
@Fig:trans_rot_diff_trimer plots the rotational and translational
diffusion constant against the structural relaxation time
giving the opposite effect to what we would expect
with rotations much faster than translations.
By removing the effect of jump dynamics and dynamic heterogeneities
we have demonstrated that the decoupling of
the rotational and translational diffusion constants
is not related to either of these phenomena.
Instead, the decoupling must represent
some other breakdown in the assumptions
of the Stokes--Einstein--Debye model of dynamics.

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
finding that it doesn't hold for fragile liquids over short length scales,
though this assumption still holds when considering large length scales.
With large length scales still displaying a decoupling
of the translational diffusion and the rotational diffusion.
In this section we look towards the second assumption,
that the translational and rotational motions are independent.
The observations of decoupling of translational and rotational motion
shown in @fig:trans_rot_otp or @fig:trans_rot_diff_trimer,
describe a macro-scale effect,
the temperature dependence of the liquid.
On the micro-scale,
observing the motions of individual particles like in @fig:spatial_heterogeneities,
there appears to be a relationship between rotational and translational motion,
closer to a coupling than the decoupling on the macro-scale.
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
