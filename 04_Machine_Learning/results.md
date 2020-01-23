# Results

Using the relative orientation $\theta_{ref} - \theta_i$
as the features, that is the input to the machine learning model.
The orientational order parameter $O_6$ [@eq:orientational_order_parameter] had problems
because it reduces 6 values to 1.
For the Machine Learning models,
rather than reducing the 6 values,
instead we can use the relative orientation
of each neighbour as the features for our models.

## Unsupervised Classification

The goal of unsupervised classification is to group
each the local environments of the different crystal structures
into clusters with no previous knowledge of the dataset.
Clustering does not have a single performance score like supervised clustering,
and so we have to look to alternate methods
of evaluating performance.
One of these methods is the visualisation of the dataset
like in @fig:order_parameter_overlap.
Now that each local environment is described by six values,
that is, represented as a point in 6D space,
visualisation is trickier,
now requiring the reduction of dimensions to 2.

### Visualisation of High Dimensional Data

The simplest method for dimensionality reduction
is Principal Component Analysis (PCA).
A linear PCA is matrix factorisation using Singular Value Decomposition.
PCA transforms the data to a new coordinate system
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
a result reflected in the Supervised learning results.

![Dimensionality reduction of the trimer dataset using a linear Principal Components
Analysis. Each point is coloured according to it's labelled structure. There are regions
of high density for each crystal structure, though there is little separation of the
crystal structures.
](../Projects/MLCrystals/figures/dim_reduction_PCA.svg){#fig:dim_reduction_PCA width=85%}

With the linear dimensionality reduction
not providing adequate separation of the crystal structures
there are a suite of non-linear methods.
The Uniform Manifold Approximation and Projection (UMAP)
is a technique for dimension reduction
with a theoretical foundation in Riemann Geometry and algebraic topology. [@McInnes2018]
The UMAP algorithm keeps points which are close in 6D,
close together in the 2D representation,
while also retaining the general structure over longer distances.
The UMAP dimensionality reduction of @Fig:dim_reduction_UMAP of the relative angles
shows a distinct separation between the liquid state and all the crystal states,
indicating that separation is possible with an Unsupervised Learning algorithm.
While the UMAP dimensionality reduction
does separate each of the different groups we want to classify,
each is split into many smaller components.

![Dimensionality reduction of the trimer dataset using Uniform Manifold Approximation
and Projection. Classes are assigned using the known state of each local environment.
](../Projects/MLCrystals/figures/dim_reduction_UMAP.svg){#fig:dim_reduction_UMAP width=85%}

The UMAP algorithm shows excellent promise for
visualising the clustering within this dataset,
with the drawback that each crystal is separated
into too many smaller clusters.
One of the ways of increasing the complexity of a machine learning algorithm [@sec:supervised_learning]
is to introduce more classes to distinguish between.
Before having to increase the complexity
of a machine learning algorithm to handle many classes,
is there a way of reducing the complexity
of the underlying data?
For any six values of the relative orientation
there are $6!$ points in space which represent those values
reflecting the different ways of ordering the values.
As an implementation detail of the nearest-neighbours algorithm [@sec:nearest-neighbours]
the relative orientations are ordered by
the distance to the neighbour.
As molecules vibrate these distances are going to change re-order,
a possible explanation for each crystal having many distinct clusters.
We need a method of reducing the degeneracy of states.
By sorting the values of relative orientation from smallest to largest,
any six values are only represented by a single point in space.
The result of sorting the angles is shown in @fig:dim_reduction_sorted_UMAP,
with each crystal having a separated cluster,
apart from the p2gg crystal which has two distinct clusters.

![Dimensionality reduction using UMAP of the orientations ordered by value.
This greatly simplifies the number of clusters,
with the liquid, the p2 and the pg crystals all in a single cluster,
while the p2gg crystal is split across two clusters.
](../Projects/MLCrystals/figures/dim_reduction_sorted_UMAP.svg){#fig:dim_reduction_sorted_UMAP width=85%}

The visualisation of the dataset is important for three reasons.
Firstly, the failure of the Principal Components Analysis
to separate the structures indicates a non-linear method
is required for separating the different structures.
Secondly, separating the structures with the UMAP algorithm for visualisation,
indicates it is possible to separate the crystal structures
using a Unsupervised Learning or clustering method.
Finally, we have found that reducing the degeneracy of the features
is an important simplification
which reduces the complexity of subsequent steps.

### Clustering

The algorithm chosen for clustering is OPTICS [@Kriegel2011],
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
](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics_vis.svg){#fig:cluster_reduced_sorted_optics_vis width=85%}

<div id="fig:cluster_reduced_sorted_optics" class="subfigures">

![p2](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics-p2.svg){#fig:cluster_reduced_sorted_optics_p2 width=33%}
![p2gg](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics-p2gg.svg){#fig:cluster_reduced_sorted_optics_p2gg width=33%}
![pg](../Projects/MLCrystals/figures/cluster_reduced_sorted_optics-pg.svg){#fig:cluster_reduced_sorted_optics_pg width=33%}

Applying the classified labels to the p2 (a), p2gg (b) and pg (c) crystals. Of note in
(b) is the alternating layers, showing molecules in two distinct states.

</div>

Using the UMAP algorithm is excellent for visualisation
showing an excellent correlation between the labelled clusters
and the visualisations.
In this case where we have the opportunity
to confirm the clustering with a labelled dataset
we can be confident the clusters from the UMAP dimensionality reduction
match the labelled clustering.
However, in performing the dimensionality reduction
the UMAP algorithm can artificially create tears in clusters
and will increase the density of points.
This has been discussed for the similar t-SNE algorithm
[@Maaten2008;@Schubert2017;@Wattenberg2016;@Shekhar2016]
with the resolution that the dimensionality reduction
can be used when care is taken in the analysis,
using additional techniques to ensure the clusters make sense.
@Fig:dim_reduction_UMAP demonstrates the tearing that is possible in clusters,
with the pg cluster being torn into three very distinct regions.
In addition the liquid region appears to be all similar,
all in a single, or possibly two high density regions.
These are features which are more a feature of the UMAP algorithm
rather than the underlying dataset.
For this particular use case,
the use of UMAP is best left as a visualisation tool
rather than a pre-processing step.

While UMAP is not suitable as a pre-processing step for clustering,
the separation of the crystal structures
means it is possible with an appropriate clustering algorithm.
The algorithm chosen for clustering is HDBSCAN [@Campello2013;@McInnes2017]
which finds areas of high density as clusters,
leaving the noise as unclustered values.
Using the HDBSCAN algorithm has a significant difference
from clustering the reduced data,
namely that the liquid in this case is considered noise and not clustered,
indicated by the assignment to the group labelled -1.
Having the liquid classified as noise
better reflects its structure in real space,
and highlights one of the issues
using UMAP for dimensionality reduction.
While it is great as a visualisation,
showing the large scale structure of the space,
much of the local structure is lost.
Furthermore,
the HDBSCAN algorithm has the ability
to detect finer details of the liquid state,
identifying clusters of smaller sizes within the liquid,
representing common and possibly more stable local structures.

![Result of clustering using the HDBSCAN algorithm and visualised using the UMAP
dimensionality reduction. The liquid is in the class with identifier -1, indicating that
it is considered noise.
](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_vis.svg){#fig:cluster_sorted_hdbscan width=80%}

## Supervised Classification

There are a wide range of algorithms
which can be used for supervised classification,
ranging from a linear model, to a deep neural network.
The first step in evaluating performance
is to find a suitable algorithm.
@Tbl:classification_performance shows a range of algorithms tested,
with each being described in @sec:supervised-learning-algorithms.
Of the algorithms shown in @tbl:classification_performance,
there are three which stand out for their performance;

- K-Nearest Neighbours (KNN),
- Decision Tree (DT), and
- Neural Network (NN).

The excellent performance of the decision tree algorithm is interesting,
since it is sequence of conditional checks,
which could have been written manually.
However, the manual approach is both
error-prone and difficult to update.
Furthermore, the values at the decision points
are important to the robustness and accuracy
of the resulting algorithm.
The values which have been chosen using machine learning
are those which perform the best
over all the input configurations.

Algorithm Accuracy Training Time  Match Time
--------- -------- -------------  ----------
NN          96          long        long
KNN         96          short       short

Table: The performance of a range of ML algorithms {#tbl:classification_performance}

The above scores were obtained using all default parameters,
having no specific tuning for each dataset.
Establishing whether it is possible to make optimisations
requires more of an understanding of the underlying classification.
A confusion matrix is a representation
of where misclassification takes place
and is a useful tool for understanding
the limitations of a model.

![The confusion matrices KNN](../Projects/MLCrystals/figures/knn-confusion_matrix.pdf)

The input dataset has roughly the same number
of local structures which are liquid and crystal,
however, with the three different crystal structures
this means there are three times as many liquid configurations
as there are crystal.
To account for this imbalance in the dataset,
the accuracy metric which we are optimising is `balanced_accuracy`,
which combines the fractions of each class scored correct.

Looking at the confusion matrix,
the misclassification with the largest impact on accuracy,
is the p2gg crystal being predicted as a liquid.
This is closely followed by the p2 and pg crystals
being incorrectly classified as liquid.
There are many possible explanations for this,
from vibrations or defects within the crystal structure,
particularly at the higher temperatures,
or alternatively the melting of the crystal,
Additionally, this only looks at structure at a single point in time,
both the liquid and crystal structures can be considered vibrations
around an inherent structure.
These vibrations can mean that liquid-like and crystal-like
structure can have some level of overlap
when considered at a single point in time.
When considering the range of conditions
over which these configurations are comprised,
greater than any theory of melting can describe,
this result is incredibly impressive.

Supervised learning is about drawing boundary regions in high dimensional space,
and the best preforming algorithm, K-Nearest Neighbours,
is able to create a complex boundary region given enough training data.
There is no shortage of training data for the supervised learning,
and so a simplification is not necessary.
However, when comparing the performance of other, simpler algorithms,
their performance increases more than 20%
when using sorted angles compared to no sorting.
Where more parameters are required to describe a crystal structure,
having an appropriate ordering of the dimensions
is likely required for getting the best results.
Additionally, the simplified behaviour emphasises
a major trade-off in machine learning,
a less optimal choice of features
requires a more complicated algorithm to classify the data,
while an excellent choice of features
can require a very simple algorithm for classification.

## Machine Learning in Practice

The ultimate test of any machine learning algorithm
is how well it holds up in real world applications.
This will be how well it can monitor
the melting of a crystal.
@Fig:melting demonstrates the ability
of the resulting algorithm to distinguish
the liquid from the solid in a complex simulation.

:::{class=subfigures id=fig:melting}

![Melting near start](../placeholder_figure.png){width=49%}

![Melting at middle](../placeholder_figure.png){width=49%}
![Melting near end](../placeholder_figure.png){width=49%}

Figures showing the progression of melting of a p2 crystal.
The colour of the molecules describes their orientation.
The lighter molecules are classified as liquid while
the darker molecules are classified as crystalline.

:::
