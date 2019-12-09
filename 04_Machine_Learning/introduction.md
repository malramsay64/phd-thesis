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

## Crystal Detection

During the course of my honours work, I established that the most likely candidates for the crystal
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

$$ O_n = \langle \cos^2(\theta_{ref} - \theta_i) \rangle_i $$

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

### Why Machine Learning

There are a range of parameters which can be used
to identify a particular structure within a simulation.
In the field of self assembly @Keys2011 describe six;

a. Point matching,
b. shape histogram,
c. shape distributions,
d. harmonic descriptors,
e. shape context, and
f. lightfield descriptor.

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

A recent example relevant to this thesis
is the development of a novel amorphous alloy [@Ren2018]
where machine learning sped up the process nearly 1000 times.
Another example of the power of machine learning
is a study finding the best glass formers,
in which the entire experiment was automated, [@Meenakshisundaram2019]
requiring no human intervention.

- Large datasets we don't fully understand
- lots of fitting parameters which are hand tuned

### Machine learning for crystal detection

- Alternative is human decision
- Other methods of crystal detection
    - Typically reduce to a single parameter
    - Reflect the relationships which are important in that crystal structure
    - Still require a decision to be made about what values are crystalline and
      which values are liquid
    - Even in these cases a machine learning methodology can be used to determine
      the optimal value to differentiate the two groups.
- Most of the methods for crystal detection focus on a very small subset of crystal
  structures
    - FCC
    - BCC
    - Hexagonal
    - Ice
- We have spent a long time developing these algorithms
    - List some different methods
    - Early methods
    - Later methods with higher accuracy
- Molecular crystal structures are complex
    - Spending 30 years developing each method is untenable
    - Need something which is transferable between systems
- Take the work of the past 30 years developing methods of detecting crystals
    - use it for finding features
    - complex combination of different features, giving results better than any
      individual feature.

- Want to know which structures are present within the data
    - great diversity of complex structures
    - hard to find something new
        - only see what we are looking for rather than what is actually there.

- Machine Learning for Crystal Detection
    - Existing approaches

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

One of the simplest approaches to machine learning
is the use of Linear Regression,
solving a problem of the form

$$ \min_w || Xw -y||^2_2 $$

which is exactly the same as solving the problem
through statistics.
For this linear case, the main difference between
a statistical approach and a machine learning approach
is the methodology.

### Feature Development

For machine learning,
features are the set of dimensions
over which the learning takes place.
That for a linear regression,
we have a single feature,
one input value which maps to an output value.
When developing a machine learning methodology
the feature selection is the most important component,
and where domain expertise for a particular problem
is most useful.
The features are a set of values which best describe
the differences which a machine learning algorithm
should differentiate.

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
with $n=10$ being close to optimal[@Zhang1993;@Arlot2010].
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
