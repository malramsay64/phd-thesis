# Simulation Conditions

This section describes the conditions used for each of the simulations.
These follow the sequence of steps for a molecular dynamics simulation
described by @Braun2018; initialisation, minimisation, equilibration, and production.
All simulations are run using the NPT ensemble unless otherwise specified
and use the Martyna-Tobias-Klein (MTK) thermostat and barostat [@Martyna1994]
to hold the pressure and temperature constant.
The simulations use the parameters $\tau = 1.0$ and $\tau_P = 1.0$
for the MTK thermostat and barostat respectively
which correspond to the rate the temperature and pressure
are restored to their desired values.
A step size of \num{0.005} is used for all simulations.
In @sec:methods_dynamics we describe the simulations
used for the analysis of Dynamics in @sec:Dynamics and @sec:Melting_Behaviour,
and in @sec:methods_melting we describe
the simulations for
machine learning in @sec:Machine_Learning
and for the analysis of the melting in @sec:Crystal_Melting and
@sec:Melting_Behaviour.

## Dynamics Simulations {#sec:methods_dynamics}

These are a series of simulations for studying the liquid phase.
The initialisation, minimisation and equilibration steps
describe the steps for generating an equilibrium liquid
at each of the temperatures studied in the production simulations
where the data collection occurs.
All simulations calculating the dynamics quantities
comprise of 1024 trimer molecules.

### Initialisation

The initialisation of the dynamics quantities is initially
constructed from a square lattice with a single lattice parameter $a$ where

$$a = 2 r_\text{enclosing}$$

with $r_\text{enclosing}$ being the radius of a circle centered
on the center-of-mass that completely encloses the molecule.
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

The initial square lattice configuration is a long way
from an equilibrium liquid configuration,
so the minimisation has two steps.
The first step of the minimisation uses
the Fast Inertial Relaxation Engine (FIRE) energy minimisation technique. [@Bitzek2006]
The FIRE algorithm is significantly faster
than the steepest-descent or conjugate-gradient approaches
and is more suited to molecular dynamics simulations.
The FIRE minimisation is run using the NPH ensemble,
minimising both the energy of the particles and the box,
with the pressure set to the desired value,
being either 13.50 or 1.00.
While the size of the box is allowed to shrink and relax,
it remains constrained to the initial square shape.
The FIRE minimisation is run with a step size of \num{1e-3} until both
the energy converges, with a tolerance of \num{1e-5} and
the force converges, with a tolerance of \num{0.1}.
The goal of the energy minimisation
is to prevent further steps from causing the simulation to blow up, [@Braun2018]
that is when the forces are so large that molecules
move unreasonable distances.
With the configuration having undergone the FIRE minimisation,
it is still going to be representative of
the square lattice from which it was minimised
rather than the equilibrium liquid.
To account for this,
a second step of the minimisation runs a simulation
for 1 million timesteps at a high temperature
to thoroughly equilibrate the high temperature liquid.
The high temperature simulations are conducted
at a temperature $T=3.00$ for a pressure $P=13.50$ and
at a temperature $T=2.00$ for a pressure $P=1.00$.
To prevent particles having a collective flow
through the periodic boundary conditions,
the net momentum of the simulation is zeroed every 33533 timesteps,
chosen for being a large prime number.
These simulations use the Martyna-Tobias-Klein thermostat and barostat [@Martyna1994],
with the parameters $\tau = 1.0$ and $\tau_P = 1.0$ and a step size of 0.005.

### Equilibration

The role of the equilibration is to take
the minimised simulation to one
representative of the equilibrated conditions
for which data collection is intended.
One of the challenges with equilibrating configurations
is capturing states which are representative
of the equilibrium configuration rather than those of a local minima.
The timescale normally associated with equilibration
is 10 structural relaxation times, [@Meenakshisundaram2019]
with the additional requirement that computed properties remain constant. [@Braun2018]
This second requirement can be troublesome for the low temperatures
at which many of these simulations take place.
To assist with this the equilibration takes place in two parts,
the first gradually lowers the temperature from that of the minimisation step,
reducing it to that of the simulation over \num{1e7} timesteps.
Following the lowering of the temperature,
the equilibration for many structural relaxation times takes place
using the same number of timesteps as the production simulations
specified in @tbl:dynamics_steps_1 and @tbl:dynamics_steps_13.

