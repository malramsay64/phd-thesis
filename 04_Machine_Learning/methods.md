# Methods

## Creation of Dataset

- Simulation to create
- Creation of labelled data

## Machine Learning Methods


## Cross Validation

- As a method to choose which value is best
    - just as applicable to low dimensionality

- 10 fold cross validation best for model selection [@Breiman1992]
- Between 5 and 10 is preferable [@Arlot2010]

## Measuring Success

- confusion matrices
- accuracy
- precision
- recall
- F1 score
- false positives/negatives

## Algorithms used and Parameters

- scikit-learn [@Pedregosa2012]
    - API design [@Buitinck2013]

### Supervised Learning

#### K-Nearest Neighbours

- [@Goldberger2005]
    - Simple method
    - Single tunable parameter
    - Non-linear decision surface
    - Use of kd-trees to reduce dimensionality search [@Bentley1975]
        - This is similar to neighbour search approaches in molecular dynamics [@Howard2016]


- Labelling the datasets
- Types of classifiers
    - algorithms
- Cross validation

### Unsupervised Learning

- Approach to clustering
