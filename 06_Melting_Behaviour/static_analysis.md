# Static analysis of the Trimer Polymorphs {#sec:static_analysis}

The lack of observable crystal growth
means that the crystal structures for the trimer molecule
are based on an isopointal search algorithm [@Jennings2015;@Hudson2011]
which finds the best hard packing of shapes.
We assume the structures generated from hard packing
closely those formed with the Lennard Jones potential.
Comparing the packing fraction with the potential energy, [@tbl:potential_energy]
the best packed structure (p2gg) has the second lowest potential energy
being beaten by the p2 structure.
The approximation of a Lennard--Jones potential as a hard shape
been shown to generate crystal structures
matching those of atomic systems, [@Filion2009;@Hudson2011;@OToole2011;@Kummerfeld2008]
however it is yet to be verified for molecular structures.
In making the assumption that hard packing of Trimers
will give the optimal crystal structures
it is possible we have missed other low energy structures.
This section looks for other possible structures
which may have been missed
using a modified isopointal search algorithm
that minimises a Lennard--Jones potential
and using the clustering algorithm developed in @sec:clustering
to identify new structures in the liquid configurations.

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

In using the crystal structures from hard molecules
for simulations of Lennard--Jones molecules
we make the assumption that these structures
are within the local minima of the Lennard--Jones crystal.
That is with a short minimisation from the hard packed structures
we find the lowest energy states of the Lennard--Jones potential.
This section challenges that assumption,
adapting the isopointal search algorithm [@Jennings2015]
to minimise the Trimer interacting with
the Shifted Lennard--Jones potential used in the simulations. [@packing_code]

The structures generated using
the hard discs and the Shifted Lennard--Jones potential (LJ)
are compared in @fig:packing.
The main difference between the LJ and hard disc packing
is the larger spacing of the LJ packing,
corresponding to the minimum of the potential
which lies a distance of $2^{1/6}\sigma \approx 1.12\sigma$.
Along with the larger spacing for the LJ packing,
there is a slight difference in the stacking of layers,
most noticeable in the p2 crystal
where the hard discs [@fig:packing_p2_hard] are offset
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
the transformation between them requires little motion.
The transition from the Hard potential structure [@fig:packing_p2_hard]
to the LJ structure [@fig:packing_p2_lj]
requires a sliding of the layers
with a small translational motion from each particle,
a motion likely to occur in a minimisation.
Furthermore, the LJ structure has no pressure applied
putting it at the extreme of possible structures.
The Hard packing provides a suitable foundation
for the analysis of crystal structures.

## Clustering liquid structures

When we use our supervised learning algorithm [@sec:supervised_learning]
to search for crystal growth,
we only look for the structures we have found through isopointal search.
It is possible there are additional structures forming we haven't considered
as they don't appear in our isopointal search.
In @sec:clustering, we use clustering to identify
structures constructed from those found using the isopointal search.
We can use this same clustering technique
to determine whether there are previously unknown structures
forming within the liquid.
The local configurations used for clustering
are from the end of a dynamics simulation,
being the longest timescale which can be studied.
The liquid from a dynamics simulations
was chosen to allow any structure to form
without preference for structures we have already created.
The results of the clustering are visualised in @fig:cluster_analysis_liquid
which shows no collections of local configurations.
Regions of the configuration space with a high density of points
suggest locally favourable configurations,
likely those associated with a crystal structure.
Neither the HDBSCAN clustering algorithm [@McInnes2017]
nor the UMAP dimensionality reduction [@McInnes2018]
found regions with a high density of points.

![Clustering analysis of local configurations
from a simulation of the trimer liquid
at a temperature $T=0.35$ and pressure $P=1.00$,
below the melting point of the crystal.
The colouring indicates the assignment to clusters
using the HDBSCAN algorithm [@McInnes2017]
while the x, and y coordinates are found through
a UMAP projection of the six dimensional input space
onto a 2D plane [@McInnes2018].
The HDBSCAN algorithm assigns local configurations
to -1 where there is insufficient local density
to form a cluster.
](../Projects/Crystal_Melting/figures/clustering_liquid.svg){width=80% #fig:cluster_analysis_liquid}

From our analysis of local configurations
we can be confident the structures generated
from an isopointal search using a hard potential
provide the lowest energy structures for the trimer molecule.
To understand the slow crystal growth
we have to look to the dynamic behaviour
and how the crystal polymorphs interact with each other
and with the liquid.
