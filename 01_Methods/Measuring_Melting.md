# Measuring Melting Rates

For simulations where there is a large difference in density
between the liquid and the crystal phases,
it is possible to monitor the rate of crystallisation
through the growth in size of the simulation cell. [@Tang2013]
Other methods are to compute a local property as a measure of order
like a hexatic order parameter for 2D simulations,
or a Steinhardt bond order parameter [@Reinhart2018].
@Sec:Machine_Learning develops the methodology for
identifying crystal structure within a liquid.
These approaches use a slab geometry [@Kerrache2008]
to measure the growth or melting rates
of a single face of the crystal.
There is no precedence in the literature
for the creation of a slab geometry
for a unit cell that doesn't fit in an orthorhombic unit cell.
Because the crystal growth and melting rates can vary by such a large value,
both the (1,0) and the (0,1) faces of the unit cell need to be tested.
Furthermore, the melting rates which are required for studying this system
are more than three orders of magnitude longer that similar studies. [@Kerrache2008;@Tang2013]
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
machine learning algorithm (@sec:supervised_learning)
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

## Calculation of Errors

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
