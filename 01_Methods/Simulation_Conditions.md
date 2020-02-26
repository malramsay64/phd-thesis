# Simulation Conditions

## Dynamics Simulations

The breakdown of the different simulation steps follows that defined by @Braun2018
having four distinct steps,

1. Initialisation
2. Minimisation
3. Equilibration
4. Production

with each step described below.

### Initialisation

The initialisation of the dynamics quantities is initially
constructed from a square lattice with a single lattice parameter $a$ where

$$a = 2 r_\text{enclosing}$$

with $r_\text{enclosing}$ being the radius of a circle centered
on the center of mass of the molecule
which completely encloses the molecule.
For the Lennard Jones potential,
enclosing radius is considered as the value of $\sigma / 2$
This configuration is chosen for being the simplest configuration
where there is no possibility of molecules overlapping
and being in the highly repulsive region of the Lennard-Jones potential.

For evaluating the dynamics quantities,
the initial lattice was extended in
the $a$ and $b$ directions for 32 periods each.
This results in a configuration containing 1024 molecules.

### Minimisation

The square lattice configuration is a long way
from an equilibrium liquid configuration,
so the minimisation steps are extensive,
comprising of two steps.

The first step of the minimisation
is using the FIRE energy minimisation technique [@Bitzek2006],
which is significantly faster
and more suited to molecular dynamics simulations
than the steepest-descent or conjugate-gradient approaches.
The minimisation was run using the NPH ensemble,
minimising both the energy of the particles and the box,
with the pressure set to the desired value,
being one of 13.50 or 1.00.
While the box was allowed to relax,
it retained the initial square shape
throughout the minimisation.
The minimisation was run until convergence of all parameters was reached
with the requirements for convergence being

- energy tolerance: \num{1e-5},
- force tolerance: 0.1, and
The step size of the minimisation was 0.001.

With the configuration minimised,
it is still unlikely to be representative
of an equilibrated liquid configuration.
So a simulation run of 1 million timesteps
was performed for each pressure at a high temperature
so that the liquid is thoroughly equilibrated.
These simulation had the conditions

Pressure   Temperature
--------  ------------
   13.50          3.00
    1.00          2.00

with a step size of 0.005.
To prevent issues with all particles in the
simulation producing a collective flow,
the net momentum of the simulation was zeroed every 33533 timesteps,
chosen for being a large prime number.
These simulations used the Martyna-Tobias-Klein thermostat and barostat [@Martyna1994],
using the parameters $\tau = 1.0$ and $\tau_P = 1.0$ and a step size of 0.005.

### Equilibration

The role of the equilibration is to take
the minimised simulation to one
representative of the equilibrated conditions
for which data collection is intended.
One of the challenges with equilibrating configurations
is capturing states which are representative
of the equilibrium configuration rather than those of a local minima,
particularly troublesome for the low temperatures
at which these simulations take place.
To assist with this the equilibration simulations take place in two parts,
the first is gradually lowering the temperature
from that of the minimisation step,
to the desired simulation temperature.
This process took place over \num{1e7} timesteps.
The second part of the equilibration
was running at the production temperature,
until the step count reached the timesteps specified in @tbl:dynamics_steps.
These simulations used the Martyna-Tobias-Klein thermostat and barostat [@Martyna1994],
using the parameters $\tau = 1.0$ and $\tau_P = 1.0$
and a step size of 0.005.

### Production

The timesteps used for each of the production simulations
are documented in @tbl:dynamics_steps.
These steps are chosen to ensure relaxation of the simulation
and to have enough key-frames for averaging over many initial conditions.

Temperature |Pressure| Steps
-----------:|-------:|-----------:
1.25        |  13.50 |   \num{4e9}
1.30        |  13.50 |   \num{2e9}
1.35        |  13.50 |   \num{2e9}
1.40        |  13.50 |   \num{2e9}
1.45        |  13.50 |   \num{2e9}
1.50        |  13.50 |   \num{2e8}
1.60        |  13.50 |   \num{2e8}
1.80        |  13.50 |   \num{2e7}
2.00        |  13.50 |   \num{2e7}
2.50        |  13.50 |   \num{2e7}
0.30        |   1.00 |   \num{4e9}
0.35        |   1.00 |   \num{2e9}
0.40        |   1.00 |   \num{2e9}
0.45        |   1.00 |   \num{2e9}
0.50        |   1.00 |   \num{2e9}
0.60        |   1.00 |   \num{2e8}
0.80        |   1.00 |   \num{2e8}
1.00        |   1.00 |   \num{2e7}
1.40        |   1.00 |   \num{2e7}
1.80        |   1.00 |   \num{2e7}

