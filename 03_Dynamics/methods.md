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

- Initial square lattice configuration
- FIRE minimisation
- equilibration at high temperature
    - NVT simulation
    - momentum zeroing

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
