# Static analysis of the Trimer Polymorphs {#sec:static_analysis}

The lack of observable crystal growth
means that the crystal structures for the trimer molecule
are based on an isopointal search algorithm [@Jennings2015;@Hudson2011]
which finds the best packing of shapes defined using a hard potential.
That is a potential with no interaction until they intersect,
then an infinite repulsion disallowing intersection.
We make the assumption that the structures generated from hard packing
closely match structures formed using the Lennard Jones potential.
The approximation of a Lennard--Jones potential as a hard shape
been shown to generate crystal structures
matching those of atomic systems, [@Filion2009;@Hudson2011;@OToole2011;@Kummerfeld2008]
however it is yet to be verified for molecular structures.
One method of evaluating that assumption
is the comparison of the packing fraction to that of the potential energy
for each of the crystal structures (@tbl:potential_energy).
For the crystal structures generated best packed structure (p2gg)
has the second lowest potential energy,
being beaten by the p2 structure,
a close second by packing fraction.
In making the assumption that hard packing of Trimers
will give the optimal crystal structures,
with the discrepancy between packing fraction and potential energy
it is possible we have missed other low energy structures.
This section looks for polymorphs which may have been missed,
firstly by using a modified isopointal search algorithm
which performs the minimisation using a Lennard--Jones potential,
and secondly, using the clustering algorithm developed in @sec:clustering
to identify new structures within the liquid configurations.

Crystal| Packing Fraction |Potential Energy per Molecule
-------| ----------------:|-------------:
p2     | 0.938            | **-0.198**
p2gg   | **0.945**        | -0.190
pg     | 0.927            | -0.084

Table: The packing fraction and potential energy of structures generated
from an isopointal search algorithm. [@Jennings2015]
The potential energy was evaluated after equilibration at a
temperature of 0.1 and a pressure of 1.00
using the packed structure as the initial configuration.
The optimal packing and energy are denoted in bold. {#tbl:potential_energy}

## Packing Analysis

By using crystal structures formed using a hard potential
when simulating molecules using a Lennard--Jones potential,
we make the assumption the structures
are within the local minima of the Lennard--Jones crystal.
That is, with a short minimisation from the hard packed structures
we will find the lowest energy states of the Lennard--Jones potential.
The isopointal search algorithm as published [@Hudson2011]
maximises the packing fraction with the constraint
that particles are unable to overlap.
By changing the scoring component of the search algorithm from
maximising the packing fraction,
to minimising the Shifted Lennard Jones interaction used in the simulations,
the same approach to finding crystal structures
can be applied to the Lennard Jones potential.

The structures generated using
the hard discs and the Shifted Lennard--Jones potential (LJ)
are compared in @fig:packing.
The main difference between the LJ and hard disc packing
is the larger spacing of the LJ packing,
corresponding to the minimum of the potential
that lies a distance of $2^{1/6}\sigma \approx 1.12\sigma$.
Along with the larger spacing for the LJ packing,
there is a slight difference in the stacking of layers,
most noticeable in the p2 crystal.
The hard discs [@fig:packing_p2_hard] are offset
such that the small molecules sit in the concavity between
the small and large particle
while the LJ molecules [@fig:packing_p2_lj] are aligned
as a mirror image.

:::{class=subfigures id=fig:packing}

![p2 Hard](../Projects/Crystal_Melting/figures/Trimer-p2-Hard.svg){#fig:packing_p2_hard width=49%}
![P2 LJ Potential](../Projects/Crystal_Melting/figures/Trimer-p2-LJ.svg){#fig:packing_p2_lj width=49%}

![pg
Hard](../Projects/Crystal_Melting/figures/Trimer-p1g1-Hard.svg){#fig:packing_pg_hard height=5cm}
![pg LJ
Potential](../Projects/Crystal_Melting/figures/Trimer-p1g1-LJ.svg){#fig:packing_pg_lj height=5cm}

![p2gg
Hard](../Projects/Crystal_Melting/figures/Trimer-p2gg-Hard.svg){#fig:packing_p2gg_hard width=49%}
![p2gg LJ
Potential](../Projects/Crystal_Melting/figures/Trimer-p2gg-LJ.svg){#fig:packing_p2gg_lj width=49%}

A comparison of the packing of the hard and the Lennard Jones potentials.
The molecules coloured in blue are the real copies of the unit cell,
while the molecules in green are the periodic copies.

:::

While the Hard and Shifted Lennard--Jones potentials
give different structures
the transformation between them requires small motions.
The transition from the Hard potential structure [@fig:packing_p2_hard]
to the LJ structure [@fig:packing_p2_lj]
requires a sliding of the layers
with a small translational motion from each particle,
a motion likely to occur in a minimisation.
Furthermore, the LJ structure has no pressure applied
putting it at the extreme of possible structures.
The Hard packing provides a suitable foundation
for the analysis of crystal structures
and analysis using the Lennard--Jones potential
found no new polymorphs.

## Clustering liquid structures

When we use the supervised learning algorithm
developed in @sec:supervised_learning
to search for crystal growth,
we only consider the structures we have found using isopointal search.
In performing an isopointal search,
we are reducing the degrees of freedom to search
by using the symmetry of the space groups.
A limitation of this approach is possible to overly reduce the degrees of freedom
to omit favourable configurations.
An alternate approach to identify locally favourable structures
is using the clustering algorithms developed in @sec:clustering.
In @sec:clustering, we use clustering algorithms to identify
structures constructed from the isopointal search.
Here we use the clustering technique
to search for new local structures
that could be forming within the liquid.
The liquid from a dynamics simulation
has been chosen for a cluster search
as it will allow any local structure to form
without preference for those we have already created.
Additionally, the configurations from the dynamics simulations
represent the longest timescale that can be studied.
The results of the clustering are visualised in @fig:cluster_analysis_liquid,
which shows no collections of local configurations.
The HDBSCAN clustering algorithm [@McInnes2017]
classifies all local configurations as noise
by assigning all to the cluster labelled -1.
This informs us that there are no regions of the 6D feature space
that have a high enough density to form a cluster.
An additional confirmation of this comes from the visualisation,
where the 6D feature space has been projected into the two dimensions shown
using the UMAP dimensionality reduction [@McInnes2018].
In this visualisation (@fig:cluster_analysis_liquid),
there are no regions with a high density of points
indicating we haven't missed structures in our isopointal search.

![Clustering analysis of local configurations
from a simulation of the trimer liquid
at a temperature $T=0.35$ and pressure $P=1.00$,
below the melting point of the crystal.
Each local configuration is represented by an open circle,
with the x, and y coordinates described by
a UMAP projection of the six dimensional input space
onto a 2D plane [@McInnes2018].
The colouring indicates an assignment to clusters
using the HDBSCAN algorithm, [@McInnes2017]
in this case all particles are assigned to the cluster -1
meaning all are considered noise.
](../Projects/Crystal_Melting/figures/clustering_liquid.svg){width=80% #fig:cluster_analysis_liquid}

From our analysis of local configurations
using an isopointal search with a Lennard Jones potential
and the clustering algorithm,
we can be confident we haven't missed any low energy structures.
This means the crystal structures described in @sec:initial_configuration
created from an isopointal search using a hard potential
are the best guess at the lowest energy structures for the trimer molecule.
To understand the slow crystal growth
we have to look to the dynamic behaviour
and how the crystal polymorphs interact with each other
and with the liquid.
