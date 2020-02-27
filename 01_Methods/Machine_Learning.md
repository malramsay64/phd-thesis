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

## Labelling Local structures {#sec:methods_ml_dataset}

The creation of the simulation provides configurations
which can then be used for the task of classification.
The dataset contains a collection of configurations
like the one depicted in @fig:labelling_structures.
Each of these contains a crystalline region
in which every local configuration is labelled as crystal in nature.
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

## Measuring Success {#sec:measuring_success}

An important aspect of machine learning models
is the measure of success.
The type of measurement can depend on the dataset
and the goals of the algorithm,
with the algorithm optimised to score highly in the chosen metric.
When measuring success for a classification task,
the confusion matrix in @tbl:methods_confusion describes
all possible outcomes of the classification. [@Fawcett2006]
The values within the confusion matrix
can be combined with the number of positive samples $P$
and the number of negative samples $N$
to condense the confusion matrix into a single value.
The *accuracy* $ACC$ is the fraction of samples
which have been correctly classified

$$ ACC = \frac{TP + TN}{P + N} $$

The metric used in this thesis is the *balanced accuracy* $BACC$
which takes into account the size of each group

$$ BACC = \frac{1}{2} \left[ \frac{TP}{P} + \frac{TN}{N} \right] $$

and is a common metric when dealing with small imbalances
in the size of the datasets. [@Brodersen2010;@Kelleher2015]

**               | Positive | Negative |
------           |--        |--        |
Predict Positive | TP       | FP       |
Predict Negative | FN       | TN       |

Table: The confusion matrix of a classification into two classes, positive and negative.
There are four possible outcomes,
true positive (TP) where the predicted result is correct and positive,
true negative (TN) where the predicted result is correct and negative,
false positive (FP) where the predicted result is incorrect and positive,
false negative (FN) where the predicted result is incorrect and negative. {#tbl:methods_confusion}
