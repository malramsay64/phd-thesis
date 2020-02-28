# Molecular Dynamics Methods

## Choice of Simulation Program

The molecular dynamics simulations within this thesis
are all conducted using version 2.3.0 of
the simulation package HOOMD-blue, [@Nguyen2011;@Anderson2008;@Glaser2015]
actively developed by the Glotzer group
with development led by Joshua Anderson at the University of Michigan.
This section documents the describes why HOOMD-blue
is most suitable for the long timescale rigid body simulations
used within this thesis.
The investigation of liquids resistant to crystallisation
necessitates simulations over long time scales
to fully characterise this behaviour.
Additionally, as described in @sec:computational_tractability
the size of the simulation needs to be large enough
to avoid the impact of finite size effects,
with 500 particles recommended as the lower limit. [@Kikugawa2015;@Moultos2016;@Maginn2018]
A further requirement of the simulation program
is handling the rigid shape of the Trimer molecule.

### Speeding up a simulation

For a simulation over a long timescale,
the most important consideration
is the time to calculate each individual timestep.
Over billions of steps,
small optimisations save large amounts of time.
Previous simulations using the Lewis--Wahnström model,
have used systems with small numbers of molecules [@Pedersen2011;@Mossa2001;@Berry2006]
to reduce the time required to calculate each timestep.
A consequence of these small simulations
is the caveat that the results could be impacted by finite size effects.
The goal of the Trimer molecule is to have a simulation
large enough that finite size effects are minimal,
so alternative approaches of speeding up the calculation of each step are required.

The most well known method of speeding up
a molecular dynamics simulation
is to spread the work across multiple Central Processing Unit (CPU) cores,
with each core working on a subset of the simulation.
[@Abraham2015;@Nguyen2011;@Plimpton1995]
This division of work is known as parallelisation.
This has the effect of reducing the size of the problem
which each individual CPU has to calculate.
However, this division of work doesn't come for free,
because each smaller simulation is part of the large whole
information needs to be communicated between each CPU
updating the positions of neighbouring subgroups.
This communication is a slow process compared to any individual computation. [@Hare2016]
For parallelisation to be beneficial,
the communication overhead needs to be amortized over many calculations,
meaning at some point adding more parallelisation
slows down the computation.
The CPU is a general purpose computing architecture,
which makes it possible to perform
many different types of computations.
However, a result of the general purpose nature
is that it is not optimised for any particular use case.
Since there is a limit to
the number of divisions within a simulation,
an alternative method to speeding up calculations
is to use specialised hardware.

Over the past 10 years Graphics Programming Units (GPUs)
have become a more important part of any HPC solution,
now comprising more than 20% of the Top 500 Supercomputers. [@top_500]
GPUs provide a highly efficient architecture
for performing the same calculation
on many pieces of data simultaneously.
The calculation of pairwise forces in molecular dynamics simulations
is one which needs to be performed many times
with different data for each calculation.
This has seen many Molecular Dynamics libraries
use GPUs to speed up certain parts of the calculation pipeline.

Taking the optimisation of the compute device a step further
is using a chip designed for performing molecular dynamics simulations.
While the diverse nature of molecular dynamics simulations
and incredible cost of creating custom processors make this impractical,
it is possible to get most of the way to a custom processor using a
Floating Point Gate Array (or FPGA).
FPGAs are programmable hardware,
able to replicate the circuitry present on a custom processor
providing incredible efficiency and performance
at a highly specific task.
FPGAs typically find applications in
industrial control systems, [@Monmasson2007]
real time signal processing, [@Parsons2006;@Woods2008]
neural networks, [@Zhang2015]
and other performance critical domains.
FPGAs have also been been explored for
use within Molecular dynamics simulations, [@Khan2013;@Yang2019]
having performance greater than using a GPU.
While there are performance benefits,
the complexity of programming the FPGA,
and the scarcity and expense of the hardware,
means these are reserved for the most specialised applications.

### Implementations

