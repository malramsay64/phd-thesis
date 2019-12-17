# Computational Methods

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
Note that this is studying people employed to write code,
typically with formal training in computer science.
If this is the rate among professionals,
how do scientists fare?
@Soergel2015 posits that anywhere from 5-100% of software used in research
has a bug altering the results obtained from it.
This is not purely a theoretical problem,
there are many results which are now questionable
as a result of software errors.

Recently @Neupane2019 found a bug in the popular Willoughby-Hoye Scripts
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
appearing in Software Carpentry's [@Wilson2016] "Programming with Python" lesson, [@programming_python]
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
complete set of instructions which generated the figures".

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
If that is not reason enough,
to publish in Nature
"Authors must make available upon request,
to editors and reviewers,
any previously unreported custom computer code or algorithm
used to generate results that are reported in the paper
and central to its main claims.
Any reason that would preclude the need for code or algorithm sharing
will be evaluated by the editors
who reserve the right to decline the paper if important code is unavailable." [@nature-reporting]

So what are the best practices
for developing software within research.
The five key points which are common across a number of best practice guides are;

1. Version Control [@Eglen2017;@Sandve2013;@Taschuk2017;@Pall2015;@Wilson2014;@Wilson2017;@Coudert2017]
2. Documentation [@Taschuk2017;@Eglen2017;@Wilson2014;@Wilson2017;@Smith2018]
3. Tests [@Eglen2017;@Taschuk2017;@Pall2015;@Smith2018]
4. Peer Review [@Pall2015;@Wilson2014;@Smith2018;@Sandve2013;@Wilson2017]
5. Open Data [@Sandve2013;@Eglen2017;@Wilson2017;@Coudert2017]

### Version Control

The process of keeping track of;

- what changes have been made,
- who made them, and
- when they were made

is a critical part of research.
Version control systems used in software development, such as Git,
provide a system for keeping track of these changes
over the lifespan of a project.
Keeping track of this can be particularly useful
in working out the impact of a bug.
Once the offending code has been identified,
version control allows looking at
the history of that piece of code over time
working out how much data has been affected.
Importantly when using version control
is to keep the size of each change fairly small
as it makes this retrospective analysis much easier.
Smaller changes are also a lot easier
for someone else to review. (See @sec:Peer_Review)

While small changes are easier to review,
they should also be self contained,
since many changes complicate the process.
This means that an ideal change to adds some new functionality
should also include documentation for what that functionality does,
including an update of existing documentation.
There should also be some test cases,
ensuring the new functionality behaves as expected
and future changes are not going to
inadvertently break the feature.
In practice this idea situation is rarely realised,
particularly where software development is not the main goal.
However it provides a framework for what should be changed.

### Documentation

At a minimum a project should contain a README file,
a first port of call for anyone coming across a project.
Much like an abstract of a journal article,
a README file should;

- explain what the software does,
- list what is required for the software to work,
  including installation instructions,
- provide instructions and commands to get the user started quickly,
  an initial check that the installation worked.

A README provides a high level overview of the project,
so for a more granular understanding
each script should contain a description of what it does,
and ideally how to use it.
This same process should also be done for functions,
including what is valid input and expected output.
This helps describe what a function does,
and also provides a method to ensure
it is used correctly later.
This documentation of functions
should also include how, if at all,
they cope with "bad" or malformed data,
as it is important to understand these cases.

### Tests

A test is the process of running some code,
and comparing the output with a known good result.
Testing can take place on many levels,
from running an entire simulation over many steps,
to checking that a force-field is calculated correctly.
The main purpose of tests is to quickly ensure
that the code is functioning as expected,
which can be used to ensure that
a change to the code has no unintended consequences.

A more advanced feature for tests
is to perform Continuous Integration (CI) testing
over a range of different operating systems.
Continuous Integration is the process of
automatically running all the tests
whenever a change is made.
There are a numerous providers which will perform
this CI testing whenever a change is uploaded to GitHub.
A key advantage of this type of testing,
particularly when running the tests on multiple operating systems
is that it makes finding compatibility problems simpler.
Many pieces of software are run on different computers,
developing something on a local computer
which could be running Windows or macOS
to then be run on an HPC cluster running Linux,
or for the Willoughby-Hoye scripts,
where researchers were running it on all platforms.
Having the ability to quickly test that your code
is going to work everywhere it is deployed is extremely powerful.

### Peer Review

The peer review of code comes in two key forms.
Firstly there is the peer review of the overall work,
this allows for other experts to find potential issues
and other points where the author of the code
has made the underlying behaviour unclear.
The Journal of Open Source Software (JOSS)
provides peer-review guidelines for scientific software. [@joss-reveiw-criteria]

As projects change and develop
the original review of the work becomes outdated,
particularly for projects which are widely used and trusted,
the peer-review takes place on *every* change made.
For example the Gromacs project requires approval from multiple
authors before any change is incorporated into the main code base. [@Pall2015]
This process ensures that the code is continually of a high standard
and by providing a range of perspectives on any particular problem
the solutions are better and have fewer bugs.
Requiring multiple people to approve changes
means that when bugs are found,
there is no attribution of blame to a single person,
the process failed rather than the person.

### Open Data

Finally the software is only part of the story for reproducibility,
the data used to generate the analysis
like input configurations for molecular dynamics trajectories
are important parts of reproducing an analysis.

- Traceability -> how was a result produced [@Sandve2013]
- Avoid manual data manipulation [@Sandve2013]
- Determinism (Document random seeds) [@Sandve2013;@Taschuk2017]
- Persistent URLs (DOI) [@Sandve2013;@Smith2018]

Many groups have had success with practicing reproducible software,
and @Donoho2009 make a rather fitting observation
for situations where it has failed;
"the theory student sees no need to develop more
disciplined ways of doing computational research."

Within the realms of computational chemistry,
the Molecular Sciences Software Institute [@molssi]
provides guides for best practices in the computational molecular sciences
in particular they provide a template for projects [@molssi-cms]
which allows for starting a new project
which takes into account all the above recommendations.
There are also many research groups in the chemical sciences
using these tools to improve their research;

- the Chodera group, [@chodera_lab]
- the Glotzer group, [@glotzer_lab]
- the Pande group, [@pande_lab]
- Laboratoire de Chimie et Physique Quantiques, [@lcpq_lab]
- Foley Lab, [@foley_lab]
- Chopra Lab, [@chopra_lab]
- SUNCAT Center, [@SUNCAT]
- DeBuyl Lab, [@debuyl_lab]

One of the important points about the errors in
the Willoughby-Hoye scripts, or supercooled water
is that by making the entire work available,
the errors were found.
The process of continual peer review,
has made these tools and methods better for everyone.
It is natural to ascribe blame to someone
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
while the code is hidden away in a rarely checked collection of files.
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
which solves the same types of problems present in the sciences,
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
