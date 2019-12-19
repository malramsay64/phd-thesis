# Introduction

The crystallisation of a solid from the liquid melt
is a process underpinning the production
of a wide range of materials.
The process of crystallisation
can be broken into two separate processes,
the nucleation rate---the formation of small crystals from the liquid, and
the crystal growth rate---the speed at which the bulk crystal grows.
These two processes are considered separately
because the nucleation rate is orders of magnitude
slower than the crystal growth rate.
It is the slow nucleation rate
that allows liquids to be supercooled.
Instead of waiting for a statistically unlikely event to occur,
crystal growth of experiments uses a seed particle
from which the crystal growth can propagate.
Initiating the crystal growth using Seed crystals
can influence the resulting crystal structure,
providing another level of control over the growth process.
In other cases, particle impurities in the liquid
or tiny scratches in glassware can also act
as a seed site,
from which the crystal grows at the crystal growth rate.

## Temperature Dependence of Growth Rates

- Looking at the nucleation rate and the crystal growth rate separately.

Nucleation occurs when a fluctuation in the liquid state,
forms a crystalline configuration stable enough to grow.
The size of this is influenced by the chemical energy difference
between the liquid and the crystal phases,
as well as the energy penalty of the interface between them.
As the size of an nucleation site increases,
the energy gained from the crystal phase increases
as the cube of the radius,
while the penalty for the surface area increases
as the square of the radius.
The two different power laws mean that at some finite size,
a crystalline configuration is stabilised
and can continue to grow.
The initial creation of this unstable state
arises from the random fluctuations of the liquid;
the average energy has spatial and temporal fluctuations
which with some rare occurrence,
create structures which are possible for nucleation.
As the temperature decreases the fluctuations creating
the higher energy crystal nucleus become rarer and rarer,
however also in favour is the larger energy gap
between the liquid and the crystal phases.

- supercooled liquids for pedestrians [@Cavagna2009]

The classical theory of crystal growth
is attributed to Wilson[@Wilson1900] and Frenkel[@Frenkel1926],
where the growth rate is determined by the liquid diffusion
near the interface, and the chemical potential between the two phases.
At temperatures slightly below the melting point
the chemical potential is the rate limiting parameter,
while typically lower temperatures become limited
by the diffusion of particles near the interface.

## Anomalously Slow Growth Rates

In the study of many different crystals,
the growth rates between the different crystal faces
can vary by as much as three orders of magnitude [@Reinhart2018;@Burke1988].
This huge difference between growth rates
indicates that the growth of the crystal
is significantly more complicated than posited
in the discussion of the temperature dependence.

@Tang2013 found
for two similar alloys,
that the difference in crystal growth rates
could be attributed to
the ordering of atoms in the interface,
with the faster glass former displaying ordering
much further from the boundary of the crystal.
This observation is supported by the work of @Reinhart2018
where in studying Janis particles,
the stricter the geometric constraints of the crystal phase,
the slower the growth rate.
While in work on Lennard Jones Particles @Burke1988
attribute the slow growth rate of the (111) crystal face
to the degeneracy of fcc and hcp stacking,
with many stacking faults arising during the freezing process as a result.

While the Wilson-Frenkel theory has a characteristic timescale of diffusion
it may be that for more complicated crystal structures,
such as Janus Particles [@Reinhart2018], clathrates [@Yagasaki2016] and molecular crystals
the diffusion may no longer be the relevant characteristic timescale.
This is important for molecular crystals,
where one of the major results has been the decoupling
of the rotational relaxation time and the diffusion constant,
with the rotational relaxation getting slower much faster than the dynamics.

## Important Temperatures

