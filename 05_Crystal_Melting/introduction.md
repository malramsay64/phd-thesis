# Introduction to Crystal Melting

The crystallisation of a solid from its liquid melt
is a process underpinning the production of a wide range of materials. [@Shimura2012;@Shimura2017;@Harkonen2005]
The process of forming a crystal can be broken into two steps;
nucleation, and crystal growth.
In this chapter we study
the crystal growth and melting of the Trimer molecule
to understand the slow growth rates of molecular crystals.

## Calculation of Melting Rates

Crystallisation rates within simulations
are typically measured along a single lattice direction.
[@Tang2013;@Tymczak1990;@Burke1988;@Broughton1982a]
This is done using the Free Solidification Method (FSM), [@Hoyt2002;@Hoyt1999]
where a slab of a known crystal is surrounded by liquid.
The Free Solidification Method removes the influence of nucleation,
having the crystal already formed in the desired structure.
This makes is possible to study the growth and melting
of a crystal structure in a highly controlled environment. [@Russo2012;@Shimura2017]

There are a range of methods which have been used
to measure crystal growth when using the Free Solidification Method.
@Tang2013 use the decrease in the density
when particles move from the liquid to the crystal phase.
Using the density change allows for the growth rate $v$ to be measured as

$$ v = \frac{d_l}{2N(V_c - V_l)} \frac{\d V}{\d t} $$

where;
$V$ is the volume of the simulation cell,
$d_l$ is the average spacing between crystal layers along the direction of crystal
growth,
$N$ is the average number of atoms in a liquid layer at the interface,
$V_c$ is the specific volume of the crystal, and
$V_l$ is the specific volume of the liquid.
An alternate approach for measuring the growth rate,
is to monitor an order parameter along the axis of crystal growth. [@Tymczak1990]
The position of the interface is then defined by the order parameter,
this position can either be based on a specific value of the order parameter [@Burke1988]
by fitting a curve to the order parameter as a function of distance. [@Yagasaki2016]
The growth rate is calculated from the propagation velocity
of the interface position.

## Theories of Crystal Growth {#sec:crystal_growth_theories}

In studying crystal growth there are a range of processes
which can limit the growth rate
including the diffusion of the melt,
the flow of heat away from the surface, and
reactions at the liquid--crystal interface. [@Kirkpatrick1975]
This diversity of behaviours has resulted in
the development of many theories of crystal growth,
each describing different interactions
of the rate limiting components.
These range from empirical descriptions [@Wilson1900;@Frenkel1926;@Turnbull1981;@Hillig1956]
to rigorously derived phase-field models. [@Granasy2019]

### Classical Theories of Growth

There are two classical theories of crystal growth
that will be explored in this thesis;
the Wilson--Frenkel theory, [@Wilson1900;@Frenkel1926] and
the Turnbull theory. [@Turnbull1950;@Hillig1956;@Turnbull1981]
Both these theories describe the velocity $v$ of an interface
using the equation;

