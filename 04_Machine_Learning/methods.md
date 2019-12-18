# Methods

## Creation of Dataset

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

### Labelling Local structures

The creation of the simulation provides configurations
which can then be used for the task of classification.
The dataset contains a collection of configurations
like the one depicted in @fig:labelling_structures.
Each of these contains a crystalline region
in which every local configuration is labelled
as being crystal in nature.
Surrounding this is the interface between the liquid and crystal,
a region which was excluded from the training dataset
as the liquid or crystal nature is not well defined
while also acting as a buffer for melting.
Finally the local configurations around the outside
are all classified as liquid in nature.
This is all collated into a dataset which contains
the information on the local structure and
the assigned label.

![Image describing the different labelled regions of a configuration.
The center region is labelled as the crystal it was created as,
while the outside is classified as liquid](../placeholder_figure.png){width=80% #fig:labelling_structures}

## Algorithms and Parameters

The algorithms used for the machine learning
leverage the scikit-learn package [@Pedregosa2012]
utilising the well designed interface. [@Buitinck2013]

### Supervised Learning Algorithms

The K-Nearest Neighbours algorithm @Goldberger2005
is used for the supervised classification of particles.
This was chosen based on performance,
both in the task of classification
but also the speed with which classification took place.
The K-Nearest Neighbours algorithm has a single parameter
being the value of $K$,
the number of neighbours from which a consensus is formed.
Testing a range of values with cross validation found that a value of 5
produced the best performing algorithm.

To get the best performance from the algorithm
kd-trees [@Bentley1975] are used for the neighbour search
an algorithm which finds use in molecular dynamics simulations [@Howard2016]

### Measuring Success

Another important part of machine learning
is the method used to measure success.
The type of measurement can depend on the dataset
and the goals of the algorithm.
It should be noted that the machine learning algorithm
will be optimised to score highly in whichever metric is chosen.
The metric used for these simulations is the balanced accuracy.
[@Brodersen2010;@Kelleher2015]
This score calculates the accuracy for each of the individual classes,
in this case for the p2, p2gg, and pg crystals along with the liquid
and combines the fraction of each to give the final score.
