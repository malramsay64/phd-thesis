# Introduction

The three densest packed structures of the Trimer molecule
as determined by the iso-configuration search algorithm developed by @Hudson2011
belong to the space groups p2, pg, and p2gg.
Each of these structures could potentially form within a simulation
requiring an algorithm able to monitor the presence of each of these structures.
A standard tool for crystal detection is to use an order parameter;
a single value which describes a local configuration on a scale
from a perfect liquid $0$, to a perfect crystal $1$.
A measure of this type previously used for molecular crystals
is an orientational order parameter $O_6$.
The value of $O_6$ is the orientation of the closest shell of 6 neighbours
relative to the orientation of the central molecule.
The orientational ordering for $O_6$ is given by the equation;

$$ O_6 = \frac{1}{6}\sum_{i=1}^6 \cos^2(\theta_{ref} - \theta_i) \rangle_i $$ {#eq:orientational_order_parameter}

where $\theta_{ref}$ is the orientation of the reference particle and
$\theta_i$ is the orientation of the neighbouring particle.
The orientational order parameter as expressed
can reasonably distinguish the liquid from the p2 structure
as shown in @fig:order_parameter_overlap.
However, there are no values
which can distinguish the p2gg or pg structures in this way.
While it is likely possible to develop
some alternate formulation to identify these different crystal structures,
this highlights that values along more than a single dimension
are needed to separate these values.
The formula for the order parameter [@eq:orientational_order_parameter]
takes the orientation of each neighbour,
and collapses those into a single value,
being a point on a number line.
The original data,
being the orientation of each neighbour
can be represented as a point in $n$ dimensional space
indicating the value of each $n$ neighbours.
Machine Learning is a tool which can assist in handling
values in higher dimensional space.

![The range of values of the orientational order parameter $O_6$
overlap for each of the crystals and the liquid.
](../Projects/MLCrystals/figures/order_parameter_overlap.svg){width=80% #fig:order_parameter_overlap}

## Machine Learning in Chemistry

Machine learning is becoming widely used within materials science [@Mueller2016;@Vasudevan2019]
for applications including;

- detection of crystal structures, [@Spellings2018;@Carrasquilla2017;@Boattini2018]
- characterisation of amorphous materials, [@Ballard2016;@Ballard2017]
- prediction of material properties, [@Hansen2013;@Hansen2015;@Pilania2013;@McDonagh2019] and
- the development of interatomic potentials. [@Snyder2012]

Machine learning is most useful where there are many hand tuned fitting parameters,
and for the analysis of large datasets we don't yet fully understand.
The application of machine learning to these problems
can be broken into two main groups;
Supervised Learning,
where data with known values is used to develop a predictive model and
Unsupervised Learning,
which is used to better understand an unknown dataset.

### Supervised Learning

Supervised learning is a tool for developing a predictive model
based on previous results with a known value.
The supervised part of the learning
is the process of drawing a line to predict future outcomes.
This can either be finding the line of best fit [@fig:regression_demo],
or a decision surface which separates one class from another [@fig:classification_demo].
Increasing the complexity of the machine learning algorithm comes from;

- increasing the number of inputs, creating a line or surface in higher dimensional
  space
- increasing the complexity of the line or surface, or
- increasing the number of lines to distinguish a larger number of different classes.

:::{class=subfigure id=fig:machine_learning_demo}

![Regression](../Projects/MLCrystals/figures/linear_regression_demo.svg){#fig:regression_demo}
![Classification](../Projects/MLCrystals/figures/clustering_demo.svg){#fig:classification_demo}

The application of machine learning to example problems in both
regression (a) and classification (b).
In both cases the process of machine learning is
finding the line which can be best used to predict further behaviour.

:::

Supervised Learning within the context of Chemistry
has been primarily focused on the optimisation of parameters
for simulations or experiments,
cases which would have previously required tedious hand optimisation.
@Meenakshisundaram2019 used Machine Learning to find the geometry
of molecules with liquids that were the most fragile.
In running an experiment where
the data collection and analysis is automated,
the machine learning directs simulations with new geometries
based on the existing data.
As more data is collected the directed guesses improve.
The tuning of parameters using machine learning
has also been used by @Ren2018 to
speed up the development of a novel amorphous alloy.
The optimisations allowed by machine learning
speed up the process of discovery by 1000 times.

The process of optimisation can also be applied to smaller problems.
In the motivating example for using machine learning [@fig:order_parameter_overlap]
we need to choose a value below which a structure is considered liquid-like
and above is considered crystal like.
The choice of this value can dramatically change how well this classification performs,
however in a survey of publications using similar techniques
[@Mitus2002;@Qi2010;@Petrov2015;@Hamanaka2006;@Wierschem2011;@Tobochnik1982;@Engel2013;@Bernard2011;@Strandburg1984]
there is no mention of the value
or the method used to determine it.
Supervised Learning provides a formal method
for the determination of the best value
based on the available data.

### Unsupervised Learning

Unsupervised algorithms in machine learning,
also known as clustering algorithms,
they take a dataset and are divide it into subsets (or clusters)
where values within each cluster are more closely related to each other
that values in different clusters. [@Russell2016]
Rather than being able to identify liquid or crystal structure
like supervised learning,
Unsupervised learning can identify
there are two distinct types of structure present
and the elements which belong to each.

Within the field of Chemistry,
Unsupervised learning has been used
to help understand energy landscapes [@Wales2018;@Ballard2016;@Ballard2017]
grouping together similar configurations within a molecular dynamics simulation,
providing a method of understanding how the simulation state
moves between the available configurations.
Other uses within Molecular Dynamics
is finding the different local structures present within a simulation.
@Spellings2018 use Unsupervised Learning to identify
a range of complex crystal structures,
a process estimated to take weeks manually, in 30 minutes.
The results from the machine learning matched those from
the manual assignment which was previously published. [@Engel2015]
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

1. Point matching,
2. shape histogram,
3. shape distributions,
4. harmonic descriptors,
5. shape context, and
6. lightfield descriptor.

To accurately describe the similarity of one structure to another
many of these different descriptors can be used,
resulting in a multi-dimensional description of a configuration.
The question then becomes,
which structure is this closest to?

Using existing data for hypothesis testing
has been within the realm of statistical analysis for hundreds of years. @Stigler1986
However, statistical approaches like ANOVA
are problematic in high dimensional space.
This is where machine learning can really improve on these existing methods.

For simulations in 3D,
the ordering in crystal structures is more complex
making it's detection more challenging.
Like the 2D case there are a range of methods
for identifying structures including

- the Steinhardt bond order parameters, [@Steinhardt1983]
- Bond Angle Analysis, and [@Ackland2006]
- Common Neighbour Analysis. [@Faken1994;@Honeycutt1987]

Each of these different values focus on the identification
of a small range of structures, typically;

- Face Centered Cubic,
- Body Centered Cubic, and
- Hexagonal Close Packed.

The differences between each of these is typically
a hand picked parameter tuned for each potential.

While the existing approaches for crystal detection
are limited by arbitrary decisions and limited re-usability.
There has been a lot of work in choosing these methods
and they reflect the relationships important in crystal structures.
So they form a foundation on which to
develop features for machine learning.
There are a range of studies [@Reinhart2017;@Dietz2017;@Boattini2018;@Spellings2018]
building upon the ideas of the more traditional
crystal order parameters.
These all take slightly different approaches,
however each converts one of the parameters above
into a many dimensional representation
of the local structure,
providing far more opportunity
to distinguish the different structures.

The approaches listed above only deal with spherically symmetric particles,
molecular crystals are far more complicated
in their shape and crystal structure.
Water Ice has 18 different polymorphs we have found so far, @Algara-Siller2015
with the most recent found in 2015.
The number of polymorphs for ice is likely to reflect
the range of structures in many molecular crystals.
The CHILL [@Moore2010] and CHILL+ [@Nguyen2015]
are traditional algorithms for
detecting ice within liquid water
though they are limited to ice Ih, Ic, and clathrates for CHILL+.
Machine learning models [@Geiger2013;@Fulford2019]
provide analysis that is both more accurate
and covers a wider range of crystal structures.

A further problem,
highlighted by the example of water
is that it is important to know
the types of structures which are present within a sample.
Not only for the discovery of novel materials
but also having a complete understanding
of a configuration.
A problem with existing tools
is that you only see the range of structures you are looking for
rather than the range of structures which exist.
Machine learning can also be used to
subdivide the dataset into distinct clusters of crystal structures. [@Spellings2018]

The real power of machine learning
for the identification and classification
of crystal structures,
comes from combining the work of the past 40 years
of classifying crystal structures
with the tools available through machine learning.

## Machine Learning Goals

- Unsupervised learning is a process allowing for the identification of regions of local
  structure which are locally favoured
- Supervised learning is a suitable method for crystal detection and monitoring
