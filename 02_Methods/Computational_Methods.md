# Computational Methods

## Introduction

The nature of using simulations to model a chemical system,
requires using computers for both running the simulations,
and for the follow-up analysis of large volumes of data.
This requires the development of software to perform
the custom simulation and analysis
required for new research.
The use of computing for research has existed for as long as the computer itself.
The development of Monte Carlo methods in 1946,
attributed to Stanislaw Ulam, [@Mazhdrakov2018]
from a neat idea into something useful
was a conversations with Jon Von Neumann
who realised the usefulness of the newly constructed ENIAC computer
for solving these problems.
This research was made possible by the programming efforts of
Kay McNulty, Betty Jennings, Betty Snyder, Fran Bilas, and Ruth Licherman, [@Light1999]
although their contribution to the field is still being fully recognised.
It is important to recognise the contribution of these women
to to fields of Physics and Chemistry
because writing software is hard.

## Correctness

The rate of programming errors within the software industry
is estimated to be between 15 and 50 errors
per 1000 lines of delivered code,[@McConnell2004]
that is code which the original author deemed correct.
Note that this is studying people employed specifically to write code,
typically with formal training in computer science.
If this is the rate among professionals,
how do scientists fare?
@Soergel2015 posits that anywhere from 5-100% of software used in research
has a bug altering the results obtained from it.
This is not just a theoretical problem,
there are many results which are now questionable
as a result of software errors.

Recently @Neupand2019 found a bug in the popular Willoughby-Hoye Scripts
for calculating NMR Chemical shifts from the output of
Quantum Chemical simulations using GAUSSIAN.
The Willoughby-Hoye scripts published in *Nature Protocols* [@Willoughby2014]
use a function `glob.glob` from the Python standard library
to list files in a particular directory on the computer.
The output of this function is non-deterministic,
with different ordering depending on
the underlying operating system it is running on.
The issue is that the scripts assumed the output of `glob.glob` was ordered,
so some of the 130 papers citing these scripts
have results which are potentially incorrect.
This function, `glob.glob`,
is a well known feature of the Python programming language,
appearing in Software Carpentry's [@Wilson2016a] "Programming with Python" lesson, [@zotero-1355]
a one day course for introducing researchers to Python.
Despite the ubiquity of this function and it's behaviour,
it took 5 years and hundreds of people
to notice that the behaviour of the script was incorrect.

Another instance where software has hung a cloud of uncertainty over results,
is the RANDU pseudo-random number generator,
which was used within FORTRAN compilers in the 1970s,
which was the primary programming language used in science at the time.
The problem with this pseudo-random number generator
is that that it doesn't actually produce random numbers,
instead generating numbers having strong ordering,
noticeable when plotting values in 3D (@fig:randu).
Now results which from this period which used random numbers,
like Monte Carlo simulations,
should be treated with caution. [@Press1988]

![When RANDU generates 'pseudo-random' the coordinates of points in 3D, all the points
lie on one of 15 planes shown.
](../Projects/random_number_generators/presentation/figures/randu.png)

There are also classes of bugs which are more subtle,
results which are different yet neither is definitively right.
@Mesnard2017 attempted the replication of Computational Fluid Dynamics
obtained within the group only three years prior,
which involved rewriting the code using different linear algebra libraries.
They found different results depending on
the linear algebra library being used,
and even between versions of the same library.
There was general agreement in the averaged quantity being measured,
in this case the lift of a snake's body,
however the individual states were significantly different.
While this highlights a reproducibility issue,
for chaotic phenomena,
small differences in the floating point arithmetic
can propagate to much larger errors.
This also applied to calculations of small molecule binding energies.
@Rizzi2019 use a range of commonly used software packages
for modelling the binding of small drug like molecules to a larger host molecule.
Even when using identical parameters for all software packages,
they still yielded statistically distinguishable results.
It is likely that none of the software packages is overtly wrong,
they are each making different implementation choices
dealing with the finite mathematics computers can perform.

These errors presented only represent
the high profile pieces of academic software,
what bugs are hiding in about all the smaller pieces?
If writing software is so hard and prone to bugs,
how can we write software in such a way
to minimise the number of bugs.
At the extreme of correctness requirements is NASA,
where software bugs can be fatal,
and in most cases it is impossible to send someone
to turn it off and on again.
NASA have published a set of Safety Critical Code Guidelines [@Holzmann2006]
of which the most general are;
- No function should be longer than can be printed on a single sheet of paper.
  Each function should be an understandable and verifiable logical unit.
