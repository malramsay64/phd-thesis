# Computational Methods

Using computer simulations to model a chemical system,
requires computers for both running the simulations,
and the follow-up analysis of the large volumes of data generated.
This custom simulations and analysis required for new research
requires the development of software to perform the calculations.
Using computing for research has existed as long as the computer itself.
The development of Monte Carlo methods in 1946,
attributed to Stanislaw Ulam, [@Mazhdrakov2018]
came about from conversations with Jon Von Neumann
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
per 1000 lines of delivered code, [@McConnell2004]
that is code which the original author deemed correct.
This studying describes people employed to write code,
typically with formal training in computer science.
If this is the rate among professionals,
how do scientists fare?
@Soergel2015 posits that anywhere from 5-100% of software used in research
has a bug which alters the result obtained from it.
This issue of correctness in software is not purely a theoretical problem,
there are many results which are now questionable
as a result of software errors.

Recently @Neupane2019 found a bug in the popular Willoughby-Hoye Scripts
for calculating NMR Chemical shifts from the output of
Quantum Chemical simulations using GAUSSIAN.
The Willoughby-Hoye scripts published in *Nature Protocols* [@Willoughby2014]
use the `glob.glob` function from the Python standard library
to list the files present within a directory.
The output of this function is documented as non-deterministic,
with the underlying operating system determining the ordering.
The scripts assumed the output of `glob.glob` was ordered,
which was the behaviour on the windows computers
the scripts were written on,
however, on Linux and macOS the order is random,
meaning some of the 130 papers citing these scripts
have results which are potentially incorrect.
The function used, `glob.glob`,
is a well known feature of the Python programming language,
appearing in Software Carpentry's [@Wilson2016] "Programming with Python" lesson, [@programming_python]
a one day course for introducing researchers to Python.
Despite the ubiquity of this function and it's behaviour,
it took 5 years and hundreds of people
to notice that the behaviour of the script was incorrect.
Another instance where software has hung a cloud of uncertainty over results,
is the RANDU pseudo-random number generator,
which was used within FORTRAN compilers in the 1970s,
the primary programming language used in the
computational sciences at the time.
The problem with this pseudo-random number generator
is that that the "psuedo-random" numbers are strongly ordered,
noticeable when plotting values in 3D (@fig:randu).
Now results which from this period which used random numbers,
like Monte Carlo simulations,
should be treated with caution. [@Press1988]

