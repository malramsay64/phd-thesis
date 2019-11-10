# Crystal Growth

The growth of crystals is important.
...

For the transition from a disordered liquid phase
to an ordered crystal phase,
there needs to be an initial region
which starts the process of ordering.
The transition from the liquid phase
to the crystal phase,
results in a saving of potential energy $H$,
with the order of the crystal allowing
particles to adopt a minimum energy structure.
However, a consequence of this ordering
is the reduction in the range of accessible states
which is referred to as the entropy $H$.
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
identifies the state which is most stable,
that is the equilibrium state,
in any conditions.
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
Using the free energy saving of the crystal $\Delta G_{crystal}$
which is always negative,
we can make the assumption that
any initial crystal structure is going to be spherical
and express the free energy of a nucleation as

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
which is the assumption that the small crystalline nuclei
has the same thermodynamic properties as the bulk crystal.
While the approximations being made in Classical Nucleation Theory
can be problematic for modelling nucleation,
for the purposes of this work
it provides enough of a theoretical foundation.

## Growth Theory

Separate to the nucleation

## Supercooled liquids

For a liquid to
