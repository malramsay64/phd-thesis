# Understanding the breakdown of Stokes--Einstein--Debye {#sec:sed}

Our current understanding of the breakdown of the Stokes--Einstein--Debye relations,
Current work in describing the Stokes--Einstein--Debye relations
centers around finding quantities which satisfy
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
which is followed by a long period in that new environment.
The displacements between each configuration
is the type of irreversible relaxation we are measuring
in the last passage time $\tau_L$.
A notable observation about the positions in @fig:molecule_trajectory_fast
is that each jump appears to be governed by
a relaxation measured by the last passage time.

![jump dynamics](../Projects/Dynamics/figures/rotational_jumps.svg){width=80% #fig:rotational_jumps}

![A trajectory of a fast particle with each point marking
the translational and orientational displacement
at a point in time.
The progression of time is described by the colour of the point.
The particle spends long periods of time in one configuration
before quickly moving to the next,
which typically requires both a translational and rotational motion.
](../Projects/Dynamics/figures/molecule_trajectory_fast.svg){width=48% #fig:molecule_trajectory_fast}

With the motion of particles so heavily influenced by Jump dynamics
we can investigate the role they play in dynamic heterogeneities.
In @sec:dynamic_heterogeneities we found that
the presence of dynamic heterogeneities
is a short time phenomenon,
decaying to the expected Gaussian distribution over longer times.
Are the dynamic heterogeneities present
because we are only observing a single jump
rather than the walk of Brownian motion.
To test this hypothesis we can use the distribution of last passage times $\tau_L$.
In taking the relaxation time of each particle within a simulation,
we have sampled the distribution of relaxation times that can take place.
This allows us to model the motion like we have observed in @fig:molecule_trajectory_fast.
We can make the assumption
that all relaxations are drawn from the same distribution,
that is, each jump between local environments is equivalent.
This also makes the assumption that once the particle
has undergone relaxation it is completely independent
of it's previous configuration.
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

![Heterogeneous dynamics taking progressively more relaxation
times](../placeholder_figure.png){width=80% #fig:jump_heterogeneities}

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

### Increasing Length Scale

There are a range of studies which predict
an increasing length scale of the dynamic heterogeneities. [@Ediger2000]
There are experimental results which both observe this length scale,
while others reject it.
Here we postulate the length scale is that of
the size of the jumps the particles take
which is alternatively the length over which
the dynamics can be described as Brownian.
There are already observations of this length scale increasing
upon cooling,
in the form of the ratio $\tau_1/\tau_2$ increasing
as the temperature decreases.
This also answers a question posed by @Ahn2013,
"Are rare, long waiting times between rearrangement events
responsible for the slowdown of dynamics at the glass transition?"
Although Betteridge's law of Headlines @Betteridge2009
would imply this is definitively not the case,
it seems that it depends.
For long timescale quantities like the diffusion constant,
this is likely not the case,
since it is mostly the fastest particles
which contribute to this quantity,
however the structural and dipole relaxations
are likely to be affected by the prevalence
of long times between rearrangement events.

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
of the decoupling of rotations and translations. [@cite]

When calculating the translational diffusion constant
we describe the long timescale behaviour of the mean-squared-displacement
by finding the slope as time goes towards infinity.
The long timescales associated with this calculation
allows many relaxations to take place
limiting the impact of jump dynamics.
The same approach to describing the long timescale behaviour
can also be achieved for rotational motion
using the Einstein formalism for the rotational diffusion constant; [@Kim2015;@Lombardo2006]

$$ D_r = \lim_{t\to\infty} \frac{1}{2tN}\sum^N_{i=1}\langle \Delta \theta^2 \rangle $$

@Kim2015 compared the Debye formalism, described in @sec:intro_sed
to the Einstein formalism described above
finding they calculated the same results for a colloidal system,
where jump dynamics are unlikely to play a role in rotational relaxation.
However, in a simulation study of the Lewis--Wahnström model
for which rotational jump dynamics observed,
@Lombardo2006 find that experiments and simulations
which measure rotational using the Debye model
display an increase in translational diffusion relative to rotational diffusion,
while when using the Einstein formalism, simulation
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

@Meyer2019
@Griffin2012
@Faraone2003

The result in @fig:trans_rot_trimer
is also produced by @Kawasaki2019
simulating water in 3D,
which makes this result even more interesting
and worth investigating further.

Two of the main assumptions made in the formulation of
the Stokes--Einstein--Debye relations are;

1. the motion is comprised of many small independent steps, and
2. translational and rotational motions are independent.

These assumptions stem from the formulation
from Brownian motion.
@Sec:jump-dynamics investigates the first of these assumptions,
so here we look towards the second.
@Fig:trans_rot_trimer depicts a decoupling
of the translational and rotational diffusion constants.
This is a macro-scale effect,
observing the different temperature dependence
in overall dynamics of the liquid.
When looking at the micro-scale, that is,
the motions of individual particles within a simulation.
There appears to be a distinct relationship
between the rotational and translational motions
which is represented in @fig:spatial_heterogeneities as
the co-location of rotationally and translationally mobile regions.

In investigating the coupling of translational and rotational motion
there are four different levels of confidence
in the coupling of rotational and translational motion.

1. No relation between translational and rotational motion,
2. coincidence, where the rotational and translational motion
  happen to have similar timescales with no connection between them,
3. correlation, where the regions of large rotational motions
  are also the regions of large translational motions, and
4. Coupling, where rotations are required for translations to occur.

As we go from 1 to 4,
the requirements for establishing these become more stringent.
The analysis of the translational [@fig:non-gaussian] and
rotational [@fig:rotational_non-gaussian] heterogeneities
provide enough data for the coincidence.
Each of the heterogeneities
have similar shape and timescales.
Adding @fig:spatial_heterogeneities
it is possible to consider correlation.
However, coupling,
where one motion allows the other to occur
requires additional analysis.

Based on work by @Faraone2003 on water,
the coupling parameter $\gamma$

$$ \gamma = \frac{\langle(\Delta r \Delta\theta)^2 \rangle}
    {\langle\Delta r^2\rangle\langle\Delta\theta^2\rangle} - 1 $$

provides a method of demonstrating correlation
between the translational and rotational motion.
The values of $\gamma$ are large
for molecules with large values of $\Delta r \Delta \theta$,
with both components of the motion contributing.
In @fig:gamma the coupling parameter is very
similar to the non-Gaussian parameters,
indicating that highly mobile molecules
have both degrees of freedom available to them.
This provides the evidence to establish
there is correlation between
rotational and translational motion.

![A plot of the coupling parameter $\gamma$
](../Projects/Dynamics/figures/gamma.svg){width=80% #fig:gamma}

### Coupling of molecular relaxation times

Another reasoning about the coupling
is looking at the effect of rotation
at the first and the last passage time.
For the first passage time,
the motion in reversible,
while at the last passage time,
the particle has moved to a new position.

![plotting the distribution of rotational motion
at the first and last passage times.
](../Projects/Dynamics/figures/angular_displacement.svg){width=80% #fig:rotation_last_passage}
