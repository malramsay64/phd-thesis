# Software Projects

As part of my PhD I have developed a range of software
which each solve specific problems I have run into.
This software is all open source and freely available on GitHub.

### Simulation Management

The management of simulations is highly complex,
particularly where multiple steps are involved.
For molecular dynamics simulations
there are four main steps
1. Initialisation of positions
2. Minimisation
3. Equilibration
4. Production
The Initialisation of positions only needs to occur once
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

![Drawing the dependencies of each simulation, starting at initialisation we get a tree
of nodes.](){#fig:simulation_dag}

There is a lot of research into decomposing computations
into directed acyclic graphs
and performing the resulting calculations [@apache/spark;@apache/airflow;@spotify/luigi;@DaskDevelopmentTeam2016]
however these are designed for a cloud type environment
rather than the scheduler based HPC cluster which I have access to.
There are many similar projects
for dealing with HPC Schedulers, [@Dakka2018;@Bosak2012;@Yon2019;@Lang2017;@Koster2012;@sumatra]
however they are either incompatible with software on the available systems,
or require unusual permissions prohibiting installation.

The PBS scripts which are the typically method of
interacting with the scheduler are highly verbose,
with limited ability to express complex tasks.
This resulted in the workflow of
defining the simulation in my notebook,
which I would then convert to a PBS script.
This conversion process was error prone and hard to test
with the additional problem of being difficult to
cross check between simulation definition and
what was actually run.
The largest issue though was changing the simulation,
by either adding more conditions
or modifying the existing ones,
which was more error prone than the initial writing.

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

- sdrun
    - qtools [@Purg2017]

- Biomedical Modelling [@Wright2018]
Organisation of project [@Wilson2014]

Part of the process of running many simulations on HPC resources,
- many simulations
- manage submission to a job script
- simulations are dynamic
    - find results
    - improve experiment based on results
        - more temperatures
        - longer simulations
        - issues with simulations / bugs
- Batch systems are difficult to deal with
    - minimal interface
    - lots of required parts
    - wait in a queue for a long period of time, want to be correct when it runs
    - test smaller simulations, run on HPC

- many variables in a MD simulation
    - need to specify all of them
    - typically no default values
    - set your own defaults for the range of simulations you are performing
    - Configure many different steps @Braun2018
        1. Initialisation of positions
            - Setup of configurations
            - plenty of software packages to do this for a variety of molecules and
              simulations
                - moltemplate
                - packmol
                - atomsk
            - important the created configuration is appropriate
        2. Minimization
            - state from which to compute numerical integration
            - easy to create exponential time divergence [@Allen1991]
        3. Equilibration
            - getting configurations to the appropriate simulation conditions
            - temperature and pressure correct
        4. Production
            - the measurement of the quantities we are interested in
            - data collection

This is my primarily my project experi
which interfaces with sdrun
for simplifying the variables in the experiment which change.

### Analysis of simulation trajectories

My projects sdanalysis and traj3dy

- vmd_diffusion_coefficient [@Giorgino2019]
- Overview of analysis tools [@Giorgino2019a]
- MDTraj [@McGibbon2015]
- MDAnalysis [@Gowers2016]
- freud [@Harper2016]
- rowan [@Ramasubramani2018]

## Data size

- Typical analysis loads all data into RAM concurrently
    - need lots of RAM
    - simple and well established methods

- Using disk cache
    - Data is flushed to disk

### Data Storage

- CSV Files
    - Advantages
        - Standard filetype
        - simple to read/write for both human and computer
        - Corruption of file can be easily dealt with
        - Appending is simple
    - Disadvantages
        - Data read in is not the same as written out, numbers are converted
          from base 2 to base 10, which loses data in the final decimal points
        - Reading and saving a CSV file in excel can change the file, a cell `1
          + 1` will be evaluated and written back as `2`
        - File size is increased over binary representation
        - Need to separately run compression
        - Slow to read/write

- HDF5
    - Used by NASA, CERN and other large research organisations [@DeCarlo2014]
    - Considered for Molecular Dynamics trajectories [@McGibbon2015]
    - Interoperable format for chemistry [@Angeli2007]
    - Solves many of the issues of text files
    - Advantages
        - Binary storage format
        - Compression is part of file specification
        - widely used in scientific computing
        - capability of appending files
        - Can store many datasets in a single file
        - datasets can have annotations
        - Specification supports parallel read/write
    - Disadvantages
        - Need to use the complex C++ library to read/write, there are bindings
          for many/most programming languages
        - Hard to debug errors/issues with the file
        - Features are implementation specific
        - Implementations can be buggy. Pandas 0.24 was leaving a file handle
          open when the read didn't go properly

### Out of Memory Processing

- Where the size of the data is too large to fit in RAM
- Approaches
    - Chunk the data
        - Each frame in a trajectory
        - 1000 rows at a time
        - can add complexity
        - Also have to consider output
    - Use a Database for aggregation
        - Let another computer handle the chunking for you
        - Requires a database and SQL queries
        - More infrastructure to maintain
    - Distributed Processing
        - Spark/Hadoop/Dask
        - Huge area of growth
        - Lots of change in this space
        - Completely different idea to what HPC is built on
        - Interactive processing
        - Libraries which handle the chunking for you, while you write the same
          code
        - Doesn't support all functionality
    - More RAM
        - Simplest solution for some cases
        - This is expensive, and can get really expensive
        - Only gets you so far

### Data Storage

- mdtraj [@McGibbon2015]
- Trajectories
    - gsd -> Glotzer group binary
    - pdb -> text
    - xtc
    - trr
    - dcd -> Binary
    - binpos
    - netcdf
    - mdcrd
    - prmtop
    - mdtraj hdf5
-
