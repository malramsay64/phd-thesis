# Methods

## Simulations

There are three distinct types of simulations which are being performed
for the generation of the dynamics results.
These are;

- initialisation,
- equilibration, and
- production

with each having a different set of conditions
suited to the aims of the particular simulation.
This process takes an arbitrary molecular shape
and generate a representative dataset.

### Initialisation

The complex shapes of the molecules makes it difficult to
manually create a representative initial configuration.
The initialisation takes an initial configuration
consisting of particles on a square grid
having a unit cell length of the largest axis of the molecule.
The use of this length
ensures that there is no overlapping of molecules.
It is important that no molecules overlap
as this could result in numerical instability of the simulation.
The low density lattice is then minimised using
a FIRE energy minimisation scheme,
chosen for handling rigid molecules.

Following minimisation,
the resulting configuration is equilibrated at a temperature
above those studied and the desired pressure,
using a NPT simulation.

<!-- TODO Check simulation condtions -->

### Equilibration

For the purposes of the dynamics simulations
an equilibration experiment is one designed to
take a configuration from well equilibrated high temperature liquid phase
and generate a configuration from a well equilibrated low temperature state.
A configuration contains all the information required
to reproduce the simulation exactly,
which is the positions, momenta, orientations, and angular momentum.

<!-- TODO What constitutes knowing that we have reached equilibrium? -->

- Purpose
- limitations -> 4 billion timesteps
- Methodology -> decrease temperature for half steps or 1e7 whichever is smaller then run at desired
  temperature for remainder

### Production

The collection of data for the equilibrium property of the dynamics
is only valid should the configurations being sampled
be representative of the equilibrium state.

- Simulation conditions
  - NPT
  - Imaginary mass
- data on many timescales
- constraints of data collection
  - storage size
  - network speeds
- Step sequence -> log scale for dynamics
- starting configurations
  - need to average over the equilibrium state
  - not just a correlated set of trajectories

## Error Calculations

The calculation of confidence intervals
has been performed using the bootstrapping procedure[@Efron1979].
The probability distributions that I am working with
are typically not normal distributions,
meaning the typical statistical approach
which assumes a normal distribution is not appropriate.
Using a bootstrap method means
there is no assumption made on the shape of the distribution.
The bootstrapping approach is a Monte-Carlo method,
using a random sampling with replacement
of the measured values.

<!-- TODO expand on this with equations, code and improved description -->

## Calculation of Relaxation Times

### Diffusion constant

- fit points from 2 to 50
    - fit is to linear function $y = mx + b$
- Error from bootstrapping different frames
    - calculate for each frame
    - randomly choose results

### Exponential Relaxations

- Structural relaxation
- Rotational relaxtion

- Find first value below 1/e
- bootstrap many starting configurations

### Maximum Time relaxation

- gamma
- alpha

- Time at which the maximum occurs
