# Machine Learning for Crystal Detection

## Introduction to Machine Learning

Machine learning is a technique by which
A machine learns when it changes it's
structure, program, or data
based on external information
such that it's expected future performance improves. [@Nillson]
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

- [@Arlot2010]
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