![When RANDU generates 'pseudo-random' the coordinates of points in 3D, all the points
lie on one of 15 planes shown.
](../Projects/random_number_generators/presentation/figures/randu.png){#fig:rand width=80%}

There are also classes of bugs which are more subtle,
results which are different yet neither is definitively right.
@Mesnard2017 attempted the replication of Computational Fluid Dynamics results
obtained within the group only three years prior.
The replication involved rewriting the code
using updated libraries for the linear algebra component.
They produced different results depending on
the linear algebra library being used,
even between versions of the same library.
All the libraries agreed in the averaged quantities being measured,
in this case the lift of a snake's body,
however the individual states were significantly different.
Despite giving different results,
none of the linear algebra libraries
were performing calculations incorrectly,
the errors came from different handling
of the finite precision of numbers stored on a computer.
These small compounded errors can also be found in
calculations of small molecule binding energies.
@Rizzi2019 use a range of commonly used software packages
for modelling the binding of small drug like molecules to a larger host molecules.
Even when using identical parameters for all software packages,
they still produced statistically distinguishable results.
It is likely that none of the software packages is overtly wrong,
they are each making different implementation choices
dealing with the finite mathematics of computers.

The software errors presented represent issues in
high profile pieces of academic software,
what bugs are hiding in about all the smaller pieces?
How can we make sure that code written for projects
like this PhD which may never be used by anyone else
are producing correct results,
how can we write software in such a way
to minimise the number of bugs?
At the extreme of correctness requirements is NASA,
where software bugs can be fatal,
and in may cases impossible to send a human to perform the
universal troubleshooting step of turning it off and on again.
To ensure high quality of code,
NASA have published a set of Safety Critical Code Guidelines [@Holzmann2006]
of which the most general are;

- No function should be longer than can be printed on a single sheet of paper.
  Each function should be an understandable and verifiable logical unit.
- All code must be compiled with the strictest checks.
  All code must be checked with at least one,
  but preferably more than one, static analysis tool.
  All code should pass with zero warnings.

Other places where code is held to a high standard
are large software engineering companies like Google,
where bugs can result in massive amounts of lost revenue or damage.
The guidelines for code at Google [@Henderson2017] includes the requirements;

- All changes to the main source code repository MUST be reviewed by at least one other engineer
- Engineers are encouraged to keep each individual change small
- All code used in production is expected to have unit tests
- Style guides for each language to ensure consistency

## Reproducibility

The progression of science is the processes of building upon
the work laid down by those before us.
As was mentioned in the scope of correctness,
it can be difficult to reproduce and build upon computational results
even when you have all the code to do so. [@Mesnard2017,@Rizzi2019]
Without the code it can be far more difficult.
In the field of Computational neuroscience
@Manninen2017 seek to replicate four
"relatively simple computational models"
describing the change of Ca$^{2+}$ concentration over time
through a series of differential equations
presented in the original publications.
Of the four models,
three didn't provide enough information in the paper to implement the models,
while two papers had errors in their equations that were noticed by an expert.
A more contentious example of the importance of code in replicating results
is a disagreement between Debnedetti and Chandler
over the behaviour of supercooled water. [@Aut2018]
This started in 2011,
where Debnedetti found two separate phases within the liquid,
while Chandler found only one,
with each seemingly using the same simulation conditions.
Despite numerous publications in the preceding years by both groups,
there is no explanation for the discrepancy,
with neither able to reproduce the results of the other.
It wasn't until Chandler made the code available to Debnedetti
that the cause of the discrepancy was found,
the molecular dynamics simulations were being seeded
with velocities that deviated from the expected Maxwell-Boltzmann distribution
and the equipartition theorem,
being that the energy is equally distributed among degrees of freedom,
was being violated.[@Palmer2018]
While this could be considered a bug in the software,
it seems the behaviour was intended
and instead this is an issue in the communication of the simulation results.
Seven years worth of papers, emails, and in-person conversations
were unable to adequately describe what the code was doing.
As @Buckheit1995 describes computational results;
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
only going as far as checking code would run.
Another angle of reproducibility is that even if the code works,
does is produce the same results.
Different versions of software can produce different results, [@Mesnard2017]
whether the result of fixing bugs,
or the changing of an algorithm.
Without knowing specific versions of software used reproducing results can be difficult.
In a study of 305 of the most highly cited papers
using the LAMMPS simulation software for molecular dynamics analysis,
only 5 provided information about the version being used. [@Li2016]
Of those 5 papers providing information,
only two point to a specific version of LAMMPS,
with the remainder describing the year.
In studies of reproducibility one of the main reasons
provided for not releasing code is that it
"is not ready for public consumption". [@Kouatchou2018;@Aut2018;@Collberg2016]
The review of code by experts
is an important practice in the field of software engineering, [@Henderson2017]
and is becoming an important practice within science.
The Journal of Open Source Software (JOSS)
is dedicated to the review and publication of research code,
and the guidelines for review in Nature note that;
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
The five key points which are common across many best practice guides are;
version control, [@Eglen2017;@Sandve2013;@Taschuk2017;@Pall2015;@Wilson2014;@Wilson2017;@Coudert2017]
documentation, [@Taschuk2017;@Eglen2017;@Wilson2014;@Wilson2017;@Smith2018]
tests, [@Eglen2017;@Taschuk2017;@Pall2015;@Smith2018]
peer review, [@Pall2015;@Wilson2014;@Smith2018;@Sandve2013;@Wilson2017]
and open data. [@Sandve2013;@Eglen2017;@Wilson2017;@Coudert2017]

Version control is the process of keeping track of;
what changes have been made,
who made them, and
when they were made.
Version control systems used in software development, such as Git,
provide a system for keeping track of
the progress of a project over its lifespan.
Keeping track of this can be useful
for working out the impact of a bug.
Once the offending code has been identified,
version control can identify
when the bug was introduced
and so how much data was affected by it.
Importantly when using version control
is to keep the size of each change fairly small
as it makes this retrospective analysis much easier.
Smaller changes are also a lot easier
for someone else to review. [@sec:peer-review]

The minimum documentation for a project should be a README file,
which is a first port of call for anyone coming across the project.
Much like an abstract of a journal article,
a README file should;
explain what the software does,
list what is required for the software to work,
including installation instructions,
and provide instructions and commands to get the user started quickly.
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
A key advantage of this type of testing
is it the tests can be run on multiple operating systems
making the process of finding compatibility problems simpler.
Many pieces of software are run on different computers,
developing something on a local computer
which could be running Windows or macOS
to then be run on an HPC cluster running Linux,
or for the Willoughby-Hoye scripts,
where researchers were running it on all platforms.
Having the ability to quickly test that your code
is going to work everywhere it is deployed is extremely powerful.

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
authors before any change is incorporated into the main codebase. [@Pall2015]
This process ensures that the code is continually of a high standard
and by providing a range of perspectives on any particular problem
the solutions are better and have fewer bugs.
Requiring multiple people to approve changes
means that when bugs are found,
there is no attribution of blame to a single person,
the process failed rather than the person.

Finally the software is only part of the story for reproducibility,
the data used to generate the analysis
like input configurations for molecular dynamics trajectories
are important parts of reproducing an analysis.

## Implementing Best Practices

Many groups have had success with practicing reproducible software,
and @Donoho2009 make a rather fitting observation
for situations where it has failed;
"the theory student sees no need to develop more
disciplined ways of doing computational research."
One of the important points about the errors in
the Willoughby-Hoye scripts, or supercooled water
is that by making the entire work available the errors were found.
The process of continual peer review,
has made these tools and methods better for everyone.
Within the realms of computational chemistry,
the Molecular Sciences Software Institute [@molssi]
provides guides for best practices in the computational molecular sciences
in particular they provide a template for projects [@molssi-cms]
which allows for starting a new project
which takes into account all the above recommendations.
There are also many research groups in the chemical sciences
using these tools to improve their research including;
the Chodera Lab, [@chodera_lab]
the Glotzer Lab, [@glotzer_lab]
the Pande Lab, [@pande_lab]
the Laboratoire de Chimie et Physique Quantiques, [@lcpq_lab]
the Foley Lab, [@foley_lab]
the Chopra Lab, [@chopra_lab]
the SUNCAT Center, [@SUNCAT]
and the DeBuyl Lab. [@debuyl_lab]

In the development of the software packages used within this thesis,
I have made employed these recommendations for high quality
and reproducible code,
building upon the examples of others within the field.
Every time I make a small change to one of my projects,
a Continuous Integration (CI) service will
run two static analysis tools, `pylint` and `mypy`
ensuring that these produce no warnings.
These static analysis tools enforce style on the code
that includes checking for functions that are too long and complicated.
The CI service will then run a suite of unit tests
running functions to ensure they produce the intended output.
The only guideline above not adhered to
is the review of the code by another engineer.
I have made the review possible by open-sourcing
all the code used for this thesis
with the details documented in @sec:software_projects.