$$ v(T) = k(T) \left[1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)}\right] $$ {#eq:crystal_growth_general}

with $k_{\text{B}}$ being the Boltzmann Constant,
and $\Delta u$ being the change in chemical potential.
The quantity $k(T)$ is a temperature dependent rate constant
and is different for each of the classical models.
The term within the square brackets,
part of all classical models,
describes the difference between the rates of particles
arriving and departing from the interface. [@Jackson2002]
At the melting point $\Delta G_\text{crystal} = 0$,
so entire term is zero,
describing particles leaving and arriving at the same rate.
Above the melting point there are more particles leaving,
while below there are more particles arriving.

The Wilson--Frenkel theory describes
the addition of liquid particles onto the crystal surface
as a diffusion limited process.
The movement of particles
from their current position to their position on the crystal lattice
is considered a limiting factor in the crystal growth process,
giving the following form for $k(T)$;

$$ k(T) = \frac{D(T) a}{\Lambda^2} f $$ {#eq:constants_wilson}

where $D(T)$ is the diffusion constant,
$a$ is the interatomic spacing,
$\Lambda$ is the diffusional mean free path, and
$f$ is a factor to account for the fraction of
collisions resulting in attachment to the crystal. [@Jackson1984]
Using a diffusion constant indicates that
the motion of particles from
their liquid position to their crystal position
requires interacting with other particles in the liquid,
which gives the diffusional timescale to motion.
With the diffusion constant of the trimer molecule
begin described by the Vogel--Tammann--Fulcher relation, (@eq:vtf)
the exponential dependence on temperature
drastically reduces the possible rate of crystal growth as the temperature drops.
The Wilson--Frenkel theory describes growth
which increases as the temperature drops below the melting point
up to a crossover point,
where the increasing magnitude of $\Delta \mu$
is no longer able to counteract the slowing dynamics. [@fig:classical_growth]
Since diffusion is the limiting factor for the crystal growth rate,
the Wilson--Frenkel model is often considered a thermally activated process,
reflecting the behaviour of diffusion within the liquid. [@sec:diffusion]

The Turnbull theory describes a process of crystal growth
where the growth is dependent on the thermal velocity of molecules,
giving $k(T)$ the form;

$$ k(T) = \frac{a}{\lambda} \sqrt{\frac{3 kT}{m}} f $$ {#eq:constants_turnbull}

where $\lambda$ is a parameter of fit
being the distance required to move to the crystal state, and
$m$ is the mass of the molecule.
This relation describes particles which move
small distances between their liquid and crystal configurations,
meaning there are no interactions with neighbouring particles.
This small motion is the key difference to the Wilson--Frenkel model,
where the motions include interactions with other particles.
Through not having a dependence on a process with an activation energy
the Turnbull theory describes growth below the melting point
which is much faster than that of the Wilson--Frenkel theory,

![Plot of the Wilson--Frekel model of crystal growth (solid line)
and the Turnbull theory (dashed line).
The circles are the melting rate of a Lennard--Jones potential,
and both axes use dimensionless units.\
*Figure from @Jackson1984 used with permission © Elsevier*](../05_Crystal_Melting/figures/classical_growth.png){#fig:classical_growth width=80%}

The difference between these two theories is shown in @fig:classical_growth.
In this figure the points marked are for a Lennard--Jones molecule,
which fits the Turnbull model.
Both the Turnbull and Wilson--Frenkel model exist
because they each describe the growth rates of different materials.
It has been observed empirically that the Wilson--Frenkel model describes
semiconductors and solids with directional bonding [@Jackson2002]
like silicon [@Jackson2002], Water Ice [@Yagasaki2016;@Xu2016], and
metal alloys of \ce{NiAl} and \ce{CuZr}. [@Tang2013]
These are materials which require structural rearrangement
for crystal growth to occur,
with the slow growth rates being fantastic for glass formation.
Materials described by the Turnbull growth rate
are metals, [@Rodway1991]
inert gasses, [@Jackson2002;@Broughton1982a]
and a small number of molecular materials [@Jackson2002]
which have low entropies of fusion, behaving like spheres.

### Semi-Empirical Density Functional Model of Growth {#sec:dft_model}

The field of modelling crystal growth using free energy functionals
has a wide range of theories using nomenclature that has changed over time. [@Granasy2019]
These theories describe the liquid and crystal using a structural order parameter $M(\vect{r}, t)$. [@Collins1985]
Models using this approach have been called
phase-field [@Pusztai2005;@Pusztai2008;@Granasy2002;@Warren2009;@Bagdassarian1994]
density functional theories [@Oxtoby2002;@Shen1996], and
square gradient methods. [@Cahn1958;@Bagdassarian1994]
Phase-field models initially described the structural order parameter
as a field defining the phase, [@Bagdassarian1994]
however, later use of phase-field describes an unrelated rigorously derived model. [@Pusztai2005;@Pusztai2008;@Granasy2002;@Warren2009]
The constant rise of new theories, and renaming of existing ones
means there is little consensus in the field over the naming of any model,
with some models having all three names at various points over the past 30 years. [@Bagdassarian1994;@Oxtoby2002;@Granasy2019]
To avoid confusion the term used to describe the model developed in this thesis
is a semi-empirical density functional model.

The semi-empirical density functional model
uses a measure of structure $M(\vect{r}, t)$ [@Bagdassarian1994]
defined such that in the bulk liquid $\langle M \rangle = 0$
and in the bulk crystal $\langle M \rangle = 1$.
This allows the free energy of the system $\Omega$ to be expressed
in the Cahn and Hilliard square gradient form [@Cahn1958]

$$ \frac{\Omega}{\rho_s k_\text{B} T_m} =
\int \d{\vect{r}} \left[ \omega(M) + |\frac{K^2}{2}|\nabla M|^2 \right] $$ {#eq:square_gradient}

where
$\rho_s$ is the density of the solid,
$k_\text{B}$ is the Boltzman constant,
$T_m$ is the melting temperature,
$K$ is the correlation length of the order parameter
describing the distance over which the order parameter
can transition from liquid to solid, and
$\omega(M)$ is a functional describing the
distribution of the order parameter $M$.
This model describes the free energy of the entire system $\Omega$
using the functional $\omega(M)$.

In this semi-empirical density functional model
we make the assumption that the system can be described by
fluctuations around the mean liquid configuration $M=0$,
and the mean crystal configuration $M=1$.
By making this assumption,
we are describing a function containing two minima,
one for the liquid $M=0$ and another for the crystal $M=1$.
Our choice for a mathematical description of these two minima
is the combination of two parabolas,
one centered around $M=0$ for the liquid
and another around $M=1$ for the crystal
giving the following form for our functional $\omega(M)$;

$$ \omega(M) = \min\left[
\frac{\lambda_\text{liquid}}{2}M^2, \frac{\lambda_\text{crystal}}{2}(M - 1)^2 + \Delta G_\text{crystal}
\right] $$ {#eq:phase_field}

This introduces the parameters;
$\lambda_\text{liquid}$ to describe the curvature of the liquid parabola, and
$\lambda_\text{crystal}$ to describe the curvature of the crystal parabola.
This choice of functional is depicted in @fig:fluctuation_parabola_example.
The parameters $\lambda_\text{liquid}$ and $\lambda_\text{crystal}$
can be obtained from fitting a Gaussian distribution
to the fluctuations present within a simulation.
Which gives;

$$ P_\text{liquid}(M) = \sqrt{\frac{\lambda_\text{liquid}}{2\pi}} \exp
\left[-\frac{\lambda_\text{liquid}}{2} M^2 \right] $$ {#eq:probability_liquid}

and

$$ P_\text{solid}(M) = \sqrt{\frac{\lambda_\text{solid}}{2\pi}} \exp
\left[-\frac{\lambda_\text{solid}}{2} (M-1)^2 \right] $$ {#eq:probability_solid}

where $P_\text{liquid}(M)$ and $P_\text{solid}(M)$
are the probability of a value of the order parameter
occurring in each phase.

![An example of the functional $\omega(M)$ describing
the energy landscape for transitioning from
a liquid configuration to a crystalline one.
The parameters in @eq:phase_field are
$\lambda_\text{liquid} = \lambda_\text{crystal} = 1$ and $\Delta = 0$
](../Projects/Crystal_Melting/figures/fluctuation_parabola_example.svg){width=80% #fig:fluctuation_parabola_example}

The time evolution of the order parameter $M$

$$ \frac{\partial M}{\partial t} =
-D \left[ \frac{\d \omega(M)}{\d M} - K^2 \nabla^2 M \right] $$

found by taking the time derivative of @eq:square_gradient,
can be used to study melting and crystallisation.
The term $D$ is a diffusion constant.
Along with this differential equation describing growth
we need to set up appropriate boundary conditions
to get reasonable solutions.
Assuming spherical symmetry with a crystal centered at the origin,
the radial cross section can be described using $M(r, t)$,
where $M(0, t) = 1$ indicating a perfect crystal,
while $M(\infty, t) = 0$ being a perfect liquid.
This allows us to find an expression for the growth rate $v(T)$
as a function of temperature
given the curvature of each phase

$$ v(T) = -\left[\frac{2KD(T)(\sqrt{\lambda_\text{liquid}}(T) +
\sqrt{\lambda_\text{crystal}}(T))^2}
{\lambda_\text{crystal}(T)\sqrt{\lambda_\text{liquid}(T)} +
\lambda_\text{liquid}(T)\sqrt{\lambda_\text{crystal}}(T)} \right ] \Delta\mu(T)
$$ {#eq:dft_growth_rate}

where $K$ being the correlation length of the order parameter.

The semi-empirical density functional theory describes the rate of melting
through the size of the fluctuations in the liquid and the crystal
and a transport coefficient.
There are similarities to the Wilson--Frenkel model
in that the growth rate is limited by diffusion,
meaning it will have the same activated growth.
There is also similarities in the inclusion of
the chemical potential between the two phases.
The important part of this semi-empirical density functional model
is modelling the rate of transition between the liquid and crystal phase
and allowing it to change as a function of temperature.

## Crystal Melting Goals

This chapter studies the crystal melting of
the p2 polymorph of the Trimer molecule,
to understand why the process of growth is so slow.
In @sec:melting_point we find that measuring growth
of the trimer crystal is not possible on the timescales
accessible to simulation,
so rather than modelling growth,
we focus on understanding what the slow melting rates
are able to tell us about
the slow growth and melting of fragile liquids.
In @sec:melting_thermodynamics
we find the thermodynamic quantities
required to model the melting rates
using the models described in @sec:crystal_growth_theories.
This is followed in @sec:melting_rates by
the calculation of the growth rates of the p2 polymorph,
followed by fitting each of the models to these observations.
This allows us to understand which aspects of the models
are important for describing melting in the Trimer
which can be applied to understanding other materials.
