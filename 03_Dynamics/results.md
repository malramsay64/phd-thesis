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

The structural relaxation is often referred to
as the timescale of importance within a liquid,
the intention of the measurement is
the timescale on which the liquid
loses any memory of it's previous state.
This is typically measured using the
density autocorrelation function.
The density autocorrelation is a

### Diffusion

The Stokes-Einstein relation was derived for particles undergoing Brownian motion,
which over long enough timescales because of the collisions with other particles
will move away from it's initial position at a linear rate with the slope $m$ having the
relation

<!-- TODO properly write out equation -->

$$ m = 4D. $$

Plotting the Mean Squared displacement (MSD) of the trimer molecule
gives the image below.

![The Mean Squared Displacment of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note that both axes are plotted using a logarithmic scale.](../Projects/Dynamics/figures/thesis/mean-squared-displacement.pdf)

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

#### Dynamic heterogeneities

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
scale.](../Projects/Dynamics/figures/thesis/non-gaussian.pdf)

### Rotational Relaxation

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

<!-- TODO rewrite as quaternions -->

$$ C(t) = \langle \hat\vec e(0) \cdot \hat \vec e(t) \rangle $$

where $\hat \vec e(0)$ and $\hat \vec e(t)$ are the orientations
The rotational relaxation time is
the time taken for the relaxation function to decay to $1/e$.
When the rotational relaxation function
is approximated as a exponential decay,
the relaxation time is the rate of the decay.

## Glass formation temperatures

- Kauzmann temperature
    - Have potential energy of the equilibrium liquid and crystal states
    - What is the difference?
    - Can this be used to find an estimate, or bounds on
        - the glass transition temperature
        - the Kauzmann temperature
        - any other properties

## Possible Investigations

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
    - This is the MSR of the rotations
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
    - Ref [@Kob1997, @Donati1999]

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
