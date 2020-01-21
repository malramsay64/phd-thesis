# Molecular Dynamics Methods

## Choice of Simulation Program

For the simulations throughout this thesis
I use the simulation program Hoomd-blue [@Nguyen2011;@Anderson2008;@Glaser2015]
which is actively developed by the Glotzer group
led by Joshua Anderson at the University of Michigan.
The reason for this choice is documented below.

### Requirements

The simulations which I am performing as part of this thesis
are about investigating the behaviour of materials
which are resistant to crystallisation.
To observe their crystallisation requires simulations
over long time periods,
something which was initially investigated
as part of my Honours thesis. [@Ramsay2015]
The simulations also need to be of a reasonable size
to avoid issues with periodic boundary conditions,
known as finite size effects.
There is a general consensus that about 1000 particles
is suitable for a 2D simulation to avoid the
finite size effects. [@cite]
Along with handling long timescale simulations of reasonable size
any simulation program is going to need
support for rigid bodies.

### Speeding up a simulation

With a lower bound on the size of a simulation,
to support a longer simulation
the emphasis is on reducing the time required
to calculate each timestep.

The most well known method of speeding up
a molecular dynamics simulation
is to spread the work across multiple CPU cores,
with each core working on a subset of the simulation.
This division of work is known as parallelisation.
This has the effect of reducing the size of the problem
which each individual CPU has to calculate.
However, this doesn't come free,
because each smaller simulation is part of the large whole
there is information which needs to be communicated between each CPU
updating the information about the neighbouring subgroups.
The communication is a slow process compared to any individual computation.
For parallelisation to be beneficial,
the communication overhead needs to be amortized over many calculations,
meaning there is a maximum division of the problem.

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
to many pieces of data simultaneously.
The calculation of pairwise forces is one of these calculations
which needs to be performed many times.
This has seen many Molecular Dynamics libraries
use GPUs to speed up certain parts of the calculation pipeline.

Taking the optimisation of the compute device a step further
is using a chip designed for performing molecular dynamics simulations.
While this is not quite a reality
due to the diverse nature of molecular dynamics simulations,
it is possible to get most of the way there with a
Floating Point Gate Array (or FPGA).
This is a programmable piece of hardware
which is amazingly efficient at the task
it is programmed to perform.
These are typically have applications in
real time signal processing
and other performance critical domains.
FPGAs have also been used for Molecular dynamics simulations [@Khan2013;@Yang2019]
with performance greater than with a GPU.
While there are definitely performance benefits,
the complexity of programming the FPGA,
and the scarcity of having somewhere to run the code
means these are reserved for the most specialised applications.

### Implementations

There are many different implementations of Molecular Dynamics on GPUs

- LAMMPS [@Plimpton1995]
- GROMACS [@Lindahl2001;@Hess2008;@Pronk2013;@Berendsen1995;@Abraham2015]
- AMBER [@Case2006;@Case2008]
- HOOMD-blue [@Anderson2008;@Nguyen2011]
- NAMD [@Phillips2005]
- OpenMM [@Eastman2010]

and evaluating each different software package's approach
to simulating the same system can be difficult for a team of experts. [@Rizzi2019]
I looked at LAMMPS which I used during my Honours project and HOOMD-blue.

The software package LAMMPS [@Plimpton1995]
is a standard tool in the field of Molecular Dynamics
with over \num{23,000} citations.
It forms the foundation of many computational analyses,
however while there are many papers using LAMMPS,
there are very few that make note of
the version number @Li2016
or provide data and scripts for using it.
This makes it really difficult to replicate work,
particularly when there are many
optional parts of LAMMPS to install.

Two of these optionally installed components are

- the GPU module, for using the GPU for accelerating some calculations, and
- the Rigid module, providing the ability to simulate rigid molecules.
While the modularity of LAMMMPS allows for
the inclusion of these additional modules,
they are not part of the core functionality.
This means that there are compromises
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
HOOMD-blue [@Anderson2008;@Nguyen2011] is a much more recent software package
which has been designed from the ground up for GPU computation.
This means it makes full use of the GPU
avoiding communication overheads
and using the best data structures and algorithms,
like the SARU pseudo-random number generator. [@sec:random-numbers-in-hoomd]
While HOOMD-blue is on the cutting edge of technology,
there is not the same source of literature to draw upon that LAMMPS has.
This also means that there are not the library of extensions,
like additional potentials which have been added.
Although in my case this is a benefit,
the installation process of HOOMD-blue
is significantly simpler than for LAMMPS,
allowing for the installation of a pre-built binary
from the Glotzer anaconda cloud channel. [@glotzer_anaconda_cloud]
The optimisation of HOOMD-blue for the GPU
can be seen with the performance increase on the GPU
which is 80 times the single core CPU performance
for a Lennard-Jones molecule (@fig:gpu_performance_hoomd)
which is much greater than for LAMMPS.
Also of significant interest for this project,
is the speed up for the rigid molecular model,
which shows a 18 times speed up over the CPU implementation.

