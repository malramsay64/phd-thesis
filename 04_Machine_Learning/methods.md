# Methods

## Creation of Dataset

- Simulation to create
    - Create crystal structure at low temperature
        - Crystal sizes
            - p2 -> 48 x 42
            - pg -> 48 x 42
            - p2gg -> 48 x 21
        - Orthogonalisation of simulation cell -> for p2 crystal
    - Melting of the outer interface at high temperature
        - 500_000 timesteps
        - Central region not integrated
        - Rescale all particles during integration
            - Increasing the unit cell volume increases the spacing of the crystal
        - Temperature
            - P=13.50 -> 5.00
            - P=1.00  -> 1.50
    - 'Equilibration' of liquid at desired temperature
        - 10_000 steps
        - Only interested in finding representative structures
            - can take shortcuts to save time
            - Algorithm is intended to be general
    - Production simulation
        - generating configurations to track melting
        - Also closer together configurations
        - Initial crystal is still in perfect crystal configuration

- Creation of labelled data
    - Use configuration at timestep 100
        - This gets a range of thermal motions within the crystal without melting too
          far
        - The melting is important for the higher temperatures

## Machine Learning Methods

The methodology from the machine learning

### Cross Validation

- As a method to choose which value is best
    - just as applicable to low dimensionality

- 10 fold cross validation best for model selection [@Breiman1992]
- Between 5 and 10 is preferable [@Arlot2010]

### Measuring Success

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

- @Goldberger2005
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