The melting point $T_m$ defines a temperature
at which both the liquid and the crystal phases
exist at equilibrium
---they are equally stable.
Above the melting point,
the liquid is the equilibrium phase, however,
it is also possible for the crystal to exist
above the melting point as a metastable phase.
At some temperature above the melting point,
the crystal is no longer metastable,
spontaneously melting to form the liquid.
The temperature at which this spontaneous melting occurs
is known as the spinodal temperature.
When a crystal is surrounded by liquid above the melting point,
melting will occur at the liquid--crystal interface.
This interfacial melting is explained by
the Wilson-Frenkel theory of crystal growth.
It is when the melting is not just occurring at the interface,
at many points within the crystal itself
that the temperature is above the spinodal.

Along with the crystal existing as
a metastable state above the melting point.
The liquid exists as a metastable state
below the melting point.
Like the crystal above the melting point,
at some temperature below the melting point,
the liquid will spontaneously crystallise,
another spinodal temperature.

## Models of Melting

The field of modelling crystal melting is full of a range of theories
the nomenclature of which has changed significantly over time.
@Granasy2019 attempt to sum up the degree to which the nomenclature has changed
"the SG [Square Gradient] approximation-based approaches
were often considered as the simplest form of density functional theories,
where as the phase-field theory originally meant an SG approach,
in which as structural order parameter (the phase field)
monitors the crystal--liquid transition.
Recently, however, phase-field methods working on the molecular scale,
termed Phase-Field Crystal (PFC) models were introduced,
which can be classified as simple dynamical density functional approaches."
This is notable in not actually clarifying how the naming has changed,
but also noting that every method
has been considered a density functional approach at some point.

The models discussed in this thesis
are the classical model of crystal growth,
and a semi-empirical density functional model.

### Classical Theory

The Wilson-Frenkel[@Wilson1900;@Frenkel1926] theory of crystal growth,
describes the velocity $V$ of an interface

