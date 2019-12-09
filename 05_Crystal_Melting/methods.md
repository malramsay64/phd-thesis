# Methods

## Crystal Melting Simulations

- tau = 1
- tauP = 1
- step size = 0.005

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

### Minimisation

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

The initial parameters for the creation of the crystals are:

- Creation of Initial Crystal from Parameters
    - p2 Crystal parameters
    - p2gg crystal parameters
    - pg crystal parameters

- Crystal sizes
    - p2 -> 48 x 42
    - pg -> 48 x 42
    - p2gg -> 48 x 21

- Choice of unit cell parameters
    - closest to square
    - conversion of p2 crystal to orthogonal
    - get the p2 crystal to align when orthogonal

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

With the minimised crystal created I needed to create
two regions within the configuration
to mimic the configurations in @Sec:crystal-melting.
The first step of creating the interface
is converting the tilted simulation configuration
to an orthorhombic configuration.
This is done to make the resulting analysis
simpler and more consistent
across the different crystal structures.

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

Simulations of type liquid or interface will be forced into an orthorhombic shape by
setting the new orthorhombic box shape and moving particles through the new periodic
boundary conditions. In the image below, the initial configuration is the tilted
box, with the vertical bars being the simulation box. Particles outside the new box
are wrapped into the missing regions on the opposite side.

The conversion to the orthorhombic shape
is done by moving the shifted regions
as shown in @fig:ortho_rhombisation.
This does result in the neighbours
of the top and bottom layers changing
which requires a careful choice
of the number of overall layers
so the orthorhombic configuration is favourable.

```text
   ____________________
  | /               | /
  |/                |/
  /                 /
 /|                /|
/_|_______________/_|
```

The outer 1/3 of the orthorhombic configuration is then melted
at temperatures displayed in @tbl:interface_melt_temps,
removing any minor mismatch in the alignment of the periodic faces.
The central crystal region is not integrated during the melting,
however the distance between particles increases as the box size increases.

The only difference between simulations of type `"liquid"` and `"interface"`, is
that the interface simulations will only be integrating the motion of a subset of
molecules, with the central 2/3 of particles remaining stationary.

For the simulation type `"crystal"`, the momentum is zeroed more often, every 307
steps instead of 33533 for the liquid and interface simulations. Additionally, to
allow proper and complete relaxation of the crystal structure, each side of the
simulation cell is able to move independently and the simulation cell is also
permitted to tilt.

### Equilibration of Liquid--Crystal Interface

- NPT Simulation
- Temperature gradually decreased
    - more steps for lower temperatures
    - simulation at the lower temperature
- Non-integrated region remains stationary

- Run for a number of steps at the higher temperature

### Production Simulations

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
are more than three orders of magnitude longer that similar studies. [@Widmer-Cooper2009a;@Kerrache2008;@Tang2013]
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
For the melting rate,
we are not so much interested in the types of crystals
which exist within the structure,
instead only whether a particle
is crystal-like or liquid-like,
so the categorisation into each crystal structure is
reduced to a single category.
This categorisation of particles into
liquid and crystal is used
to create a spatial cluster
describing the crystalline region.
The spatial clustering is undertaken
using a hierarchical clustering algorithm,
with each particle starting in its own cluster
with the clusters being merged to minimise
the number of misclassified particles,
having the constraint that merges only occur
with neighbouring particles.
This is implemented using the Ward clustering algorithm [@Ward1963]
from the `AgglomerativeClustering` class
in the scikit-learn [@Pedregosa2012] library.
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
If we make the assumption
that the shape of the crystal region is roughly circular,
which from observations of the melting behaviour
is a reasonable description of the melting behaviour.
This means that we can express the crystallisation rate
as a function of the radius

$$ \tau_C = \frac{\Delta r}{\Delta t} $$

and taking the radius from the volume,
namely by rearranging the equation
for the volume of a circle

$$ V = \pi r^2 $$

$$ r = \frac{\sqrt{V}}{\pi} $$

Which gives the relation

$$ \tau_C = \frac{1}{\pi} \frac{\Delta \sqrt{V}}{\Delta t} $$

The change of the radius
is expected to be linear in time,
so all the measurements  are fit to a straight line
to find the overall crystal growth rate.

### Calculation of Errors

There many of different types of uncertainties
in the calculation of the melting rates.
There is the errors in the classification of the crystalline particles
and finding the region containing the crystal,
along with the fluctuations in the size of the crystal.
These first set of errors are all captured in the variance
of the melting curve,
with the effect of the errors minimised
by fitting a straight line to all the points.
This line of best fit
includes an error in the fit.
An additional source of error
is the variance between the simulation runs.
This error is found by multiple repetitions of the melting runs
using independent configurations.

It has been found that the error between simulations
is significantly larger than the error
in finding the melting rates for a single simulation.
For this reason,
the standard deviation of the melting rate
is the standard deviation of the values from each independent simulation.
This is converted to a standard error
by dividing by the square root of the number of samples.

This is all that is required for calculating the error
of the crystallisation rate,
however we are also combining this value
with the rotational relaxation time
which has its own errors---
see @sec:Dynamics for the calculation of this value
and the respective errors.
These are calculated using bootstrapping,
since the distribution is non-normal.
There is no exact method of combining asymmetrical errors [@Barlow2003]
and there is no standard method in the field,
instead I am making the errors symmetrical,
with the size of the largest asymmetrical error.

The two now symmetrical errors in
the crystallisation rate and the rotational relaxation time
can be combined by adding the fractional errors.

$$ \sigma_{C \times R} = (\tau_C * \tau_R) \left [ \frac{\sigma_C}{\tau_C} + \frac{\sigma_R}{\tau_R} \right ] $$

Where $\tau_C$ is the crystal growth rate,
$\sigma_C$ is the error in the crystal growth rate,
$\tau_R$ is the rotational relaxation time
$\sigma_R$ is the error in the rotational relaxation time,
and $\sigma_{C\times R}$ is the error of
the $\tau_R \times \tau_C$.
