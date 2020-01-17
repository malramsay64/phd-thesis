# Results

To allow the comparison of dynamics between materials with a range of properties,
dynamics quantities are presented relative to the melting point of the material,
that is using the quantity

$$ T/T_m $$

where $T$ is the experimental temperature and $T_m$ is the melting point.
For the results presented here,
we don't have an accurate determination of the melting point,
instead using our best approximation,
the details of which are discussed in @sec:Crystal_Melting
and presented in @tbl:melting_points.

 Pressure   Melting Point
 --------  --------------
 1.00            0.36
 13.50            1.35

Table: The melting points of the trimer molecule for different pressures. {#tbl:melting_points}

Much of the theory of dynamics in molecular systems
has been built around the
Stokes-Einstein relation [@Einstein1956]

$$ D_t \eta / T = \text{constant} $$

and the Stokes-Einstein-Debye relations [@Debye1929].

$$ D_r \eta / T = \text{constant} $$

where $D_t$ is the diffusion constant of the translational motion
$D_r$ is the diffusion constant of the rotational degrees of freedom,
$\eta$ is the shear viscosity, and
$T$ is the temperature.

## Standard Dynamics

Analysing the behaviour of the trimer molecule
using the standard dynamic quantities
provides a method of comparing these results
to both existing experiments and simulations.

### Structural Relaxation

The structural relaxation is measured
using the intermediate scattering function (@eq:intermediate_scattering_function).
To compute the values monitoring
the structural relaxation,
we first have to compute the value of the wave-number
which will give the greatest change
In computing the values for this function,
it is first required to
find the wave-number which corresponds to
to first maximum of the static structure factor.

Pressure|$k$
--------|-----
1.00    | 2.80
13.5    | 2.90

Table: The wave-numbers $k$ used for each of the pressures studied. {#tbl:wave_numbers}

### Intermediate Scattering Function

Having found the value of the wave number
to calculate the decay of the intermediate scattering function,
we can move out attention to the calculation of the value.
When dealing with an isotropic liquid in two dimensions,
we can evaluate the intermediate scattering function
using the below equation

$$ F(k, t) = \frac{1}{NM} \left \langle \sum_j^N\sum_{a=1}^M \cos \left (
k \left[\cos\left(a\frac{2\pi}{M}\right), \sin \left(a\frac{2\pi}{M} \right) \right]
\cdot [\Delta x_{j}(t), \Delta y_{j}(t)]
\right ) \right \rangle $$ {#eq:intermediate_scattering_function}

![The intermediate scattering function of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale on the time axis.
](../Projects/Dynamics/figures/scattering_function.svg){width=81% #fig:intermediate_scattering_function}

At low temperatures ($T=1.25$ to $T=1.4$)
the relaxation of the intermediate scattering function
takes place through a two step process,
the initial relaxation to a plateau at \num{1e4} timesteps,
with the bumps indicating a reversal of relaxation.
Both these features,
the two step relaxation,
and the reversal of relaxation
are features characteristic of a supercooled liquid,
an interesting phenomenon,
particularly since there is an onset above
the melting point.

![The characteristic timescales for the intermediate scattering function
over a range of temperatures and pressures.
To put multiple pressures on a single scale,
all the temperatures have been scaled
relative to the melting point.
](../Projects/Dynamics/figures/scattering_function_summary.svg){width=80% #fig:isf_relaxation}

Taking the characteristic timescale of the
relaxation of the intermediate scattering function,
which is the rate coefficient of the exponential decay,
we get @fig:isf_relaxation.
This includes results from both
a high pressure simulation ($P=13.50$),
and a low pressure simulation ($P=1.00$).
Plotting the results from both simulations
normalising the temperature by
the melting point of each pressure,
the results collapse onto a single curve.

@fig:isf_relaxation is also an excellent example
of non-Arrhenius behaviour commonly found in supercooled-liquids,
with there being a distinct shift in the temperature dependence
above and below $T_m/T$ of 0.8.
What is particularly interesting about this behaviour
is that it occurs above the melting point,
that is, in a liquid that is not supercooled.
The degree to which this behaviour is non-Arrhenius
can be determined by fitting the Vogel--Tammann--Fulcher (VTF) relations
which are shown as a black line on the figure.
With the analytical description of the curve
it is possible to extrapolate to
the relaxation time associated with the glass transition, \num{1e14}. [@Meenakshisundaram2019]
This gives the estimations of the glass transition temperature
which are shown in @tbl:glass_transition_temp.
Also notable about these temperatures
is that the temperature typically cited
for the onset of dynamic heterogeneities, $1.2\ T_g$, [@cite]
is close to the estimated melting point,
particularly for a pressure of 1.00.
This raises an important question,
is the fragility a feature of the supercooled liquid,
is it a feature of approaching the glass transitions,
or something else entirely?

Pressure | $T_g$ | $1.2 T_g$ | $T_m$
---------|-------| --------- | ------
1.00     | 0.28  | 0.34      | 0.36
13.50    | 1.05  | 1.26      | 1.35

Table: Estimations of the glass transition temperature $T_g$
for each pressure based on fitting the
Vogel--Tammann--Fulcher relation. {#tbl:glass_transition_temp}

The VTF relations also provide a method of finding the fragility $m$,
measuring how far the dynamics deviate from Arrhenius,
which has values ranging from $\approx 16$
for strong liquids and exceeds 200 for fragile liquids. [@Meenakshisundaram2019]
The structural relaxation has a fragility $m=220$,
well into the region of the fragile liquids.
This exceeds the highest fragility $m=188$ found
for a trimer molecules by @Meenakshisundaram2019,
who used a machine learning algorithm
to design the most fragile molecules.
While the results are not directly comparable
on account of being 3D compared to our 2D simulations
this molecule is amongst the best simulated glass formers.
The determination of a large fragility
is supported by the dynamic behaviour
which is representative of fragile liquids,
namely the step relaxation process (@fig:intermediate_scattering_function).

### Contribution of Individual Particles

The intermediate scattering function
describes the relaxation of the entire configuration
with no way of ascribing relaxation to individual particles.
Here we use the structural relaxation defined in @eq:structural_relaxation
where particles contributing to relaxation
can be identified at each timestep.

![The structural relaxation of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale on the time axis.
](../Projects/Dynamics/figures/structural_relaxation.svg){width=80% #fig:structural_relaxation}

The shape of @fig:structural_relaxation has
many of the same features as @fig:intermediate_scattering_function,
the reversal of relaxations at \num{1e4} timesteps,
the exponential relaxation.
The large difference between the two types of relaxation
is that the two-step relaxation process
is much more noticeable @fig:intermediate_scattering_function.

### Diffusion

The Stokes-Einstein relation was derived for particles undergoing Brownian motion,
which over long enough timescales because of the collisions with other particles
will move away from its initial position at a linear rate
where the diffusion constant $D$ has the relation

$$ D = \frac{1}{4}\lim_{t->\infty} \langle \Delta \vect{r}^2 \rangle $$

Plotting the Mean Squared Displacement (MSD) of the trimer molecule
gives the image below.

![The Mean Squared Displacement of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale of both axes.
](../Projects/Dynamics/figures/mean_squared_displacement.svg){width=80% #fig:msd}

At high temperatures the MSD moves from the ballistic regime,
where the particles haven't collided
so the displacement is increasing with a power law of order 2.
There is then a quick transition to the diffusive regime,
where particles are undergoing Brownian motion.
At lower temperatures,
the quick transition from the ballistic becomes much longer
forming a plateau region.
This plateau region is indicative of dynamics
which are not described by Brownian motion,
and more notably regions of dynamic heterogeneities.
A structural description of this region
describes the particles being stuck in 'cages',
local regions which require significant free energy to escape.
The value of the Mean Squared Displacement
which corresponds to the end of the plateau region
can be interpreted as the

![The diffusion constant as a function of temperature
normalised by the melting point for a range of pressures.
](../Projects/Dynamics/figures/diffusion_constant_summary.svg){width=80% #fig:diffusion_constant}

### Rotational Relaxations

While it is typical to consider translational diffusion constants,
instead of a rotational diffusion constant $D_r$,
the quantity typically calculated for rotations
is a rotational relaxation time $\tau_r$
where $\tau_r \propto 1/D_r$.
This is a way of dealing with the periodicity of rotational motion,
instead of keeping track of every rotation of a molecule,
the rotational relaxation function $C(t)$ is a measure of
how orientationally aligned a configuration is to another
and is given as

$$ C(t) = \langle \hat{\vect{e}}(0) \cdot \hat{\vect{e}}(t) \rangle $$

where $\hat{\vect{e}}(0)$ and $\hat{\vect{e}}(t)$ are the orientations
The rotational relaxation time is
the time taken for the relaxation function to decay to $1/e$.
When the rotational relaxation function
is approximated as a exponential decay,
the relaxation time is the rate of the decay.

![The rotational relaxation of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/rotational_relaxation.svg){width=80% #fig:rotational_relaxation}

### Summarising Standard Dynamics

The dynamic behaviour of the trimer molecule
reflects that of a highly fragile liquid,
displaying dynamic properties
that fit well with existing theories of dynamics,
namely the Vogel--Tammann--Fulcher relation
which extrapolates a fragility $m=220$.
Additionally the dynamic behaviour
is indicative of a fragile liquid,
the two-step relaxation in
the structural relaxation (@fig:structural_relaxation)
and the rotational relaxation (@fig:rotational_relaxation).
This is also supported by the plateau region
in the mean squared displacement (@fig:msd).
These behaviours which have also been observed
in both simulations and experiments of fragile liquids,
demonstrate that this molecule is a good candidate
for further investigation of it's dynamic behaviour
and there are no issues dealing with a simulation in 2D.

The only unusual property is the onset of this fragility
well above the melting point.
This is likely a result of the incredibly slow dynamics at the melting point
the with a timescale barely accessible to simulation.

## Dynamic heterogeneities

Dynamic heterogeneities have been described qualitatively,
with features of the previous dynamic quantities
noted as a characteristic sign of supercooled liquids.
However to discuss them,
they need to be adequately measured.

### Translational heterogeneities

Dynamic heterogeneities are a phenomenon
where there are multiple timescales within a single material,
that is, some regions of the material are moving fast
while others are moving slow.
This phenomenon has been observed in a wide range of materials
both simulated and experimental.
The quantity used to measure this is the non-Gaussian parameter $\alpha$,
which is a measure of how far the distribution of motions
deviates from the expected Gaussian distribution [@Donati1999;@Rahman1964].

![The non-Gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/non_gaussian.svg){width=80% #fig:non-gaussian}

As the temperature decreases from 2.5 to 1.30,
the maximum value of non-Gaussian parameter increases,
demonstrating an increase in the dynamic heterogeneities,
that is, there is a big difference between
the fastest and the slowest particles.
In addition to the increase in
the value of the maximum,
the time at which the maximum occurs
becomes later moving from high temperature to low.

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
of a simulation at T=1.35 and P=13.50
at the time of the maximum of the translational non-Gaussian.
The translational motion is denoted by an arrow depicting
the size and the direction of the motion,
while the rotational motion is depicted by ...TODO...
Areas which are white are indicative of no motion,
while coloured areas have lots of motion.
](../placeholder_figure.png){width=80% #fig:spatial_heterogeneities}

## Relaxations of Individual Molecules

The relaxations we have been calculating
are characteristic times for
the entire simulation configuration.
From the presence of the dynamic heterogeneities,
there are different timescales
on which relaxation takes place.
So rather than having a single characteristic time
for the entire simulation,
having characteristic timescales for every particle
gives us more information on how
the different relaxations are linked
for each individual particle.
This idea of applying a relaxation
to each individual particle
was introduced by @Widmer-Cooper2009
for the structural relaxation.
Here we build upon this idea
developing relaxation times
for all the dynamics quantities.

One of the key differences introduced
is rather than defining a relaxation function
which describes the total relaxation,
the relaxation of each particle is considered.
With the characteristic timescale
taken from the average over all the particles.

### Reversible behaviour in structural relaxation

When calculating structural relaxation though
the intermediate scattering function
we use a characteristic wave number.
This wave number $k$ inherently has a
length scale $d$ associated with it

$$ d = \frac{\pi}{2k} $$

This distance can then be used to define relaxation
with particles having moved further than this distance
being considered relaxed.
Here we are looking for the time taken
for a particle to first move beyond this characteristic distance.
This length scale is typically considered
the distance a particle has to move
to completely forget it's previous environment.[@cite]
When comparing the structural relaxation time
to the relaxation time $\tau_F$ (@fig:first_passage_time)
there is a distinct different in both the timescale
and the shape of the two curves,
with a particularly noticeable deviation in shape
at $T_m/T = 0.80$.

![Structural relaxation compared with the first passage time
](../Projects/Dynamics/figures/first_passage_time.svg){width=80% #fig:first_passage_time}

The idea that reversible relaxations
play an important role in dynamics
is one which has been investigated previously [@deSouza2008]
and presented as an issue when introducing
a local structural relaxation quantity. [@Widmer-Cooper2009a]
@Doliwa2003 find metabasins with radii up to 4 times
the size of the simulated particles
which is far larger than a half radius
which is typically considered as
the escape from the local environment.
The return to the previous structure is important
since once a particle leaves it's local neighbourhood
it should have no memory of where it was.
This raises the idea
that a molecule will make multiple attempts
at escaping the local environment,
with many of them failing,
resulting in a reversed relaxation.

When a particle completely escapes it's local environment
it is entirely possible to return
as a part of the random process.
A particle undergoing a random walk in 2D
is guaranteed to return to it's original position, [@Polya1921]
and with a probability of 34% in 3D. [@Watson1939;@Weisstein]

The approach to solving these issues is using the last passage time,
building upon the ideas of @Widmer-Cooper2009a and @deSouza2008
in acknowledging a particle will undergo reversible relaxations,
however there is a distance beyond which
the particle has no 'memory' of it's previous location,
this distance is the diffusive distance,
and is $3 \frac{\pi}{2k} \approx 1.2$.
The last passage time $\tau_L$ is the time
a particle undergoes a structural relaxation,
that is moves a distance $\approx 0.4$,
before it moves beyond the diffusive distance.
The last passage time $\tau_L$ is far better at describing
the structural relaxation (@fig:last_passage_time),
closely following the shape of the structural relaxation timescale.

![Structural relaxation compared with the last passage time
](../Projects/Dynamics/figures/last_passage_time.svg){width=80% #fig:last_passage_time}

### Single particle diffusion

The length scale which we have associated with diffusion is $3 \frac{\pi}{2k} \approx 1.2$
chosen for being close to a value of 1
with the idea that $D = 1/\tau_D$.
While this does hold true over the range of temperatures (@fig:diffusive_time)
the timescale is possibly too small.

![Diffusion constant compared with the diffusive timescale
](../Projects/Dynamics/figures/diffusive_time.svg){width=80% #fig:diffusive_time}

### Single particle rotational relaxations

Of all the molecular quantities,
the rotational relaxations are
the most comparable to the traditional
dipole relaxation times (@fig:rotational_time).
The reason for this is that the length scale
for the dipole relaxation is more well defined
that either the structural relaxation or the diffusion.
The rotational relaxation $C_2$ has it's first zero
at an angular displacement of $\pi/4$,
which is the angular displacement required for
the relaxation quantity $\tau_{T4}$.

![Rotational relaxation times compared with the rotational relaxations
](../Projects/Dynamics/figures/rotational_time.svg){width=80% #fig:rotational_time}

### Summary

As a way of summarising the relationships between
the traditional quantities and the newer molecular relaxation quantities
@fig:ratio_comparison shows the temperature dependence of
the ratios of the old and new quantity.
At $T_m/T < 0.5$ the temperature dependence deviates,
however at lower temperatures,
there is a nearly constant relation
between the two types of relaxation.
This demonstrates these quantities
are appropriate for developing our
understanding of dynamics.

![Summary of comparisons
](../Projects/Dynamics/figures/ratio_comparison.svg){width=80% #fig:ratio_comparison}

### Heterogeneities in Molecular Relaxations

One of the benefits of describing relaxation times
for each individual molecule
is it provides methods of probing
the distribution of timescales
over which these processes occur.
This provides methods of understanding
the effect of unusually slow events
on the overall dynamics.

The distribution of the last passage time $\tau_L$
is given in @fig:relaxation_distribution.
As the temperature drops,
the proportion of relaxations
which are far longer than the mean increases,
which results in raising the mean.

![Histogram displaying the distribution of the relaxation times
for the last passage time.](../placeholder_figure.png){width=80% #fig:relaxation_distribution}

It is possible to measure
the deviation of these relaxations from Gaussian
by finding the ratio between
the arithmetic mean and
the harmonic mean
of each molecules relaxation.
Giving a metric for the dynamic heterogeneities $\alpha_M$

$$ \alpha_M = \frac{\langle \tau \rangle}{\left\langle \tau^{-1} \right\rangle^{-1}} $$

In effect this weights larger and smaller values differently,
the arithmetic mean is dominated by the longest relaxation times,
while the harmonic mean is the inverse,
dominated by the small relaxation times.
The heterogeneity of each of the molecular relaxation quantities
is displayed in @fig:molecular_heterogeneities.
As the temperature drops,
the heterogeneities dramatically increase,
however the quantities don't do so equally.
Quantities which have a longer length-scale
demonstrate significantly less heterogeneity,
with $\tau_F$ having the most while $\tau_D$ has the least.
The longer the distance travelled
the more Gaussian the relaxation.

![Heterogeneous dynamics of the molecular relaxations
](../Projects/Dynamics/figures/molecular_heterogeneities.svg){width=80% #fig:molecular_heterogeneities}

## Jump Dynamics

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

## Coupling of translational and rotational motion

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
