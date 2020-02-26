# Machine Learning Methodology

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

## Machine Learning Algorithms

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

### Feature Development

The features of a machine learning model
are the set of quantities passed to the model.
For example when we perform a linear regression there is a single feature,
one input value which can be used to predict an output value.
Feature selection is the most important part of machine learning
with a good set of features requiring domain expertise.
The features are a set of values which best describe
the underlying behaviour.

## Labelling Local structures {#sec:methods_ml_dataset}

The creation of the simulation provides configurations
which can then be used for the task of classification.
The dataset contains a collection of configurations
like the one depicted in @fig:labelling_structures.
Each of these contains a crystalline region
in which every local configuration is labelled
as being crystal in nature.
Surrounding this is the interface between the liquid and crystal,
a region which was excluded from the training dataset
as the liquid or crystal nature is not well defined
while also acting as a buffer for melting.
Finally the local configurations around the outside
are all classified as liquid in nature.
This is all collated into a dataset which contains
the information on the local structure and
the assigned label.

![Image describing the different labelled regions of a configuration.
The center region is labelled as the crystal used to create the configuration,
while the outside is classified as liquid.
](../Projects/MLCrystals/figures/labelled_config.svg){width=80% #fig:labelling_structures}

## Algorithms and Parameters

The algorithms used for the machine learning
leverage the scikit-learn package [@Pedregosa2012]
utilising the well designed interface. [@Buitinck2013]

### Measuring Success {#sec:measuring_success}

Another important part of machine learning
is the method used to measure success.
The type of measurement can depend on the dataset
and the goals of the algorithm.
It should be noted that the machine learning algorithm
will be optimised to score highly in whichever metric is chosen.
The metric used for these simulations is the balanced accuracy.
[@Brodersen2010;@Kelleher2015]
This score calculates the accuracy for each of the individual classes,
in this case for the p2, p2gg, and pg crystals along with the liquid
and combines the fraction of each to give the final score.