:::{class=subfigures id=fig:gpu_performance}

![Comparison of CPU and GPU implementations of
LAMMPS](../02_Methods/figures/lammps_relative_performance.pdf){#fig:gpu_performance_lammps width=49%}
![Comparison of CPU and GPU implementations of
HOOMD](../02_Methods/figures/hoomd_relative_performance.pdf){#fig:gpu_performance_hoomd width=49%}

Both LAMMPS and HOOMD-blue show significant performance improvements using GPUs.
However this is a little different when looking at rigid molecules,
where there is a minimal performance improvement with LAMMPS,
while there is a significant improvement with HOOMD-blue.

:::

### Issues

While the software is available supporting computation using GPUs,
that doesn't mean the availability and management
of the hardware is available within an HPC context.
While GPUs were available on the HPC systems I was working with,
they were a new computational resource
and so the management was still developing.
While I was using the HPC resources there were
issues with the loading of the GPU drivers,
which on some occasions didn't load at all.
Additionally the tools to specify
the use of GPUs as a computational resource
like memory, number of CPUs and walltime
within a PBS script took a long time to be useful
requiring the specification of an entire node
to use a single GPU.
On top of all the usability issues with GPUs,
they were also a limited resource,
with initially only 5 GPU nodes
for the 100 or so CPU nodes.
When initially investigating GPUs
additional compute resources were intended to be made available,
however this didn't end up going ahead.

The result of all these issues using GPUs is that
it ended up being easier and faster to run the simulations using a CPU.
Using 12 cores with Hoomd-blue,
I was able to get the performance about half that of the GPU,
and with the overall abundance of CPU cores,
this approach turned out to be more efficient overall,
despite individual simulations taking longer.

## Molecular Definition

The Trimer molecule is comprised of;
a central particle which has a defined radius of $1.0$, and
two identical radial particles.
The radius of the radial particles is defined by the variable $r$,
while the positions are defined by
the distance $d$ from the center of the central particle,
and the angle $\theta$ between the centers of the two radial particles.

![This shows the construction of the trimer molecule.](02_Methods/figures/trimer.pdf)

This gives the positions of the particles $\mathbf{P}`$ as;

$$
\mathbf{P}` = \left [
\begin{matrix}
    0 & 0 & 0 \\
    d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} & 0 \\
    -d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} & 0
\end{matrix}
\right ]
$$

The variables $r$, $d$, and $\theta$ were chosen
for being the simplest basis set for defining these types of molecules.
The algebraic definition of the molecule allows for
modelling a range of shapes.

### Representation in Hoomd

The integration of rigid bodies in Hoomd is performed by
calculating the force on all the particles and then
using the calculated forces to integrate a central particle of a molecule
which undergoes both the translations and rotations.

Since the center of mass is not at one of the existing particle positions
I have added an additional non-interacting particle labelled 'R'.
This 'R' particle is at the center-of-mass,
with a mass of 3 and a moment-of-inertia $I$,
which are the properties of the entire molecule.

With the addition of the center-of-mass particle,
the positions of the particles have to be adjusted,
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

By setting values for the fundamental units,
appropriate for a molecular system,
the derived units can also be calculated.
For simulating *ortho*-terphenyl, [@Pedersen2011]

- $\mathcal{D} = \SI{0.242}{\nano\metre}$
- $\mathcal{E} = k_B\times\SI{600}{\kelvin} \approx \SI{4.988}{\kilo\joule\per\mole}$
- $\mathcal{M} = \SI{76.760}{\atomicmassunit}$

which derives a time $\tau = \SI{0.95}{\nano\second}$

## Distance in Molecular Dynamics

The periodic boundary conditions of molecular dynamics simulations
make the calculation of distances somewhat more challenging.
When given an initial position $\vect{r_0}$ and a final position $\vect{r_t}$
with the periodic boundary conditions there are two possible directions
the particle could have moved in each direction. [@fig:periodic_distance]
The same is also true for rotational motion.
The standard method of handling this is the minimum image convention,
where the distance is calculated for the shortest of the two paths.

