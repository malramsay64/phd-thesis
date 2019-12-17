# Crystal Growth

The growth of crystals is important.
...

For the transition from a disordered liquid phase
to an ordered crystal phase,
there needs to be an initial region
which starts the process of ordering.
The transition from the liquid phase to the crystal phase,
results in a saving of potential energy $H$;
the order of the crystal allowing
particles to adopt a lower energy structure.
However, a consequence of this ordering
is the reduction in the range of accessible states
known as the entropy $H$.
The relationship between the changes of these two factors,
potential energy $\Delta H$, and
entropy $\Delta S$
is codified in the equation for
the change in the Gibbs free energy $\Delta G$.

$$ \Delta G = \Delta H + T \Delta S $$ {#eq:gibbs_free_energy}

This equation additionally includes the term $T$,
which represents the temperature.
This relationship for the Gibbs free energy
provides an important relationship,
at some temperature $T_m$,
the entropy lost by forming the crystal $T_m \Delta S$
is equal to the energy gained $\Delta H$.
This temperature, $T_m$, is the melting point.

The relationship in @eq:gibbs_free_energy
identifies the most stable state for a given condition;
that is the equilibrium state.
What it doesn't describe is the process
of moving from one phase to another,
we need additional theories.
The growth of a crystal from the melt
is comprised of two distinct steps,

1. the nucleation of an initial *seed* crystal
    which provides a structure from which
    the crystal can continue to grow, and
2. the continued growth of crystal as it
    propagates forward from the initial boundary.

## Nucleation Theory

The current description of nucleation,
known as Classical Nucleation Theory,
builds upon the @eq:gibbs_free_energy relationship.
The relation describes the free energy
of the bulk liquid liquid and the bulk crystal,
however when we look at the process of
a crystal growing within the liquid phase,
there is an additional energy
which needs to be considered.
This is the energy at the interface of
the liquid and crystal regions,
this is described as the surface tension $\sigma$.
Using the free energy saving of the crystal $\Delta G_{crystal}$,
a value that is always negative,
and making the assumption that
any initial crystal structure is going to be spherical.
An expression for the free energy of nucleation $\Delta G_\text{nucleation}$ is

$$ \Delta G_\text{nucleation} = \frac{4}{3} \pi r^3 \Delta G_\text{crystal} + 4 \pi r^2 \sigma $$

where the first term is the free energy of the crystal
multiplied by the volume of a sphere,
while the second term is the surface tension
multiplied by the surface area of the sphere.
Since the free energy saved is proportional to the volume,
while the energy penalty is proportional to the surface area,
there is always some finite radius $r_c$
known as the critical radius
for which a crystal is stable within the liquid
when we are below the melting point.

When a small crystal forms within the liquid
with a radius $r < r_c$
the crystal will melt back to the liquid
because of the energy penalty of of the surface tension.
While a larger crystal with some radius $r > r_c$
will continue to grow.
For crystals of the critical radius to form,
we need to rely on the fluctuations of the liquid.
A liquid in equilibrium will sample
all the available configurations,
which will include configurations which are
more crystalline in nature.
We can express the rate $\kappa$ at which these configurations
arise using an Arrhenius equation,

$$ \kappa = K \exp\left(-\frac{\Delta G_\text{nucleation}}{k_\text{B} T}\right) $$

where $k_\text{B}$ is the Boltzmann constant.
The important part of this relation is that this allows us
to define a timescale on which we expect nucleation to take place.

Classical Nucleation Theory makes many approximations
the most important being the *capillarity approximation*,
the assumption that small crystalline nuclei
have the same thermodynamic properties as the bulk crystal.
While the approximations being made in Classical Nucleation Theory
can be problematic for modelling nucleation,
for the purposes of this work
it provides enough of a theoretical foundation.

## Growth Theory

Once a crystal has reached the size of the
critical nucleus and starts to grow,
we need to switch from using nucleation theory
to using a theory of crystal growth,
with the well established theory being the Wilson-Frenkel theory.
This expresses a relation predicting
the rate of crystal growth $v(T)$ being

$$ v(T) = k(T) \left[1-\exp{\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}}\right] $$

where $k(t)$ is the mobility of particles within the liquid.
The Wilson-Frenkel model is similar to that of Classical Nucleation Theory.
We have an activated process,
that is, one governed by an Arrhenius temperature dependence,
with a factor out the front.
The key difference here is that the pre-factor, $k(T)$
has a temperature dependence,
being the mobility of particles within the liquid.
This gives rise to some interesting behaviour,
as the temperature drops below the melting point,
the rate of crystal growth increases,
with the $\Delta G_\text{crystal}$ term getting larger.
However, at some point,
the growth of of the crystals slows down again,
as the first mobility of the particles $k(T)$
becomes dominant.

## Supercooled liquids

An important part of understanding nucleation theory,
is that it gives rise to a metastable state,
the liquid before a nucleation event has occurred.
This metastable state,
which under the right conditions can be long lived,
is known as a supercooled liquid.

A Supercooled liquid is a liquid
that has been cooled to a temperature below the melting point
before the rare event of nucleation has taken place.
Supercooled liquids are a metastable state,
although simulation studies often reference them as equilibrated;
a reference to the rarity of the nucleation.
The supercooled liquid is able to sample
most of the available phase space
without encountering a nucleation configuration.
A typical method of determining when a supercooled liquid
has reached equilibrium is defining a relaxation timescale,
being a timescale over which a configuration
has no 'memory' of a previous configuration.

For each temperature we will have a relaxation time
---being the typical time for relaxation to occur---
and a nucleation time
---being the typical time for nucleation to occur.
Forming a supercooled liquid,
can then be expressed as a line between those of
the relaxation time and the nucleation time
as shown in @fig:supercooled_liquid_formation.
The example shown in @fig:supercooled_liquid_formation
demonstrates a well behaved example,
with the nucleation time always
being longer than the relaxation time, however
there are also supercooled liquids
where for some range of temperature,
the relaxation time becomes longer than the nucleation time
resulting in what is known as a *kinetic spinodal*,
a temperature where the supercooled liquid does not exist
since nucleation starts before equilibrium can be established.

![When the nucleation time (solid line) and relaxation time (dashed line) do not cross
it is possible to equilibrate the liquid to arbitrarily low temperatures
using a non-linear cooling rate which stays between the lines.
[@Cavagna2009]](../placeholder_figure.png){#fig:supercooled_liquid_formation width=80%}