Table: The simulation conditions for each of the production simulations. {#tbl:dynamics_steps}

Lower temperatures were not considered
as HOOMD-blue is unable to count higher.
Internally HOOMD-blue uses an unsigned 32 bit integer
to keep track of the step, [@hoomd_counter]
which means the largest supported step size is $2^{32-1}$ or \num{~4.2e9}.

The momentum of the simulations was zeroed every 33533 steps
to prevent flow through the periodic boundaries
from influencing calculations of the change of displacement.
The simulations were undertaking in the NPT ensemble,
with the temperature and pressure held constant
using the Martyna-Tobias-Klein thermostat and barostat [@Martyna1994],
having the parameters $\tau = 1.0$ and $\tau_P = 1.0$ and a step size of 0.005.

## Machine Learning Simulations

The simulations for the machine learning dataset
are created using the same method as the Crystal Melting
simulations (see @sec:crystal-melting-simulations).
This so the models developed for the machine learning
are as close to the dataset they will be used with as possible.
The simulations for the crystal melting do take a long time to run
and since for the machine learning we concerned with
finding a range of representative structures rather than thermodynamic equilibrium
I can take some shortcuts to save time.
Rather than the equilibration at each temperature running up to 4 billion timesteps,
all the equilibration is done in 10 thousand steps.

The configurations used for the machine learning tasks
was from a timestep of 100,
chosen for having a range of thermal motions within the crystal,
without the melting at higher temperatures interfering with the structure.

## Melting Simulations

All the simulations for the crystal melting
were conducted using the HOOMD-blue package.
The simulations were conducted using the NPT ensemble,
having the number of particles, the pressure, and the temperature
constant throughout the simulations.
The pressure and temperature are kept constant
using the Martyna--Tobias--Klein thermostat and barostat [@Martyna1994]
with a coupling constants $\tau = 1$ for the temperature
and $\tau_P = 1$ for the pressure.
The timestep was set to 0.005.

The creation of the liquid--crystal interface
requires an additional step compared to
the dynamics calculations,
being the melting of the liquid crystal interface.
These steps are all documented below.

1. Initial Configuration
2. Minimisation
3. Melting
4. Equilibration
5. Production

## Initial Configuration

Since we are unable to determine
the equilibrium crystal structure
through molecular dynamics simulations,
we have to look to alternative techniques
for finding the initial crystal structures.
Instead we look to a Monte Carlo type algorithm
searching for the most stable structure.

The search technique I used was developed by @Hudson2011
for finding the optimal packing of shapes.
The optimal packing approach approximates
the Lennard-Jones potential as a hard disc,
however the approach has shown to be appropriate
for predicting crystal structures for a range of materials.

The packing algorithm is comprised of two key ideas,
an isopointal search algorithm
which uses symmetry to reduce the search space
making it more likely to find the true maximum packing,
with the other being a simulated annealing algorithm
to efficiently sample the space of packings
while moving to optimise the best ones.
The isopointal search provides results for different constraints
so there are configurations for each of the p2, p2gg and pg crystals
which were the most likely candidates for the true crystal structure.

### Minimisation of local structure

With an initial configuration determined using hard discs
this needs to be adjusted to account for the Lennard-Jones
potential used in the simulations.
The initial minimisation is performed using
the FIRE energy minimisation technique [@Bitzek2006]
which ensures the crystal structure is in
a local minima with the Lennard-Jones potential.
Because this is optimising the highly rigid crystal structure,
the box has been allowed to adjust its tilt,
and each of the axes can move independently of the others.
The FIRE energy minimisation is performed using
the NPH ensemble with a pressures of $P=13.50$ and $P=1.00$
and the kinetic energy of the temperature $T=0.4$.

The parameters for the creation of the crystal unit cells
are documented in @fig:crystal_unit_cell.
For the initial configuration these unit cells
were packed together

:::{class=subfigures id=fig:crystal_unit_cell}

![p2](../01_Methods/figures/placeholder_figure.png){width=33% #fig:crystal_unit_cell_p2}
![pg](../01_Methods/figures/placeholder_figure.png){width=33% #fig:crystal_unit_cell_pg}
![p2gg](../01_Methods/figures/placeholder_figure.png){width=33% #fig:crystal_unit_cell_p2gg}

The unit cells of the p2 (a) the pg (b) and the p2gg (c) crystals
documenting the unit cell parameters
and the positions of each particle within the cell.

:::

The initial configurations used many replications
of these unit cells along the $a$ and $b$ crystal axes.
The number of replications for each crystal is in @tbl:unit_cell_dimensions.
These numbers were based on the p2 crystal,
which doesn't have an orthorhombic unit cell,
required for the melting step.
The choice of 42 is such that
the periodicity of the simulation cell in the $y$ direction
is nearly the same as the $b$ crystal direction
allowing for adjusting the shape.
The remaining parameters were chosen
to keep the simulation cells close to square in shape.
Note that the p2gg unit cell has twice as many molecules
as the other unit cells.

Crystal | Replications $a$ | Replications $b$
------- |----              |----
p2      | 48               | 42
pg      | 48               | 42
p2gg    | 48               | 21

Table: The unit cell dimensions for each of the crystal
structures. {#tbl:unit_cell_dimensions}

The once the initial configuration is created,
an NPT simulation at a temperature $T=0.1$
is run to allow the molecules to relax.
The positions are based off the packing of hard spheres
so this allows the particles to relax to their minimum.
During this relaxation process all degrees of freedom
of the simulation cell are decoupled
and the box is allowed to tilt,
giving the crystal the most freedom to find
the minimum energy configuration.

### Creation of Liquid--Crystal Interface

The first step of creating the interface
is converting the tilted simulation configuration
to an orthorhombic configuration.
This is done to make the resulting analysis
simpler and more consistent
across the different crystal structures.

The conversion to the orthorhombic shape
is done by moving the shifted regions
as shown in @fig:orthorhombisation.
This does result in the neighbours
of the top and bottom layers changing
which requires a careful choice
of the number of overall layers
so the orthorhombic configuration is favourable.

![Depicting conversion of tilted cell to orthorhombic
](../01_Methods/figures/placeholder_figure.png){width=80% #fig:orthorhombisation}

The outer 1/3 of the orthorhombic configuration is then melted
at 2.2 times the melting point,
removing any minor mismatch in the alignment of the periodic faces.
The central crystal region is not integrated during the melting,
however the distance between particles increases as the box size increases.

### Equilibration of Liquid--Crystal Interface

The equilibration component involves
reducing the temperature of the liquid region
to represent the equilibrium liquid at each temperature.
This is done by equilibrating only the liquid regions
for the number of steps in @tbl:melting_conditions.
These simulations are replicated five times
for each set of conditions,
each with a different initial momentum.

### Production Simulations

The steps for the production simulations are shown in @tbl:melting_conditions,
with each simulation replicated five times for the calculation of errors.
Each simulation has 100 output configurations to measure the rate of melting.

Pressure | Temperature | Steps
----     |--           |--
1.00     | 0.70        | \num{4e4}
1.00     | 0.60        | \num{1e5}
1.00     | 0.55        | \num{5e5}
1.00     | 0.50        | \num{5e6}
1.00     | 0.45        | \num{1e7}
1.00     | 0.42        | \num{1e8}
1.00     | 0.40        | \num{5e8}
1.00     | 0.39        | \num{1e9}
1.00     | 0.38        | \num{1e9}
1.00     | 0.37        | \num{1e9}
1.00     | 0.36        | \num{1e9}
1.00     | 0.35        | \num{1e9}
13.50    | 3.00        | \num{4e4}
13.50    | 2.50        | \num{1e5}
13.50    | 2.20        | \num{5e5}
13.50    | 2.20        | \num{5e6}
13.50    | 1.80        | \num{1e7}
13.50    | 1.60        | \num{1e8}
13.50    | 1.50        | \num{5e8}
13.50    | 1.45        | \num{1e9}
13.50    | 1.40        | \num{1e9}
13.50    | 1.38        | \num{1e9}
13.50    | 1.35        | \num{1e9}
13.50    | 1.33        | \num{1e9}

Table: The conditions for the simulations for the crystal
melting rates. {#tbl:melting_conditions}
