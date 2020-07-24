# Introduction to Machine Learning {#sec:ml_introduction}

The three densest packed crystal structures for the Trimer molecule
determined by iso-configurational search [@Hudson2011]
belong to the space groups p2, pg, and p2gg.
Any of these three structures could potentially form within a simulation
requiring an algorithm able to monitor the presence of all structures.
A standard tool for crystal detection is to use an order parameter; [@Russo2016;@Sultan2014;@Tanaka2012;@Tanaka2014;@Kuczynski2002]
a single value which describes a local configuration on a scale
from a perfect liquid $0$, to a perfect crystal $1$.
A measure of this type previously used for molecular crystals [@Sims2019;@Kuczynski2002]
is the orientational order parameter $O_6$.
The value of $O_6$ is the orientation of the closest shell of 6 neighbours
relative to the orientation of the central molecule.
The orientational ordering $O_6$ of reference particle is given by the equation;

$$ O_6 = \frac{1}{6}\sum_{i=1}^6 \cos^2(\theta_{ref} - \theta_i) \rangle_i $$ {#eq:orientational_order_parameter}

where $\theta_{ref}$ is the orientation of the reference particle and
$\theta_i$ is the orientation of the neighbouring particle.
The orientational order parameter
can reasonably distinguish the liquid from the p2 structure
as shown in @fig:order_parameter_overlap,
with values above 0.90 considered crystalline,
while values below 0.90 considered liquid.
However, the overlap of the liquid with the p2 and p2gg crystals
means they can't be identified in this way.
While it is possible to develop an alternate formulation of an order parameter
to identify each of these different structures,
the diversity of structure indicates that the separation of structures
needs a higher dimensional space.
The formula for the order parameter [@eq:orientational_order_parameter]
takes the orientation for each neighbour,
collapsing them into a single value
represented as a point along the number line.
The original data,
being the relative orientation of each neighbour
can be represented as a point in 6 dimensional space.
Having the entire six dimensional space to work with
provides more opportunities to distinguish each structure.
Machine Learning is a tool which can assist in finding surfaces
to separate values in higher dimensional space.

![The range of values of the orientational order parameter $O_6$
overlap for each of the crystals and the liquid.
](../Projects/MLCrystals/figures/order_parameter_overlap.svg){width=80% #fig:order_parameter_overlap}

## Machine Learning in Chemistry

Machine learning is becoming widely used within materials science [@Mueller2016;@Vasudevan2019]
for applications including;
detecting crystal structures, [@Spellings2018;@Carrasquilla2017;@Boattini2018]
characterising amorphous materials, [@Ballard2016;@Ballard2017]
predicting material properties, [@Hansen2013;@Hansen2015;@Pilania2013;@McDonagh2019] and
developing interatomic potentials. [@Snyder2012]
Machine learning is most useful for problems
where there are many hand tuned fitting parameters,
and the analysis of large datasets we don't yet fully understand.
The application of machine learning to these problems
can be broken into two main groups;
Supervised Learning,
where data with known values is used to develop a predictive model and
Unsupervised Learning,
which is used to better understand an unknown dataset.

### Supervised Learning {#sec:supervised_learning_intro}

Supervised learning is a tool for developing a predictive model
based on previous data with a known outcome.
The supervised part of the learning
is the process of drawing a line to predict future outcomes.
This can either be finding the line of best fit (@fig:regression_demo),
or a decision surface which separates one class from another (@fig:classification_demo).
Increasing the complexity of the machine learning algorithm comes from;
increasing the number of inputs, creating a line or surface in higher dimensional space,
increasing the complexity of the line or surface, or
increasing the number of lines to distinguish a larger number of classes.

:::{class=subfigure id=fig:machine_learning_demo}

![Regression](../Projects/MLCrystals/figures/linear_regression_demo.svg){#fig:regression_demo width=49%}
![Classification](../Projects/MLCrystals/figures/clustering_demo.svg){#fig:classification_demo width=49%}

The application of machine learning to example problems in both
regression (a) and classification (b).
In both cases the process of machine learning is
finding the line which can be best used to predict further behaviour.

:::

Supervised Learning within the context of Chemistry
has focused on the optimisation of parameters in simulations or experiments,
cases which would have previously required tedious hand optimisation.
@Meenakshisundaram2019 used Machine Learning to find
the most fragile molecular liquids for a given number of particles.
The machine learning was able to direct
simulations of molecules with new geometries
based on the automated data collection and analysis of previous geometries.
As more data is collected the directed guesses improve.
The tuning of parameters using machine learning
has also been used by @Ren2018
to speed up the development of a novel amorphous alloy.
The optimisations allowed by machine learning
speed up discovery by 1000 times over previous methods.

Optimisation using machine learning can also be applied to smaller problems.
In the motivating example (@fig:order_parameter_overlap)
to separate the liquid and p2 structures
we need to choose a value that separates local configurations
considered crystal-like from those considered liquid-like.
The choice of this value can determine how well this classification performs.
However, in a survey of publications classifying local structures
using a one dimensional order parameter,
[@Mitus2002;@Qi2010;@Petrov2015;@Hamanaka2006;@Wierschem2011;@Tobochnik1982;@Engel2013;@Bernard2011;@Strandburg1984]
none mention the value chosen or the method used to determine the optimal choice.
Supervised Learning provides a formal method
for the determination of the best value
based on the available data.

### Unsupervised Learning {#sec:clustering_intro}

Unsupervised algorithms in machine learning,
also known as clustering algorithms,
take a dataset and divide it into clusters,
where values within each cluster are more closely related to each other
that values in different clusters. [@Russell2016]
Unsupervised learning is a tool for identifying pieces of data which should be grouped together,
and how many groups are present in a dataset,
the labelling of each group requires human expertise.
Unsupervised learning is also known as clustering,
with the term clustering used throughout the rest of this thesis.

Within the field of Chemistry,
clustering has been used within Molecular Dynamics
to find the different local structures present within a simulation.
@Spellings2018 use clustering to identify
a range of complex crystal structures.
The results from the machine learning matched those from
the manual assignment which was previously published [@Engel2015]
despite the clustering taking 30 minutes,
while the manual assignment was estimated to take weeks.
A further application of clustering is in the analysis of instrument data
where @DellAnna2008 reduce the number of peaks in
Time-of-Flight Secondary Ion Mass Spectrometry (ToF-SIMS) spectra
to develop models predicting the chemical composition of thin films.

Machine learning provides a range of tools
for understanding, analysing, and predicting data.
However, like a statistical analysis
machine learning needs to be applied carefully
using the appropriate analysis for the task at hand.
It is not a black box which magically solves problems. [@Lehman2019]

## Machine learning for crystal detection

There are a range of parameters which can be used
to identify local structure within a simulation.
In the field of self assembly @Keys2011 describe six main descriptors;
Point matching,
shape histogram,
shape distributions,
harmonic descriptors,
shape context, and
lightfield descriptor
noting there are a range of other possible descriptors.
Describing the similarity of one structure to another
can require one, or many of these parameters.
For simulations of atomic particles
there are a range of order parameters
making use of the above descriptions;
the radial distribution function is a shape distribution,
the Steinhardt bond order parameters, [@Steinhardt1983] and Bond Angle Analysis [@Ackland2006]
are harmonic descriptors,
while Common Neighbour Analysis [@Faken1994;@Honeycutt1987] is a graph based descriptor.
Each of these different order parameters
focuses on the identification of a small range of structures,
typically; Face Centered Cubic, Body Centered Cubic, and Hexagonal Close Packed.
The identification of each structure
uses hand picked parameters
tuned for the potential used for the simulation.
While the hand tuned parameters limits the re-usability of these methods,
they reflect the relationships important in crystal structures
and have been developed and tested over many years.
There are a range of studies [@Reinhart2017;@Dietz2017;@Boattini2018;@Spellings2018]
which build upon these order parameters,
using machine learning to combine many values
and make decisions for new datasets.
Each of these machine learning approaches have slightly different approaches,
however they use existing tools for crystal detection
as one of the dimensions describing local structure.

Current applications of machine learning for crystal detection
only deal with spherically symmetric particles.
There are many examples of molecular crystals exhibiting
a range of polymorphs; [@Beran2016]
Ice has 18 known polymorphs,
with the most recent found in 2015, [@Algara-Siller2015]
flufenamic acid has 9 known polymorphs, [@Lopez-Mejias2012 ] and
triacetone-triperoxide has 6 known polymorphs. [@Reany2009]
The prevalence of molecular polymorphs is such that @McCrone1965 noted that
"the number of forms known for each compound is proportional to
the time and money spent researching that compound."
This diversity of structure raises additional complications
in the identification of these structures.
The CHILL [@Moore2010] and CHILL+ [@Nguyen2015] algorithms
are order parameter based approaches for detecting ice within liquid water
however, they are limited to the detection of ice Ih, and Ic.
Machine learning models for the identification of ice crystal structures [@Geiger2013;@Fulford2019]
provide analysis that is both more accurate
and covers a wider range of crystal structures.

A further problem with molecules having so many polymorphs
is finding the different structures present within a simulation.
Finding structures is important for the discovery of novel polymorphs,
and also ensuring a complete understanding of a configuration.
One of the limitations of existing detection methods
is that you only see the range of structures you are looking for
rather than the range of structures which exist.
With a clustering approach,
the work lies in finding the appropriate descriptors
to use for a problem.
However, unlike order parameters,
the descriptors are transferable
across a wide range of problem descriptions.
Machine learning is a tool ideally suited
for the identification and classification
of molecular crystal structures,
being able to account for the diversity and complexity
of these structures.
Machine Learning accelerates research
by taking care of the tedious time consuming elements
allowing the researcher to focus on the science.

## Machine Learning Goals

This chapter develops a machine learning method
for the identification of molecular crystal structures
within a molecular dynamics simulation.
To do this we use a dataset [@MalcolmRamasy2018] describing three crystal structures
of the trimer molecule and the liquid.
The creation of the dataset is described in @sec:methods_ml_dataset.

The structure of this chapter comprises two sections.
Firstly, in @sec:clustering we show the applicability of clustering
as a tool for the identification of regions of local structure
within a simulation.
The importance of clustering is that it requires minimal
prior knowledge of the arrangement of the local structures.
This section also develops an understanding of
tools to use for visualising data in high dimensional space.
Then in @sec:supervised_learning we use supervised learning
for the accurate detection and monitoring
of crystal polymorphs within a simulation.
The result of this chapter is a robust method
for the detection of the Trimer crystal structures
that will be used in @sec:Crystal_Melting
for monitoring the melting of the crystals
and in @sec:Melting_Behaviour for understanding
the transition between polymorphs.
