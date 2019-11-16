# Introduction

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

## Introduction to Machine Learning

Machine learning is a technique by which
A machine learns when it changes it's
structure, program, or data
based on external information
such that it's expected future performance improves. [@Nilsson1998]
With this simple definition,
the field of statistics could easily be included.
Adding more data samples to a statistical distribution
improves the understanding of the data
and hence one would expect the results to improve.
There is a strong link between
the field of statistics and that of machine learning,
which can be examined at a fundamental level.

One of the simplest approaches to machine learning
is the use of Linear Regression,
solving a problem of the form

$$ \min_w || Xw -y||^2_2 $$

which is exactly the same as solving the problem
through statistics.
For this simple case the difference between
the typical statistical approach
and a machine learning approach
is the methodology.

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
So one of the methods used to mitigate this
is to break the dataset into two groups,
the test set
---typically comprising 80\% of the data---
which is used for the first step
of finding an optimal model, and
the validation set
---comprising the remaining 20\% of the data---
used for scoring the performance of the models.
In machine learning,
the most important metric is
the performance of the model on data which
has not yet been seen,
so splitting the dataset means
the evaluation of performance is on a dataset
which the model hasn't previously been exposed to.
This idea of evaluating performance on
unseen data extends to the model development.

In finding the best model,
a method of cross-validation is used,
with *n*-fold cross validation
being the most common.
The *n*-fold cross validation is where the
test dataset is further split into
*n* components, with $n=10$ being close to optimal[@Zhang1993;@Arlot2010].
Cross validation is all about reducing
the risk that the model is highly specific
to part of the dataset.

- @Arlot2010
    - As noticed in the early 30s by Larson, training an algorithm and evaluating it's
      statistical performance on the same data yields and overoptimistic result.
    - Cross validation was raised to fix this issue, starting from the remark that
      testing the output of the algorithm on new data would yield a good estimate of it's
      performance.

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

## Why Machine Learning

- Why is a Machine Learning approach more suitable?
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
        - Need something which is easily transferable between systems
    - Take the work of the past 30 years developing methods of detecting crystals
        - use it for finding features
        - complex combination of different features, giving results better than any
          individual feature.

## Feature Development

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

- Machine Learning Methods
    - Introduction to machine learning
        - What is it
        - How is it different to other techniques
        - How is it similar to other techniques
            - Finding a 'best' parameter
    - Machine Learning for Classification
        - Common algorithms
        - scikit-learn
        - development of the 'best' algorithm
            - overfitting
            - cross validation
            - accuracy vs precision vs ....
    - Machine Learning for segmentation
        - unsupervised
        - no previous knowledge

- Development of feature sets

## Detecting crystal Structures using Machine Learning

- Machine Learning for Crystal Detection
    - Existing approaches

The field of Machine Learning has well tested and documented procedures for evaluating the best
value of a parameter to use for the classification of distinct groups. The procure starts with the
collation of dataset which is labelled according to the true classification. For this dataset I used
the starting configurations of a liquid--crystal interface simulation. In these configurations, the
middle two-thirds is a crystal structure while the outer third is liquid with a sharp boundary
between them. Using the position of each local environment, I was able to assign them labels. The
molecules which lay on the liquid--crystal boundary were excluded from the analysis as they are not
well defined as either liquid or crystal and the boundary layer is artificially created. The
boundary layer for the purposes of this analysis is the first layer either side of the artificial
boundary created.

Characteristics required by a metric of the crystal melting are that it works over a range of
simulation conditions. It is no use to have a metric which needs to be tweaked to work properly with
every different simulation condition. Additionally I require a metric which is distinguish the three
different crystal structures from the liquid and from each other. For this general approach I looked
to a variety of machine learning algorithms using the Scikit Learn library.

The orientational order parameter uses the relative orientation of the molecules for identification
of local crystalline order. As a first approach I would use the relative orientations as input for
the machine learning models, although rather than combine all the values into one, I will use each
separately. A feature of the method I am using to compute the nearest neighbours is the neighbours
are returned in order of closeness, an ordering which carries into the orientation of the
neighbours. It is entirely plausible that the ordering of the orientations is additional information
the machine learning algorithm is picking up.

Using a number of different machine learning methods, the maximum classification accuracy I was able
to achieve was 96% which was achieved in a number of different models, even a complicated neural
network. This tells me that for a higher accuracy to be achieved more input data is required,
whether that be neighbour distances, longer range effects, or some other value. Additionally in
investigating many of the incorrect assignments in the liquid phase, these had the character of a
local crystalline configuration without the long range ordering. This does hint that the accuracies
in the algorithm may not be so much in the algorithm itself, but instead in my initial
classification.

Regardless of the potential issues with the classification and potential improvements, the 95%
accuracy of the K-Nearest Neighbours (KNN) classifier, along with being one of the fastest
algorithms for classification, make this ideal for classifying the melting rate of crystals.

A high accuracy is required for the classification algorithm due to the obscenely slow crystal
growth which has been observed in these crystal structures.
