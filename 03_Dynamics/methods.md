# Methods

## Simulations

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
- angular momentum tolerance: 0.1.
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
until the step count reached the timesteps specified in @Tbl:dynamics_steps.
These simulations used the Martyna-Tobias-Klein thermostat and barostat [@Martyna1994],
using the parameters $\tau = 1.0$ and $\tau_P = 1.0$
and a step size of 0.005.

### Production

Steps

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

## Data Collection

The collection of the data is an important part
of calculating the resulting dynamics quantities.
Because of the large timescale of the simulations
and I am looking at phenomena on a range of timescales
the time between configurations increases
as the total time increases.
The sequence of the steps is visually displayed in @tbl:step_sequence
with each row having 100 steps,
and the size of the steps increasing by a power of 10
as we move down the rows.

Step Size |      |       |       |       |       |       |        |
---------:|:---- |:----- |:----- |:----- |:----- |:----- |:----   | :------
1         |   1  |  2    | 3     | ...   | 97    | 98    | 99     | 100
10        | 110  | 120   | 130   | ...   | 970   | 980   | 990    | 1000
100       |1100  | 1200  | 1300  | ...   | 9700  | 9800  | 9900   | 10000
1000      |11000 | 12000 | 13000 | ...   | 97000 | 98000 | 99000  | 100000

