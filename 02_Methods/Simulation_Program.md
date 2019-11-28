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
like the SARU pseudo-random number generator (see @sec:??).
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

## Issues

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
