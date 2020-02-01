# Introduction

The crystallisation of a solid from the liquid melt
is a process underpinning the production of a wide range of materials.
As discussed in @sec:intro_crystal_growth
crystallisation can be broken into two separate processes,
nucleation and crystal growth.
In this chapter we are studying
the crystal growth and melting of the Trimer molecule
to understand the slow growth rates of molecular crystals.
To remove the influence of the nucleation
a seed crystal is used,
forming a known base from which the growth and melting can take place.
[@Russo2012;@Shimura2017]

## Theories of Crystal Growth

In studying crystal growth there are a range of processes
which can limit the growth rate
including the diffusion of the melt,
the flow of heat away from the surface, and
reactions at the liquid--crystal interface. [@Kirkpatrick1975]
This diversity of behaviours has resulted in
the development of many theories of crystal growth,
each describing different interactions
of the rate limiting components.
These range from empirical descriptions [@Wilson1900;@Frenkel1926;;@Turnbull1981;@Hillig1956]
to rigorously derived phase-field models. [@Granasy2019]

### Classical Theories of Growth

There are two classical theories of crystal growth which will be explored;
the Wilson--Frenkel theory, [@Wilson1900;@Frenkel1926] and
the Turnbull theory. [@Hillig1956;@Turnbull1981]
Both these theories describe the velocity $v$ of an interface
through the equation;

