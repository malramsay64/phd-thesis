# Results

## Supervised Classification

- Decision Tree
    - In the case of the decision tree,
        this could have been entirely written by hand
        using conditional statements.
        However that approach is error-prone,
        difficult to maintain,
        time consuming to write,
        and would likely have no basis
        for choosing any of the values other than
        it works for this single configuration I looked at.

- Use of accuracy
    - Unbalanced dataset
        - 3 times as many liquid configurations as each crystal
        - Use balanced_accuracy
            - account for unbalanced dataset

 - Is it possible to improve the score
    - The accuracies presented here are in excess of 97\%
    - Looking at the confusion matrix,
        - The diagonal elements are where the model correctly predicted the class
        - Off diagonal elements are where the model was wrong
        - Most of the incorrect values are crystals predicted as liquid
            - Vibrations of crystal structure
    - The liquid structure by nature of visiting all possible configurations,
        will exhibit structures which are very crystalline in nature.
        - this is particularly true for the small local structures we are investigating
        - Move to larger configurations could help this, although at the expense
            of spatial granularity.
    - More degrees of freedom/features?
        - It would potentially be possible to add more degrees of freedom
        - Include more than a single neighbourhood
        - Include distance to molecules
        - include angles to molecules
        - Is it useful here?
    - More complicated algorithm?
        - KNN is simple
        - Deep neural networks are all the rage
            - use computing time instead of good features
            - Massively complicated and compute heavy
        - In this case it is possible to express the difference
            - using insight to guide selection of features
        - Simple model is far more useful for using the model in production

- Choice of algorithm
    - Not just for performance in correctness
    - Performance with regards to classifying quickly

## Unsupervised Classification

A significant downside of the approach required
for the Supervised Classification of molecules
was that a dataset with labels needed to be created.
This required additional techniques to search for
the likely crystal structures.

- Visualisation of features
    - PCA
        - What is it
        - What it shows
        - Groups the crystal structures into their components
        - there is a lot of overlap with the liquid state
        - Linear combination not adequate in 2D
    - t-SNE
        - More complex algorithm
        - tries to keep geometry the same in the flattened visualisation
        - Complicated function
        - Each crystal structure has multiple clusters
            - Make clustering by structure difficult
            - Require more clusters?

- Clustering
    - Which algorithms worked best

- Detection of different crystal structures
