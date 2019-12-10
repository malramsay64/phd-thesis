# Introduction

## Machine Learning Methodology

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