$$ v(T) = k(T) \left[1-\exp{\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}}\right] $$ {#eq:crystal_growth_general}

with $k_{\text{B}}$ being the Boltzmann Constant,
and $\Delta u$ being the change in chemical potential.
The quantity $k(T)$ is where these two models of growth differ.

The Wilson--Frenkel model describes
the addition of liquid particles onto the crystal surface
as a diffusion limited process,
that is the movement of particles
from their current position to their position on the crystal lattice
is a limiting factor in the crystal growth process.
This gives the following form for $k(T)$;

$$ k(T) = \frac{D a}{\Lambda^2} f $$

where $D$ is the diffusion constant,
$a$ is the interatomic spacing,
$\Lambda$ is the diffusional mean free path, and
$f$ is a factor to account for
not all collisions resulting in attachment to the crystal. [@Jackson1984]
The Wilson--Frenkel model of growth is considered a thermally activated process,
through the activation comes indirectly through the diffusion constant.

The Turnbull theory describes a process of crystal growth
where the growth is dependent on the thermal velocity of molecules,
rather than their diffusion.
This has the resulting form of $k(T)$;

$$ k(T) = \frac{a}{\lambda} \sqrt{\frac{3 kT}{m}} f $$

where $\lambda$ is a parameter of fit
being the distance required to move to the crystal state, and
$m$ is the mass of the molecule.
Notably the Turnbull theory lacks activated growth,
having much faster growth which extends well below the melting point.

![Plot of the Wilson--Frekel model of crystal growth (solid line)
and the Turnbull theory (dashed
line). [@Jackson1984]](../placeholder_figure.png){#fig:classical_growth width=80%}

The difference between these two theories is shown in @fig:classical_growth.
In this figure the points marked are for a Lennard--Jones molecule,
which fits the Turnbull model.
However, there are many molecules which follow the Wilson--Frenkel model of growth.
The distinction between the two groups of molecules
is those that a good glass formers have Wilson--Frenkel behaviour,
while metals have the behaviour of the Turnbull model.

### Non-Classical Methods

The field of modelling crystal growth using non-classical methods
has many theories of growth and nomenclature which has changed over time. [@Granasy2019]
These theories describe the liquid and crystal
through a structural order parameter $\phi(\vect{r}, t)$. [@Collins1985]
Models using this approach have been called
phase-field [@Pusztai2005;@Pusztai2008;@Granasy2002;@Warren2009;@Bagdassarian1994] for
the structural order parameter being a field which defines the phase [@Bagdassarian1994]
and later for a rigorously derived approach, [@Pusztai2005;@Pusztai2008;@Warren2009]
density functional theories [@Oxtoby2002;@Shen1996], and
square gradient methods. [@Cahn1958;@Bagdassarian1994]
There is little consensus within the field
over the naming of any model,
with some having all the names at various points in time. [@Bagdassarian1994;@Oxtoby2002;@Granasy2019]
The term used throughout this thesis will be
semi-empirical density functional model.

The semi-empirical density functional model
uses a measure of structure $M(\vect{r}, t)$ [@Bagdassarian1994]
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
The free energy of the system $\Omega$
is described as a functional of $\omega(M)$.

In this semi-empirical density functional model
we make the assumption that the system can be described as
fluctuations around the mean liquid configuration $M=0$,
and fluctuations around the mean crystal configuration $M=1$.
In making this assumption,
we are describing a function with two minima,
one for the liquid $M=0$ and another for the crystal $M=1$.
Our choice for a mathematical description
is the combination of two parabolas,
one centered around $M=0$ for the liquid
and another around $M=1$ for the crystal
giving the form

$$ \omega(M) = \min\left[
\frac{\lambda_\text{liquid}}{2}M^2, \frac{\lambda_\text{crystal}}{2}(M - 1)^2 + \Delta
\right] $$ {#eq:phase_field}

and introducing the parameters

- $\lambda_\text{liquid}$ describing the curvature of the liquid parabola,
- $\lambda_\text{crystal}$ describing the curvature of the crystal parabola, and
- $\Delta$ being the difference in free energy between the liquid and crystal.

This choice of $\omega(M)$ is shown in @fig:fluctuation_parabola_example.

![An example of the function $\omega(M)$ describing
the energy landscape for transitioning from
a liquid configuration to a crystalline one.
The parameters in @eq:phase_field are
$\lambda_\text{liquid} = \lambda_\text{crystal} = 1$ and $\Delta = 0$
](../Projects/Crystal_Melting/figures/fluctuation_parabola_example.svg){width=80% #fig:fluctuation_parabola_example}

The time evolution of the order parameter $M$
is used to study the melting and crystallisation
given by

$$ \frac{\partial M}{\partial t} =
-\Gamma \left[ \frac{\d \omega(M)}{\d M} - K^2 \nabla^2 M \right] $$

where

- $\Gamma$ is a transport coefficient.

We can find an expression for the growth rate $v(T)$
as a function of temperature

$$ v(T) = -\left[\frac{2K\Gamma(T)(\sqrt{\lambda_\text{liquid}}(T) +
\sqrt{\lambda_\text{crystal}}(T))^2}
{\lambda_\text{crystal}(T)\sqrt{\lambda_\text{liquid}(T)} +
\lambda_\text{liquid}(T)\sqrt{\lambda_\text{crystal}}(T)} \right ] \Delta(T)
$$ {#eq:dft_growth_rate}

with $K$ being the correlation length of the order parameter.
This describes the rate of melting
as the size of the fluctuations in the liquid and the crystal.
It is also important to note that this model also incorporates
the transport coefficient like the Wilson--Frenkel model.

## Anomalously Slow Growth Rates

In the study of many different crystals,
the growth rates between the different crystal faces
can vary by as much as three orders of magnitude. [@Reinhart2018;@Burke1988]
This huge difference between growth rates
indicates that the growth of the crystal
is significantly more

In a study of two similar alloys @Tang2013
attributed the difference in crystal growth rates to
the ordering of atoms in the interface,
with the faster glass former displaying ordering
much further from the boundary of the crystal.
This observation is supported by the work of @Reinhart2018
where in studying Janis particles,
the stricter the geometric constraints of the crystal phase,
the slower the growth rate.
While in work on Lennard Jones Particles,
@Burke1988 attribute the slow growth rate of the (111) crystal face
to the degeneracy of fcc and hcp stacking,
with many stacking faults arising during the freezing process as a result.

While the Wilson-Frenkel theory has a characteristic timescale of diffusion
it may be that for more complicated crystal structures,
such as Janus Particles, [@Reinhart2018] clathrates [@Yagasaki2016] and molecular crystals
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
