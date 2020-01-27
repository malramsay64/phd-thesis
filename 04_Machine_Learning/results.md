# Results

The orientational order parameter $O_6$ [@eq:orientational_order_parameter] had problems
because it reduces 6 values to 1.
For the Machine Learning models,
rather than reducing the 6 values,
instead we can use the relative orientation of each neighbour $\theta_{ref} - \theta_i$
as the features for our models.
Features in machine learning
are measured quantities used to differentiate the input.

## Unsupervised Classification

The goal of unsupervised classification is to group
local environments of each crystal structure into clusters
while having no previous knowledge of the dataset.
Clustering is hard to give a numerical score like supervised clustering,
so we look to alternate methods of evaluating performance.
Visualisation of the dataset like in @fig:order_parameter_overlap
is a fantastic method of understanding the data
and evaluating how well the clustering has performed.
For the unsupervised classification,
each local environment is described by six features,
that is, represented as a point in 6D space,
making the visualisation on a 2D page somewhat more difficult.
Before evaluating the performance of the Unsupervised Classification
we need to find appropriate tools for visualising
the high dimensional data.

### Visualisation of High Dimensional Data {#sec:visualisation}

When visualising data on a page, like in this thesis,
we are limited to the display of two spatial dimensions at a time.
So in visualising a six dimensional dataset,
the problem becomes one of reducing the number of dimensions to two,
while retaining properties of the six dimensional dataset.
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
is that the crystal structures are not linearly separable in 2D.

![Dimensionality reduction of the trimer dataset using a linear Principal Components
Analysis. Each point is coloured according to it's labelled structure. There are regions
of high density for each crystal structure, though there is little separation of the
crystal structures.
](../Projects/MLCrystals/figures/dim_reduction_PCA.svg){#fig:dim_reduction_PCA width=85%}

With the linear dimensionality reduction
not providing adequate separation of the crystal structures
there are a suite of non-linear methods
which could be more suitable for this problem.
The Uniform Manifold Approximation and Projection (UMAP)
is a technique for dimension reduction
with a theoretical foundation in Riemann Geometry and algebraic topology. [@McInnes2018]
The UMAP algorithm finds the nearest neighbours of every point in space,
using it to find a low dimensional representation
where points share the same neighbours.
The low dimensional representation has the same local structures
as the original high dimensional data,
The UMAP dimensionality reduction of @Fig:dim_reduction_UMAP of the relative angles
shows a distinct separation between the liquid state and all the crystal states.
This firstly indicates that UMAP is
a fantastic tool for the visualisation of these datasets,
and additionally that separation of each of the crystals
is possible using an Unsupervised Learning algorithm.

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

Using the UMAP algorithm is excellent for visualisation
showing an excellent correlation between the labelled clusters
and the visualisations.
In this case where we have the opportunity
to confirm the clustering with a labelled dataset,
we can be confident the clusters from the UMAP dimensionality reduction
match the labelled clustering.
However, when performing the dimensionality reduction
the UMAP algorithm can artificially create tears in clusters
and additionally increase the density of points for each cluster.
The increased density of points is present for the liquid,
with @fig:dim_reduction_sorted_UMAP having a nice clustering
of all the liquid configurations,
while the Principal Component Analysis (@fig:dim_reduction_PCA)
visualises the liquid as covering all the phase space.
These issues which make UMAP unsuitable for clustering
have been documented for the similar t-SNE algorithm
[@Maaten2008;@Schubert2017;@Wattenberg2016;@Shekhar2016]
with a consensus that these dimensionality reduction techniques
should be used for visualisation and other algorithms used for clustering.

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

With UMAP not being a suitable algorithm for clustering,
an alternate choice is required.
The non-linear separation allowed by UMAP
does provide a hint as to the algorithms which will be suitable.
The algorithm chosen for clustering is HDBSCAN [@Campello2013;@McInnes2017]
which finds areas of high density assigning them to clusters.
The HDBSCAN algorithm doesn't require all points to belong to a cluster,
with those too far from an area of high density
being considered noise and left unclustered.
Leaving points unclustered is a better fit for clustering configurations
since only configurations which have a high density of points,
that is locally favoured configurations
will be assigned to a cluster.
The result of clustering using the HDBSCAN algorithm
is displayed in @fig:cluster_sorted_hdbscan_vis
using the UMAP algorithm for visualisation (see @sec:visualisation).
This shows the unsupervised assignment of clusters
matches the groups formed from the visualisation.
The assignment of structures to the clusters
has to be performed manually,
with @fig:cluster_sorted_hdbscan displaying the entire configurations
from which the assignment can be made.
Most interesting is that the structure of the p2gg crystal
has two distinct alternating layers
which explains why there are more clusters than distinct crystals.
This additional knowledge demonstrates that
while the dataset used in the clustering
was known and understood,
the clustering made no use of that knowledge.

![Result of clustering using the HDBSCAN algorithm
using the six dimensional features.
The resulting cluster assignment is visualised using
the UMAP dimensionality reduction as a method of gauging
the effectiveness of the clustering algorithm.
The label -1 indicates points in no cluster,
while all other labels have no meaning.
](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_vis.svg){#fig:cluster_sorted_hdbscan_vis width=80%}

<div id="fig:cluster_sorted_hdbscan" class="subfigures">

![p2](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_p2.svg){#fig:cluster_reduced_sorted_hdbscan_p2 width=33%}
![p2gg](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_p2gg.svg){#fig:cluster_reduced_sorted_hdbscan_p2gg width=33%}
![pg](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_pg.svg){#fig:cluster_reduced_sorted_hdbscan_pg width=33%}

Applying the cluster labels from @fig:cluster_sorted_hdbscan_vis
to the p2 (a), p2gg (b) and pg (c) crystals using the same colourscheme.
These are the configurations used to form the local environments.

</div>

Unsupervised Learning, or clustering
is a tool allowing for the identification of
distinct local structures within a simulation
with no previous knowledge of the data.
These local structures can be manually labelled
providing information about the types of structures present.
The step of manual labelling is a downside to clustering,
with no way to apply the learned information to new datasets.

## Supervised Learning

Unsupervised learning is unable to give a specific label to a configuration,
requiring manual labelling by a researcher,
a tedious and time consuming task.
This is the domain of Supervised Learning.
Supervised Learning is the task of taking features
which have been manually labelled
and developing an algorithm which can assign that same label
to sets of previously unlabelled features.
The creation of the manually labelled dataset
is a crucial part of the process,
and @sec:unsupervised_learning presents a method
for constructing this dataset for some unstructured crystal growth data.

There are a wide range of algorithms
which can be used for supervised learning,
ranging from a linear model, to a deep neural network.
The first step in evaluating performance
is to find a suitable algorithm.

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

![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2_9.svg){width=33%}
![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2gg_9.svg){width=33%}
![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_pg_9.svg){width=33%}

![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2_1499.svg){width=33%}
![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2gg_1499.svg){width=33%}
![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_pg_1499.svg){width=33%}

![Melting near
start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2_2999.svg){width=33%}
![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2gg_2999.svg){width=33%}
![Melting near start](../Projects/Crystal_Melting/figures/ml_demo_trimer_pg_2999.svg){width=33%}

Figures showing the progression of melting of a p2 crystal.
The colour of the molecules describes their orientation.
The lighter molecules are classified as liquid while
the darker molecules are classified as crystalline.

:::
