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

Looking at the nucleation rate and the crystal growth rate separately.

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

- supercooled liquids for pedestrians [@Cavagna2009a]

The classical theory of crystal growth
is attributed to Wilson[@Wilson1900] and Frenkel[@Frenkel1926],
where the growth rate is determined by the liquid diffusion
near the interface, and the chemical potential between the two phases.
At temperatures just below the melting point
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

- Methods of crystal detection
    - Simple methods
        - Density
        - energy
    - 2D Structural Methods
        - Hexatic order parameter
        - orientational order parameter
    - 3D Materials
        - Water (CHILL)
        - radial harmonics methods

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

### Models of Melting

- Classical Theory
- Ginzburg Landau / Square Gradient
- Phase-field
- Density functional methods

The field of modelling crystal growth
is a complete and utter mess of nomenclature
with no consistency of terminology.
The different models of crystal growth
can be roughly divided into four categories;

1. Classical Theory
2. Square Gradient Approximations
3. Phase-field theories
4. Density functional methods

however, actually working out which class
a model belongs to is rather difficult.

In 1994 @Bagdassarian1994 introduce a model
which measures the ordering using the parameter $M(\vect{r}, t)$
which is expressed in the Landau-Ginzburg form

$$ \frac{\partial M(\vect{r}, t)}{\partial t} = \frac{\Gamma}{\rho_s k_\text{b} T_f}
\frac{\partial \Omega[M]}{\partial M} $$

where;

- $\Omega[M]$ is the grand canonical free energy, taken as a functional of the order
  parameter $M(\vect{r}, t)$, and
- $\Gamma$ is a transport coefficient
As for why $\Omega[M]$ and not $\Omega[M(\vect{r}, t)]$,
it would have been nice to have been explained in the paper.
This initial form was described as a phase-field model.

In 2002 @Oxtoby2002 reviews Density Functional Theory (DFT)
in the context of statistical mechanics
and thermodynamic phase behaviour,
introducing the square gradient approximation,
which is also known as the Landau-Ginzburg free energy;

$$ F[m(\vect{r})] = \d{r}\left[ f_u(m(\vect{r}) + K | \nabla m(\vect{r}|^2 \right] $$

The equation was presented complete with the missing parentheses
and no description of any of the symbols.
Despite initially being described as a phase-field model,
the same idea is now described as Density Functional Theory.

Then in 2019 @Granasy2019 gives yet another term
to describe this same idea,
the Square Gradient approximation,
making a note that terminology has changed over time.
Then proceed to use it as a phase-field model.
So here we have a model of crystal growth
which has been described by three of
the four classes of crystal growth models.

#### Classical Theory

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

    - thermally activated process
    - mobility of molecules in the liquid
    - One dimensional process -> all parameters proceeding simultaneously [@Russo2016]
    - *Capillarity approximation* -> small crystalline nuclei are amenable to a
      thermodynamic description, that is they retain the properties of the bulk solid.
    - Surface tension -> not the relevant free energy cost

- Equation for crystals growth mathematically equivalent to the ising model
- There are classes of material which can't be described as thermally activated
    - Kinetic monte carlo
    - can be modelled using the ising model -> spin flips

- Bond orientational ordering
    - The idea that there are two order parameters required for crystallisation, even
      in atomic liquids
    - Description of liquid as ideal and homogeneous -> $G(r)$ [@Tanaka2012]
    - long range disordered -> can still posess short range to medium range order
    - A liquid has locally favourable structures which are formed normally within the liquid
    - Use bond ordering to describe short range ordering
    - Importance of orientational ordering has been often overlooked
    - it is bond orientational order not translational order that triggers crystal
      nucleation

- Molecular dynamics results suggest that there are two classes of materials. Once where
  there is an activation barrier for growth, and another where there is no activation
  barrier for growth. [@Jackson2002]

#### Square Gradient

@Bagdassarian1994 propose an alternative method
of understanding melting rates
somewhat modelled on the Marcus [@Marcus1956] theory of electron transfer.
The model describes an order parameter $M(\vect{r}, t)$
which describes the local state of the system.
The fluctuations of the order parameter
can be approximated by parabolas,
with one describing each of the phases.
This paper has a

#### Phase Field

- Phase field approach
    - rigorously derived based on variational principles of irreversible
      thermodynamics [@Emmerich2009]
    - used to model more complex behaviours [@Granasy2019;@Ericsson2019]
        - Dendrites, eutectic patterns, fractal like structures
    - currently has been used sparingly in the modelling of rates

- Use a local structural order parameter $\phi(\vect{r}, t)$ termed the *phase field*
    - a measure of local crystallinity
    - can monitor the presence of many different phases
- Able to monitor a range of different

- Front velocity $v_{PF} = (\alpha a / \lambda)\sqrt{3kT/m}$

#### Density Functional Theory

## Calculation of Melting Rates

- The temperature dependent chemical potential
  can be approximated as [@Tang2013]
  $$ \Delta \mu(T) = (T_m - T) \frac{\Delta h_m}{T_m} $$
  where
    - $T_m$ is the melting point, and
    - $\Delta h_m$ is the enthalpy of fusion per particle

- Slab geometries
    - Growth/melting rate along a single crystal plane
