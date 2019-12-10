# Introduction

The field of machine learning has been actively researched for over 40 years.
Developing the ideas of helping computers make better decisions for us.
The relatively recent surge of both research and commercial interest
is the result of widely available computing power.
This has seen the rise of more complex algorithms like deep neural networks.
An important part of the rise in popularity of neural networks
is the type of operations they perform.
Training a neural network requires a sequence of matrix operations,
in particular the multiplication of matrices.
The multiplication of matrices is important because of Graphics Processing Units (GPUs)
which can be over 400 times faster at matrix multiplication than CPUs,
which has made these types of algorithms commercially viable.

One of the large downsides of using a complicated neural network
is that there is little clarity over how a decision is made.
In particular, bias in data the algorithm learns from
is amplified within the algorithm in unexpected ways.

## Introduction to Machine Learning

Machine learning is a technique by which a machine learns
when it changes it's structure, program, or data based on external information
such that it's expected future performance improves. [@Nilsson1998]
This definition includes the field of statistics,
namely that the more data fed to a statistical distribution,
the better the performance and understanding of the data.
There is a strong link between
the field of statistics and that of machine learning,
which can be examined at a fundamental level.

One of the simplest applications of machine learning is Linear Regression,
solving a problem of the form

$$ \min_w || Xw -y||^2_2 $$

exactly the same formulation as using statistics.
For this linear case, the difference between
a statistical approach and a machine learning approach
is the methodology.

### Why Machine Learning

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

### Feature Development

The features of a machine learning model
are the set of quantities passed to the model.
For example when we perform a linear regression there is a single feature,
one input value which can be used to predict an output value.
Feature selection is the most important part of machine learning
with a good set of features requiring domain expertise.
The features are a set of values which best describe
the underlying behaviour.

### Machine learning for crystal detection

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

### Machine Learning Methodology

When developing a machine learning algorithm for a problem
there are typically two separate steps,

1. development of optimal models, and
2. evaluating the performance of these models.

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

For the development of machine learning models,
which often have a very large parameter space,
overfitting of the model to the input data
is a very real concern.
It was noticed by @Larson1931 in 1931 that
using the same dataset for training an algorithm
and evaluating it's statistical performance
leads to an overoptimistic result.
One of the methods used to mitigate this
is to break the dataset into two groups,
the test set---typically comprising 80\% of the data---
used for finding an optimal model, and
the validation set---comprising the remaining 20\% of the data---
used for scoring the performance of the models.
The most important metric in machine learning is
the performance on data which has not yet been seen.

For the process of finding the best model,
a method of cross-validation is used,
with *n*-fold cross validation being the most common.
The technique of *n*-fold cross validation splits
the test dataset into *n* components
with $n=10$ being close to optimal. [@Zhang1993;@Arlot2010]
Cross validation is all about reducing
the risk that the model is highly specific
to part of the dataset.

Once the best models have been established
using cross validation on the training dataset,
the reported performance is evaluated
on the unseen test dataset.
In many cases, the performance
is additionally compared against
an entirely different dataset,
as a way of evaluating the specificity of the model.

It is this approach to developing a model
which is a defining characteristic of machine learning
more so than any particular model used.
The big advantage of this much more complicated approach
to the methodology of the development of the best model
is that more complicated models with many parameters
are still general enough to work with new data

### Supervised Learning Algorithms

#### Linear Methods

#### K-Nearest Neighbours

- @Goldberger2005
    - Simple method
    - Single unable parameter
    - Non-linear decision surface
    - Use of ked-trees to reduce dimensionality search [@Bentley1975]
        - This is similar to neighbour search approaches in molecular dynamics [@Howard2016]

#### Decision Trees

#### Neural Networks

### Measuring Success

- confusion matrices
- accuracy
- precision
- recall
- F1 score
- false positives/negatives

### Unsupervised Learning Algorithms

#### K-Means clustering

#### DBSCAN

#### Optics

#### HDBSCAN
