# Results

While one of the main goals of this thesis
is to understand the slow crystal growth associated with glass formation,
one of the notable results is the complete lack of any crystal growth.
Because of the lack of crystal growth,
crystal structures for the trimer molecule
have been found using an isopointal search algorithm, [@Jennings2015]
finding the best hard packing of the shape.
It is assumed that the optimal hard packing
closely matches the crystal structure of the Lennard Jones potential.
Comparing the packing fraction of each structure
with the resulting potential energy, [@tbl:potential_energy]
the best packed structure (p2gg) does not have the lowest potential energy,
with that going to the p2 structure.
The worst packed structure (pg) has the highest potential energy
which is in line with our expectations.

Crystal| Packing Fraction |Potential Energy per Molecule
-------| ---------------- |-------------
p2     | 0.938            | -0.198
p2gg   | 0.945            | -0.190
pg     | 0.927            | -0.084

Table: The potential energy for each molecule for the crystal structures with the best
packing fractions. The potential energy was evaluated at a temperature of 0.1 and
a pressure of 1.00. {#tbl:potential_energy}

## Investigating Alternate Crystal Structures

There are many reasons for not observing crystal growth,
one of which can be that we are looking at the wrong crystal structures.
In this section we investigate the possibility
that we are looking for the growth of the wrong crystal,
using a range of tools to look for structures
which are more stable than the ones studied.
In ruling out other structures
we can focus on the melting behaviour
knowing this is the information we can obtain.

### Clustering of liquid structures

In looking for crystal growth
we are searching for what we consider to be appropriate structures,
however, it is plausible our collection of structures is incomplete.
There are possibly additional crystal structures
not identified in the isopointal search.
In @sec:clustering, we use clustering to identify
the crystal structures constructed from the isopointal search.
It is possible to use this same clustering technique
to find regions of local structure which could be a new crystal structure.
@Fig:cluster_analysis_liquid performs clustering of configurations
using the HDBSCAN algorithm as described in @sec:clustering.
The configurations used for clustering are from the end of a dynamics simulation,
being the longest timescale which can be studied.
The liquid structure was also chosen to allow any stable structure to form,
not just the pre-determined structures.
Instead of the distinct crystal structures observed in @fig:cluster_sorted_hdbscan,
the configurations are distributed evenly throughout the configuration space,
with no regions of high density clustering.
The clustering analysis of the HDBSCAN algorithm
matches the visualisation from the UMAP algorithm
finding no configurations belonging to local clusters.
With no additional configurations forming,
the structures from the isopointal search
remain the best guess.

![Clustering analysis of a sequence of liquid configurations
at a temperature $T=0.35$ and pressure $P=1.00$,
conditions below the melting point of the crystal.
The HDBSCAN [@McInnes2017] clustering algorithm
doesn't identify any configurational clusters
in 10 thousand local structures taken randomly
from a dynamics trajectory.
](../Projects/Crystal_Melting/figures/clustering_liquid.svg){width=80% #fig:cluster_analysis_liquid}

### Packing Analysis

In finding the crystal structures using an isopointal search algorithm [@Hudson2011]
we use the best packing of hard molecules
as the predictor of the most stable crystal structures.
The approximation of a Lennard--Jones potential as a hard shape
been shown to generate crystal structures
matching those of atomic systems, [@Filion2009;@Hudson2011;@OToole2011;@Kummerfeld2008]
however it is yet to be verified for molecular structures.
It is possible that the molecular shapes mean that
a short minimisation simulation is unable to find
the local minima once the Lennard--Jones potential is applied.
The isopointal search algorithm for hard molecules [@Jennings2015]
was rewritten and adapted [@packing_code]
to optimise molecules interacting via the Shifted Lennard--Jones potential,
matching the potential used for the molecular dynamics simulations.
The structures generated using the hard potential and the Shifted Lennard--Jones
potential are compared in @fig:packing.
The main difference between the Lennard--Jones (LJ) and hard disc packing
is the larger spacing of the LJ packing,
which corresponds to the minimum of the potential
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

From the analysis of the trimer molecule
there are no structures we are missing in this analysis.
The timescales required for crystallisation
are beyond the current limits of our simulations.
Rather than focusing on crystal growth,
we instead turn to developing an understanding of crystal melting.

## Polymorphic Stability {#sec:polymorphic_stability}

We have three crystal structures which at a best guess estimate
the different structures available to the trimer molecule.
So we want to understand how they melt.
This section investigates the melting behaviour
of all the different crystal structures
to understand their different behaviour.
The main goal of this section is to find
the most stable of the p2, p2gg, and pg crystals
to use for the calculation of the melting rate.

The potential energy calculations [@tbl:potential_energy]
propose the p2 structure as the most stable,
with a slightly lower enthalpy than the p2gg structure.
The pg structure is significantly higher in enthalpy
than either the p2 or p2gg structures.
To see the effect of these enthalpy differences on the melting rates,
@fig:melting_comparison monitors the size of the crystal region
starting from a rectangle of each crystal structure.
The crystal which melts the fastest is from the pg structure,
an expected result given the enthalpy is higher
than the p2 and p2gg crystals.
The melting rates of the p2 and p2gg crystals follow this trend,
with the p2gg crystal melting faster having higher enthalpy.

![Comparison of the melting of each of the different crystal types. These values are
compared at a pressure of 13.50 and a temperature of 1.40. The pg crystals melts
faster than either the p2 or p2gg crystals.
](../Projects/Crystal_Melting/figures/melting_crystal_comparison.svg){#fig:melting_comparison width=80%}

The melting of the entire crystalline region
is only one aspect of the melting rate.
Using the machine learning algorithm developed in @sec:04_Machine_Learning,
it is possible to monitor the fraction of each crystal polymorph within a simulation.
The monitoring of each polymorph within a simulation of the p2gg crystal
is shown in @fig:solid_state_transition,
which shows the majority of the p2gg polymorph
converting to the pg polymorph
in a solid state phase transition.
The rate of this solid state transition
is orders of magnitude faster than melting
with the transition to the p2 polymorph taking place completely
before melting is observed.
The solid state phase transition
takes place on a timescale similar to that of
the rotational relaxation time.
The Trimer at a temperature $T=1.40$ and pressure $P=13.50$,
has a rotational relaxation time $\tau_R = \num{2.8e5}$,
a timescale over which all the crystal
has undergone the solid state phase transition.
For the phase transition to take place so quickly,
it must take place through a series of highly co-ordinated rearrangements.

### Investigating the Solid State phase transition of the p2gg polymorph

Both the p2 and the p2gg structures
are comprised of the same dimer like units. [@fig:...]
These units are all in the same direction in the p2 structure
while the p2gg structure has layers of dimers offset by \SI{90}{\degree}.
The rearrangements taking place within the solid state phase transition
are the rotations of dimers to match the orientation of the rows above and below.
These reorientations are shown in @fig:solid_state_transition_structure,
where a defect propagates along the horizontal layers
changing their orientation.
The process of defect propagation
is similar to that studied in amorphous materials [@Tondl2014]
and in other phase transitions. [@Allain1986;@Burakovsky2000]
The transition displayed here
is interesting in that it is limited to 1D,
only taking place along the planes of the crystal lattice.

::: {#fig:p2gg_phase_transition subfigures}

![test](../placeholder_figure.png)

There are subfigures

:::

The transition of the p2gg crystal to the p2 crystal
takes place at a fast rate,
however the reverse reaction is not observed.
This highly directional reaction indicates
a large difference in the free energy $\Delta G$
between the p2 and p2gg polymorphs.
With the potential energy difference between the polymorphs
being relatively small [@tbl:potential_energy],
the only other contributor must be the entropy.
This highlights a limitation of using the packing approach
for the generation of crystal structures,
by only considering the static configurations
we are only considering the enthalpy component of the free energy.

The highly directional nature of the transition
in that it can only take place along a single layer of the crystal
and it doesn't back-track explain both
the incredible rate at which the transition takes place
and its step-like nature.
A single pair of molecules switching from
the four layer p2gg structure to the two layer p2 structure,
must lower the barrier for
neighbouring pairs of molecules to undergo this same transformation.
Once the initial fast transformation has taken place
there are a smaller number of p2gg molecules
which are able to initialise the phase transition,
resulting in periods of waiting for a 'nucleation' event,
followed by the rapid propagation across the crystal.
Also of note is that the starting point of the propagation
is completely random.
In the final configuration (@fig:transition_end),
there are still three rows of the p2gg crystal,
which are grain boundaries between
layers of the p2 crystal with different orientations.
The presence of this phase transition is
additional evidence that we have identified
the crystals which will grow in simulation.

![Monitoring the proportion of each crystal within the p2gg crystal at a temperature of
1.40 and a pressure of 13.50 which is slightly above the melting point of 1.36. Tracking all
the different crystals within the configuration shows a transition of the p2gg crystal
structure to the p2 crystal structure.
](../Projects/Crystal_Melting/figures/solid_state_transition-P13.50-T1.40-p2gg.svg){#fig:solid_state_transition width=80%}

A characteristic feature of the transition,
is that after the initial transformation,
there are periods of no change
followed by short periods of quick change.
Giving a stepped pattern between
\num{1e7} and \num{3e7} timesteps in @fig:solid_state_transition.

<div id="fig:solid_state_transition_structure" class="subfigures">

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-p2gg_init.svg){#fig:transition_init width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-p2gg_process.svg){#fig:transition_process width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-p2gg_end.svg){#fig:transition_end width=33%}
<!-- markdownlint-disable MD045 -->

The process of the solid state phase transition with the colouring denoting the
identified crystal structure. The liquid is blue, the p2 crystal is yellow, the pg
crystal is red and the p2gg crystal is green. The initial configuration (a), shows the
entire central crystal classified as p2gg, with some patches of p2 around the border.
After 4 million timesteps (b), there are now large regions which have been converted to
the p2 crystal structure. In the final configuration (c) the only remaining p2gg crystal
are grain boundaries between the layers of p2 crystals.

</div>

### Investigating the Fast Growth of the pg structure

While the p2 and the p2gg polymorphs
have comparable melting rates,
primarily resulting from p2gg structure
undergoing a solid state transition to the p2 structure,
the pg polymorph has a significantly faster melting rate.
Understanding how this crystal melts may provide some insight
into the phenomenally slow growth rates of the p2 crystal.

<div id="fig:pg_melting" class="subfigures">

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_0.svg){#fig:pg_melting_0 width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_1.svg){#fig:pg_melting_1 width=33%}
![](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_2.svg){#fig:pg_melting_2 width=33%}
<!-- markdownlint-enable MD045 -->

Melting of the pg crystal,
with crystalline regions shown in red,
and liquid regions shown in blue.
Trace quantities of the p2 and the p2gg crystal
are shown in yellow and green respectively.
This shows (a) the melting from the initial crystal,
(b) after a time of \num{1e6} and
(c) after a time of \num{2e6}.

</div>

@Fig:pg_melting shows configurations
from the melting of the pg crystal,
demonstrating asymmetric melting of the pg crystal.
In the same time the crystal has melted
the bottom 30 layers (from @fig:pg_melting_0 to @fig:pg_melting_2),
the top layer of the crystal remains completely intact,
containing the same molecules as the initial configuration.
It is a common occurrence for
crystal faces to have different melting rates, [@Burke1988;@Tymczak1990]
however it is far less common for different rates
on opposite sides of the same crystal,
such that no other examples have been found within the literature.
So what is the difference between these two faces?

<div id="fig:pg_crystal" class="subfigures">

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![Bottom beginning](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_bottom_0.svg){#fig:pg_crystal_bottom width=33%}
![Top Beginning](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_top_0.svg){#fig:pg_crystal_top width=33%}
![Top End](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_top_2.svg){#fig:pg_crystal_top_end width=33%}
<!-- markdownlint-enable MD045 -->

Zooming in on the pg crystal structure
at the beginning of the melting run
(a) at the bottom and (b) at the top.
This can be compared to
(c) the top after a time of \num{2e6}.

</div>

The primary difference between
the top and the bottom of the pg crystal,
is the face of the molecule exposed to the liquid.
The top face of the crystal exposes the larger particle,
while the bottom face exposes all three particles.
Interactions at the bottom face of the crystal
can have much stronger interactions with the liquid
than at the top of the crystal,
interactions which can help remove particles from the crystal.
This isn't the entire story,
since molecules at the top and bottom of the crystal
have the same interactions within the crystal
with each molecule locked into the concavities
of the neighbouring molecules.
The melting of the crystal [@fig:pg_melting_1]
takes place along the diagonal crystal planes
giving the triangular shape.
Along this face there isn't the same
locking of molecules into the crystal structure.

Looking past the crystal
to the first layer of the liquid,
the layer of liquid above the top (@fig:pg_crystal_top)
has much orientational order
than the layer below the bottom (@fig:pg_crystal_bottom).
The orientational order observed
at the start of the simulation
persists and possibly even extends throughout the simulation,
still remaining after a time of \num{2e6} (@fig:pg_crystal_top_end).
