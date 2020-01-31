# Crystal Growth {#sec:crystal_growth}

Much of the world we interact with is built using solid materials,
from all the electronics within your phone,
to the skyscrapers that tower over us.
Each application has specific requirements on the materials used
whether that is strength, corrosion resistance, magnetic properties, among many others.
One of the key methods of forming these materials is from the melt.
The properties of a material can be influenced by
the crystal structure which forms, [@cite]
and the micro-structure of that crystal. [@Granasy2004]
Manufacturing materials to these exacting specifications
requires understanding all aspects of crystal growth.

The transition from a disordered liquid phase to an ordered crystal phase,
requires an initial region of order from which it can propagate,
a process known as nucleation.
The highly structured order of the crystal phase results in
a lower enthalpy $H$ than that of the liquid.
However, a consequence of the ordering of a crystal
is a reduction in the range of accessible states,
known as entropy $S$.
This means the transition from the liquid to the crystal
results in a decrease in the enthalpy $\Delta H < 0$
and an increase in the entropy $\Delta S > 0$.
The change in the Gibbs free energy $\Delta G$ [@eq:gibbs_free_energy]
describes how changes in the enthalpy $\Delta H$ and entropy $\Delta S$
contribute to possibility of spontaneous change from
a liquid configuration to a crystal configuration.

$$ \Delta G = \Delta H + T \Delta S $$ {#eq:gibbs_free_energy}

@Eq:gibbs_free_energy includes a term for the temperature $T$,
which changes the influence of the entropy,
where at the melting point $T_m$
the enthalpy lost from crystallisation
is equal to the entropy gained
giving $\Delta G = 0$.
Having a negative $\Delta G$ indicates that a phase transition is possible,
it doesn't describe is the process of crystal growth.
The growth of a crystal from the melt
is comprised of two distinct steps,

1. the microscopic nucleation of a crystal within the liquid, and
2. the macroscopic growth (or melting) of the crystal

These two steps are important for understanding
the formation of supercooled liquids
and the growth of crystals
which will be described in the following sections.

## Growth Theory

Theories of crystal growth describe
the attachment of molecules to an existing liquid--crystal interface.
Classical theories of crystal growth have the form

$$ v(T) = k(T) \left[1-\exp{\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}}\right] $$ {#eq:crystal_growth_general}

where $k_\text{B}$ is the Boltzman constant and
$-\Delta G_\text{crystal}$ is the change in free energy
going from the liquid to the crystal.
The exponential term in the square brackets
describes the process of attaching and detaching from the crystal surface,
while $k(T)$ is a function
which takes different forms depending on the growth theory.

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
using a non-linear cooling rate which stays between the lines.\
*Adapted with permission from @Cavagna2009 © 2009 Elsevier*
](../01_Introduction/figures/supercooled_liquid_formation.jpg){#fig:supercooled_liquid_formation width=80%}
