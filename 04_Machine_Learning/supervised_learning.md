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
The configurations used for training contain
the same number of liquid and crystal configurations,
however there are three different crystals and only a single liquid.
This means that there are three times as many liquid configurations as any crystal
and guessing every configuration is liquid would have an accuracy of 50%
rather than 25% for a balanced dataset.
Handling imbalanced data is a large problem within the field of machine learning [@He2009]
with a range of tools for removing the effect of the imbalance.
The medical field is notably sensitive to data imbalance,
where datasets contain hundreds or thousands more healthy samples than diseased.
Incorrectly handling this data imbalance
can make a machine learning algorithm appear far better than
it performs in practice. [@Brabec2020;@Vandewiele2020]
For the problem of classification within this thesis,
the data imbalance is small,
and so the balanced accuracy (@sec:measuring_success)
is an appropriate tool to mitigate the imbalance.
The KNN algorithm gives a balanced accuracy of 97.0%,
scored based on a holdout dataset, [@Kohavi1995]
which is data not seen during the training and optimisation of the model.
The use of a holdout dataset
is the standard method of publishing results from machine learning algorithms.
Scoring an algorithm using previously unseen data
is important since algorithms can memorise data given to them
resulting in unbelievable performance on the presented dataset
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
which will explore all the feature space,
some of which represents crystalline configurations.
While there will inherently be some errors in classification,
that doesn't mean the KNN algorithm is best suited for the task.
Similar problems for the identification of crystal structures,[@Fulford2019;@Boattini2018;@Geiger2013]
use Neural-Network based algorithms.
While Neural-Network algorithms are used for complex problems
like image [@Krizhevsky2017] and speech recognition, [@Hinton2012]
that doesn't mean they perform better for well defined tasks.
In a study of neural network algorithms,
@Dacrema2019 find that six of the seven neural-network models they could reproduce
were outperformed by a simpler nearest-neighbour or graph-based algorithm.
While the remaining neural-network algorithm performed on par with the simpler algorithms.
These findings match my own investigation of a neural-network,
which performed within the margin of error of the KNN model,
while both being slower to train the model on the input data
and slower for the classification of new data.

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
using a visual indicator of performance
rather than a numerical one.
The KNN algorithm is able to follow the melting of all three crystals,
showing a clear delineation between
the liquid and crystal phases with few visible errors.
There is some inconsistency at the single interface layer of each crystal,
although this single layer of boundary region is not well defined.
The identification of a defect within the p2 crystal (@fig:melting_p2_middle)
demonstrates the utility of a measure of local structure.
Along with the presence of presence of defects in the crystal structure,
there are also many local structures in the liquid phase
which are classified as crystalline.
From a visual survey of these misclassified configurations,
the majority form local structures close to those present in the crystals,
having at most a single misaligned neighbour.
Most notable
is handling the solid state phase transition within the p2gg crystal,
from @fig:melting_p2gg_start to @fig:melting_p2gg_middle.
This phase transition is discussed in more detail in @sec:polymorphic_stability.
The KNN algorithm developed in @sec:supervised_learning not only performs well
on the dataset used for the development of the model,
it can be applied to studying a range of problems
in understanding these crystal structures.

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