There are many different implementations of Molecular Dynamics on GPUs including;
LAMMPS, [@Plimpton1995]
GROMACS, [@Lindahl2001;@Hess2008;@Pronk2013;@Berendsen1995;@Abraham2015]
AMBER, [@Case2006;@Case2008]
HOOMD-blue, [@Anderson2008;@Nguyen2011]
NAMD, [@Phillips2005]
and OpenMM. [@Eastman2010]
Evaluating the approach of each software package to simulating the same system
is difficult for a team of experts, [@Rizzi2019]
with each having different optimisations.
In choosing a software package,
two of this collection were evaluated for use, LAMMPS and HOOMD-blue.

The software package LAMMPS [@Plimpton1995]
is a standard tool in the field of Molecular Dynamics
with over \num{23,000} citations.
It forms the foundation of many computational analyses,
however while there are many papers using LAMMPS,
there are very few that make note of
the version number @Li2016
or provide data and scripts for using it.
This makes it difficult to replicate work,
compounded by LAMMPS containing many optionally installed components.
Two of these optionally installed components are
the GPU module, for using the GPU for accelerating some calculations, and
the Rigid module, providing the ability to simulate rigid molecules.
While the modularity of LAMMPS allows for
the inclusion of these additional modules,
they are not part of the core functionality,
meaning there are compromises
in functionality and performance.
This can be seen in @fig:gpu_performance_lammps,
where rigid molecules have
a small performance increase using the GPU,
while the standard Lennard-Jones simulations
see a 20 times speed up.
The small increase in performance of the Molecular benchmark
is likely a result of the communication overhead
transferring data to and from the GPU.

While LAMMPS has GPU support added in an ad-hoc fashion,
HOOMD-blue [@Anderson2008;@Nguyen2011] is a more recent software package
designed for GPU computation.
It makes full use of the GPU by avoiding communication overheads
and using data structures and algorithms designed for this hardware,
an example being the SARU pseudo-random number generator (@sec:random_hoomd).
While HOOMD-blue is on the cutting edge of technology,
there is not the same diversity of literature to draw upon that LAMMPS has.
This also means that there are not the library of extensions,
like additional potentials which have been added.
In my case the lack of extensions is a benefit,
with the installation process of HOOMD-blue
being significantly simpler than for LAMMPS.
HOOMD-blue has a pre-built binary on the Glotzer anaconda cloud channel. [@glotzer_anaconda_cloud]
The optimisation of HOOMD-blue for the GPU
can be seen with the performance increase when using the GPU,
80 times the single core CPU performance
for a Lennard-Jones molecule (@fig:gpu_performance_hoomd)
much greater than the comparable speedup for LAMMPS.
Also of significant interest for this project,
is the speed up for the rigid molecular model,
which shows a 18 times speed up over the CPU implementation.

:::{class=subfigures id=fig:gpu_performance}

