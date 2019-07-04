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
@Fig:dim_reduction_PCA shows the first two dimensions of the PCA
with each local structure plotted as a point.
The PCA analysis shows the liquid occupying the full range of values,
reflecting the liquid state being able to explore the full range of configurations.
Additionally the PCA generally groups the crystal configurations together,
though there is little separation of the pg crystal from the liquid,
while the p2 and the p2gg crystals are inseparable from the liquid.
The main result of the PCA analysis,
is that the crystal structures are not linearly separable,
which is also reflected in the Supervised learning results.

![Dimensionality reduction of the trimer dataset using a linear Principal Components
Analysis. Each point is coloured according to it's labelled structure. There are regions
of high density for each crystal structure, though there is little separation of the
crystal structures.
](../Projects/MLCrystals/figures/dim_reduction_PCA.pdf){#fig:dim_reduction_PCA width=85%}

Using a non-linear dimensionality reduction
is another approach to

- non-linear approach
    - umap
    - retains local structure, and global structure
- Liquid is mostly co-located in single location
    - does appear to be two somewhat distinct groups
- Lots of groups for the crystals
    - This matches the linear Decomposition
    - 3 groups of p2
    - at least 4 groups for p2gg
    - pg over on it's own
- Most importantly clear separation of the liquid and each of the crystals.


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

- Sorting works for clustering
    - simplifying the data
    - a method of dimensionality reduction
    - like only having half a matrix to work with
- There is no advantage for supervised learning
    - Algorithms able to generate complex boundaries
    - KNN and DT in particular
    - There are enough points in each configuration for there not to be and issue
- However for higher dimensional space this could be important
- It is also possible to see that many configurations are misclassified


### Clustering

From the visualisation of the dimensions in 2D,
the non-linear transformation of the UMAP algorithm
clearly separates each of the crystal structures.
The next problem is finding a clustering algorithm
which appropriately groups each of the points
into their respective clusters.

The algorithm chosen for clustering is OPTICS,
which uses the local density for determining clusters,
highly suitable to the data generated from using UMAP
to perform a dimensionality reduction,
where there are centers of high density.
Other features of the OPTICS algorithm
which make it suitable for this application
is the classification of oddly shaped regions,
which is a good description
of the points in the reduced dimensionality.
Furthermore, the OPTICS algorithm
requires no information about the number
or shape of the clusters when performing the clustering,
requiring little optimisation of parameters to create the clustering.

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