![Demonstrating periodic boundary conditions
](../placeholder_figure.png){width=80% #fig:periodic_distance}

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

This approach only works for wrapping a coordinate
which is in the next periodic cell,
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

### Rotational Distance using Quaternions {#sec:quaternion_rotations}

Measuring rotational motion in three dimensional space
is something performed in many applications including

- robotics,
- computer graphics,
- aviation, and
- molecular dynamics.
However in all cases,
there is a need to represent an orientation in 3D space.
There are many different methods which achieve this,
each with different strengths and weaknesses.

#### Rotational Representations

Mathematically, rotations in 3D belong to the special orthogonal group
A rotation is a mapping from a position in real space $\mathbf{R}^n$
to another position in real space,
presenting the angles between and distances of transformed vectors.
This space of transformations is known as the Special Orthogonal group $SO(3)$.

##### Euler Angles

Euler Angles use three different rotations
to describe the orientation of a body in 3D space,
relative to a fixed coordinate system.
A common terminology for these angles is roll, pitch, and yaw,
however, there are twelve different sequences
in which the Euler Angles can be defined,
so their use requires clarification
of the ordering.

While Euler Angles are the simplest rotational coordinate system,
they also suffer from a significant issue in Gimbal Lock,
where two of the rotational axes align,
restricting motion of the gimbal to two dimensions;
the angles are no longer independent degrees of freedom. [@Evans1977]
While this restriction is only present for a single value,
it presents problems with precision close to the gimbal lock,
where large changes in the Euler Angle are required
to describe small absolute changes.

In certain applications,
the "problem" of gimbal lock
turns out to be a benefit.
In robotics applications,
where the movement of a robotic joint is restricted,
the Gimbal lock can be avoided by
aligning the reference frame appropriately.
For most other fields however,
the Euler Angles are not an appropriate
representation of orientation.

##### Rotation Matrix

This is an alternative to Euler Angles,
which uses a $3 \times 3$ matrix $R$ to represent rotation.
For a matrix to properly represent a rotation
it has to preserve both
the length
and the orientation of a transformed vector.
For a matrix to preserve length,
the columns of the matrix have to form an orthonormal basis,
which can be expressed as satisfying the condition

$$ R\,R^T = R^TR = I $$

where $R^T$ is the transpose of $R$ and $I$ is the identity matrix.
For an orthonormal matrix to preserver orientation
it is required to have a determinant $\text{det}\,R = 1$.

While the rotation matrix doesn't suffer
the Gimbal Lock issue of the Euler Angles,
it has complications of it's own in practical applications.
Euler angles require 3 floating point numbers,
while a rotation matrix requires 9,
which can become an issue in storage
capacity and bandwidth when using many values.
Another problem is that errors with the finite precision
of floating point values can add up,
moving the rotation matrix away from orthonormal,
which requires a computationally costly
re-orthonormalisation step to correct.

##### Quaternions

In the same way rotations in 2D can be represented
using complex numbers,
rotations in 3D can be represented using quaternions $q$,
which have the representation

$$ q = a + bi + cj + dk $$

where $i$, $j$, and $k$ are complex numbers about
the $x$, $y$, and $z$ axes respectively.
The dimensionality of quaternions is
larger than the space of rotations,
however like with complex numbers,
by restricting rotations to the unit circle,
in this case the unit sphere,
a normalised quaternion can represent all rotations.

Because quaternions have no issues with gimbal lock,
and there are no issues with matrix normalisation,
they are a natural choice for describing orientations
in molecular dynamics simulations. [@Evans1977;@Evans1977a]

#### Mathematical Operations of Quaternions

As part of dealing with quaternions
understanding their mathematical operations is important.
Firstly the multiplication of the quaternions has the following rule

$$ i^2 = j^2 = k^2 = ijk = -1 $$

Which corresponds to the following table of multiplications

$\times$ | **$i$** | **$j$** | **$k$**
:-------:|:-------:|:-------:|:--:
 **$i$** | $-1$    | $k$     | $j$
 **$j$** | $-k$    | $-1$    | $i$
 **$k$** |$j$      |$-i$     | $-1$

Table: The results of multiplying the value in the left hand column,
with the label at the top of each row.

When working with quaternions,
the imaginary components are often referenced by a vector $\vect{v}$
such that

\begin{align}
q &= r + bi + cj + dk \\
  &= r + \vect{v}
\end{align}

With this representation,
the addition of quaternions
$q_1 = (r_1, \vect{v_1})$ and
$q_2 = (r_2, \vect{v_2})$
is expressed as

$$ (r_1, \vect{v_1}) + (r_2, \vect{v_2})  = (r_1 + r_2, \vect{v_1} + \vect{v_2}) $$

while the multiplication can be expressed as

$$ (r_1, \vect{v_1})(r_2, \vect{v_2}) =
(r_1r_2 - \vect{v_1}\cdot\vect{v_2}, r_1\vect{v_2}+r_2\vect{v_1} + \vect{v_1} \times \vect{v_2}) $$

where $\cdot$ is the dot product and the $\times$ is the cross product.
Quaternion multiplication is non-commutative,
which comes from the non-commutativity of the cross product.

The multiplication of one quaternion by another $q_1 \times q_2$
gives a resulting quaternion equivalent to
the rotation $q_2$ followed by $q_1$.

Like complex numbers,
quaternions also have a complex conjugate $q^*$
which can be expressed as

$$q^* = (r - \vect{v}) $$

The conjugate allows us to define the norm of a quaternion

$$ ||q|| = \sqrt{qq^*} $$

which is $1$ for quaternions used to define rotations.

The quaternion logarithm is defined as

$$ \ln(q) = \ln \|q\| + \frac{\mathbf{v}}{\|\mathbf{v}\|} \arccos \frac{a}{\|q\|} $$

while the exponent is defined as

$$ \exp(q) = \sum_{n=0}^\infty \frac{q^n}{n!}=e^{a}
    \left(\cos \|\mathbf{v}\| + \frac{\mathbf{v}}{\|\mathbf{v}\|} \sin \|\mathbf{v}\|\right) $$

#### Angular Distance From Quaternions

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
which is designed for analysing molecular dynamics simulations
and the array type operations required.
The function `rowan.geometry.intrisic_distance` implements the calculation of $\phi_3$
with the angular rotation being calculated as twice this value.

## Random Numbers

Random numbers are used in a number of places in this thesis.
However, for the purposes of reproducibility
and computational performance,
rather than generating truly random numbers[@Haahr1998;@Noll1998],
pseudo random number generators are used instead.
A Pseudo Random Number Generator (PRNG)
is an algorithm for generating statistically random values
that is, their distribution matches that of true randomness,
while being possible to exactly replicate a sequence.

### Random Numbers in Hoomd

Random numbers are used in Hoomd
for the initialisation of translational and rotational velocities.
Hoomd uses the Saru PRNG [@Afshar2013],
which was chosen for it's performance on GPUs,
in particular the algorithm for generating random values
takes a seed comprising three numbers,
one of which is the identity of the body
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
the Box-Muller transformation is used,
specifically the polar coordinates version.
The polar version is used to
avoid trigonometric functions
which are particularly slow on a GPU.
This transformation takes two random values,
$u$ and $v$, with each value in the range $[-1, 1)$,
which is simply a rescaling of the values from
the $[0, 1)$ distribution.
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
only returns a single value
as displayed below.

```c++
inline float gaussian_rng(RNG &rng, const float sigma) {
    // use Box-Muller transformation to get a gaussian random number
    float u, v, s, z0;

    do  {
        u = rng.s(-1.0, 1.0);
        v = rng.s(-1.0, 1.0);
        s = u * u + v * v;
    } while ( s >= 1.0 );

    w = fast::sqrt((-2.0 * log(w)) / w);
    z0 = u * w;

    return z0 * sigma;
}
```

### Random Numbers in Packing

The packing codebase uses Pseudo random numbers extensively
since it is a Monte Carlo method.
In this case, the PCG family [@ONeill2014] of PRNG
has been chosen for a combination of performance
and statistical qualities.
In particular the PCG family passes all tests[@ONeill2014;@Cook2017;@Cook2017a]
from the TestU01[@LEcuyer2007;@LEcuyer] suite.

### Reproducibility

While there are typically no guarantees
that a random number generator will be the same
across platforms and versions,
or for that matter a numerical seed
giving the same initial state.
The seeds for random number generation are listed below.

Note that for the PCG random number generators,
there is a transformation from the seed
to the initial state of the PRNG.

The initial seed for random numbers in Hoomd is
42 for most simulations.
Where there are multiple replications of a simulation,
with each having it's own simulations id
as specified in the filename,
the initial seed is the value of the simulation id.

For the packing analysis,
there are many replications run,
(with the default being 32)
with each replication having a seed
which is the index of the replication.