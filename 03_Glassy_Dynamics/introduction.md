# Introduction

## Breakdown in Stokes--Einstein--Debye

The Stokes--Einstein--Debye (SED) theory of dynamics
describes a series of relations (@eq:sed) between dynamics quantities.
These relations describe the dynamics of a wide range of liquids,
however, they start to break down in fragile liquids
close to the glass transition temperature.
The canonical example of this is the decoupling
of rotational and translational diffusion [@Chang1994;@Griffin2012;@Fujara1992]
shown in @fig:trans_rot_otp.
This decoupling results from a change in the viscosity dependence
of the translational diffusion having the relationship $D_t \propto \eta^{-0.75}$
which has deviated from the expected $D_t \propto \eta-1$. [@Chang1994]

There is a general consensus on the presence of both these
decoupling within experimental studies, [@Chang1994;@Griffin2012;@Fujara1992]
however, there has been difficulty replicating these results in simulations
demonstrated within this thesis in @sec:trans_rot_decoupling.
@Shi2013 find a similar relationship to those of experiments
for the decoupling of translational diffusion and viscosity,
a result mirrored by @Sengupta2013.
Neither of these studies looked at the rotational motions of particles.
Recent simulations by @Kawasaki2019 on supercooled water
find both a decoupling between translational diffusion and viscosity,
and a decoupling of translational and rotational diffusion,
however, there is also a decoupling of the rotational diffusion and viscosity
which is not observed in experiment
and the rotational diffusion is slow compared to translational diffusion,
the opposite of the experimental results.
This same flipping of the rotational and translational diffusion
is also observed by @Lombardo2006.

The typical simulation quantities used for establishing
the breakdown in the SED relations
are the translational diffusion constant $D_t$
and the rotational relaxation time $\tau_r$.
When there are dynamic heterogeneities present,
these two quantities capture different elements
of the distribution,
with the translational diffusion capturing the fastest particles,
while the rotational relaxation is dominated by the slowest particles.
Consider two regions of dynamics,
one containing fast particles with $\tau_\text{fast}$ and $D_\text{fast}$
and the other containing slow particles with $\tau_\text{slow}$ and $D_\text{slow}$,
where $\tau$ is a relaxation time and $D$ is a diffusion constant.
These values are such that $\tau_{fast} << \tau_{slow}$ and
$D_\text{fast} >> D_\text{slow}$.
When finding the average relaxation time

$$ \frac{\tau_\text{fast} + \tau_\text{slow}}{2} \approx \frac{\tau_\text{slow}}{2} $$

and the average diffusion constant

$$ \frac{D_\text{fast} + D_\text{slow}}{2} \approx \frac{D_\text{fast}}{2} $$

we can how there are different relationships. [@cite]
Here the presence of dynamic heterogeneities results in
a decoupling of translational and rotational motion
by the choice of parameters.

### Breakdown in rotational coupling

A limitation of the Stokes--Einstein model,
acknowledged by Einstein as such, [@Einstein1907;@Bian2016]
is that the inertia of a particle is neglected.
This means that the time resolution of observations becomes important
for the motions of particles. [@Pusey2011;@Li2013]
The SED relations are based on Brownian dynamics
however there is evidence of rotations motions
not described by Brownian motion,
coming in the form of jump dynamics. [@Das2015;@Nair2019;@Laage2006;@Andreozzi1996;@Jose2006]
When describing rotation dynamics using spherical harmonics
which is known as the Debye formalism, [@Lombardo2006]
there are multiple choices for the order of the Legendre polynomial $l$.
@Eq:debye_rotational_diffusion describes the relationship
between the relaxation times for difference choices of $l$.
The ratio $\tau_1/\tau_2$ is used to measure contribution
of large angular jumps to rotational relaxation. [@Jose2006;@Kivelson1970]
The Debye model predicts an exponential decay of the $l$th rank
single-particle orientation time correlation function $R_l^s$,

$$ R_l^s = \exp\left(\frac{-t}{\tau_l}\right) $$

which gives the corresponding relaxation time

$$ \tau_l = \frac{1}{l(l+1)D_r}, $$

where $D_r$ is the rotational diffusion coefficient.
Comparing this relationship for
the first and second-order relaxation functions

$$ \tau_1/\tau_2 = \frac{2(2 + 1) D_r}{1(1+1) D_r} = 3$$

When molecules rotate inertially, that is,
there are large angular displacements between collisions.
The relaxation is no longer exponential,
and can be identified by the ratio $\tau_1/\tau_2$
falling within the range

$$ 1 < \tau_1/\tau_2 < 3 $$

The value of 3 (or 4 for 2D systems)
indicates the rotations are governed by Brownian dynamics,
that is, rotations take place through a sequence of small random steps.
When there are large changes in orientation,
the two relaxation times become correlated
as there are fewer steps for relaxation to occur.
At the limit, a single large motion can describe
both relaxation quantities simultaneously
which is described the $\tau_1/\tau_2 = 1$

