# Results

To allow the comparison of dynamics between materials with a range of properties,
dynamics quantities are presented relative to the melting point of the material,
that is using the quantity

$$ T/T_m $$

where $T$ is the experimental temperature and $T_m$ is the melting point.
For the results presented here,
we don't have an accurate determination of the melting point,
instead using our best approximation,
the details of which are discussed in \ref{sec:crystal_melting}
and presented in @tbl:melting_points.

 Pressure   Melting Point
---------  --------------
     1.00            0.36
    13.50            1.35

Table: The melting points of the trimer molecule for different pressures. {#tbl:melting_points}

## Comparison with other systems

Much of the theory of dynamics in molecular systems
has been built around the
Stokes-Einstein relation [@Stokes???]
$$ D_t \eta / T = \text{constant} $$
and the Stokes-Einstein-Debye relations [@Stokes???].
$$ D_r \eta / T = \text{constant} $$
where $D_t$ is the diffusion constant of the translational motion
$D_r$ is the diffusion constant of the rotational degrees of freedom,
$\eta$ is the shear viscosity, and
$T$ is the temperature.

## Structural Relaxation

The measurement of structural relaxation in two dimensions
is the same as for three dimensional systems,
using the intermediate scattering function (@eq:intermediate_scattering_function).
To compute the values monitoring
the structural relaxation,
we first have to compute the value of the wave-number
which will give the greatest change
In computing the values for this function,
it is first required to
find the wave-number which corresponds to
to first maximum of the static structure factor.

### Static Structure Factor

The static structure factor
is a function describing how a crystal
scatters incident radiation,
being used extensively to understand and interpret
scattering patterns in diffraction experiments
of both ordered and disordered materials.
In computational systems,
the static structure factor is computed from
the radial distribution function $G(\vect r)$
which is given by

$$ G(\vect r) = \frac{1}{\rho} \left \langle
  \sum_{i \ne 0} \delta(\vect r-\vect{r}_i )
\right \rangle $$

where $\vect r$ is the position vector,
$\rho$ is the density of the system,
the reference particle is given the index 0,
with all other particles $r_i, i \ne 0$
some distance away.
The angle brackets $\langle \rangle$ denote
an ensemble average
over many particles.

The radial distribution function
for the trimer molecule
is shown in @fig:radial_distribution.
This shows that the distribution
is more complicated than
a single component liquid,
being more comparable to a binary mixture.

![The radial distribution function of the Trimer liquid at a pressure $P=13.50$ and a
temperature $T=1.50$. The radial distribution is taken as an average over 100 configurations of
the input trajectory. There shape of the molecule means there are three distinct first
shell peaks, which are also visible in the second shell. In further shells the only
impact on shape is the longer than usual tails of the peaks.
](../Projects/Dynamics/figures/thesis/radial_distribution.pdf){width=80% #fig:radial_distribution}

From the radial distribution function $G(r)$,
we can obtain the static structure factor $S(k)$
for an isotropic liquid
using the following transformation

$$ S(k) = 1 + 4 \pi \rho \frac{1}{q} \int \d r r \sin(qr)[g(r) - 1] $$

Which is plotted for the trimer molecule
in @fig:static_structure_factor.
The position of the first peaks
for the two pressures studies are
given in @tbl:wave_numbers.
The values of the wave-number
over the range of temperatures
was considered to be close enough
that a single value was to be used
for each pressure
which are given below.

![The static structure factor of the Trimer liquid at a pressure $P=13.50$ and a
temperature $T=1.50$. This is calculated from an average over 100 configurations.
within the trajectory. The first peak corresponds to a value of 2.90.
](../Projects/Dynamics/figures/thesis/static_structure_factor.pdf){width=80% #fig:static_structure_factor}

 Pressure  $k$
 --------  -----
     1.00   2.80
     13.5   2.90

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
](../Projects/Dynamics/figures/thesis/scattering_function.pdf){width=81% #fig:intermediate_scattering_function}

At low temperatures ($T=1.25$ to $T=1.4$)
the relaxation of the intermediate scattering function
takes place through a two step process,
the initial relaxation to a plateau at \si{1e4} timesteps,
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
To put multiple preesures on a single scale,
all the temperatures have been scaled
relative to the melting point.
](../Projects/Dynamics/figures/thesis/isf_relaxation.pdf){width=80% #fig:isf_relaxation}

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
that is, in a liquid not supercooled.

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
](../Projects/Dynamics/figures/thesis/structural_relaxation.pdf){width=80% #fig:structural_relaxation}

The shape of @fig:structural_relaxation has
many of the same features as @fig:isf_relaxation,
the reversal of relaxations at \si{10e4} timesteps,
the exponential relaxation.
The large difference between the two types of relaxation
is that the two step relaxation process
is much more noticeable @fig:isf_relaxation.

## Diffusion

The Stokes-Einstein relation was derived for particles undergoing Brownian motion,
which over long enough timescales because of the collisions with other particles
will move away from it's initial position at a linear rate
with the gradient $m$ having the relation

<!-- TODO properly write out equation -->

$$ m = 4D. $$

Plotting the Mean Squared displacement (MSD) of the trimer molecule
gives the image below.

![The Mean Squared Displacment of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale of both axes.
](../Projects/Dynamics/figures/thesis/mean_squared_displacement.pdf){width=80% #fig:msd}

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

![The diffusion constant as a function of temperature
normalised by the melting point for a range of pressures.
](../Projects/Dynamics/figures/thesis/diffusion_constant.pdf){width=80% #fig:diffusion_constant}

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

$$ C(t) = \langle \hat\vec e(0) \cdot \hat \vec e(t) \rangle $$

where $\hat \vec e(0)$ and $\hat \vec e(t)$ are the orientations
The rotational relaxation time is
the time taken for the relaxation function to decay to $1/e$.
When the rotational relaxation function
is approximated as a exponential decay,
the relaxation time is the rate of the decay.

![The rotational relaxation of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/thesis/rotational_relaxation.pdf){width=80% #fig:rotational_relaxation}

## Dynamic heterogeneities

Dynamic heterogeneities have been described qualitatively,
with features of the previous dynamic quantities
noted as being a telltale sign of heterogeneous dynamics.
However to truly discuss them,
they need to be adequately measured.

### Translational heterogeneities

Dynamic heterogeneities are a phenomenon
where there are multiple timescales within a single material,
that is, some regions of the material are moving fast
while others are moving slow.
This phenomenon has been observed in a wide range of materials
both simulated and experimental.
The quantity used to measure this is the non-gaussian parameter $\alpha$,
which is a measure of how far the distribution of motions
deviates from the expected gaussian distribution [@Donati1999].

![The non-gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/thesis/non_gaussian.pdf){width=80% #fig:non-gaussian}

As the temperature decreases from 2.5 to 1.30,
the maximum value of non-gaussian parameter increases,
demonstrating an increase in the dynamic heterogeneities,
that is, there is a big difference between
the fastest and the slowest particles.
In addition to the increase in
the value of the maximum,
the time at which the maximum occurs
becomes later moving from high temperature to low.

<!-- - TODO Is this anything more than the dynamics slowing down:  <03-05-19, Malcolm Ramsay> - -->

### Rotational Heterogeneity

- calculation of rotational Heterogeneity
- there are rotational heterogeneities,

### Rotational and Translational Heterogeneity

There are rotational heterogeneities and translational heterogeneities

- just a coincidence
- are they co-located, mobile regions just mobile for everything
- correlated, high rotational/translational mobility allows the other

- maps overlaying rotational heterogeneities with translational heterogeneities

- calculation of Gamma
- figures

These are methods of looking at the entire system as a whole

- it makes sense to be able to define these quantities for single molecules

## Molecular Relaxations

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

This builds upon the ideas of Widmer-Cooper and Harrowell [@Widmer-Cooper2009]
in tying the motion of a particle
at a particular length scale to relaxation.
In this case, though,
rather than defining a relaxation function
with a characteristic time,
The relaxation time of each individual particle,
being the time taken to move the characteristic distance,
is the quantity that is averaged over.

### Single particle structural relaxation

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

### Single particle diffusion

- Use the length scale associated with the wave-number
    - multiplied by 3

### Reversible relaxations

- In the structural relaxation there are bumps
    - this indicates there are large reversible fluctuations
    - the single particle structural relaxation doesn't account for this

- Once a particle leaves it's local neighbourhood it should have no memory of where it
  was
- There is some reversibility with brownian motion
- Relaxation time is the last time it undergoes structural relaxation before diffusion

### Single particle rotational relaxations

- defined based on the distances for the rotational relaxations
- Additionally an angle corresponding to half the angle between the smaller particles

## Comparison of relaxation times

- mean vs harmonic mean
    - weighting motions differently
    - which values are small
- randomly sampling the states

- Diffusion compared to molecular diffusion
    - distance of 2 is still small compared to diffusive motion
    - at the onset of diffusion
    - This observes only a few relaxations
    - when over a longer time-scale, there are many motions

## Timescale of Motions

- Diffusion is a long timescale behaviour
    - doesn't capture the heterogeneities

- Develop jump model
    - making assumption that a particle has no memory once moved distance $d$
    - we can then randomly take the motions from
        the distribution of short time scale motions
    - Over long enough time scales, the heterogeneities disappear

## Possible Investigations

- Kauzmann temperature
    - Have potential energy of the equilibrium liquid and crystal states
    - What is the difference?
    - Can this be used to find an estimate, or bounds on
        - the glass transition temperature
        - the Kauzmann temperature
        - any other properties

- Calculation of alternative structural relaxations
    - van Hove relaxation -> Histogram over radius and time, for $i \ne j$
    - How close is $G(r)$ at time $t$ to $G(r)$ at time $0$.
    - Two point time dependent correlation $G(r, t)$
    - Four point time dependent density correlation $G(r_1, r_2, t)$ [@Daspugata1991]
    - Assignment matching -> Hungarian Algorithm
    - The idea of memory and caging?
        - A distance of 0.4 is greater than would be expected for caging

- Fit non-exponential relaxations
    - Kohlrausch function $\theta(t) = \exp(- (\frac{t}{\tau})^\beta$ where $0 < \beta \le 1$
    - typically the change in function is a result of multiple processes

- What is the glass transition temperature?
    - A $T_g$ of 1.2 would indicate glassy dynamics at $T=1.45$.
    - Is 'supercooled liquid' more about dynamics above a glass transition temperature
      than below a melting point?

- Rotational diffusion constant
    - This is the MSD of the rotations
    - Plotting this value could be rather interesting

- Length scales
    - Bimodal distribution -> fast particles vs slow particles
    - Clustering of fast particles
    - Clustering with velocity as a defining variable
    - Using DBSCAN with connectedness
    - Is it just a time scale???
    - Estimate number of particles from rate constant -> does this correspond to size?

- Spatial correlation
    - How are the fastest and slowest particles correlated with each other spatially
    - Does this change as a function of temperature?
    - Does this change as we increase/decrease the timescale?
    - Ref [@Kob1997; @Donati1999]

- Onset of activated process?

- Velocity autocorrelation
    - $$ G_v(t) = \frac{\langle \vect v_i(t) \cdot \vect v_i(o) \rangle}
      {\langle \vect v_i(0) \cdot \vect v_i(0) \rangle} $$
        [@Brodka1992]
    - This relates to the choice of the imaginary mass for the thermodynamic properties.

- Temperature dependence of properties
    - Structural relaxation
    - Rotational Relaxation
    - Diffusion constant

- Spatial heterogeneities
    - How long to remove these
    - Measure of heterogeneous dynamics $\alpha$ follows a single curve
        - the difference is where the relaxation tips over
        - What causes the 'master curve'?
        - What is the cause of the tipping point?
        - What prevents it from occurring earlier?

- Over the timescale of heterogeneities there is a direction to the motion
    - See the papers on following tubes, 1D dynamics
    - Can rotations do the same thing
        - no longer getting motion which is random because of collective dynamics

- Brownian dynamics breaks down because there is collective motion
    - length scale of collective motion?
    - why haven't we observed it?

- Pressure dependence
    - [@Ediger1996]
    - Does the fragility change with compression?

- Measure heat capacity
    - How to do this?

- Step dynamics / hops
    - can this be ignored
    - over what timescales can it be ignored
    - how many hops for the distribution to be as expected

- Scaling of Viscosity (structural relaxation)
    - are there any alternative theories / theoretical results that fit
        - Uniform local volume expansion [@Dyre1996]
        - $$\eta = \eta_{0} \left( \frac{C}{G_{\inf} (T)} \right) $$

The dynamics studied here are primarily above the melting point,
however the liquid displays behaviour normally attributed
to a supercooled liquid while above the melting point.