- A minimum of two assertions per function.
  Unit tests and programmers are not perfect,
  an assertion checks that the values within the function
  are for normal operation.
  If a function doing something with temperature
  got a value of negative Kelvin,
  something impossible in normal operation,
  then an assertion would make that known.
- All code must be compiled with the strictest checks.
  All code must be checked with at least one,
  but preferably more than one,
  static analysis tool.
  All code should pass with zero warnings.
Another source of guidelines for improved code is from Google [@Henderson2017]
- All changes to the main source code repository MUST be reviewed by at least one other engineer
- Engineers are encouraged to keep each individual change small
- All code used in production is expected to have unit tests
- Style guides for each language to ensure consistency


- Fuzz / property testing
- changes which are beyond current thought, a lack of creativity
- scope of software is large, unintended consequences, locally change is fine, but
  might not be fine somewhere else
- Rust programming language uses Crater to run changes to the compiler against all
  publicly available code written in rust, making sure the tests still pass.
    - No unintended consequences
    - How are people actually using features

Importantly testing, readability, and review

## Reproducibility

As was mentioned in the scope of correctness,
it can be difficult to reproduce results
even when you have all the code to do so. [@Mesnard2017,@Rizzi2019]
Without the code it can be far more difficult.
In the field of Computational neuroscience
@Manninen2017 seek to replicate four
"relatively simple computational models"
describing the Ca^{2+} concentration over time
by implementing the series of differential equations
present in the original publications.
Of the four models,
three didn't provide enough information
to implement the models,
while two had errors in their equations
which were noticed by an expert.
A more contentious example of this
is a disagreement between Debnedetti and Chandler
over the behaviour of supercooled water. [@Aut2018]
This started in 2011,
where Debnedetti found two separate phases,
while Chandler found only one,
with each seemingly using the same simulation conditions.
Despite numerous publications in the preceding years by both groups,
there is no explanation for the discrepancy.
It wasn't until Chandler made the code available to Debnedetti
that the cause of the discrepancy was found,
the molecular dynamics simulations were being seeded
with velocities which deviate from the expected Maxwell-Boltzmann distribution
and additionally the equipartition theorem,
that the energy is equally distributed among degrees of freedom,
was being violated.[@Palmer2018]
While this appears to be a bug in the software,
it appears that the behaviour was the intended behaviour.
The real issue here is in the communication of the simulation results.
Seven years worth of papers, emails, and in-person conversations
were unable to adequately describe what the code was doing.
As @Buckheit1995 put it
"an article about computational results is advertising, not scholarship.
The actual scholarship is the complete software development environment and the
complete set of instructions which generated the figures"

- Computational reproducibility [@Baker2016]
- Unable to reproduce modelling of differential rate equations from 3 of 4
  publications without modifications to the presented equations [@Manninen2017]
- Even following reproducible practices, it can be difficult to reproduce results
  from within the same lab [@Mesnard2017]


Reproducible Research
    - What does this mean for software
    - Best practices
        - Traceability -> how was a results produced [@Sandve2013]
        - Avoid manual data manipulation [@Sandve2013]
        - Determinism (Document random seeds) [@Sandve2013;@Taschuck2017]
        - Documentation [@Taschuck2017;@Eglen2017;@Wilson2014;@Wilson2017;@Smith2018]
        - Version Control
          [@Eglen2017;@Sandve2013;@Taskchuk2017;@Pall2015;@Wilson2014;@Wilson2017]
        - Tests [@Eglen2017;@Taschuk2017;@Pall2015;@Smith2017]
        - Data in standard format [@Sandve2013;@Eglen2017;@Wilson2017]
        - Provide public access to scripts and results [@Sandve2013;@Wilson2017]
        - Persistent URLs (DOI) [@Sandve2013;@Smith2018]
        - Peer Review [@Pall2015;@Wilson2014;@Smith2018]

    - When did it fail: *Theorists* the theory student sees no need to develop more
      disciplined ways of doing computational research. [@Donoho2009]

## Literate Programming

Bringing implementation as part of write up.

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
      [@Weiss2017;@Smec2016;@Golman2019;@Smec2017a;@Weiss2017a;@Nguyen2018]
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
            - complex workflows -> directed acyclic workflow
            - robustness to errors
            - HTBAC to manage simulation replications
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

- sdrun
    - qtools [@Purg2017]

- sdanalysis / traj3dy
    - vmd_diffusion_coefficient [@Giorgino2019]
    - Overview of analysis tools [@Giorgino2019a]
    - MDTraj [@McGibbon2015]
    - MDAnalysis [@Gowers2016]
    - freud [@Harper2016]
    - rowan [@Ramasubramani2018]
