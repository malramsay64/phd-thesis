---
top-level-division: chapter
title: Data Storage
---

- Typical analysis loads all data into RAM concurrently
    - need lots of RAM
    - simple and well established methods

- Using disk cache
    - Data is flushed to disk

- CSV Files
    - Advantages
        - Standard filetype
        - simple to read/write for both human and computer
        - Corruption of file can be easily dealt with
        - Appending is simple
    - Disadvantages
        - Data read in is not the same as written out, numbers are converted
          from base 2 to base 10, which loses data in the final decimal points
        - Reading and saving a CSV file in excel can change the file, a cell
          `1 + 1` will be evaluated and written back as `2`
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

# Out of Memory Processing

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

# Trajectory File Format

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

<!-- markdownlint-disable-file MD025 -->
