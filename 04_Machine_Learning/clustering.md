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
PCA transforms the data to a new coordinate system
such that the greatest variance lies on the first coordinate
and the second greatest variance on the second coordinate.
A linear PCA is matrix factorisation using Singular Value Decomposition,
which gives a transformation that is a linear combination
of the original coordinates,
allowing the introspection of the contribution of
each original dimension to the transformed coordinates.
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

With the linear dimensionality reduction of PCA
not providing adequate separation of the crystal structures
there are a suite of non-linear methods
which could be more suitable for this problem.
The Uniform Manifold Approximation and Projection (UMAP)
is a technique for dimension reduction
with a theoretical foundation in Riemann Geometry and algebraic topology. [@McInnes2018]
The UMAP algorithm finds the nearest neighbours of every point in the untransformed space,
using the nearest neighbours to build a topological representation of the dataset.
This topological structure can then be projected onto a lower dimensional plane,
where the chosen representation minimises the difference between
the topology of the high and low dimensional representations.
This algorithm results in a low dimensional representation
that has the same local structures as the original high dimensional data,
The UMAP dimensionality reduction of @Fig:dim_reduction_UMAP of the relative angles
shows a distinct separation between the liquid state and all the crystal states.
This firstly indicates that UMAP is
a useful tool for the visualisation of these datasets,
and additionally that separation of each of the crystals
is possible using an clustering algorithm.

![Dimensionality reduction of the trimer dataset using Uniform Manifold Approximation
and Projection. Classes are assigned using the known state of each local environment.
](../Projects/MLCrystals/figures/dim_reduction_UMAP.svg){#fig:dim_reduction_UMAP width=85%}

The UMAP algorithm shows excellent promise for
visualising the clustering within this dataset,
with the drawback that each crystal is separated
into too many smaller clusters.
One of the ways of increasing the complexity of a machine learning algorithm (@sec:supervised_learning)
is to introduce more classes to distinguish between.
Before having to increase the complexity
of a machine learning algorithm to handle many classes,
is there a way of reducing the complexity
of the underlying data?
For any six values of the relative orientation
there are $6!$ points in space which represent those values
reflecting the different ways of ordering the values.
As an implementation detail of the nearest-neighbours algorithm (@sec:nearest_neighbours)
the relative orientations are ordered by their distance to the neighbour.
As molecules vibrate these distances are going to change and re-order,
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

Using the UMAP algorithm is useful for visualisation
showing an excellent correlation between the labelled clusters
and the visualisations.
In this case where we have the opportunity
to confirm the clustering with a labelled dataset,
we can be confident the clusters from the UMAP dimensionality reduction
match the labelled clustering.
However, when performing dimensionality reduction
the UMAP algorithm can artificially create tears in clusters
and increase the density of points for each cluster.
These unusual behaviours of the UMAP algorithm are shown in @fig:umap_demo,
where the two Gaussian functions in @fig:classification_demo
have been transformed into an abstract shape,
with large distances between points which were close together
and increasing the density of some points so they overlap.
The increased density of points is also present in @fig:dim_reduction_sorted_UMAP,
where all the liquid configurations are grouped together,
contrasted with the PCA dimensionality reduction (@fig:dim_reduction_PCA)
where the liquid configurations cover the entire configuration space.
These issues which make UMAP unsuitable for clustering
have been documented for the similar t-SNE algorithm
[@Maaten2008;@Schubert2017;@Wattenberg2016;@Shekhar2016]
with a consensus that these dimensionality reduction techniques of t-SNE and UMAP,
should be used for visualisation and alternative algorithms used for clustering.

![Using the UMAP algorithm on two Gaussian clusters
results in a highly distorted shape.
](../Projects/MLCrystals/figures/umap_demo.svg){width=80% #fig:umap_demo}

The visualisation of the dataset is important for three reasons.
Firstly, the failure of the Principal Components Analysis
to separate the structures indicates a non-linear method
is required for separating the different structures.
Secondly, separating the structures with the UMAP algorithm for visualisation,
indicates it is possible to separate the crystal structures using clustering.
Finally, we have found that reducing the degeneracy of the features
is an important simplification
which reduces the complexity of the following steps.

## Clustering Performance {#sec:clustering_performance}

With UMAP not being a suitable algorithm for clustering,
an alternate choice is required.
The non-linear separation allowed by UMAP
does provide a hint as to the algorithms which will be suitable.
The Hierarchical Density-Based Clustering of Applications with Noise (HDBSCAN) algorithm [@Campello2013;@McInnes2017]
was chosen for being similar to UMAP in creating a
topological representation of the data.
Clusters within the HDBSCAN algorithm are assigned to regions
of the input space containing a high density of points,
meaning the number of clusters is algorithmically determined.
The HDBSCAN algorithm doesn't require all points belong to a cluster,
where points are too far from a cluster they considered noise and left unclustered.
Since configurations of an equilibrium liquid
should be exploring all the available phase space,
considering the liquid configurations as noise is appropriate.
We are only concerned with configurations
with a higher density than the liquid.

To evaluate the results of the clustering algorithm
we will use the UMAP dimensionality reduction
shown in @fig:dim_reduction_sorted_UMAP.
Instead of the colouring being provided by
the labels we have assigned to the dataset,
they will be applied by the clustering algorithm.
These results of using the HDBSCAN algorithm for clustering
are shown in @fig:cluster_sorted_hdbscan_vis,
where the assignment of clusters from HDBSCAN
closely matches the grouping of the UMAP algorithm.
The cluster labelled -1 are the points that
the HDBSCAN algorithm considered noise,
which corresponds to the points we labelled as liquid
in @fig:dim_reduction_UMAP.
The classification of the liquid as noise
showcases the suitability of the HDBSCAN algorithm
for identifying recurring local structures within a liquid configuration.
The remaining clusters are assigned to the values 1 through 4,
these numbers have no meaning other than grouping like items together,
however, they can be assigned to each crystal structure manually
by comparing with the simulation configurations.
@fig:cluster_sorted_hdbscan uses the same colours as @fig:cluster_sorted_hdbscan_vis
so we can assign the clusters to each polymorph.
The cluster labelled 0 corresponds to the pg polymorph,
the cluster labelled 2 corresponds to the p2 polymorph,
while the clusters labelled 1 and 3
are alternating layers of the p2gg crystal.
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

::: {#fig:cluster_sorted_hdbscan class="subfigures"}

![p2](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_p2.svg){#fig:cluster_reduced_sorted_hdbscan_p2 width=33%}
![p2gg](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_p2gg.svg){#fig:cluster_reduced_sorted_hdbscan_p2gg width=33%}
![pg](../Projects/MLCrystals/figures/cluster_sorted_hdbscan_pg.svg){#fig:cluster_reduced_sorted_hdbscan_pg width=33%}

Applying the cluster labels from @fig:cluster_sorted_hdbscan_vis
to the p2 (a), p2gg (b) and pg (c) crystals using the same colourscheme.
These are the configurations used to form the local environments.

:::

Clustering is a tool allowing for the identification of
distinct local structures within a simulation
having no previous knowledge of the data.
These local structures can be manually labelled
providing information about the types of structures present.
The step of manual labelling is a downside to clustering,
with no way to apply the learned information to new datasets.
