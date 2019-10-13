# Computational Methods

## Introduction

The nature of using simulations to model particular behaviour,
is using computers for both running the analysis,
and the follow-up analysis of large volumes of data.
There are a range of problems which

Interactive Computing (Literate programming)
    - Working with the computer to formulate the answer
    - Asking lots of questions quickly
    - Try something out, modify to suit the use case
    - Generating a figure is an excellent example, read in the dataset, plot, change
      colours, change size of labels, add axis labels. At each point modifying the
      underlying code to modify behaviour.
    - Jupyter notebooks are driving this
    - Very different to HPC where getting results requires waiting in queues for hours,
      copying files then being able to look at results, often with an additional
      processing step for generating the figures.

Jupyter Notebooks
    - Provide a mechanism for a computational narrative, which combines the description
      of the problem being solved, including equations and working along with the code
      to solve the problem and any visualisations.
    - Provide a method of interacting with code and data
    - They are being used to teach complex topics in Chemistry, aiding understanding
      [@Weiss2017;@Smec2016;@Golman2019;@Smec2017a;@Weiss2017a]
    - There is a lot of interest from researchers, with the notebooks providing an
      interactive method of understanding data [@Mascarelli2014].
    - Mainstream media attention as a replacement for scientific communication as awe
      know it. [@Somers2018]
    - There aren't issues with the approach in practice. There are lots of promises, but
      that doesn't mean they are being delivered on. [@Rule2018]

Data size
    - Typical analysis loads all data into RAM concurrently
        - need lots of RAM
        - simple and well established methods

    - Using disk cache
        - Data is flushed to disk

    - Data Storage
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

    - Out of Memory Processing
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

Data Storage
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
    - Binary file formats are much preferred for data storage

## Project Management
    - Organisation of project [@Wilson2014]

    Workflow
        - Gromacs [@Pall2015]
            - Gerrit code review
            - Multiple authors have to approve the changes
            - User and developer level documentation has to be part of the change
            - Built across a range of systems using CI
            - large test suite
            - tests of new behaviour along with the introduction of it

        - Biomedical Modelling [@Wright2018]
            - "bad" data, what to do
            - complex workflows -> directed acylic workflow
            - robustness to errors
            - HTBAC to manage simulation replicants
            - software carpentry
            - Managing change
                - What has changed and when

## Projects

- experi
    - HTBAC [@Dakka2018]
    - DRMAA
    - QGCBroker [@Bosak2012]
    - SlurmR [@Yon2019]
    - batchtools [@Lang2017]


- sdanalysis / traj3dy
    - vmd_diffusion_coefficient [@Giorgino2019]
    - Overview of analysis tools [@Giorgino2019a]
    - MDTraj [@McGibbon2015]
    - MDAnalysis [@Gowers2016]
    - freud [@Harper2016]
    - rowan [@Ramasubramani2018]
