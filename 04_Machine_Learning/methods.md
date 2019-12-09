# Methods

## Creation of Dataset

The simulations for the machine learning dataset
are created using the same method as the Crystal Melting
simulations (see @sec:crystal_melting_simulations).
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
which can then be used for the calculation of

## Algorithms and Parameters

- scikit-learn [@Pedregosa2012]
    - API design [@Buitinck2013]
