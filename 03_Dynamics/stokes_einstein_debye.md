# Understanding the breakdown of Stokes--Einstein--Debye

## Jump Dynamics

@Nair2019

A foundational assumption of the Stokes--Einstein--Debye relations
is that the particles undergo Brownian motion,
that is, movement occurs as a sequence of small independent jumps.
What if the issue with dynamic heterogeneities
and non-Gaussian behaviour,
is rather than observing many jumps,
over the timescale of the relaxation
only a small number of jumps are observed.
The single particle relaxation times
provide a method to investigate this idea.

The typical picture of jump dynamics
is that of the rotational motion,
where the quantity $\tau_1/\tau_2$ has a value of 4
when the motion is comprised of small angular jumps,
and reduces in value to 1 when
the motion is comprised of large angular jumps. [@Kivelson1970]
This is depicted in @fig:rotational_jumps
which has both the traditional $\tau_1/\tau_2$ quantity
in addition to the ratio of the molecular relaxation quantities $\tau_{T2}/\tau_{T4}$.
These both display motion of small jumps,
which becomes large jumps as the temperature drops.

![jump dynamics](../Projects/Dynamics/figures/rotational_jumps.svg){width=80% #fig:rotational_jumps}

This describes angular jumps of the rotations,
however what does this actually look like
and does it also occur with translations?
@Fig:molecule_trajectory shows the translational and rotational displacement
of two molecules at each time point.
For a fast molecule (@fig:molecule_trajectory_fast)
there is some time spent in the initial cage,
before a large jump including both angular and translational displacement
puts it within a new cage.
This is in contrast to the slow molecule (@fig:molecule_trajectory_slow)
which spends all the time within the initial cage,
however the size of that cage is significantly larger.

:::{class=subfigures id=fig:molecule_trajectory}

![Fast Particle](../Projects/Dynamics/figures/molecule_trajectory_fast.svg){width=48% #fig:molecule_trajectory_fast}
![Slow Particle](../Projects/Dynamics/figures/molecule_trajectory_slow.svg){width=48% #fig:molecule_trajectory_slow}

The distinct positions of the fast particle are visible as clustered regions,
with time spent in each one before a large rearrangement
which is comprised of both a large translational and rotational motion.
The slow particle has not moved from it's initial state.

:::

In taking the relaxation time of each particle within a simulation,
we have the distribution of relaxation times that take place.
So making the assumption that once relaxation has taken place,
the particle is completely independent of it's initial configuration
it will then need to undergo another relaxation event to move further.
This can be modelled by drawing consecutive relaxation times for a particle
from our experimentally determined distribution of relaxation times.
This modelling of consecutive relaxations is shown in @fig:jump_heterogeneities
for the last passage time $\tau_L$,
which was chosen as a timescale for which
the relaxation is considered irreversible.
When we consider long enough length scales (or timescales),
the heterogeneities within the dynamics disappear.
Where the long relaxation times
dominate the averaging over a single time period,
they are rare occurrences,
so over multiple relaxation times
their effect averages out.

![Heterogeneous dynamics taking progressively more relaxation
times](../placeholder_figure.png){width=80% #fig:jump_heterogeneities}

So here we do observe an increasing length scale
as the liquid is supercooled;
the length over which the observed dynamics
can be considered Brownian.
This can be an important consideration,
when comparing the different relaxations.
The ratio $\tau_1/\tau_2$ shows that
the rotational relaxation is dominated
by jump dynamics in the supercooled liquid,
while the diffusion constant
is a much longer timescale phenomenon.
Is the different regions of dynamics
responsible for the observed decoupling
of rotational and translational motion?

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

The result that the changing length scale of a measurement
has an effect on the resulting Stokes--Einstein--Debye relation
has also been observed in models of water.
@Kawasaki2019 find that changing degree of the Legendre polynomial
used for the rotational relaxation,
changes the relationship with the viscosity.
The first order polynomial corresponding to the largest motion
is similar to the diffusion constant,
while the sixth order polynomial, corresponding to the smallest motion
has a temperature dependence similar to the viscosity.
This provides additional support to the hypothesis
that the jump dynamics are an important part
of understanding the breakdown in SED.

When dealing with translation motion
we use the mean squared displacement
to describe long timescale motion,
taking the limit as the time goes to infinity.
This allows the sampling of motion
allowing many relaxations to take place,
so the jump dynamics are no longer a concern.
It is possible to also describe
the rotational diffusion using the Einstein formalism

$$ D_r = \lim_{t\to\infty} \frac{1}{2tN}\sum^N_{i=1}\langle \Delta \theta^2 \rangle $$

@Kim2015 compares the Einstein and the Debye formulations
of rotational dynamics in colloidal systems,
finding no difference between the formalisms.
However they make no mention of jump dynamics,
so it is possible these didn't play much of a role.

Comparing the rotational diffusion constant
to the rotational diffusion constant
and reproducing @fig:trans_rot_otp,
we get @fig:trans_rot_trimer.
This shows that jump dynamics
are not the only cause for the breakdown of SED.
The result in @fig:trans_rot_trimer
is also produced by @Kawasaki2019
simulating water in 3D,
which makes this result even more interesting
and worth investigating further.

![Comparison of the structural relaxation vs the
rotational and translational diffusion.
The range of rotational metrics describe
different measures of rotational diffusion.
](../Projects/Dynamics/figures/trans_rot_trimer.svg){width=80% #fig:trans_rot_trimer}

### Conclusion

A degree of the dynamic heterogeneities
can be explained by the dynamics
no longer adhering to Brownian motion,
with the dynamics at short time scales
dominated by the motion of large jumps.
This breaks many of the assumptions
which rely on the dynamics being Brownian in nature.
The jumps are present in both
the rotational and translational motion
and can be attributed to
motion associated with breaking out of
a local potential energy minimum
and moving to another.

Increasing the length scale
of the motion measured
reduces the effect of the jump dynamics.
With lower temperatures requiring longer length scales.
It is possible that the length scale
of the dynamic heterogeneities
is more related to the size of the jumps
rather than the size of the heterogeneous regions
as has been hypothesised.
As we go down in temperature
the length scale required
to return to Brownian motion increases.

While the transition to jump dynamics
can explain some of the unusual observations in supercooled liquids
it doesn't explain everything.
When we remove the effect of jump dynamics
using the long time diffusion constants
for both rotational and translational motion,
we still observe decoupling of these motions.
This indicates there is still more to understand.

## Coupling of translational and rotational motion {#sec:trans_rot_coupling}

@Meyer2019

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
4. coupling, where rotations are required for translations to occur.

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
