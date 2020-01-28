# Results

The orientational order parameter $O_6$ [@eq:orientational_order_parameter] had problems
because it reduces 6 values to 1.
For the Machine Learning models,
rather than reducing the 6 values,
instead we can use the relative orientation of each neighbour $\theta_{ref} - \theta_i$
as the features for our models.
Features in machine learning
are measured quantities used to differentiate the input.

## Clustering {#sec:clustering}

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

### Clustering Performance {#sec:clustering_performance}

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

## Supervised Learning {#sec:supervised_learning}

The process of clustering is unable to give a specific label to a configuration,
requiring manual labelling by a researcher,
a tedious and time consuming task.
This is the domain of Supervised Learning.
Supervised Learning is the task of taking features
which have been manually labelled
and developing an algorithm which can assign that same label
to sets of previously unlabelled features.
The creation of the manually labelled dataset
is a crucial part of the process,
and @sec:clustering_performance presents a method
for constructing this dataset for some unstructured crystal growth data.
In this section we develop a method
for taking a small manually labelled dataset
and training an algorithm to apply those labels to new data.

The algorithm used for the supervised learning is
the K-Nearest Neighbours (KNN),
which uses labels of the configurations closest in feature space
to label an unknown configuration.
This algorithms gives a balanced accuracy of 97.0%,
where the balanced accuracy accounts for the slight imbalance in the dataset.
The configurations used for training contain
the same number of liquid and crystal configurations,
however there are three different crystals and only a single liquid.
This means that there are three times as many liquid configurations as any crystal
and guessing every configuration is liquid would have an accuracy of 50%
rather than 25% for a balanced dataset.
The balanced accuracy score finds the accuracy for each class
and combines those percentages.
Handling imbalanced data is a large problem within machine learning
[@He2009;@Brabec2020;@Vandewiele2020]
however a balanced accuracy score is an appropriate mitigation tool
for this small imbalance.
The balanced accuracy is scored for data previously unseen
during the training and optimisation of the model,
known as a holdout dataset [@Kohavi1995]
The use of a holdout dataset
is the standard method of publishing results from machine learning algorithms.
Scoring an algorithm using previously unseen data
is important as algorithms are able to memorise the data given to them
resulting in fantastic performance on the presented dataset
and much poorer performance on unseen data.

With an accuracy of 97% for the KNN algorithm,
there is potentially room for improvement.
However, before looking at ways of getting closer to 100%,
does that make sense as a target?
In the visualisation of the dataset in @fig:dim_reduction_sorted_UMAP,
there are some points labelled as crystalline
which are located with those of the liquid,
and conversely some labelled as liquid and located near the crystal.
It is entirely possible for local configurations
to be incorrectly labelled within the training dataset,
meaning increasing the accuracy for this dataset is a result of overfitting.
Another complication has to do with the properties of an equilibrium liquid,
which will explore the space of all possible local configurations
some of which will be locally crystalline in nature.
While there will inherently be some errors in classification,
that doesn't mean the KNN algorithm is best suited for the task.
Similar problems for the identification of crystal structures,[@Fulford2019;@Boattini2018;@Geiger2013]
use Neural-Network based algorithms.
While Neural-Network algorithms are more complex and complicated,
that doesn't mean they perform better.
In a study of neural network algorithms presented at top conferences,
@Dacrema2019 find that six of the seven neural-network models they could reproduce
were outperformed by a simpler nearest-neighbour or graph-based algorithm.
While the remaining neural-network algorithm performed on par with the simpler algorithms.
These findings match my own investigation of a neural-network,
which performed within the margin of error of the KNN model,
while both being slower to train the model on the input data
and slower for the classification of new data.

Here we have presented a method
for taking a small manually labelled dataset
and training an algorithm to apply those labels to new data
with fantastic accuracy.

## Machine Learning in Practice

Developing a machine learning model which performs well
on a labelled dataset
is only part of the challenge in machine learning.
The algorithm has to also be useful in the real world,
applying the learned labels to new data.
In the presentation of the results in @sec:supervised_learning
a holdout dataset was used, [@Kohavi1995]
however @Vandewiele2020 found that
many studies presenting near perfect results
were inadvertently leaking samples from the holdout dataset
through techniques for overcoming issues of data imbalance. [@He2009]
While @sec:supervised_learning demonstrates
the effectiveness of a KNN algorithm
for the labelling of local structures in one dataset,
it doesn't show whether the algorithm is suitable
for a generalised case using completely different data.

The KNN algorithm will be used in @sec:Crystal_Melting
for monitoring the melting of each crystal structure.
The dataset used in @sec:Crystal_Melting,
is completely different to that used in this chapter,
in particular containing the melting over a long timescale.
@Fig:melting shows the application of the KNN algorithm
developed in @sec:supervised_learning applied to
the melting of each of the crystal structures.
The colouring of the orientation of each molecule
is intended as a guide
for the identification of regions of orientational ordering,
a way of visually confirming the KNN algorithm
adequately classifies the structures.
In this example there is no label indicating
what the local structures should be,
so rather than a numerical indication of performance
it is instead visual.
For the identification of the crystal in the center,
the KNN algorithm is fantastic,
there is potentially some inconsistency
in the interface between the liquid and the crystal
however this boundary is not well defined and
any issues are only a single layer.
The identification of a defect within the p2 crystal (@fig:melting_p2_middle)
demonstrates the utility of a measure of local structure.
The "misclassification" within the liquid phase,
that is the single particles classified as crystals in the liquid,
primarily have local configurations which are crystal-like in nature,
with some exceptions.
However most notable,
is handling the solid state phase transition within the p2gg crystal,
from @fig:melting_p2gg_start to @fig:melting_p2gg_middle.
This phase transition is discussed in more detail in @sec:polymorphic_stability.

:::{class=subfigures id=fig:melting}

![p2 Start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2_9.svg){width=33%}
![p2gg Start](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2gg_9.svg){width=33% #fig:melting_p2gg_start}
![pg Start](../Projects/Crystal_Melting/figures/ml_demo_trimer_pg_9.svg){width=33%}

![p2 Middle](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2_1499.svg){width=33% #fig:melting_p2_middle}
![p2gg Middle](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2gg_1499.svg){width=33% #fig:melting_p2gg_middle}
![pg Middle](../Projects/Crystal_Melting/figures/ml_demo_trimer_pg_1499.svg){width=33%}

![p2 End](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2_2999.svg){width=33%}
![p2gg End](../Projects/Crystal_Melting/figures/ml_demo_trimer_p2gg_2999.svg){width=33%}
![pg End](../Projects/Crystal_Melting/figures/ml_demo_trimer_pg_2999.svg){width=33%}

Figures showing the progression of melting of a p2 crystal.
The colour of the molecules describes their orientation.
The lighter molecules are classified as liquid while
the darker molecules are classified as crystalline.

:::

The KNN algorithm developed in @sec:supervised_learning not only performs well
on the dataset used for the development of the model,
it can be applied to studying a range of problems
in understanding these crystal structures.
