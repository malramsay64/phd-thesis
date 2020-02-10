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
The orientational ordering for $O_6$ is given by the equation;

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
represented as a point on a number line.
The original data,
being the relative orientation of each neighbour
can be represented as a point in 6 dimensional space
which better allows for separation of values.
Machine Learning is a tool which can assist in finding surfaces
to separate values in higher dimensional space.

![The range of values of the orientational order parameter $O_6$
overlap for each of the crystals and the liquid.
](../Projects/MLCrystals/figures/order_parameter_overlap.svg){width=80% #fig:order_parameter_overlap}

## Machine Learning in Chemistry

Machine learning is becoming widely used within materials science [@Mueller2016;@Vasudevan2019]
for applications including;
detecting of crystal structures, [@Spellings2018;@Carrasquilla2017;@Boattini2018]
characterising amorphous materials, [@Ballard2016;@Ballard2017]
predicting of material properties, [@Hansen2013;@Hansen2015;@Pilania2013;@McDonagh2019] and
developing of interatomic potentials. [@Snyder2012]

Machine learning is most useful where there are many hand tuned fitting parameters,
and for the analysis of large datasets we don't yet fully understand.
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
This can either be finding the line of best fit [@fig:regression_demo],
or a decision surface which separates one class from another [@fig:classification_demo].
Increasing the complexity of the machine learning algorithm comes from;
increasing the number of inputs, creating a line or surface in higher dimensional
  space,
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
In the motivating example @fig:order_parameter_overlap]
to sepearate the liquid and p2 structures
we need to choose a value below which a structure is considered liquid-like
and above is considered crystal like.
The choice of this value can change how well this classification performs,
however in a survey of publications using similar techniques
[@Mitus2002;@Qi2010;@Petrov2015;@Hamanaka2006;@Wierschem2011;@Tobochnik1982;@Engel2013;@Bernard2011;@Strandburg1984]
there is no mention of the value or the method used to determine it.
Supervised Learning provides a formal method
for the determination of the best value
based on the available data.

### Unsupervised Learning {#sec:clustering_intro}

Unsupervised algorithms in machine learning,
also known as clustering algorithms,
take a dataset and are divide it into clusters,
where values within each cluster are more closely related to each other
that values in different clusters. [@Russell2016]
Rather than being able to identify liquid or crystal structure like supervised learning,
unsupervised learning can identify there are two distinct types of structure present
and the structures which belong to each.
The term clustering will be used over unsupervised learning
throughout the rest of this thesis.

Within the field of Chemistry,
clustering has been used to help understand energy landscapes [@Wales2018;@Ballard2016;@Ballard2017]
grouping together similar configurations within a molecular dynamics simulation,
providing a method of understanding how the simulation state
moves between the available configurations.
Other uses within Molecular Dynamics
is finding the different local structures present within a simulation.
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
In the field of self assembly @Keys2011 describe six;
Point matching,
shape histogram,
shape distributions,
harmonic descriptors,
shape context, and
lightfield descriptor.

Describing the similarity of one structure to another
can require one, or many of these parameters.
For simulations of atomic particles
there are a range of order parameters
making use of the above descriptions,
the Steinhardt bond order parameters, [@Steinhardt1983]
Bond Angle Analysis, and [@Ackland2006]
Common Neighbour Analysis. [@Faken1994;@Honeycutt1987]
Each of these different order parameters
focus on the identification of a small range of structures,
which is typically; Face Centered Cubic, Body Centered Cubic, and Hexagonal Close Packed.
The identification of each structure
uses hand picked parameters
tuned for the potential used for the simulation.
While the hand tuned parameters limits the re-usability of these methods,
they reflect the relationships important in crystal structures
and have been developed and tested over many years.
There are a range of studies [@Reinhart2017;@Dietz2017;@Boattini2018;@Spellings2018]
which build upon these traditional methods,
using machine learning to combine many values
and make decisions for new datasets.
Each of these machine learning approaches have slightly different approaches,
however they use existing tools for crystal detection
as one of the dimensions describing local structure.

Current applications of machine learning for crystal detection
only deal with spherically symmetric particles.
Many molecular crystals are far more complicated, [@Beran2016] for example
water Ice has 18 different polymorphs we have found so far, @Algara-Siller2015
with the most recent found in 2015.
Other examples of this diversity are
to flufenamic acid [@Lopez-Mejias2012] with at least 9 polymorphs, and
triacetone-triperoxide [@Reany2009] with at least 6 polymorphs.
The abundance of molecular polymorphs is such that @McCrone1965 noted that
"the number of forms known for each compound is proportional to
the time and money spent researching that compound."
This diversity of structure raises additional complications
in the identification of these structures.
The CHILL [@Moore2010] and CHILL+ [@Nguyen2015] algorithms
are traditional approaches for detecting ice within liquid water
however, they are limited to the detection of ice Ih, and Ic.
Machine learning models for the identification of ice crystal structures [@Geiger2013;@Fulford2019]
provide analysis that is both more accurate
and covers a wider range of crystal structures.

A further problem with molecules having so many polymorphs
is finding the different structures present within a simulation.
Not only for the discovery of novel polymorphs
but also ensuring a complete understanding of a configuration.
One of the limitations of existing detection methods
is that you only see the range of structures you are looking for
rather than the range of structures which exist.
Using a clustering approach [@Spellings2018]
provides a complete overview of the structures present
with minimal additional effort.

Machine learning is a tool ideally suited
for the identification and classification
of molecular crystal structures.
Able to account for the diversity and complexity
of these structures.
Machine Learning accelerates research
by taking care of the tedious time consuming elements
allowing the researcher to focus on the science.

## Machine Learning Goals

This chapter demonstrates the applicability of machine learning
to understanding crystal structures within molecular crystals.
Firstly to demonstrate clustering as a tool for
the identification of regions of local structure within a simulation
requiring no previous knowledge.
Secondly demonstrating Supervised learning for the accurate detection and monitoring
of many molecular crystal structures within a simulation.
