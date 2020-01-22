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

## Labelling Local structures

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
The center region is labelled as the crystal it was created as,
while the outside is classified as liquid](../placeholder_figure.png){width=80% #fig:labelling_structures}

## Algorithms and Parameters

The algorithms used for the machine learning
leverage the scikit-learn package [@Pedregosa2012]
utilising the well designed interface. [@Buitinck2013]

### Measuring Success

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
