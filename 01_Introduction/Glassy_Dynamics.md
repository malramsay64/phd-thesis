# Glassy Dynamics

Dynamics are important to both Crystal Growth, as a rate term
and to understanding the Glass.

## Introduction to Dynamics

Connecting viscosity using Stokes--Einstein and Stokes--Einstein--Debye

### Structural Relaxation

- Short timescale
- local "cage"
- measured in simulations and experiments

### Diffusion Constant

- long timescale motion
- derived from Brownian motion
- measured in both simulations and experiments

### Rotational (Dipole) Relaxation

- Relaxation of the orientation of a dipole
- measured in simulations and experiments

## Dynamic Heterogeneities

The typical approach to modelling liquid behaviour
describes the liquid as a homogeneous continuum.
This homogeneous model is completely appropriate
for describing "ordinary" liquids.
In supercooled liquids,
the dynamics slow down by many orders of magnitude
before the glass transition,
where dynamics in one region of the liquid
can be orders of magnitude faster
than dynamics in another region of the liquid.
The idea that a liquid is not homogeneous
requires a significant change in how we think about supercooled liquids.

The presence of fast and slow regions within supercooled liquids,
referred to as dynamic heterogeneities
is a phenomenon which has garnered significant interest;
it is considered to be a physical indicator of the glass transition,
a demonstration that it is more than a kinetic phenomenon.

Relaxations $F(t)$ within systems undergoing Brownian motion,
whether structural or rotational will have the form

$$ F(t) = c \text{e}^{-t/\tau} $$

where $\tau$ is the characteristic timescale of the relaxation.
These produce the curves at higher temperatures shown in @fig:relaxtion
which also has curves which don't fit this description,
an indicator of heterogeneous dynamics.
The other relaxations display a stretched exponential behaviour
and are fit to the Kohlrausch--Williams--Watts (KWW) equation [@Williams1970;@Kohlrausch1854]

$$ F(t) = c \e^{-(t/\tau_\alpha)^\beta} $$

The stretched exponential function provides terms to describe
the two-step relaxation process in @fig:relaxtion.
The short timescale relaxation is known as the $\beta$ relaxation,
in relation to the $\beta$ term of the stretched exponential,
and is an indicator of dynamic heterogeneities.
The longer timescale relaxation, denoted the $\alpha$ relaxation
is related to the value of $\tau_\alpha$.
This stretched exponential behaviour has to describe
dynamic heterogeneities and relaxation behaviour
in experimental studies of supercooled relaxations
measured using a range of techniques, including;

- probe molecules [@Cicerone1995a;@Cicerone1995b],
- hole burning experiments [@Schmidt-Rohr1991;@Cicerone1995;@Schiener1997],
- photobleaching [@Cicerone1993], and
- optical microscopy [@Bartko1999].

While the results from experimental systems
are useful in describing the presence of dynamic heterogeneities,
with some even indicating a spatial component.
It is through simulations that the nature of the heterogeneous
dynamics has been understood.
One of the characteristic pictures of dynamic heterogeneities
is that of @Hurley1995, (@fig:dynamic_heterogenaeties)
where there are regions of particles that retain their original structure,
while others have moved many molecular distances.
This visualisation of the dynamic heterogeneities
is one which has been, and still is, used extensively
in describing this phenomenon.
It captures the phenomenon so succinctly
because the simulation is in 2D,
allowing everything to be represented on the page.
A similar picture is painted in 3D systems [@Donati1999],
with spatially separated regions of fast and slow particles.

There are many theoretical foundations
for understanding dynamic heterogeneities.
One of the more general frameworks
originally introduced by @Goldstein1969
is the representation of configuration space
as a high dimensional potential energy landscape.
A single configuration is then a point
on this high dimensional surface.
This idea is depicted in @fig:potential_energy_landscape.
In a high temperature liquid,
there is free movement around the potential energy surface,
giving rise to the homogeneous dynamics.
At the lower temperatures close to the glass transition
there are more limitations to the movement of particles,
with the standard barriers to motion larger than
the energy of particles,
as depicted in @fig:potential_energy_2d.
However because of the high dimensionality of the space,
instead of motion being impossible,
it uses additional dimensions (@fig:potential_energy_3d)
observed as the collective motion of multiple particles.

- Onset near the glass transition temperature
- large difference between mobile and immobile
- Simulations and experiments
- A feature of a fragile glass former

## Breakdown in rotational coupling

- no longer a single governing force
- Supercooled liquids approaching the glass transition temperature
    break our understanding of how liquids should behave.
