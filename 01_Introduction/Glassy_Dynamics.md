# Glassy Dynamics

Dynamics are important to both Crystal Growth, as a rate term
and to understanding the Glass.

## Introduction to Dynamics

Current models of motion in the liquid state
are based on the Stokes-Einstein-Debye relationships[@Debye1929],
which are theoretical models of collective motion
derived from particles undergoing Brownian motion[@Einstein1956].
These models define characteristic rates of motion
known as diffusion constants,
with $D_t$ being the diffusion constant of translational motion
while $D_r$ is the diffusion constant of rotational motion.
The Stokes--Einstein equation for translational motion

$$ D_t = \frac{k_\text{B} T}{6 \pi \eta R} $$

and the Stokes--Einstein--Debye relation for rotational motion

$$ D_r = \frac{k_\text{B} T}{8 \pi \eta R^3} $$

where

- $\eta$ is the shear viscosity, and
- $T$ is the temperature.

These equations can be simplified as follows

$$ \frac{D_t \eta}{T} = \text{constant} $$ {#eq:stokes_einstein}

and

$$ \frac{D_r \eta}{T} = \text{constant} $$ {#eq:einstein_debye}

which allows us to express a relationship
between the rotational and translational diffusion

$$ D_t \propto D_r $$ {#eq:sed_proportionality}

when both are at the same temperature and viscosity.

One of the detractors of Brownian dynamics
is that it describes the dynamics of independent events,
making no account for momentum.
An alternative method of describing the dynamics of particles
is through Langevin Dynamics,
which does include the momentum of particles.
This ends up giving the same result
for the Stokes-Einstein-Debye relations.
This is because it is possible to consider
Brownian Dynamics as a more granular form
of Langevin Dynamics.

The Stokes-Einstein-Debye models are suitable for describing
the dynamic properties of most liquids, however,
there are instances in supercooled liquids,
where the Stokes-Einstein-Debye relations
are insufficient for describing the dynamics which are observed.
The breakdown in dynamics is primarily
a case of the underlying particle motions
no longer adhering to Brownian motion.

### Structural Relaxation

Structural relaxation is the most fundamental relaxation process [@Angell2000]
being the process by which a liquid forgets it's structure
from some earlier time [@Ediger1996].
The process of structural relaxation occurs over distances
comparable to the size of the particles within the liquid [@Angell1985].
These small distances over which the structural relaxation take place
are comparable to the relaxations that take place
when the liquid is under a shear stress.
The motion of the liquid under a shear stress,
otherwise known as shear viscosity and denoted by $\eta$,
has been shown to have the same temperature scaling
as the structural relaxation time
in both experimental [@Ediger2012] and computational [@Perera1999] systems.
A rationalisation of this relationship
can be to consider a force pushing on one part of the configuration,
the structural relaxation time is indicative of
the time the state takes to adjust to the applied force.
In a liquid, applying force results in flow
with the viscosity being a measure of the resistance to flow.

Consider a force pushing on the material,
the structural relaxation is the timescale
over which the material can rearrange to reduce that force.
When the force is continuous,
we are measuring the viscosity,
so the structural relaxation is used within experiments
in the place of viscosity.

This relationship between the shear viscosity and the structural relaxation
allows us to rewrite the Stokes-Einstein-Debye relations as

$$ D \propto \frac{1}{\tau_s} \text{ and } \tau_r \propto \tau_s $$

where we are using the structural relaxation time
as the fundamental relaxation time,
providing a link between
the diffusion constant $D$ and the rotational relaxation time $\tau_r$.

### Diffusion Constant

The translational diffusion constant $D_t$
is a measure of how fast particles within the liquid
move over a long time period.
It's formulation is based upon Brownian dynamics,
where, over long time periods,
the displacement from the origin $\Delta x(t)$ at time $t$
averaged over many initial configurations
has the relation

$$ \langle \Delta x(t)^2 \rangle = 2 D_t t $$

where the angle brackets $\langle\rangle$ represent
the average over many initial conditions.
In the case of a molecular dynamics simulation
this is over all the individual particles.
The relation shown above is for a 1D random walk,
with each dimension contributing to the diffusion giving

$$ \langle \Delta \vect{r}(t)^2 \rangle = 4 D_t t $$

for the 2D case and

$$ \langle \Delta \vect{r}(t)^2 \rangle = 6 D_t t $$

for the 3D case.
Where $\Delta \vect{r}(t)$ is the displacement over all dimensions.

The Mean-Squared-Displacement (MSD) has a characteristic shape,
with the initial section representing the ballistic motion
before particles have collided with any other.
Since the particles are moving freely,
the MSD has increases as a power law of order 2.
This ballistic region transitions into a diffusive region
where the dynamics are governed by many small steps.
This diffusive regime defines the diffusion constant,
so the calculation of the diffusion constant
is often written as

$$ D = \frac{1}{2tN} \lim_{t\to\infty} \langle \Delta \vect{r}(t)^2 \rangle $$

reflecting the long timescale behaviour.

The Diffusion is measured in experimental systems
using \ce{1H}-NMR [@Chang1994;@Chang1994a;@Fujara1992;@Mapes2006;@Andreozzi1997]
which allows for direct comparison with simulation.

### Rotational Relaxation

What is termed rotational relaxation,
is typically measured as a dipole relaxation.
This describes rotational motion as a sequence of
small infinitesimal jumps of a dipole around the unit sphere
using spherical harmonics $Y_l^m$.
This allows us to express a rotational relaxation function $R_l(t)$
in terms of those spherical harmonics

\begin{align}
R_l(t) &= \langle Y_l^m(0) Y_l^{-m}(t) \rangle \\
       &= \exp(-D_r\,l(l+1)t)
\end{align}

This formulation represents the rotational relaxation as an exponential.
The exponential is nice in that we can find a characteristic timescale $\tau_l$
for relaxation to occur, where

$$ \tau_l = \frac{1}{D_r\,l(l+1)} $$

Here relaxation is the time taken for relaxation from
the initial value of $Y_l^m$ to it's first zero.

The relaxation of a dipole $C_l$,
where the orientation of the dipole is represented by the vector $\hat{\vect{u}}$
can be represented as

$$ C_{l} = \langle P_l(\hat{\vect{u}}_i(t) \cdot \hat{\vect{u}}_i(0)) \rangle_i $$

Here $P_l$ is the Legendre polynomial of degree $l$,
and the angle brackets signify an average over
all molecules and starting configurations.

The rotational relaxation functions $C_l$
have equivalences in experiments.
The 2nd degree Legendre polynomial corresponds
to NMR [@Dote1981] and fluorescence experiments.

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

![Structural relaxation from a experimental study showing
the transition to the two-step process characteristic of
heterogeneous dynamics](../placeholder_figure.png){#fig:relaxation width=80%}

Relaxations $F(t)$ within systems undergoing Brownian motion,
whether structural or rotational will have the form

$$ F(t) = c \e^{-t/\tau} $$

where $\tau$ is the characteristic timescale of the relaxation.
These produce the curves at higher temperatures shown in @fig:relaxtion
which also has curves which don't fit this description,
an indicator of heterogeneous dynamics.
The other relaxations display a stretched exponential behaviour
and are fit to the Kohlrausch--Williams--Watts (KWW) equation [@Williams1970;@Kohlrausch1854]

$$ F(t) = c \e^{-(t/\tau_\alpha)^\beta} $$

The stretched exponential function provides terms to describe
the two-step relaxation process in @fig:relaxation.
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
is that of @Hurley1995, [@fig:dynamic_heterogenaeties]
where there are regions of particles that retain their original structure,
while others have moved many molecular distances.
This visualisation of the dynamic heterogeneities
is one which has been, and still is, used extensively
in describing this phenomenon.
It captures the phenomenon so succinctly
because the simulation is in 2D,
allowing everything to be represented on the page.
A similar picture is painted in 3D systems, [@Donati1999]
with spatially separated regions of fast and slow particles.

![The spatial distribution of motion
@Hurley1995](../placeholder_figure){#fig:dynamic_heterogenaeties width=80%}

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
One of the results from this analysis of the collective motion,
is that as the temperature is lowered
towards the glass transition temperature $T_g$,
one would expect motion to become more difficult,
requiring more degrees of freedom,
which incorporates the motion of a larger number of particles.
This growing number of particles
can be characterised as a *length scale*,
being the size of mobile regions;
a measurable property in both simulation an experiment.
Despite many experiments [@cite] searching for
a growing length scale as the temperature drops,
there has been no data to suggest this is the case.

:::{class=subfigures id=fig:potential_energy}

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../placeholder_figure.png){#fig:potential_energy_2d width=49%}
![](../placeholder_figure.png){#fig:potential_energy_3d width=49%}
<!-- markdownlint-disable MD045 -->

When we look at two dimensions (a),
there is no possible path for getting from A to B
without going over the large energy barrier.
However, by adding an extra dimension (b),
it becomes possible to go around.

:::

![A representation of the potential energy landscape for a
liquid.](../placeholder_figure.png){#fig:potential_energy_landscape width=80%}

Further evidence for the idea that the structure
plays a role in the resulting dynamics
is work done by @Widmer-Cooper2004,
where the same structural configurations
were initialised with randomised momenta.
Despite the randomisation of the momenta,
the resulting dynamics of each configuration were similar,
most noticeable when looking at dynamic heterogeneities.
Dynamic heterogeneities were present
in the same locations of a configuration
regardless of initial particle momenta.

Where the structure has been tied to dynamics
is in the study of jamming of granular materials.[@cite]
This has also been applied to crystals and glasses.[@cite]
The premise is that particles are unable
to move past each other. [@fig:jamming_diagram]
With molecules that contain concave components,
there is even more susceptibility to jamming.
Another aspect of jamming which has less attention
is rotational jamming.

![Depiction of the jamming of discs.
](../placeholder_figure.png){#fig:jamming_diagram width=80%}

Gears are a method of mechanically transferring rotational motion
from one location to another,
with the requirement that they rotate in opposite directions.
When there are many gears in a plane,
the requirement for rotation in opposite directions
can lead to the jamming of rotational motion.
Take for example @fig:gears_triple,
adding the third gear in a triangular lattice
now means that none of the gears can turn,
completely preventing rotational motion.
This demonstrates the importance of structure
on a gear network,
with square lattice sites allowing rotations
while triangular sites inhibit them.
@Zwanzig1987 models the effect of
jamming and rotational clustering of gear networks,
noting that clusters of the gears in square lattice
will all rotate together acting as a single body.

:::{class=subfigures id=fig:gears}

![Three gears](../placeholder_figure.png){#fig:gears_triple width=40%}
![Four gears](../placeholder_figure.png){#fig:gears_quad width=40%}

If we model the rotational motion of a gear network
Where there are three gears,
like in a triangular lattice
the rotational motion is jammed,
while four gears allow motion to propagate.

:::

## Breakdown in rotational coupling

Another unusual behaviour of supercooled liquids,
is the breakdown of the Stokes--Einstein--Debye relations,
that is, the proportionality in @eq:sed_proportionality
no longer holds true.
Experimental evidence of this is displayed in @fig:trans_rot_otp
which is supported by additional studies.

![Translational an rotational coupling within ortho-terphenyl
breaks down below 290K @Chang1994](../placeholder_figure.png){#fig:trans_rot_otp width=80%}

The idea that the rotational and translational diffusion constants
were proportional to each other
there is the assumption that there is a single "force"
governing the motion of particles.

Our current understanding of the liquid state
breaks down for supercooled liquids.
The assumptions we have made developing
a theoretical understanding of the liquid,
do not take into account the unusual behaviour
observed in supercooled liquids.