## Dynamic Heterogeneities and structure

- Does structure play a role in the presence of dynamic heterogeneities
- Configuration space
- Increasing length scale

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

![A representation of the potential energy landscape for a
liquid.\
*Figure from @Stillinger1995 used with permission © 1995 AAAS*
](../00_Introduction/figures/potential_energy_surface.png){#fig:potential_energy_landscape width=80%}

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

![Depiction of the jamming of discs in an inherent structure
for a trimer molecule with $r=0.7$ and $\theta=120^\circ$\
*Figure from @Jennings2015 used with permission © 2015 Taylor and Francis*
](../00_Introduction/figures/jammed_discs.png){#fig:jamming_diagram width=80%}

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

![Three gears](../00_Introduction/figures/cogs_3.svg){#fig:gears_triple width=40%}
![Four gears](../00_Introduction/figures/cogs_4.svg){#fig:gears_quad width=40%}

If we model the rotational motion of a gear network
Where there are three gears,
like in a triangular lattice
the rotational motion is jammed,
while four gears allow motion to propagate.

:::

- Increasing length scale

@Cummins1997 is a great review
@Royall2018 also reviews the topic

There are numerous methods which can be used to describe
different aspects of the motion of particles.
However each individual piece of information
is only able to tell part of the story,
so we need to be able to have some theoretical framework
which provides a scaffolding for combining these values.

### Free Energy Landscape {#sec:energy_landscape}

@Niblett2016
@Wales2018
@deSouza2017
@Ballard2017
@Niblett2017

In Goldstein's[@Goldstein1969] energy landscape model of dynamics,
this change in dynamic behaviour is characterised
by the transition from free diffusion,
where the energy of the particles
is greater than the energy of the barriers between configurations,
to activated diffusion,
where the transition from one position to another
requires the concentration of energy at a certain point.
There has been evidence of this transition from
free to activated diffusion in simulations of atomic systems [@Barrat1991;@Wahnstrom1991]
where the dynamics change from many small random motions
to a large motions from one site to another
often as part of a correlated motion.
Where dynamics occurs by the process of large jumps,
the assumptions made about the Brownian motion start to break down.
While atomic systems seem to make the transition to jump dynamics,
there is not the same evidence for molecular systems, [@Lewis1994;@Barrat1991;@Wahnstrom1991]
namely the Lewis--Wahnström model of *ortho*-terphenyl,
where rotational motion occurs through jump dynamics
while the translational motion takes remains Brownian in nature.

One of the key predictions of the energy landscape model of dynamics
is the incorporation of more dimensions in the motion
when the molecules no longer have the energy
to cross potential energy boundaries.
Since including more dimensions to a motion
is including more particle degrees of freedom,
the increased dimensionality is expected to manifest in
an increase in a length scale as the temperature drops.
Despite significant effort searching for
this increasing length scale, [@cite]
there has been no evidence of it.

### Jamming Transition

@vanHecke2010
@Torquato2010

An alternative structural model of the supercooled liquid
is the idea of the jamming transition
which is adapted from an understanding of granular materials.
[@Silbert2002;@Cates1998;@Cates2005;@Liu2010;@Torquato2010;@vanHecke2010]
A particle is considered jammed
when the number of contacts
is enough to restrict all the degrees of freedom,
this is known as *isostatic* jamming
with the requisite contact count $z_\text{iso}$ being

$$ z_\text{iso} = 2d_f $$

where $d_f$ is the number of degrees of freedom
available to a molecule ($d_f=3$ for our trimer).
When a molecule is jammed,
there are no degrees of freedom available
meaning it is unable to move.
Using contact numbers is notable
for concave shapes like the Trimer molecule
as the concavities allow for contact numbers
well above $z_\text{iso}$. [@Jennings2015]

The concept of jamming also applies to rotational motion
where @Zwanzig1987 considers a liquid of 2D gears.
Once three gears come in contact with each other,
they are no longer able to rotate.

### Geometric Frustration

Building upon some of the ideas of the jamming transition
is a model of geometric [@Frank1952] or packing [@Tarjus2005;@Kivelson1995] frustration.
This considers small regions of the liquid,
which form structures that minimise the local free energy,
however these structures are then unable to tile space.
This gives small regions of favourable local structure
which are highly favourable and unlikely to diffuse.

This idea of geometric frustration is notable for the Trimer molecule,
as there are a range of crystal structures it can take on. [@sec:stability-of-crystal-phases]

## Goals for understanding dynamics

In @sec:molecular_relaxation we introduce new relaxation quantities
to describe the relaxations of individual molecules.
These molecular relaxation quantities allow more insight
into the dynamic heterogeneities present in supercooled liquids.

Dynamic Heterogeneities

- They are a big problem which needs understanding
- Increasing length scale

Impact of jump dynamics on SED

- Responsible for breakdown

Coupling of Rotational and Translational Motions