$$ V(T) = k(T)[1-\e^{\beta \Delta u}] $$ {#eq:wilson_frenkel_growth}

where $\beta = \frac{1}{k_{\text{B}} T}$
with $k_{\text{B}}$ being the Boltzmann Constant,
and $\Delta u$ being the change in chemical potential.
A standard method @Tang2013 of estimating the chemical potential $\Delta u$ is

$$ \Delta u = \frac{(T_m - T) \Delta h_m}{T_m} $$

allowing, with some rearrangement, to express @eq:wilson_frenkel_growth as

$$ V(T^*)\tau_C(T^*) = c\left [ 1-\exp\left(\frac{(1-T^*)\Delta h_m}{T^*}\right) \right ]$$ {#eq:normalised_growth}

where $T^* = T/T_m$ the normalised temperature,
$c$ is a constant
$\Delta h_m$ is the free energy from the liquid to the crystal
at the melting point,
$V(T^*)$ is the velocity of the interface,
and $\tau_C(T^*)$ is the crystallisation rate.

The classical model of Crystal Growth and Melting
known as the Wilson-Frenkel [@Wilson1900;@Frenkel1926]
is one where the rate of crystal growth $v(T)$
as a function of temperature $T$
is represented by the equation

$$ v(T) = k(T) \left[1-\exp{\frac{-\Delta\mu(T)}{k_\text{B} T}}\right] $$

where

- \Delta\mu(T) is the difference between the chemical potentials of the liquid and the
  crystal phases at the desired temperature, and
- $k_\text{B}$ is the Boltzman constant.

The value $k(T)$ describes
the rate per unit area at which material is added to the surface
which is assumed to be proportional to a transport coefficient of the liquid.
The term in brackets describes
the thermally activated rate at which material is removed from the surface.
When measuring melting the added and removed are switched. [@Tang2013]

### Semi-empirical Density Functional

This models the free energy of a configuration
based on a distribution of an order parameter $M$ [@Bagdassarian1994]
defined such that in the bulk liquid $\langle M \rangle = 0$
and in the bulk crystal $\langle M \rangle = 1$.

This allows the free energy $\Omega$ to be expressed
in the Cahn and Hilliard square gradient form [@Cahn1958]

$$ \frac{\Omega}{\rho_s k_\text{B} T_m} =
\int \d{\vect{r}} \left[ \omega(M) + |\frac{K^2}{2}|\nabla M|^2 \right] $$

where;

- $\rho_s$ is the density of the solid,
- $k_\text{B}$ is the Boltzman constant,
- $T_m$ is the melting temperature,
- $K$ is the correlation length of the order parameter
  describing the distance over which the order parameter
  can transition from liquid to solid, and
- $\omega(M)$ is a function which describes the
  distribution of the order parameter $M$.
This describes the free energy of the system $\Omega$
as a functional of $\omega(M)$.

In this model we make the assumption
that there are fluctuations of the order parameters
about the mean liquid configuration $\langle M \rangle = 0$
and about the crystal configuration $\langle M \rangle = 1$.
This requires the choice of a function describing two minima.
One choice is using the combination of two parabolas,
one centered around $0$ for the liquid
and another centered around $1$ for the crystal
giving the form

$$ \omega(M) = \min\left[
\frac{\lambda_\text{liquid}}{2}M^2, \frac{\lambda_\text{crystal}}{2}(M - 1)^2 + \Delta
\right] $$

introducing the parameters

- $\lambda_\text{liquid}$ describing the curvature of the liquid parabola,
- $\lambda_\text{crystal}$ describing the curvature of the crystal parabola, and
- $\Delta$ being the difference in free energy between the liquid and crystal.

Letting $\lambda_\text{liquid} = \lambda_\text{crystal} = 1$ and $\Delta = 0$
results in @fig:fluctuation_parabola_example.

![An example of the function $\omega(M)$.
](../Projects/Crystal_Melting/figures/fluctuation_parabola_example.svg){width=80% #fig:fluctuation_parabola_example}

The time evolution of the order parameter $M$
is used to study the melting and crystallisation
given by

$$ \frac{\partial M}{\partial t} =
-\Gamma \left[ \frac{\d \omega(M)}{\d M} - K^2 \nabla^2 M \right] $$

where

- $\Gamma$ is a transport coefficient.

Using a series of "straightforward", and "simple" [@Bagdassarian1994] transformations
we can find an expression for the growth rate $v(T)$
as a function of temperature

$$ v(T) = -\left[\frac{2K\Gamma(T)(\sqrt{\lambda_\text{liquid}}(T) +
\sqrt{\lambda_\text{crystal}}(T))^2}
{\lambda_\text{crystal}(T)\sqrt{\lambda_\text{liquid}(T)} +
\lambda_\text{crystal}(T)\sqrt{\lambda_\text{liquid}}(T)} \right ] \Delta(T)
$$ {#eq:dft_growth_rate}

with $K$ being the correlation length of the order parameter.

## Calculation of Melting Rates

Crystallisation rates within simulations
are typically measured along a single lattice direction.
[@Tang2013;@Tymczak1990;@Burke1988;@Broughton1982a]
This is done by creating a slab geometry,
which is a region of perfect crystal of the desired geometry
onto which the liquid can attach and grow.
The slab geometry allows for measuring both melting and growth
and creates a highly controlled environment for growth.

When measuring the crystal growth within a slab geometry
there are a range of methods used.
@Tang2013 measure the growth rate using
the increase in density from the liquid to the crystal,
which allows for the growth rate $v$ to be measured as

$$ v = \frac{d_l}{2N(V_c - V_l)} \frac{\d V}{\d t} $$

where;

- $V$ is the volume of the simulation cell,
- $d_l$ is the average spacing between crystal layers along the direction of crystal
  growth,
- $N$ is the average number of atoms in a liquid layer at the interface,
- $V_c$ is the specific volume of the crystal, and
- $V_l$ is the specific volume of the liquid.

An alternate approach, [@Tymczak1990]
is to monitor an order parameter along the axis of crystal growth.
The growth rate can then be measured as
the progression of that order parameter.
