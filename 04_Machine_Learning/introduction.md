# Introduction

During my honours work, I established that the most likely candidates for the crystal
structure were the p2, p2gg, and pg structures as shown below. The search for structures was first
performed using hard shapes in an isoconfigurational search algorithm developed by Toby Hudson
[@Jennings2015]. The resulting crystal structures were then relaxed using the Lennard-Jones potential
find the energy of each structure. The calculated energies (@Tbl:crystal_energies) are all within
2% of each other, indicating there is no significant driving force for a particular crystal
structure.

Crystal| Penalty
------:|--------:
p2     |   -0.199
pg     |   -0.093
p2gg   |   -0.191

Table: A Comparison on the energies of the potential crystal structures for the Trimer molecule.
{#tbl:crystal_energies}

The lack of a single definitive crystal structure requires that further investigation of the
crystallisation behaviour needs to handle all the different structures. The standard tool for
crystal detection is to use an order parameter; a single value which captures the closeness of a
configuration to the liquid state. These values are typically scaled to be of the range $[0-1]$
where 0 is completely liquid character and 1 is perfect crystal character. A measure of this type
that has been previously used in molecular crystals is an orientational order parameter $O_n$. The
value of $O_n$ is the relative orientation of nearby molecules, which is typically the nearest
shell. The measure of orientational alignment for $O_n$ is given by the equation;

$$ O_n = \langle \cos^2(\theta_{ref} - \theta_i) \rangle_i $$ {#eq:orientational_order_parameter}

where $\theta_{ref}$ is the orientation of the reference particle and $\theta_i$ is the orientation
of the particle to be compared. This value is averaged over all $i$, which in this case is the
particles in the shell of first nearest neighbours. This form of the equation only works in 2D.
While it is possible to modify the above equation to take three orientations, this is a poor
implementation due to the occurrence of gimbal lock. Additionally most simulation software uses
quaternions for orientation to alleviate the issue of gimbal lock.
The quaternion based representation,
where the central molecule has orientation $\vect{\hat{q}}_{0}$,
while the neighbours have orientation $\vect{\hat{q}}_i$

$$ O_N = \frac{1}{N} \sum_{i=1}^{N}
2\cos^2(\log(\hat{\vect{q}}_{0}^{-1}\cdot \hat{\vect{q}}_{i})) $$

The quaternion form of the orientation is still unsuitable for even the p2 structure which is the
most orientationally ordered of all three crystals. In the p2 structure the molecules are arranged
parallel and antiparallel, so both these orientations need to contribute positively to the order
parameter hence the $\cos^2$ term.

This form of the equation works reasonably well at distinguishing the liquid from the p2 crystal
phase, using $O_n > 0.85$ as the measure of the p2 crystal. There are still two issues with using
this parameter. Firstly, the value of
0.85 was chosen because I thought it worked well, with no data to validate it is the best value for
distinguishing the two phases. Secondly, $O_n$ is only suitable at identifying the p2 structure.
Both the p2 and p2gg structures are considered part of the liquid phase with the chosen parameter.

![The range of values of the orientational order parameter $O_n$
overlap for each of the crystals and the liquid.
](../placeholder_figure.png){width=80% #fig:order_parameter_overlap}

The formula for the order parameter [@eq:orientational_order_parameter]
takes the orientation of each neighbour,
and collapses those into a single value,
being a point on a number line.
The original data,
being the orientation of each neighbour
can be represented as a point in $n$ dimensional space
indicating the value of each $n$ neighbours.
Machine Learning is a tool which can assist in handling
values in higher dimensional space.

## Why Machine Learning

There are a range of parameters which can be used
to identify a particular structure within a simulation.
In the field of self assembly @Keys2011 describe six;

1. Point matching,
2. shape histogram,
3. shape distributions,
4. harmonic descriptors,
5. shape context, and
6. lightfield descriptor.

To accurately describe the similarity of one structure to another
many of these different descriptors can be used,
resulting in a multi-dimensional description of a configuration.
The question then becomes,
which structure is this closest to?

Using existing data for hypothesis testing
has been within the realm of statistical analysis for hundreds of years. @Stigler1986
However, statistical approaches like ANOVA
are problematic in high dimensional space.
This is where machine learning can really improve on these existing methods.

Machine learning is becoming widely used within materials science [@Mueller2016;@Vasudevan2019]
used for applications including;

- detection of crystal structures, [@Spellings2018;@Carrasquilla2017;@Boattini2018]
- characterisation of amorphous materials, [@Ballard2016;@Ballard2017]
- prediction of material properties, [@Hansen2013;@Hansen2015;@Pilania2013;@McDonagh2019] and
- the development of interatomic potentials. [@Snyder2012]

The places where machine learning is most useful
is in places where there are many hand tuned fitting parameters, and
for analysis of large datasets we don't fully understand.
Where there are many hand tuned parameters,
machine learning can help guide finding the best solution
much like @Meenakshisundaram2019 have done
with finding the best molecular glass formers.
In running an experiment where
the data collection and analysis is automated,
the machine learning directs new simulations
based on the existing data.
As more data is collected the directed guesses improve.
The tuning of parameters using machine learning
has also been used by @Ren2018 to
speed up the development of a novel amorphous alloy.
The optimisations allowed by machine learning
speed up the process of discovery by 1000 times.

There are many problems in materials science we don't fully understand,
like the glass transition,
and there are tremendous volumes of data
from both simulations and experiments.
@DellAnna2008 use machine learning
to aid in the analysis and understanding of data from
Time-of-Flight Secondary Ion Mass Spectrometry (ToF-SIMS) spectra.
Using a Supervised Principal component technique @Bair2006
to reduce the number of peaks analysed in the resulting spectrum from 55 to 8,
they were able to develop models to effectively predict
the chemical composition of thin films.

Machine learning provides a range of tools
for understanding, analysing, and predicting data.
However, like a statistical analysis
machine learning needs to be applied carefully
using the appropriate analysis for the task at hand.
It is not a black box which magically solves problems. [@Lehman2019]

## Machine learning for crystal detection

The problem I am using machine learning to help solve
is the detection of crystalline structures within the liquid phase.
This is a problem which has been approached using traditional techniques.
In 2D simulations the order parameter $\psi_6$ [@Tobochnik1982]
is commonly used to differentiate between the liquid and crystal regions

$$ \psi_6 = \left|\frac{1}{6} \sum_j^n \exp(i 6 \theta)\right| $$

Having a value $\psi_6 = 1$ indicates
the configuration is perfectly hexagonal
while a value $\psi_6 = 0$ indicates
perfect disorder.
However to classify a local configuration into either
liquid-like or crystal-like
there needs to be a cutoff value
separating the two types of structures,
something which isn't present in any publication.
[@Mitus2002;@Qi2010;@Petrov2015;@Hamanaka2006;@Wierschem2011;@Tobochnik1982;@Engel2013;@Bernard2011;@Strandburg1984]
The likely reason for this is that the
value would be chosen arbitrarily.
Machine learning provides a framework
for choosing the best value for a given dataset.

For simulations in 3D,
the ordering in crystal structures is more complex
making it's detection more challenging.
Like the 2D case there are a range of methods
for identifying structures including

- the Steinhardt bond order parameters, [@Steinhardt1983]
- Bond Angle Analysis, and [@Ackland2006]
- Common Neighbour Analysis. [@Faken1994;@Honeycutt1987]

Each of these different values focus on the identification
of a small range of structures, typically;

- Face Centered Cubic,
- Body Centered Cubic, and
- Hexagonal Close Packed.

The differences between each of these is typically
a hand picked parameter tuned for each potential.

While the existing approaches for crystal detection
are limited by arbitrary decisions and limited re-usability.
There has been a lot of work in choosing these methods
and they reflect the relationships important in crystal structures.
So they form a foundation on which to
develop features for machine learning.
There are a range of studies [@Reinhart2017;@Dietz2017;@Boattini2018;@Spellings2018]
building upon the ideas of the more traditional
crystal order parameters.
These all take slightly different approaches,
however each converts one of the parameters above
into a many dimensional representation
of the local structure,
providing far more opportunity
to distinguish the different structures.

The approaches listed above only deal with spherically symmetric particles,
molecular crystals are far more complicated
in their shape and crystal structure.
Water Ice has 18 different polymorphs we have found so far, @Algara-Siller2015
with the most recent found in 2015.
The number of polymorphs for ice is likely to reflect
the range of structures in many molecular crystals.
The CHILL [@Moore2010] and CHILL+ [@Nguyen2015]
are traditional algorithms for
detecting ice within liquid water
though they are limited to ice Ih, Ic, and clathrates for CHILL+.
Machine learning models [@Geiger2013;@Fulford2019]
provide analysis that is both more accurate
and covers a wider range of crystal structures.

A further problem,
highlighted by the example of water
is that it is important to know
the types of structures which are present within a sample.
Not only for the discovery of novel materials
but also having a complete understanding
of a configuration.
A problem with existing tools
is that you only see the range of structures you are looking for
rather than the range of structures which exist.
Machine learning can also be used to
subdivide the dataset into distinct clusters of crystal structures. [@Spellings2018]

The real power of machine learning
for the identification and classification
of crystal structures,
comes from combining the work of the past 40 years
of classifying crystal structures
with the tools available through machine learning.

## Machine Learning Methodology

When developing a machine learning algorithm for a problem
there are typically two separate steps,

1. development of optimal models, and
2. Evaluating the performance of these models.

The development of optimal models is finding
which methodology works best for the data,
much like looking at a curve
and evaluating whether to apply
linear fit or a power law.
Neither model may fit the data perfectly,
however a cubic may capture
the features of interest
better than a linear fit
margin that the model of choice.

Machine Learning models normally have many fitting parameters,
making the over-fitting of the model to the input data
more of a concern than statistical methods.
For methods of linear regression
it is possible to express the uncertainty of the model,
based on the values passed into the model. [@Altman2015]
More complex models of a dataset,
like those used in machine learning
lack this mathematical description of uncertainty.
@Larson1931 noted in 1931 that
using the same dataset for training an algorithm and evaluating it's statistical performance
gives a result more optimistic than can be replicated with additional datasets.
Cross-validation is a technique which
has been demonstrated to reduce over-fitting when used appropriately [@Arlot2010;@Zhang1993]
and is a textbook method in Machine Learning. [@Hastie2009]
The idea is to divide the data into two groups,
one used to develop a model
and the other used to evaluate the performance of that model.
There are a range of cross validation methods
through the most popular is 10-fold cross-validation [@Arlot2010;@Hastie2009]
which is chosen for optimising computational and statistical performance. [@Arlot2010;@Hastie2009;@Zhang1993]
The process of 10-fold cross validation
randomly divides the dataset into 10 equal groups,
with nine groups being used to develop the model
while the remaining group is used to evaluate the performance.
This process is repeated such that
each of the 10 groups is used to evaluate the performance.
The final score is the mean of the 10 models evaluated.
When publishing results from machine learning algorithms
the performance is evaluated on data note previously seen by the algorithm. [@Hastie2009;@Russell2016]
This is additional to the cross validation used above.
The set of data used for the final evaluation of performance
is known as the *test set*. [@Hastie2009;@Russell2016]

It is this approach to developing a model
which is a defining characteristic of machine learning
more so than any particular model used.
The big advantage of this much more complicated approach
to the methodology of the development of the best model
is that more complicated models with many parameters
are still general enough to work with new data

### Supervised Learning

The K-Nearest Neighbours algorithm [@Goldberger2005]
is used for the supervised classification of particles.
This was chosen based on performance,
both in the task of classification
but also the speed with which classification took place.
The K-Nearest Neighbours algorithm has a single parameter
being the value of $K$,
the number of neighbours from which a consensus is formed.
Testing a range of values with cross validation found that a value of 5
produced the best performing algorithm.

To get the best performance from the algorithm
kd-trees [@Bentley1975] are used for the neighbour search
an algorithm which finds use in molecular dynamics simulations [@Howard2016]

### Unsupervised Learning

## Machine Learning Goals

- Unsupervised learning is a process allowing for the identification of regions of local
  structure which are locally favoured
- Supervised learning is a suitable method for crystal detection and monitoring
