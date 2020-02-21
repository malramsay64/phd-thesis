# Introduction

The current set of tools we have for understanding dynamics,
introduced in @sec:intro_dynamics,
are limited to describing the aggregated motions of all the particles.
Even the measures of dynamic heterogeneities in $\alpha$
describe how the motions of the entire liquid
deviate from that of a Gaussian distribution.
While the tools we have for describing dynamics describe system wide motions,
the current problems in the field
being the understanding of liquid fragility
and the decoupling of rotational and translational motions
are attributed to dynamic heterogeneities,
which is inherently a local description.

## Breakdown in Stokes--Einstein--Debye

The Stokes--Einstein--Debye (SED) relations described in @sec:intro_sed
are used to describe the overall dynamics of a liquid.
These relations are derived assuming that
the motion of particles within the liquid state
can be described using Brownian motion. [@Einstein1956]
When modelling fragile liquids there are
two ways in which the SED relations break down.
The first, shown in @fig:trans_rot_otp,
is the decoupling of the rotational and translational motion [@Chang1994;@Griffin2012;@Fujara1992]
and the second is the non-linear relationship of diffusion and viscosity. [@cite]

These breakdowns in the SED relations
has been observed in experiments, however,
there has been difficulty replicating these results in simulations.
...stuff people have found...
Part of the issue with simulations
is that in measuring the diffusion constant
and the rotational relaxation times
weight the contribution of slow and fast particles differently.
...demonstration of this idea...

### Breakdown in rotational coupling

The SED relations are based on Brownian dynamics
however there is evidence of rotations not described by Brownian motion.
This comes in the form of jump dynamics.
Describing dynamics using spherical harmonics
and there are multiple choices of $l$.
...rotational dynamics...
The relationship between the first and second Legendre polynomials $\tau_1/\tau_2$
describes the degree to which large jumps play a role in the dynamics.

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

The Debye model predicts an exponential decay of the $l$th rank
single-particle orientation time correlation function $C_l^s$,

$$ C_l^s = \exp\left(\frac{-t}{\tau_l}\right) $$

which gives the corresponding relaxation time

$$ \tau_l = \frac{1}{l(l+1)D_r}, $$

where $D_r$ is the rotational diffusion coefficient.
Comparing this relationship for
the first and second-order relaxation functions

$$ \tau_1/\tau_2 = \frac{2(2 + 1) D_r}{1(1+1) D_r} = 3$$

When molecules rotate inertially, that is,
there are large angular displacements between collisions.
The type of relaxation is no longer exponential,
and can be identified by the ratio $\tau_1/\tau_2$
falling in the range

$$ 1 < \tau_1/\tau_2 < 3 $$

The value of 3 (or 4 for 2D systems) is given by Brownian dynamics,
that is, assuming rotations take place through a process of small random steps.
Where there are large changes in orientation,
the two relaxation times become correlated,
since there are much fewer steps required for rotational relaxation to occur,
with the limit of this being
single jumps account for both relaxations simultaneously.

In experimental and simulation studies
at high temperatures [@Laage2006]
the relationship $\tau_1/\tau_2 = 3$ has held true.
In supercooled liquids however,
there have been many studies
which have found $\tau_1/\tau_2 < 3$,
which has given credence to the
idea of rotational relaxations
taking place through the process of large angular jumps.

The typical picture of jump dynamics
is that of the rotational motion,
where the quantity $\tau_1/\tau_2$ has a value of 4
when the motion is comprised of small angular jumps,
and reduces in value to 1 when
the motion is comprised of large angular jumps. [@Kivelson1970]

An alternative method of describing rotations
which has been used in describing the breakdown of rotations
and translations is to measure the rotational diffusion constant.
There are two different formalisms of estimating rotational diffusion $D_r$,
referred to as the Einstein and Debye formalisms. [@Kim2015;@Lombardo2006]
The Einstein formulation treats the rotational motion
in the same way as translational diffusion,
by measuring the small rotational changes over time,
giving

$$ \frac{\d}{\d{t}} \langle \Delta \theta^2(t) \rangle = 2D_r $$

for rotations in 2D.

### Breakdown in structural relaxation and Diffusion

Currently unexplained

@Shi2013
@Bian2016

Part of this story which is still being actively studied
is the coupling of the rotational and translational motions
on short timescales.
indicating a breakdown in the Stokes-Einstein-Debye
theory of dynamics.
This result however is an observation of the overall properties
and doesn't consider the microscopic coupling that takes place.
In the potential energy landscape model
as the temperature is lowered,
it is predicted that more degrees of freedom
will be used for motion to occur
and some of these are in
the rotational motion of molecules.
This coupling between rotational and translational motion
on the microscopic scale
has been observed in simulations of water [@Meyer2019;@Nair2019;@Faraone2003]
and liquid crystals [@Jose2006].

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

## Spatially Resolved Dynamics

Existing quantities measuring dynamics
are formulated based on experimentally available methods.
This allows for direct comparison with
results from experimental systems.
However the power of simulations
is that there is so much more data available to us.

More recently, there has been an effort
to link structure with dynamics on a local level,
which has required a measure of structural relaxation
that makes the contribution of each particle explicit
rather than aggregated over the entire system.
Widmer-Cooper and Harrowell [@Widmer-Cooper2009] defined
a structural relaxation $F_d(t)$ where

$$ F_d(t) = \frac{1}{N} \left \langle \sum_i w_i(d, t) \right \rangle $$ {#eq:structural_relaxation}

where $w_i(d, t) = 1$ if the particle is within distance $d$
of it's initial position at time $t$,
and zero otherwise.
The angle brackets signify an average over initial times.
The value of $d$ was chosen to be

$$ d = \frac{\pi}{2 k_{\text{bragg}}} $$

where $k_{\text{bragg}}$ is the wave-vector of
the maximum peak of the static structure factor $S(k)$.
This matches with the calculation of the intermediate scattering function
which will follow the same wave-vector $k_{\text{bragg}}$
as it will display the largest change over time.

## Goals for understanding dynamics

In @sec:molecular_relaxation we introduce new relaxation quantities
to describe the relaxations of individual molecules.
These molecular relaxation quantities allow more insight
into the dynamic heterogeneities present in supercooled liquids.
As part of introducing these quantities
we establish their equivalence to the quantities measured in @sec:dynamics_results.
Finally to conclude this chapter
we use a combination of the standard dynamics quantities from @sec:dynamics_results
and the newly introduced molecular relaxations from @sec:molecular_relaxation
to explain the breakdown in the Stokes--Einstein--Debye relations.
