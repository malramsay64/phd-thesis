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


A significant downside to the Supervised Classification of molecules
is the process of creating an already labelled dataset.
The process of creating a dataset
required a Monte-Carlo optimisation[@Jennings2015]
to search for possible crystal structures.
A alternate method of searching for structures
is taking simulation configurations
and using unsupervised classification
---also known as clustering---
on the configurations
using each cluster as a local structure.
The same set of configurations
used for supervised classification
are also used for the unsupervised classification.

### Visualisation

Clustering doesn't have a simple performance score
like supervised clustering,
and so we have to look to alternate methods
of evaluating performance.
One of these methods is the visualisation of the dataset.
Reducing the six dimensional dataset to two dimensions for visualisation
requires a dimensionality reduction algorithm.

The simplest method for dimensionality reduction
is Principal Component Analysis (PCA).
A linear PCA is equivalent to
a Singular Value Decomposition matrix factorisation.
PCA is a transformation of the data
to a new coordinate system
such that the greatest variance lies on the first coordinate
and the second greatest variance on the second coordinate.

![Dimensionality reduction of the trimer dataset using a linear Principal Components
Analysis. Each point is coloured according to it's labelled
structure](../Projects/MLCrystals/figures/dim_reduction_PCA.pdf){#fig:dim_reduction_PCA width=85%}

- PCA
    - What is it
    - What it shows
    - Groups the crystal structures into their components
    - there is a lot of overlap with the liquid state
    - Linear combination not adequate in 2D

A si

![Dimensionality reduction of the trimer dataset using Uniform Manifold Approximation
and Projection.
](../Projects/MLCrystals/figures/dim_reduction_UMAP.pdf){#fig:dim_reduction_UMAP width=85%}

- Too many clusters, need to reduce
- Still can get great results, but tedious matching structures
- Orientations are orders by distance from central molecule
    - a consequence of the algorithm used

![Dimensionality reduction using UMAP of the orientations ordered by value.
This greatly simplifies the number of clusters,
with the liquid, the p2 and the pg crystals all in a single cluster,
while the p2gg crystal is split across two clusters.
](../Projects/MLCrystals/figures/dim_reduction_sorted_UMAP.pdf){#fig:dim_reduction_sorted_UMAP width=85%}

### Clustering

- OPTICS

![Result of clustering on the reduced dataset using the OPTICS algorithm.
](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics_vis.pdf){#fig:cluster_reduced_sorted_optics_vis width=85%}

<div id="fig:cluster_reduced_sorted_optics" class="subfigures">

![p2](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics-p2.pdf){#fig:cluster_reduced_sorted_optics_p2 width=33%}
![p2gg](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics-p2gg.pdf){#fig:cluster_reduced_sorted_optics_p2gg width=33%}
![pg](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics-pg.pdf){#fig:cluster_reduced_sorted_optics_pg width=33%}

Applying the classified labels to the p2 (a), p2gg (b) and pg (c) crystals. Of note in
(b) is the alternating layers, showing molecules in two distinct states.

</div>



## Discussion

- Why so separated
    - no continuum of structures
    - Interlocking
    - 2D radial distribution function
