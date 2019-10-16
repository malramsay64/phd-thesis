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
appearing in Software Carpentry's [@Wilson2016a] "Programming with Python" lesson, [@programming_python]
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
](../Projects/random_number_generators/presentation/figures/randu.png){#fig:randu width=80%}

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

### Extra ideas

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
describing the Ca$^{2+}$ concentration over time
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
While this could be considered a bug in the software,
it seems that the behaviour was intended.
The real issue here is in the communication of the simulation results.
Seven years worth of papers, emails, and in-person conversations
were unable to adequately describe what the code was doing.
As @Buckheit1995 put it
"an article about computational results is advertising, not scholarship.
The actual scholarship is the complete software development environment and the
complete set of instructions which generated the figures"

In a study of reproducibility
@Baker2016 found that 80% of respondents
finding that missing code or methods
were sometimes an issue in reproducibility.
Making code available is only part of the solution,
it also needs to install and work on your system.
@Collberg2016 studied computer systems research papers
where the main result was based on code.
Of the 500 papers studied,
only 54% had code which compiled
even after correspondence with the original author.
This didn't make any attempt to replicate the original results,
only going as far as checking the code would run.
One of the main reasons presented
for not releasing code is that it
"it not ready for public consumption",[@Kouatchou2018;@Aut2018;@Collberg2016]
however I posit that if code is not ready for anyone else to read,
how is it ready for you to read?
How can you be sure it is doing what you intend?

Another angle of this is that even if the code works,
is it using the same version of the software?
There are differences, [@Mesnard2017]
some of which don't change the result,
others which might fix problems in previous versions.
Without knowing specific versions,
even with the code, reproducing results can be difficult.
In a study of 305 of the most highly cited papers
using the LAMMPS simulation software for molecular dynamics analysis,
only 5 provided information about the version being used. [@Li2016]
Of those 5, only 2 gave information
which point to an exact version rather than a year.

It would seem that we in the field of computational chemistry
are not doing well in the aspect of reproducibility.
Since the point of publishing research is for others to build upon it,
which is measured using citations,
making it easier, and in many cases possible, to replicate your work
as the first step of building upon it
seems fairly fundamental.
So what are the best practices
for software within research.
The five key points which are brought are

1. Version Control [@Eglen2017;@Sandve2013;@Taschuk2017;@Pall2015;@Wilson2014;@Wilson2017;@Coudert2017]
2. Documentation [@Taschuk2017;@Eglen2017;@Wilson2014;@Wilson2017;@Smith2018]
3. Tests [@Eglen2017;@Taschuk2017;@Pall2015;@Smith2018]
4. Peer Review [@Pall2015;@Wilson2014;@Smith2018;@Sandve2013;@Wilson2017]
5. Open Data [@Sandve2013;@Eglen2017;@Wilson2017;@Coudert2017]

### Version Control

- Keep track of what changed and when
- keep the changes small

### Documentation

- what each function does
- inputs/outputs
- What the function does and what it changes

### Tests

- running the code with known good output
- ensure that any changes to the code have unintended consequences
-

### Peer Review

- Both of software as a whole and of changes being made
- Where there are issues, someone else can see the changes

### Open Data

- not just the software, also the input and output files


Many groups have had success with practicing reproducible software,
and @Donoho2009 make a rather fitting observation
for situations where it has failed;
"the theory student sees no need to develop more
disciplined ways of doing computational research."

### Additional ideas

- Traceability -> how was a results produced [@Sandve2013]
- Avoid manual data manipulation [@Sandve2013]
- Determinism (Document random seeds) [@Sandve2013;@Taschuck2017]
- Persistent URLs (DOI) [@Sandve2013;@Smith2018]


One of the important points about the errors in
the Willoughby-Hoye scripts, or supercooled water
is that by making the entire work available,
the errors were found.
The process of continual peer review,
has made these tools and methods better for everyone.
It is really easy to ascribe blame to someone
and lose trust in them,
however it is through these failures,
that people learn and improve.

## Literate Programming

Recognising that code is an important component of the research process
now means that there need to be suitable methods of combining both
- the ideas in the form of descriptive text and equations, and
- the implementation of those ideas in the form of code.
Typically the current method is to place
the ideas front and center in the paper,
while the code is hidden away in a collection of files
which is rarely checked.
The idea of combing both code and documentation in this way was coined
*literate programming* by Donald Knuth in 1984.[@Knuth1984]
This focused on the idea that a program is a work of literature
concentrating on communicating to humans rather than computers.
A key point Knuth made in using the literate programming style is that
"My programs are not only explained better than ever before;
they are also better programs,
because the new methodology encourages me to do a better job."

There have been implementations of literate programming,
with Wolfram Mathematica among others,
none have had the recent popularity of Jupyter notebooks.
The development has primarily been driven by the field of data science,
which is solving the same types of problems present in the sciences,
namely the interactive analysis and plotting of data.
The Jupyter notebook---previously iPython notebook---has seen
significant interest within the research community [@Shen2014;@Mascarelli2014].
With the primary appeal being the ability to provide a computational narrative,
combining the description of the problem being solved,
including equations and description,
along with the working code the solve the problem
and related visualisations.
This narrative can be shared, replicated, and explored,
providing an interactive method of understanding
your own or a peer's data,
and communicate that understanding effectively.

Part of the real power of the jupyter notebook is the extensibility,
with research groups developing software that build upon jupyter,
simplifying the process of visualising different types of data,
like @Nguyen2018 developing a widget to view molecular dynamics simulations.
Furthermore, services like MyBinder, and Google Colaboratory
provide ways of sharing notebooks online
without having to install anything on your local computer.
This makes it possible for your entire audience
to replicate your research as part of a 20 minute presentation.
Additionally jupyter notebooks are becoming
part of the research outputs for papers,
in particular the LIGO discovery included the accompanying notebook
so that anyone can replicate their analysis.
The adoption of Jupyter notebooks within a research environment
is so prolific that it has even been picked up by mainstream media,
with The Atlantic publishing a provocatively titled article
"The Scientific Paper Is Obsolete" [@Somers2018]
documenting the rise of the computational notebook.

While the Jupyter notebook has lots of wonderful promises,
it doesn't mean they are being delivered on in practice.
@Rule2018 study academic jupyter notebooks available on GitHub,
evaluating how well they adhere to the promise of literate programming.
A key part of a scientific publication is the reasoning
and discussion of the results and their importance,
yet in the notebooks sampled the discussion of results and reasoning
only occurred in approximately a third of notebooks studied.
Of even more concern,
while 55% of notebooks had an introductory description,
only 3% had a conclusion,
making these notebooks no better than the code they are replacing.
While Donald Knuth found code improvements using literate programming,
the same is not true for everyone,
with Jupyter notebooks inspiring poor programming practices.


### Additional Ideas

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




## Project Management

Organisation of project [@Wilson2014]

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
- Binary file formats are much preferred for data storage
