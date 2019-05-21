# Methods

## Reduced Units

## Simulations

- tau = 1
- tauP = 1
- step size = 0.005

### Creation of Initial Crystal

- NPT simulation
- All degrees of freedom are decoupled
    - box is allowed to tilt
    - x,y,z increase independently
- Momentum is zeroed every 307 steps

- Creation of Initial Crystal from Parameters
    - p2 Crystal paramters
    - p2gg crystal parameters
    - pg crystal parameters

- Choice of unit cell parameters
    - closest to square
    - conversion of p2 crystal to orthogonal
    - get the p2 crystal to align when orthogonal

- initialised at a lower temperature

### Creation of Liquid--Crystal Interface

- NPT simulation
    - x, y axes expand individually
- Box of particles in the center third of the simulation cell are not integrated
    - temperature for these not included in calculation
- start at the higher temperature
    - randomly initialise velocities and angular velocities
- run until the crystal melts
- Positions of all particles are increased
    - distance between particles in the static region increases with the rest of the
      simulation cell

### Equilibration of Liquid--Crystal Interface

- NPT Simulation
- Temperature gradually decreased
    - more steps for lower temperatures
    - simulation at the lower temperature
- Non-integrated region remains stationary

- Run for a number of steps at the higher temperature

### Melting of Liquid--Crystal Interface

- NPT Simulation

## Crystal Melting Rates

### Measuring Melting Rates

For simulations where there is
a large difference in density
between the liquid and the crystal phases,
it is possible to monitor the rate of crystallisation
through the growth in size of the simulation cell. [@Tang2013]

Other methods are to compute a local property as a measure of order
like a hexatic order parameter for 2D simulations,
or a Steinhardt bond order parameter [@Reinhart2018].
See @sec:MLCrystals for details about identifying
crystal structure within a liquid.
These approaches use a slab geometry [@Kerrache2008]
to measure the growth or melting rates
of a single face of the crystal.

The melting rates of each crystal face can

There is no precedence in the literature
for the creation of a slab geometry
for a unit cell that doesn't fit in an orthorhombic unit cell.
Because the crystal growth and melting rates can vary by such a large value,
both the (1,0) and the (0,1) faces of the unit cell need to be tested.

As a method of getting around the limitations of these simulations,
a crystal blob was created,
with the central crystal region being completely surrounded by the liquid.
This ensures that the p2 crystal
is not artificially strained by the periodic boundary conditions,
and has the additional benefit
of being able to observe melting on all faces simultaneously
finding an Isotropic melting rate.

- Magnitude of Melting Rate
    - Relative to length of simulation
    - 3 orders of magnitude longer than most other simulations in the literature
        with regards to timesteps [@Widmer-Cooper2009a,@Kerrache2008,@Tang2013]
    - Still only looking at less than a layer melting near the melting point



- Detection of Crystalline molecules
-
- Machine Learning Methodology
    - Reference to results in previous section

### Calculation of Errors

- Dynamics
    - See @sec:dynamics
- Melting Rate
    -
