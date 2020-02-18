# Clustering {#sec:clustering}

The goal of clustering
is to group together similar local environments
with no previous knowledge of the dataset.
Clustering is hard to give a numerical score like supervised clustering,
so we look to alternate methods of evaluating performance.
Visualisation of the dataset like in @fig:order_parameter_overlap
is a fantastic method of understanding the data
and evaluating how well the clustering has performed.
For clustering, each local environment is described by six features,
that is, represented as a point in 6D space,
making the visualisation on a 2D page somewhat more difficult.
Before evaluating the performance of the clustering
we need to find appropriate tools for visualising
the high dimensional data.

## Visualisation of High Dimensional Data {#sec:visualisation}

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
is possible using an clustering algorithm.

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
As an implementation detail of the nearest-neighbours algorithm [@sec:nearest_neighbours]
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
indicates it is possible to separate the crystal structures using clustering.
Finally, we have found that reducing the degeneracy of the features
is an important simplification
which reduces the complexity of subsequent steps.

## Clustering Performance {#sec:clustering_performance}

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
This shows the assignment of clusters
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

Clustering is a tool allowing for the identification of
distinct local structures within a simulation
having no previous knowledge of the data.
These local structures can be manually labelled
providing information about the types of structures present.
The step of manual labelling is a downside to clustering,
with no way to apply the learned information to new datasets.
