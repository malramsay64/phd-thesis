# Dynamics of the Trimer Molecule {#sec:dynamics_results}

To allow the comparison of dynamics between materials with a range of properties,
dynamics quantities are presented relative to the melting point of the material,
that is using the quantity

$$ T/T_m $$

where $T$ is the experimental temperature and $T_m$ is the melting point.
For the results within this chapter
we use the melting points determined in @sec:Crystal_Melting
which are tabulated in @tbl:melting_points.

 Pressure   Melting Point
 --------  --------------
 1.00            0.36
 13.50            1.35

Table: The melting points of the trimer molecule for different pressures. {#tbl:melting_points}

Analysing the behaviour of the trimer molecule
using the standard dynamic quantities
provides a method of comparing these results
to both existing experiments and simulations.

## Structural Relaxation

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

## Diffusion

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

## Rotational Relaxations

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

@Meyer2019 Pressure dependence

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
