# Results

## Crystal Detection

During my honours work, I established that the most likely candidates for the crystal
structure were the p2, p2gg, and pg structures as shown below. The search for structures was first
performed using hard shapes in an isoconfigurational search algorithm developed by Toby Hudson
[@Jennings2015]. The resulting crystal structures were then relaxed using the Lennard-Jones potential
find the energy of each structure. The calculated energies (@Tbl:crystal_energies) are all within
2% of each other, indicating there is no significant driving force for a particular crystal
structure.

Crystal| Penalty
------:|--------:
p2     |   -0.199
pg     |   -0.093
p2gg   |   -0.191

Table: A Comparison on the energies of the potential crystal structures for the Trimer molecule.
{#tbl:crystal_energies}

The lack of a single definitive crystal structure requires that further investigation of the
crystallisation behaviour needs to handle all the different structures. The standard tool for
crystal detection is to use an order parameter; a single value which captures the closeness of a
configuration to the liquid state. These values are typically scaled to be of the range $[0-1]$
where 0 is completely liquid character and 1 is perfect crystal character. A measure of this type
that has been previously used in molecular crystals is an orientational order parameter $O_n$. The
value of $O_n$ is the relative orientation of nearby molecules, which is typically the nearest
shell. The measure of orientational alignment for $O_n$ is given by the equation;

$$ O_n = \langle \cos^2(\theta_{ref} - \theta_i) \rangle_i $$

where $\theta_{ref}$ is the orientation of the reference particle and $\theta_i$ is the orientation
of the particle to be compared. This value is averaged over all $i$, which in this case is the
particles in the shell of first nearest neighbours. This form of the equation only works in 2D.
While it is possible to modify the above equation to take three orientations, this is a poor
implementation due to the occurrence of gimbal lock. Additionally most simulation software uses
quaternions for orientation to alleviate the issue of gimbal lock.
The quaternion based representation,
where the central molecule has orientation $\vect{\hat{q}}_{0}$,
while the neighbours have orientation $\vect{\hat{q}}_i$

$$ O_N = \frac{1}{N} \sum_{i=1}^{N}
2\cos^2(\log(\hat{\vect{q}}_{0}^{-1}\cdot \hat{\vect{q}}_{i})) $$

The quaternion form of the orientation is still unsuitable for even the p2 structure which is the
most orientationally ordered of all three crystals. In the p2 structure the molecules are arranged
parallel and antiparallel, so both these orientations need to contribute positively to the order
parameter hence the $\cos^2$ term.

This form of the equation works reasonably well at distinguishing the liquid from the p2 crystal
phase, using $O_n > 0.85$ as the measure of the p2 crystal. There are still two issues with using
this parameter. Firstly, the value of
0.85 was chosen because I thought it worked well, with no data to validate it is the best value for
distinguishing the two phases. Secondly, $O_n$ is only suitable at identifying the p2 structure.
Both the p2 and p2gg structures are considered part of the liquid phase with the chosen parameter.

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

Clustering does not have a single performance score like supervised clustering,
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
](../Projects/MLCrystals/figures/dim_reduction_PCA.svg){#fig:dim_reduction_PCA width=85%}

With the linear dimensionality reduction
not providing adequate separation of the crystal structures
the next step is to investigate non-linear methods.
The Uniform Manifold Approximation and Projection (UMAP)
is a technique for dimension reduction with a theoretical foundation
in Riemann Geometry and algebraic topology. [@McInnes2018]
The UMAP algorithm attempts to keep neighbouring points close together,
while also retaining some of the larger scale structure.
@Fig:dim_reduction_UMAP shows the UMAP dimensionality reduction
of the dataset.
Most notable here is that there is a distinct separation
between the liquid state and all the crystal state,
supporting the supervised learning results.
While the UMAP dimensionality reduction
does separate the different groups we want to classify,
the splitting is into many separate groups.
Some of this reflects the grouping of the linear dimensionality reduction,
the splitting of the p2 and p2gg crystals into multiple clusters,
however particularly noticeable in the pg crystal
is the splitting of what was a single cluster in the linear decomposition
into 3 smaller clusters which appear to be clearly separate.

![Dimensionality reduction of the trimer dataset using Uniform Manifold Approximation
and Projection. Classes are assigned using the known state of each local environment.
](../Projects/MLCrystals/figures/dim_reduction_UMAP.svg){#fig:dim_reduction_UMAP width=85%}

The UMAP algorithm shows excellent promise for
visualising the clustering within this dataset,
with the drawback that each crystal is separated
into too many smaller clusters.
Rather than looking for a more complicated algorithm for this,
is there a way of reducing the complexity
of the underlying data?
Currently the angles between molecules are ordered
by the distance to the neighbouring molecules.
As the molecules vibrate these distances are going to change
and likely re-order,
which is a possible explanation for
each crystal having many distinct clusters.
In other methods for crystal detection,
spherical harmonics are used remove any orientation dependence[@Boattini2018],
which doesn't map well to this problem.
Instead I sort by the value of the angles,
reducing the data to a list of angles
without any order.
The result of sorting the angles is shown in @fig:dim_reduction_sorted_UMAP,
with each crystal having a clearly separated cluster,
apart from the p2gg crystal which has two distinct clusters.

![Dimensionality reduction using UMAP of the orientations ordered by value.
This greatly simplifies the number of clusters,
with the liquid, the p2 and the pg crystals all in a single cluster,
while the p2gg crystal is split across two clusters.
](../Projects/MLCrystals/figures/dim_reduction_sorted_UMAP.svg){#fig:dim_reduction_sorted_UMAP width=85%}

In this approach the sorting acts as a dimensionality reduction,
removing structural variations form the structures,
and has the effect of making further dimensionality reduction simpler.
Since sorting the size of the angles made the visualisation so much simpler,
wouldn't it make sense to also apply this technique to the supervised learning?
For this dataset it doesn't.
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

## Machine Learning in Practice

The ultimate test of any machine learning algorithm
is how well it holds up in real world applications.
This will be how well it can monitor
the melting of a crystal.
@Fig:melting demonstrates the ability
of the resulting algorithm to distinguish
the liquid from the solid in a complex simulation.

:::{class=subfigures id=fig:melting}

![Melting near start](../placeholder_figure.png){width=80%}

![Melting at middle](../placeholder_figure.png){width=80%}

![Melting near end](../placeholder_figure.png){width=80%}

Figures showing the progression of melting of a p2 crystal.
The colour of the molecules describes their orientation.
The lighter molecules are classified as liquid while
the darker molecules are classified as crystalline.

:::
