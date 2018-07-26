# Crystal Detection

During the course of my honours work, I established that the most likely candidates for the crystal
structure were the p2, p2gg, and pg structures as shown below. The search for structures was first
performed using hard shapes in an isoconfigurational search algorithm developed by Toby Hudson
[@Jennings2015]. The resulting crystal structures were then relaxed using the Lennard-Jones potential
find the energy of each structure. The calculated energies (+@tbl:crystal_energies) are all within
2% of each other, indicating there is no significant driving force for a particular crystal
structure.

 Crystal   Energy   Penalty
--------  -------  --------
      p2
      pg
    p2gg

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

$$ O_n = \langle \cos(\theta_{ref} - \theta_i) \rangle_i $$

where $\theta_{ref}$ is the orientation of the reference particle and $\theta_i$ is the orientation
of the particle to be compared. This value is averaged over all $i$, which in this case is the
particles in the shell of first nearest neighbours. This form of the equation only works in 2D.
While it is possible to modify the above equation to take three orientations, this is a poor
implementation due to the occurrence of gimbal lock. Additionally most simulation software uses
quaternions for orientation to alleviate the issue of gimbal lock. The more natural quaternion based
representation has the form

$$ O_n = \langle \text{quaternion maths} \rangle_i $$

The quaternion form of the orientation is still unsuitable for even the p2 structure which is the
most orientationally ordered of all three crystals. In the p2 structure the molecules are arranged
parallel and antiparallel, so both these orientations need to contribute positively to the order
parameter giving an equation of the form

$$ O_n = \langle \text{maths} \rangle+i $$


This form of the equation works reasonably well at distinguishing the liquid from the p2 crystal
phase, using $O_n > 0.85$ as the measure of the p2 crystal. There are still two issues with using
this parameter. Firstly, the value of
0.85 was chosen because I thought it worked well, with no data to validate it is the best value for
  distinguishing the two phases. Secondly, $O_n$ is only suitable at identifying the p2 structure.
  Both the p2 and p2gg structures are considered part of the liquid phase with the chosen parameter.

The field of Machine Learning has well tested and documented procedures for evaluating the best
value of a parameter to use for the classification of distinct groups. The procure starts with the
collation of dataset which is labelled according to the true classification. For this dataset I used
the starting configurations of a liquid--crystal interface simulation. In these configurations, the
middle two-thirds is a crystal structure while the outer third is liquid with a sharp boundary
between them. Using the position of each local environment, I was able to assign them labels. The
molecules which lay on the liquid--crystal boundary were excluded from the analysis as they are not
well defined as either liquid or crystal and the boundary layer is artificially created. The
boundary layer for the purposes of this analysis is the first layer either side of the artificial
boundary created.

Characteristics required by a metric of the crystal melting are that it works over a range of
simulation conditions. It is no use to have a metric which needs to be tweaked to work properly with
every different simulation condition. Additionally I require a metric which is distinguish the three
different crystal structures from the liquid and from each other. For this general approach I looked
to a variety of machine learning algorithms using the Scikit Learn library.

The orientational order parameter uses the relative orientation of the molecules for identification
of local crystalline order. As a first approach I would use the relative orientations as input for
the machine learning models, although rather than combine all the values into one, I will use each
separately. A feature of the method I am using to compute the nearest neighbours is the neighbours
are returned in order of closeness, an ordering which carries into the orientation of the
neighbours. It is entirely plausible that the ordering of the orientations is additional information
the machine learning algorithm is picking up.

Using a number of different machine learning methods, the maximum classification accuracy I was able
to achieve was 96% which was achieved in a number of different models, even a complicated neural
network. This tells me that for a higher accuracy to be achieved more input data is required,
whether that be neighbour distances, longer range effects, or some other value. Additionally in
investigating many of the incorrect assignments in the liquid phase, these had the character of a
local crystalline configuration without the long range ordering. This does hint that the accuracies
in the algorithm may not be so much in the algorithm itself, but instead in my initial
classification.

Regardless of the potential issues with the classification and potential improvements, the 95%
accuracy of the K-Nearest Neighbours (KNN) classifier, along with being one of the fastest
algorithms for classification, make this ideal for classifying the melting rate of crystals.

A high accuracy is required for the classification algorithm due to the obscenely slow crystal
growth which has been observed in these crystal structures.

## Classification Algorithm

The algorithm I have chosen for the classification is the K-Nearest Neighbours (KNN) as
implemented in scikit-learn [@Pedregosa2012] with with `sklearn.neighbors.KNeighborsClassifier`
function. I am using all default values, which means K=5. To perform classification, the KNN
algorithm finds the K points in the training dataset which are closest to the new value, returning
the most common class for the new value.

For any Machine Learning algorithm there are two elements which have the biggest impact on the
overall accuracy of the model; the selection of features, and the dataset to train the model. To
choose the features for classification I looked for distinguishing features between the crystal
structures with the most obvious being the orientational arrangement of the nearest neighbours.
The relative orientation of the nearest neighbours is the feature I used for training. 

The labelled dataset for training was constructed from the initial configurations for a
liquid--crystal interface melting simulation, where the inner 2/3 of each axis is crystalline with
the remainder of the simulation as a liquid. In knowing the position of a particle within the
simulation I know whether it is liquid or crystal. The initial configurations were all run for
1000 timesteps with the crystal region allowed to move, giving the crystalline molecules some
vibrational noise while not melting the crystal. The complete training dataset is comprised of
these initial configurations for each of the three crystal structures (p2, p2gg, pg) at a pressure
$P=1.0$ and a range of temperatures near the melting point $T = 0.30, 0.35, 0.40, 0.45, 0.50$.
Overall this dataset comprises of 80,000 local environments each with a label of p2, pg, p2gg, or
liquid.

The complete labelled dataset was randomly divided into two components, with 80% of the dataset
being the training data on which the different models are developed and trained. The final 20% is
a test dataset, which is presented to the model a singe time to asses the accuracy. The test set
is not exposed to the model prior to evaluation as a counter-measure against overfitting to the
training data. With the large number of parameters some machine learning models are comprised of
the model can 'memorise' the training dataset, getting a perfect score with the trained values
yet perform poorly on unseen problems. The trained model had an accuracy of 96% on the test
dataset, with a confusion matrix showing the classification errors shown in @fig:knn_confusion.

![The confusion matrix of the trained KNN algorithm for the test dataset. The diagonal shows the
percentage of correctly clasified environments while the off diagonal elements are the
misclassifications. It is interesting to note that most of the misclassifications are predicting a
crystalline environment as a liquid.](figures/knn_confusion_matrix.png){#fig:knn_confusion}



## Clustering



## Melting Rates