![Comparison of CPU and GPU implementations of
LAMMPS](../01_Methods/figures/lammps_relative_performance.pdf){#fig:gpu_performance_lammps width=49%}
![Comparison of CPU and GPU implementations of
HOOMD](../01_Methods/figures/hoomd_relative_performance.pdf){#fig:gpu_performance_hoomd width=49%}

Both LAMMPS and HOOMD-blue show significant performance improvements using GPUs.
However this is a little different when looking at rigid molecules,
where there is a minimal performance improvement with LAMMPS,
while there is a significant improvement with HOOMD-blue.

:::

### Issues

The availability of software for GPU computing
is only one part of running simulations.
The availability of the hardware on HPC systems
that is appropriately managed is critical for generating results.
While GPUs were available on the HPC systems I was working with,
they were a new computational resource
and so the management was still developing.
While I was using the HPC resources there were
issues with the loading of the GPU drivers,
which on some occasions didn't load at all.
Additionally the tools to specify GPUs as a computational resource
prevented their use in a way that made sense for this use case.
On top of all the usability issues with GPUs,
they were also a limited resource compared to CPUs.
When initially investigating GPUs
additional compute resources were intended to be made available,
however this didn't end up going ahead.
The result of all these issues using GPUs is that
it ended up being easier and faster to run the simulations using a CPU.
Using 12 cores with Hoomd-blue,
I was able to get the performance about half that of the GPU,
however I could run more than twice as many simulations
at the same time on the CPUs increasing the overall throughput
despite each simulation taking a longer time.

## Molecular Definition

The Trimer molecule is comprised of;
a central particle which has a defined radius of $1.0$, and
two identical radial particles.
The radius of the radial particles is defined by the variable $r$,
while the positions are defined by
the distance $d$ from the center of the central particle,
and the angle $\theta$ between the centers of the two radial particles.
The construction of the trimer is shown in @fig:trimer.
The variables $r$, $d$, and $\theta$ were chosen
for being the simplest basis set for defining this class of molecules,
allowing the study of a range of shapes.

![The construction of the trimer molecule showing each of the
variables.](../01_Methods/figures/trimer.pdf){#fig:trimer width=80%}

### Representation in HOOMD-blue

The integration of rigid bodies in HOOMD-blue is performed by
calculating the force on all the particles and then
using the calculated forces to integrate a central particle of a molecule
which undergoes both the translations and rotations.
For the rotations to take place properly
the central particle needs to be located at the center of mass of the molecule.
The positions of each particle in the Trimer molecule are given by;

$$ \mathbf{P}` = \left [
\begin{matrix}
    0 & 0 & 0 \\
    d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} & 0 \\
    -d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} & 0
\end{matrix}
\right ] $$

where the $r$, $d$, and $\theta$ are the variables of the molecule definition.
Since the center of mass is not at one of the existing particle positions,
within HOOMD-blue the trimer molecule is defined with
an additional non-interacting particle labelled 'R'
that sits at the center-of-mass.
This non-interacting particle has the combined mass of all particles being 3,
and a moment-of-inertia $I$ calculated by assuming point masses
at each molecular position.
The properties of the particle 'R',
represent the properties of the entire molecule.
With the addition of the center-of-mass particle,
the positions of the particles are adjusted,
with the adjusted position denoted $\mathbf{P}$.

\begin{align}
\mathbf{C} &= \left [ \sum_i \mathbf{P}`_{i0}, \sum_i \mathbf{P}`_{i1}, \sum_i \mathbf{P}`_{i2} \right ] \\
\mathbf{P} &= {[\mathbf{P}`_{ij} - \mathbf{C}_j]}_{ij}
\end{align}

Using the position $\mathbf{P}$ of molecules from the center of mass,
I am calculating the moment-of-inertia $I$.

$$ \mathbf{Q} = \left [
\begin{matrix}
    0 & 1 & 1 \\
    1 & 0 & 1 \\
    1 & 1 & 0
\end{matrix} \right ] \times \mathbf{P} $$

$$ I = \left [
\sum_i \mathbf{Q}_{i0}, \sum_i \mathbf{Q}_{i1}, \sum_i \mathbf{Q}_{i2}
\right ] $$

Since the trimer molecules are two dimensional,
the $x$ and $y$ components of the moment-of-inertia
$I_0$, and $I_1$ are set to $0$.
With the center-of-mass particle defined,
the interacting particles are defined with the positions $P$.
The central particles is labelled 'A',
with the interaction parameter $\sigma_{AA} = 2$.
The two radial particles are labelled 'B'
with interaction parameter $\sigma_{BB} = 2r$.
The mixed interaction potential $\sigma_{AB} = 1+r$.

### Reduced Units

The units used throughout this thesis are based on
the fundamental units of

- distance $\mathcal{D}$,
- energy $\mathcal{E}$, and
- mass $\mathcal{M}$

with all other units derived from these.
For the Lennard Jones system these values are all dimensionless.

The units of temperature are $kT$,
where $k$ is the Boltzmann constant,
having a value of 1 in LJ units.

From the fundamental units derived units can be calculated [@hoomd_units]

- time: $\tau = \sqrt{\frac{\mathcal{M}\mathcal{D}^2}{\mathcal{E}}}$
- volume: $\mathcal{D}^3$
- velocity: $\mathcal{D}/\tau$

## Distance in Molecular Dynamics

The periodic boundary conditions of molecular dynamics simulations
make the calculation of distances somewhat more challenging.
When given an initial position $\vect{r_0}$ and a final position $\vect{r_t}$
with the periodic boundary conditions there are two possible directions
the particle could have moved in each direction.
The same is also true for rotational motion.
The standard method of handling this is the minimum image convention,
where the distance is calculated for the shortest of the two paths.
The problem with the minimum image convention
is it breaks down for large motions,
especially for rotations.

### Integrated Distances

An alternate approach is to keep track of
the distance moved during a simulation.
This means that calculating the rotational motion $\Delta \varphi(t)$
is expressed as the integration of the angular velocity [@Kammerer1997;@Lombardo2006]

$$ \Delta \vect{\varphi}(t) = \vect{\varphi}(t) - \vect{\varphi}(0) =
\int_0^t \d t' \vect{\omega}(t') $$

In practice, this involves summing the rotation at every preceding configuration.

$$ \Delta \vect{\varphi}(t) = \sum_0^t \vect{\varphi}(t) - \vect{\varphi}(t-\Delta t) $$

This is allows for keeping track of rotational motions over large timescales
and allowing many rotations.
It should be noted that this approach still uses the minimum image convention,
however the timescales and distances of comparison are typically smaller
avoiding ambiguity.
The same approach can also be used to study translational motions.

### Periodic distances for Translations

The calculation periodic distances of a single dimension
can be performed using a comparison.
Given the length of a periodic box `len_x`,
and the translational motion `delta_x`
the periodic_distance can be calculated using conditionals

```python
if delta_x > len_x / 2:
    delta_x -= len_x
elif delta_x < -len_x / 2:
    delta_x += len_x
```

This approach only works for wrapping a coordinate in the next periodic cell,
that is, `3 * len_x` will only get wrapped to `2 * len_x`.
Additionally when using multiple dimensions
where the simulation cell is no longer orthogonal,
the checks required are complicated and error-prone.

The approach used by many molecular dynamics simulation tools
[@Giorgino2019;@Gowers2016;@Harper2016;@lumol-org/lumol;@Linke2019]
is to convert the distance to fractional coordinates,
calculate the periodicity in the fractional coordinates
followed by the conversion back to real coordinates.
Using a matrix representation for the cell $C$ and coordinates $\vect{x}$

$$ C(C^{-1} \vect{x} - \lfloor{C^{-1} \vect{x}}\rfloor) $$

### Nearest Neighbours {#sec:nearest_neighbours}

The calculation of the nearest neighbours
within a simulation is performed using the `freud` package
which uses the algorithm described in @lst:nn_algorithm.
For optimal performance freud divides the simulation
into cells, only searching neighbouring cells for
particles drastically reducing computational time.
The `neighbor_cells` function finds particles in the neighbouring cells.
The `freud.locality.NearestNeighbours` object defines defines
the parameters for finding neighbours

```{.python #lst:nn_algorithm caption="The algorithm for the calculation of the nearest neighbours. This explicitly sorts the distances of the particles before resuting the result."}
for each particle i:
    for each particle j in neighbor_cells(i):
        r_ij = position[j] - position[i]
        r = sqrt(dot(r_ij, r_ij))
        l_r_array.append(r)
        l_n_array.append(j)
        # sort by distance
        sort(n_array, r_array)
        neighbor_array[i] = n_array[:k]
```

### Rotational Distance using Quaternions {#sec:quaternion_rotations}

HOOMD-blue uses quaternions to represent the orientation of particles.
When using quaternions for representing rotations
there are a range of different methods for finding
the distance between them. [@Huynh2009]
Each of these methods can give a different value.
The two constraints for choosing an appropriate distance measure
is that it maps well to rotational distance calculated by other means
like using Euler angles,
and that the calculation is fast to compute.
The method chosen to calculate angular distance is $\phi_3$
computing the relationship

$$ \phi_3 = \arccos(|q_1 q_2|) $$

giving values on the range $[0, \pi/2)$.
Using the minimum image convention,
the maximum rotational distance is $\pi$,
when a quaternion is antiparallel to another.
This means finding the angle $\theta$
subtended by two quaternions is

$$ \theta = 2\arccos(|q_1 q_2|) $$

Quaternion operations are not a standard component
of either python or numpy. [@Walt2011]
There are some established python implementations of quaternion operations,
namely pyquaternion [@Wynn2019] and quaternion [@Boyle2019],
however these are not optimised for calculating rotations
on arrays of quaternions.
More recently the rowan [@Ramasubramani2018] software package was published,
designed for analysing molecular dynamics simulations
and the array type operations required.
The function `rowan.geometry.intrisic_distance` implements the calculation of $\phi_3$
with the angular rotation being calculated as twice this value.

## Random Numbers

Random numbers are used many places throughout this thesis.
However, for the purposes of reproducibility
and computational performance,
rather than generating truly random numbers[@Haahr1998;@Noll1998],
pseudo random number generators are used instead.
A Pseudo Random Number Generator (PRNG)
is an algorithm for generating statistically random values
that is, their distribution matches that of true randomness,
while being possible to exactly replicate a sequence.

### Random Numbers in HOOMD-blue {#sec:random_hoomd}

Random numbers are used in Hoomd
for the initialisation of translational and rotational velocities.
HOOMD-blue uses the Saru PRNG [@Afshar2013],
which was chosen for it's performance on GPUs,
in particular the algorithm for generating random values
takes a seed comprising three numbers,
one that is the identity of the body
for which the number is being generated.
This allows for the PRNG to generate
random numbers without communication
with every other thread.

The Saru PRNG generates numbers on
a uniform distribution with the range $[0, 1)$.
However, for a Maxwell-Boltzmann distribution
of total velocities,
each directional velocity requires values
which are normally distributed.
For transformation of random values from
a uniform distribution to a normal distribution
the polar coordinate version of the Box-Muller transformation is used.
The polar version avoids using trigonometric functions
that are slow to compute on the GPU.
This transformation takes two random values,
$u$ and $v$, with each value in the range $[-1, 1)$,
a rescaling of the values from the $[0, 1)$ distribution.
These two random values are combined
such that $s = u^2 + v^2$,
with values of $s >= 1$ being discarded,
redrawing values until this condition holds.
Once an appropriate value has been drawn,
this transformation provides two independent
values from a Gaussian distribution

\begin{align}
z_0 &=  x\, \sqrt{\frac{-2 \ln{s}}{s}a} \\
z_1 &=  y\, \sqrt{\frac{-2 \ln{s}}{s}a}
\end{align}

This algorithm as implemented in Hoomd,
only returns a single value and is reproduced in @lst:gaussian_rng.

The melting simulations (@sec:methods_melting) used a random seed
corresponding to their replication index,
taking values from 1 to 5.
Each of these simulations describe an independent trajectory
requiring different seeds.
HOOMD-blue performs a transformation on the given seed
to introduce more randomness,
which also removes issues from using consecutive numbers as seeds.
The remainder of the simulations in HOOMD-blue
use 42 as the random seed.

### Random Numbers in Packing

The packing codebase uses Pseudo random numbers extensively
since it is a Monte Carlo method.
In this case, the PCG family [@ONeill2014] of PRNG
has been chosen for a combination of performance
and statistical qualities.
In particular the PCG family passes all tests[@ONeill2014;@Cook2017;@Cook2017a]
from the TestU01[@LEcuyer2007;@LEcuyer] suite.
The random seed used for the packing analysis
is the index of the replication,
taking values from 0 to 2047.
Like in HOOMD-blue,
there is a transformation of the seed value
to the initial random state
distributing the numbers randomly throughout.