### Production

The conditions for production simulations are documented
in @tbl:dynamics_steps_1 for a pressure $P=1.00$
and in in @tbl:dynamics_steps_13 for a pressure $P=13.50$.
The net momentum in each of these simulations is zeroed every 33533 steps
preventing the flow of particles influencing the dynamics quantities.
The steps are chosen to ensure relaxation of the simulation
and to have enough key-frames for averaging over many initial conditions.
Lower temperatures are not considered as HOOMD-blue is unable to
count higher that \num{4e9} (detailed in @sec:melting_point).
Internally HOOMD-blue uses an unsigned 32 bit integer
to keep track of the step, [@hoomd_counter]
which means the largest supported step size is $2^{32-1}$ or \num{~4.2e9}.

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

Table: The conditions for the production simulations at a pressure $P=13.50$. {#tbl:dynamics_steps_13}

Temperature |Pressure| Steps
-----------:|-------:|-----------:
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

Table: The conditions for the production simulations at a pressure $P=1.00$. {#tbl:dynamics_steps_1}

## Melting Simulations {#sec:methods_melting}

These are a series of simulations for studying the melting
of each polymorph of the Trimer molecule.
These simulations are comprised of five steps,
consisting of initialisation, minimisation, melting and equilibration steps
and finally the production simulations used to collect the data.
The additional step of melting creates the interface
between the liquid and the crystal.
All simulations studying the melting behaviour of the Trimer
contain 4032 Trimer molecules.

### Initial Configuration {#sec:initial_configuration}

Since we are unable to determine
the equilibrium crystal structure
through molecular dynamics simulations (see @sec:melting_point),
we have to look to alternative techniques
for finding the initial crystal structures.
For these structures we use an
isopointal search algorithm developed by @Hudson2011
for finding the optimal hard packing of shapes.
The isopointal search algorithm is an approach to
reduce the degrees of freedom when searching for possible crystal structures
using the symmetry of the space groups comprising a structure.
Reducing the degrees of freedom to optimise
reduces the time to find a locally optimal solution
and increases the probability of that locally optimal solution
being the true global optimum.
The results from the hard packing
have been found to give our best estimate
at the equilibrium structures (see @sec:static_analysis).
The packing algorithm is comprised of two key ideas,
an isopointal search algorithm
which uses symmetry to reduce the search space
making it more likely to find the true maximum packing,
with the other being a simulated annealing algorithm
to efficiently sample the space of packings
while moving to optimise the best ones.
The isopointal search provides results for each space group,
with the structures from the p2, p2gg, and pg space groups
being the lowest energy polymorphs.
These structures are displayed in @fig:trimer_crystals
with the parameters for construction in @tbl:polymorph_construction.

:::{class=subfigures #fig:trimer_crystals}

![p2](../Projects/Crystal_Melting/figures/Trimer-p2-Hard.svg){#fig:trimer_p2 width=49%}

![pg](../Projects/Crystal_Melting/figures/Trimer-p1g1-Hard.svg){#fig:trimer_pg height=4cm}

![p2gg](../Projects/Crystal_Melting/figures/Trimer-p2gg-Hard.svg){#fig:trimer_p2gg width=49%}

The molecules coloured in blue are the real copies of the unit cell,
while the molecules in green are the periodic copies.

:::

Polymorph | $a$  | $b$  | $\theta$ | $x$  | $y$  | $\phi$ |
---       | --   | --   | --       | --   | --   | --     |
p2        | 3.82 | 2.63 | 1.83     | 0.70 | 0.32 | 5.59   |
p2gg      | 2.63 | 7.38 | 1.57     | 0.94 | 0.14 | 1.14   |
pg        | 2.72 | 3.63 | 1.57     | 0.65 | 0.45 | 1.94   |

Table: The structure of the unit cells of each crystal polymorph.
The values $a$, $b$, and $\theta$ describe the unit cell
being the length of each side and the angle between them.
The values $x$, $y$, and $\phi$ describe the position of
the molecule in fractional co-ordinates.
The additional molecules are constructed
from the symmetry of the space groups.
The angles are given in radians. {#tbl:polymorph_construction}

The initial configurations are built using the
crystal cell parameters in @tbl:polymorph_construction,
with the unit cell replicated 48 times the $a$ axis
and 42 times along the $b$ axis for the p2 and pg crystals.
The p2gg crystal with 4 molecules in the unit cell
is only replicated 21 times along the $b$ axis.
The number of replications in the $b$ axis
was chosen so the p2 polymorph can be coerced into a rectangular cell (see @sec:methods_interface).
The alignment of the layers is close enough to prevent overlap of particles.
The choice of the replications in the $b$ axis
informed the choice of $a$ which made the ratio of side lengths close to 1:1.

### Minimisation of local structure

With the initial configurations determined using hard discs
they need to be tweaked for the Lennard-Jones
potential used in the simulations.
This initial minimisation to find the closes Lennard--Jones structure
is performed using the FIRE energy minimisation technique. [@Bitzek2006]
To best optimise the crystal structure,
the box has been allowed to adjust its tilt ($\theta$),
and each of the axes ($a$ and $b$) can grow or shrink independently of the other.
An NPH ensemble is used for the minimisation
with pressures of $P=13.50$ and $P=1.00$
and the molecules having the kinetic energy of the temperature $T=0.4$.
The FIRE minimisation is run with a step size of \num{1e-3} until both
the energy converges, with a tolerance of \num{1e-5} and
the force converges, with a tolerance of \num{0.1}.
Once the minimisation is complete,
the configuration is then allowed to relax at a temperature $T=0.1$,
giving the particles the opportunity to find their local energy minima.

### Creation of Liquid--Crystal Interface {#sec:methods_interface}

The first step of creating the interface
is converting the tilted simulation configuration
to an orthorhombic configuration.
This is to make the creation of the crystal region easier
since the p2 crystal has a tilted unit cell.
The conversion to the orthorhombic shape
is done by drawing a rectangular box
of the same area in the periodic space
and using that as the new simulation cell,
a process is shown in @fig:orthorhombisation.
This does result in the neighbours
of the top and bottom layers changing
which requires a careful choice
of the number of overall layers
so the orthorhombic configuration is favourable.
This conversion to the orthorhombic cell
does introduce strain into the crystal structure
where it doesn't align quite perfectly.
This is handled by melting the outer 1/3
of the orthorhombic configuration at 2.2 times the melting point.
During this melting only the outer region is integrated,
with the distance between particles in the center region
increasing as the box increases.

![Depicting conversion of tilted cell (red) to orthorhombic (black).
The magenta region on the left of the tilted region
fills in the right corner of the rectangle
while the cyan region on the bottom right of the tilted region
fills in the bottom left corner of the rectangle.
](../01_Methods/figures/orthorhombisation.svg){width=80% #fig:orthorhombisation}

### Equilibration of Liquid--Crystal Interface

The equilibration component involves
reducing the temperature of the liquid region
to represent the equilibrium liquid at each temperature.
This is done by equilibrating only the liquid regions in two parts like for the dynamics.
The first gradually lowers the temperature from that of the minimisation step,
reducing it to that of the simulation over \num{1e7} timesteps.
Following the lowering of the temperature,
the equilibration takes place
for the number of steps of the production simulations in @tbl:melting_conditions_1 and @tbl:melting_conditions_13.
For the calculation of the melting rates,
there are five replications of each set of conditions.
To generate independent structures,
each liquid is initialised with a randomised momenta
before the equilibration takes place,
giving completely independent configurations
by the end of the melting process.

### Production Simulations

The number of timesteps used for the production simulations are shown in
@tbl:melting_conditions_1 and @tbl:melting_conditions_13,
with each simulation replicated five times for the calculation of errors.
The output from each configuration is in 100 evenly spaced configurations
which are used to measure the melting rates.

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

Table: The simulation conditions for the calculation of
the melting rates at a pressure $P=1.00$. {#tbl:melting_conditions_1}

Pressure | Temperature | Steps
----     |--           |--
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

Table: The simulation conditions for the calculation of
the melting rates at a pressure $P=13.50$. {#tbl:melting_conditions_13}
