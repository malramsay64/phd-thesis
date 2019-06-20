# Methods

## Reduced Units

## Simulations

- tau = 1
- tauP = 1
- step size = 0.005

### Creation of Initial Crystal

- Use crystal structure from isopointal search
- FIRE minimisation to find local minima with LJ potential
    - Allow tilt and box shinkage/growth

- NPT simulation to relax structure -> equilibrate
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

There is no precedence in the literature
for the creation of a slab geometry
for a unit cell that doesn't fit in an orthorhombic unit cell.
Because the crystal growth and melting rates can vary by such a large value,
both the (1,0) and the (0,1) faces of the unit cell need to be tested.

Furthermore, the melting rates which are required for studying this system
are more than three orders of magnitude longer that similar studies. [@Widmer-Cooper2009a,@Kerrache2008,@Tang2013]
The rates required are measuring on the order of
a layer of the crystal melting over
a billion timesteps.

As a method of getting around the limitations of these simulations,
a crystal blob was created,
with the central crystal region being completely surrounded by the liquid.
This ensures that the p2 crystal
is not artificially strained by the periodic boundary conditions,
and has the additional benefit
of being able to observe melting on all faces simultaneously
finding an Isotropic melting rate.

The first step in determining the melting rate
is determining which particles
are in a local crystalline configuration.
This approach used the K-Nearest Neighbours
machine learning algorithm (see @sec:MLCrystals).
In the case of the melting rate,
we are not so much interested in the types of crystals
which exist within the structure,
instead only whether a particle
is crystal-like or liquid-like,
so the categorisation into each crystal structure is
reduced to a single category.
This categorisation of particles into
liquid and crystal is used
to create a spatial cluster
describing the region which is just crystal.
The spatial clustering is undertaken
using a hierarchical clustering algorithm,
with each particle starting in it's own cluster
with the clusters being merged to minimise
the number of misclassified particles,
having the constraint that merges only occur
with neighbouring particles.
This is implemented using the Ward clustering algorithm [@Ward1963]
from the `AgglomerativeClustering` class
in the scikit-learn [@Pedregosa2011] library.
The clustering is required
as there are errors in the crystal/liquid classification
and this accounts for and smooths the errors
and the fluctuations on the surface of the crystal.

With the clustering algorithm defining the particles which are crystalline,
this needs to be converted into units of distance.
This is done by taking the convex hull
of the crystal cluster,
being the area which encloses all the crystal particles.
The convex hull is used to calculate the area and perimeter.
The Qhull algorithm [@Barber1996] is used for
the calculation of the convex hull,
accessed through the interface of the SciPy library. [@Jones2001]
It should be noted that the Application Programming Interface (API)
defines the calculated quantities as
the volume (area) and surface area (perimeter),
reflecting the names of the 3D equivalents,
despite calculating the relevant quantities when
provided two-dimensional data.

The above steps describe the process
of calculating the volume and surface area
of the crystal at a single point in time.
And these values are calculated
for each individual configuration within a melting simulation.
From each of these measurements
a straight line fit
is used to find the change in area $A$ over time $t$,
with this being normalised by the initial perimeter $P$,
to give a crystallisation rate $\tau_C$ as the distance the interface travels.

$$ \tau_C = \frac{1}{P} \frac{\Delta A}{\Delta t} $$

So that the changing perimeter doesn't
have too much of an effect on the measured rate,
the melting is only tracked until it is 50%
of it's original volume.

### Calculation of Errors

- Dynamics
    - See @sec:dynamics
- Melting Rate
- Normalised Melting Rate
    - Dynamics don't have a normal distribution
    - Combining the asymmetric error with a normal error requires special handling
