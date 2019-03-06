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
deviates from the expected gaussian distribution.

![The non-gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/thesis/non-gaussian.pdf)

### Rotational Relaxation

While it is typical to consider translational diffusion constants,
instead of a rotational diffusion constant $D_r$,
the quantity typically calculated for rotations
is a rotational relaxation time $\tau_r$
where $\tau_r \prop 1/D_r$.
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

### Shear Viscosity
