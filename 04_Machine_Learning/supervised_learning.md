# Supervised Learning {#sec:supervised_learning}

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
Because this method has been primarily developed
for the classification of configurations in @sec:Crystal_Melting,
the constructed crystals are used directly to train the model.
The creation of the crystal structures and
the labelling of each configuration is described in @sec:methods_ml_dataset.
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
