# Choice of Simulation Program

For the simulations throughout this thesis
I use the simulation program Hoomd-blue [@Nguyen2011;@Anderson2008;@Glaser2015]
which is actively developed by the Glotzer group
led by Joshua Anderson at the University of Michigan.
The reason for this choice is documented below.

## Requirements

The simulations which I am performing as part of this thesis
are about investigating the behaviour of materials
which are resistant to crystallisation.
To observe their crystallisation requires simulations
over long time periods,
something which was initially investigated
as part of my Honours thesis. [@Ramsay2015a]
The simulations also need to be of a reasonable size
to avoid issues with periodic boundary conditions,
known as finite size effects.
There is a general consensus that about 1000 particles
is suitable for a 2D simulation to avoid the
finite size effects. [@cite]
Along with handling long timescale simulations of reasonable size
any simulation program is going to need
support for rigid bodies.

## Speeding up a simulation

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
now comprising more than 20% of the Top 500 Supercomputers. @cite
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

## Implementations

There are many different implementations of Molecular Dynamics on GPUs

- LAMMPS
- GROMACS
- AMBER
- HOOMD
- NAMD
- Q
- OpenMM

and evaluating each different software package's approach
to simulating the same system can be difficult for a team of experts. [@Rizzi2019]
I looked at LAMMPS which I used during my Honours project and HOOMD-blue.

- lots of papers using it
    - doesn't make too much of a difference since they don't share data or scripts
      anyway
- limitations of rigid body tool
- doesn't support minimisation

GPU Implementations

:::{class=subfigures id=gpu_performance}

![Comparison of CPU and GPU implementations of HOOMD](../02_Methods/figures/hoomd_relative_performance.pdf)
![Comparison of CPU and GPU implementations of LAMMPS](../02_Methods/figures/lammps_relative_performance.pdf)

Both LAMMPS and HOOMD show significant performance improvements using GPUs.
However this is a little different when looking at rigid molecules,
where there is a minimal performance improvement with LAMMPS,
while there is a significant improvement with HOOMD.

:::

- Lammps has a GPU implementation
    - Limited -> restrictions on what could be run
    - Some calculations on CPU others on GPU
    - large bandwidth costs moving between the two
- Hoomd built from the ground up to use GPUs
    - localisation of data
    - highly optimised

## Reproducibility

Versioning

- highly important for reproducibility
- Also what was actually installed

LAMMPS

- No standard method of specifying the version used in the literature
- Doesn't use a versioning standard
- Contains many optionally installable sub-packages
    - have not seen any instance of these being specified
- Compilation and installation are fiendishly difficult

Hoomd

- Uses a Semantic Versioning standard
- Installable using Conda
    - distributable binary format
    - pre-compiled

## Issues

- GPUs are relatively new to HPC
    - really new to the systems I was working with
    - Issues with drivers
    - Specification of resources
        - Couldn't specify GPUs
        - Have to use all GPUs in node at once
    - limited resources
        - 5 GPU nodes vs hundreds of CPU nodes
        - Run 20 vs 5 jobs, can take 4x as long same throughput

- Promise of more resources
    - developing a workflow for resources which didn't work out
    - GPUs in a cluster were promised and never delivered