Table: The step sequence broken into it's two components.
Across each row are the linear steps,
while dropping down to the next row
increases the size of the linear step by a power of 10. {#tbl:step_sequence}

This sequence of steps allows for a singe data point for each simulation,
however the stochastic nature of simulations means this trajectory
is only representative of a single possible outcome.
A typical method of creating many trajectories from a single one
is the comparison of every measurement with every other [@Buyl2018],
an approach which only works when there is equal spacing between configurations.

As an alternative,
I have created what are called key-frames,
points spaces evenly from which this exponential sequence starts.
This allows for comparison back to the initial key-frame.
By using key-frames spaced
such that they are independent configurations
I am able to use standard statistical methods to estimate errors.

Independent configurations in molecular dynamics
are typically considered configurations separated
by more than the structural relaxation time
and with enough key-frames
I can sample the equilibrium configuration.

## Dynamics Quantities

### Calculation of Wavenumbers

The first step in the calculation of wavenumbers
is finding the radial distribution function.
This shows the distribution of particles at each radius
and can be related to the experimentally measurable scattering function
through a Fourier transformation.
I used the function `freud.density.RDF` from
the freud python package [@Harper2016]
for the analysis of the radial distribution function.
The radial distribution is averaged over 1000 frames
at the melting point shown in @fig:radial_distribution_function.

![The radial distribution function of the Trimer
molecule](../placeholder_figure.png){#fig:radial_distribution_function width=80%}

### Computing the structure factor

Now that we have nicely computed the radial distribution function
we can convert it to the structure factor $S(k)$
using @eq:structure_factor.

$$ S(k) = 1 + \rho \int dr e^{-ikr} [G(r) - 1] $$ {#eq:structure_factor}

Although the computation of the structure factor
is described as a Fourier transform,
with the isotropic nature of the liquid,
we can assume spherical symmetry giving

$$ S(k) = 1 + 4 \pi \rho \frac{1}{k} \int dr r \sin(qr) [G(r) - 1] $$

where $\rho$ is the number density of the liquid.
Additionally because we can only take finite steps,
the integration is discretised as

$$ S(k) = 1 + 4 \pi \rho \frac{1}{k} \Delta r \sum_r r \sin(qr) [G(r) - 1] $$

The discrete function is calculated with the following function

```python
import numpy

def static_structure_factor(
    rdf: freud.density.RDF, wave_number: float, num_particles: int
):
    dr = rdf.R[1] - rdf.R[0]
    integral = dr * numpy.sum((rdf.RDF - 1) * rdf.R * numpy.sin(wave_number * rdf.R))
    density = num_particles / rdf.box.volume
    return 1 + 4 * numpy.pi * density / wave_number * integral
```

The wave number $v$ is the maximum value
of the static structure factor,
and can be used to find the characteristic Bragg length $k_\text{bragg}$

$$ k_\text{bragg} = \frac{\pi}{2 v} $$

### Structural Relaxation

Knowing the value of the wave vector $k_\text{bragg}$
it is possible to monitor how particles
move relative to that characteristic distance
using the intermediate scattering function

$$ F(k, t) = \left \langle \cos \left\{
k \left[\cos\left(a\frac{2\pi}{M}\right), \sin \left(a\frac{2\pi}{M} \right) \right]
\cdot
[\Delta x_{j}(t), \Delta y_{j}(t)]
\right\} \right \rangle $$

This can then be converted to a python function:

```python
from functools import lru_cache

# This decorator is what enables the caching of this function,
# making this function 100 times faster for subsequent exectutions
@lru_cache()
def create_wave_vector(wave_number: float, angular_resolution: int):
    """Convert a wave number into a radially symmetric wave vector."""
    angles = numpy.linspace(
        0, 2 * numpy.pi, num=angular_resolution, endpoint=False
    ).reshape((-1, 1))
    wave_vector = numpy.concatenate([numpy.cos(angles), numpy.sin(angles)], axis=1)
    return wave_vector * wave_number


def intermediate_scattering_function(
    box: freud.box.Box,
    initial_position: numpy.ndarray,
    current_position: numpy.ndarray,
    wave_number: int,
    angular_resolution: int = 60,
) -> float:
    """Calculate the intermediate scattering function for a specific wave-vector."""
    wave_vector = create_wave_vector(wave_number, angular_resolution)

    # We only want the x and the y values from the displacements
    displacement = box.wrap(initial_position - current_position)[:, :2]

    return numpy.mean(numpy.cos(numpy.dot(wave_vector, displacement.T)))
```

As an alternative and simpler method of
monitoring structural relaxation $F_d(t)$
using the quantity suggested by @Widmer-Cooper2009

$$ F_d(t) = \begin{cases}
    1 &\quad\text{if} \Delta x < d, \\
    0 & \text{otherwise}
    \end{cases} $$

Both the intermediate scattering function $F(k, t)$
and the structural relaxation $F_d(t)$
have the shape of a stretched exponential.
For both these values,
the characteristic relaxation time $\tau_s$ was found by
finding the first time which the relaxation function
dropped below the value $1/\text{e}$.
The expected value and confidence interval
was estimated by using the bootstrap procedure
over all the key frames.

### Diffusion

To calculate the translational diffusion constant
we first need to calculate the mean squared displacement $MSD$

$$ MSD = \langle ||\vect{r}(t) - \vect{r}(0)||_2^2 \rangle $$

which is calculated for all par

```python
import numpy
import freud

def mean_squared_displacement(
    box: freud.box.Box,
    initial: numpy.ndarray,
    final: numpy.ndarray
) -> numpy.ndarray:
    return numpy.square(numpy.linalg.norm(box.wrap(final - initial), axis=1))
```

The linear region of the mean squared displacement,
which are points with displacements from 2 to 50
are fit to the linear function

$$ \log(MSD) = m \log(t) + b $$

where $t$ is time and $m = 4D_t$.

The values are aggregated
over all the starting configurations
by calculating the diffusion constant of each time sequence
and using bootstrapping to estimate the mean
and the confidence interval.

### Rotational Relaxation

The rotational relaxation function, $C_l(t)$
is calculated for both the first,

$$ C_1(t) = \langle \cos[2\cos^{-1}(|q(t) q(0)|)] \rangle $$

and second

$$ C_2(t) = \langle 2\cos^2[2\cos^{-1}(|q(t) q(0)|)] - 1 \rangle $$

Legendre polynomials,
where $q(t)$ is the quaternion representing the orientation at time $t$.
The calculation the quaternion angle
is done using the Rowan package [@Ramasubramani2018],
specifically using the function `rowan.geometry.intrinsic_distance`.
See @sec:quaternion_roataions for more details
in using quaternions for representing orientations.

For both these values,
the characteristic relaxation time $\tau_s$ was found by
finding the first time which the relaxation function
dropped below the value $1/\text{e}$.
The expected value and confidence interval
was estimated by using the bootstrap procedure
over all the key frames.

### Heterogeneous dynamics

Particles undergoing Brownian motion
will have a distribution of distances $\Delta r$
which has a Gaussian distribution.
The non-Gaussian parameter $\alpha$ [@Rahman1964]
is a measure of how far the actual distribution
of distances deviates from a Gaussian distribution

$$ \alpha = \frac{\langle \Delta r^4\rangle} {2\langle \Delta r^2  \rangle^2} - 1 $$

This is the result for relaxation in two dimensions.

Like translational motion,
the rotational motion is also expected to have
a Gaussian distribution,
which means it can be expressed in the same way
as the translational non-Gaussian parameter.

$$ \alpha_\text{rotation} = \frac{\langle \Delta \theta^4\rangle} {2\langle \Delta \theta^2  \rangle^2} - 1 $$

It is additionally possible to investigate
the coupling of the rotational and translational heterogeneities
which is measured using the parameter $\gamma$.

$$ \gamma = \frac{\langle(\Delta r \Delta\theta)^2 \rangle}
    {\langle\Delta r^2\rangle\langle\Delta\theta^2\rangle} - 1 $$

This formulation is simplified from @Faraone2003
using the same approach as the rotational and translational
non-Gaussian parameters.

Each of these quantities,
the translational heterogeneities $\alpha$,
the rotational heterogeneities $\alpha_\text{rotation}$, and
the coupling of heterogeneities $\gamma$,
has a characteristic timescale;
the time at which the dynamics is maximally heterogeneous.
This allows for the comparison of these quantities
as a function of temperature.

## Molecular Quantities

The calculation of the molecular relaxation times
is done by keeping track of the state of each molecule over time.
The typically relaxation times,
diffusion, structural relaxation, and rotational relaxation
find the first time the particle moves beyond
the intended distance.

The last passage time uses a state machine
which can have one of three values

The state can have one of three values,

- 0 => No relaxation has taken place, or particle has moved back within
        the threshold distance
- 1 => The distance has passed the threshold, however not the
          irreversibility distance
- 2 => The molecule has passed the irreversibility distance

```python
for state, dist, status in zip(self._state, distance, self._status):
    if state == 2:
        # The threshold has been reached so there is now nothing to do
        continue
    elif state == 1:
        # Need to check whether the relaxation has crossed a threshold
        if dist > self._irreversibility:
            state = 2
        elif dist < self.threshold:
            state = 0
        else:
            continue
    elif state == 0:
        if dist > self.threshold:
            status = timediff
            state = 1
        else:
            continue
    else:
         RuntimeError("Invalid State")
```
