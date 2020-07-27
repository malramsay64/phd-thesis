---
top-level-division: chapter
title: Software Projects
---

As part of my PhD I have developed a range of software
which each solve specific problems I have run into.
This software is all open source and freely available on GitHub.

# Simulation Management {#sec:simulation_management}

The management of simulations is highly complex,
particularly where multiple steps are involved.
Molecular dynamics simulations typically require four main steps; [@Braun2018]
the initialisation of positions,
the minimisation,
the equilibration,
and the production simulation which collects data.
The initialisation of positions only needs to occur once
regardless of the additional simulation parameters,
the minimisation needs to occur for every pressure,
while the equilibration and production
need to occur for every simulation condition.
This gives the relationships between simulations
shown in @fig:simulation_dag.
This is known as a directed acyclic graph (DAG),
directed for the ordering required from top to bottom,
while acyclic indicates that all paths through the graph are finite,
put another way, everything can be calculated.
There is a lot of research into decomposing computations
into directed acyclic graphs
and performing the resulting calculations [@apache/spark;@apache/airflow;@spotify/luigi;@DaskDevelopmentTeam2016]
however these are designed for a cloud type environment
rather than the scheduler based HPC cluster which I have access to.
There are many similar projects
for dealing with HPC Schedulers, [@Dakka2018;@Bosak2012;@Yon2019;@Lang2017;@Koster2012;@sumatra]
however they are either incompatible with software on the available systems,
or require unusual permissions prohibiting installation.

![Drawing the dependencies of each simulation, starting at initialisation we get a tree
of nodes.](08_Appendix/figures/simulation.pdf){#fig:simulation_dag}

The PBS scripts which are the typically method of
interacting with the scheduler are highly verbose,
with limited ability to express complex tasks.
This resulted in the workflow of
defining the simulation in my notebook,
which I would then convert to a PBS script.
This conversion process was error-prone and hard to test
with the additional problem of being difficult to
cross check between simulation definition and
what was actually run.
The largest issue though was changing the simulation,
by either adding more conditions
or modifying the existing ones,
which was more error-prone than the initial writing.

Solving this problem is my project `experi`,
which breaks the problem into two separate parts,
the simulation steps which are to be run,
and the variables used in those steps.
The simulation steps are specified as they are on the command line,
however the variables are listed in a more human readable format.
The `experi` software combines these two parts into a PBS script,
utilising the power of the scheduler for the evaluation of the DAG.
The idea here is that a single file is
both the machine and human readable specification of an experiment.
The storage of this format within the repository provides
an additional level of reproducibility (@sec:reproducibility),
storing the exact set of commands used.
Using `experi` has a further advantage,
since it is a program to generate files for a scheduler
different schedulers can be added with minimal changes.
So there is support for generating files for the SLURM scheduler.
Additionally testing that the simulations work as intended
can be a complex task,
so to make this easier experi also supports running the commands
on a local computer without any scheduler,
providing a method of testing simulations while only making minimal changes.

The source code for experi is available at [github.com/malramsay64/experi](https://github.com/malramsay64/experi)
and available for installation on both the python package index
([`pypi.org`](https://pypi.org/project/experi)) and [anaconda cloud](https://anaconda.org/malramsay/experi)
with the documentation available on [read the docs](https://experi.readthedocs.io/en/latest/).

# Running Simulations {#sec:running_simulations}

There are many parameters which need to be specified
in a molecular dynamics simulation,
many of which are going to be constant for all simulations within an experiment.
One of these parameters is the imaginary mass of the thermostat and barostat,
which is a measure of how quickly these algorithms
modify the measured values to push them towards the desired values.
There closet I have seen this value specified in a paper
was a reference to a theoretical paper describing how to find the best value.
While the literature mostly ignores this parameter,
when this is set incorrectly it can quickly lead to
exponential time divergence [@Allen1991],
that is the discreet nature of the simulations becomes a problem
causing highly unphysical behaviour.
To simplify the process
of running the types of simulations within this project
I have developed the `sdrun` software.
Since the `packing` code handles the four steps
in a molecular dynamics project,
this handles the other three.
It breaks the simulation into the creation step,
which is taking the crystal parameters output from `packing`
and using it to create configurations and minimising them.
The next step is handling the equilibration,
slowly ramping the temperature from that of the initialisation
to the desired values.
Finally there is the production,
which handles the output.
The structure is very similar to the qtools software [@Purg2017]
which provides a similar capability for the Q molecular dynamics package,
while `sdrun` provides the capability for HOOMD-blue.

The `sdrun` software package is available at
[github.com/malramsay64/statdyn-simulation](https://github.com/malramsay64/statdyn-simulation)
with a battery of tests running every time the code changes
on [travis-ci](https://travis-ci.org/malramsay64/statdyn-simulation)
while the documentation is available on
[read-the-docs](https://statdyn-simulation.readthedocs.io/en/latest/?badge=latest).

# Analysis of simulation trajectories {#sec:simulation_analysis}

The analysis of molecular dynamics simulation trajectories
is an area containing many different software packages, [@Giorgino2019a]
each having their own benefits.
The main tools available for the analysis simulation trajectories are;
MDTraj, [@McGibbon2015]
MDAnalysis, [@Gowers2016] and
freud. [@Harper2016]
Each of these tools provides a python interface
to a collection of common analyses.
While these collectively provides tools
for some analyses which I am conducting,
they don't provide the breadth of analyses I required,
notably lacking in understanding rotational motion.

I needed to develop my own analyses for this project,
which I have done with the sdanalysis and `traj3dy` projects.
The sdanalysis project calculates quantities
and builds upon two projects from the Glotzer group,
freud [@Harper2016] which provides the calculations of periodic distances,
  the efficient calculation of the nearest neighbours, and
  voronoi diagrams, and
Rowan [@Ramasubramani2018] which provides utilities for working with Quaternions.
These projects were both developing throughout the course of my PhD
and at various points I was implementing components of these tools,
however ensuring my code was correct, fast and installable
was too much of an effort to justify its continued development
when there were these high quality alternatives.

While these projects provided fast implementations of various calculations,
with the overhead of Python managing the range of tasks
the calculation of quantities required waiting
longer than the patience of my supervisor.
So the `traj3dy` project was developed in the waiting time
which is a high performance implementation
of a small set of analyses in the Rust programming language.
In the calculation of fluctuations
it is over 100x faster than the `sdanalysis` implementation
which takes the analysis from hours to minutes.

The `sdanalysis` software package is available at
[github.com/malramsay64/statdyn-analysis](https://github.com/malramsay64/statdyn-analysis)
with a battery of tests running every time the code changes
on [travis-ci](https://travis-ci.org/malramsay64/statdyn-analysis)
while the documentation is available on
[read-the-docs](https://statdyn-analysis.readthedocs.io/en/latest/?badge=latest).

<!-- markdownlint-disable-file MD025 -->
