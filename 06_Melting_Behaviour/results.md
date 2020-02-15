# Results

Start with an analysis of the configurations,
looking at whether there are additional structures we haven't considered.
This is followed by an analysis of the melting dynamics
of each crystal structure,
looking at their stability
whether there is competition between structures,
and what the fluctuation model can tell us about the structure.

## Static analysis of the Trimer Polymorphs

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
-------| ---------------- |-------------
p2     | 0.938            | **-0.198**
p2gg   | **0.945**        | -0.190
pg     | 0.927            | -0.084

Table: The packing fraction and potential energy of structures generated
from an isopointal search algorithm. [@Jennings2015]
The potential energy was evaluated after equilibration at a
temperature of 0.1 and a pressure of 1.00
using the packed structure as the initial configuration.
The optimal packing and energy are denoted in bold. {#tbl:potential_energy}

### Packing Analysis

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

### Clustering liquid structures

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

## Polymorphic Stability in simulations {#sec:polymorphic_stability}

In the previous section we examined the static properties
of local configurations concluding that
the crystal structures we have been studying
are the lowest energy structures of the Trimer.
This section investigates the melting behaviour
of each crystal structure
to understand what makes the melting and growth so slow.
The main goal of this section is to find
the most stable of the p2, p2gg, and pg polymorphs
to be used for calculating the melting rate in @sec:Crystal_Melting.

The melting of each crystal polymorph is shown in @fig:melting_comparison,
monitoring the size of the crystalline region for each polymorph as they melt.
The pg polymorph melts the fastest,
an expected result based on the higher potential energy
than the other polymorphs. [@tbl:potential_energy]
The other polymorphs, being p2 and p2gg follow this trend,
the p2 polymorph with the lowest potential energy melts the slowest.
The melting of the entire crystalline region
is only one aspect of melting.
Using the machine learning algorithm developed in @sec:Machine_Learning,
it is possible to monitor the fraction of each polymorph within a simulation,
shown for the p2gg polymorph in @fig:solid_state_transition.
This figure shows most of the p2gg polymorph
undergoing a solid state transition to
the p2 polymorph before the melting takes place.
The rate of this solid state transition
is orders of magnitude faster than melting,
with the transition to the p2 polymorph taking place completely
before melting is observed.

![Comparison of the melting of each of the different crystal types.
These values are compared at a pressure of 13.50 and a temperature of 1.40.
The pg crystals melts faster than either the p2 or p2gg crystals.
](../Projects/Crystal_Melting/figures/melting_crystal_comparison.svg){#fig:melting_comparison width=80%}

### Investigating the Solid State phase transition of the p2gg polymorph

The transition of the p2gg polymorph to the p2 polymorph
shown in @fig:solid_state_transition
takes place incredibly quickly.
The timescale of this conversion
is similar to that of the rotational relaxation time $\tau_R = \num{1.0e4}$
of the liquid at the same conditions.
More than half the particles have undergone a transition
in twice the rotational relaxation time.
What is unusual about this transition
is the initial fast reaction
is followed by a period of no reaction taking place,
followed by a fast reaction, then nothing.
This profile is similar to that of crystal growth
where the nucleation of a new island on the interface
is very slow relative to the growth rate. [@Markov2003]
The speed of this transition is also notable
since it is so much faster than the melting rate
and in @sec:fluctuations we see the crystal structure
is incredibly stiff.
Along with the speed of the transition,
the shape of conversion is notable.
This section investigates why the solid state phase transition
from the p2gg to the p2 polymorph is so fast.

![Monitoring the proportion of each polymorph within a crystal
which is initially comprised of the p2gg polymorph.
The simulation is at a pressure of 13.50 and a temperature of 1.40,
slightly above the melting point of 1.36.
This shows the transition of the configuration from
the p2gg polymorph to the p2 polymorph
while the total proportion of crystal remains constant.
](../Projects/Crystal_Melting/figures/solid_state_transition-P13.50-T1.40-p2gg.svg){#fig:solid_state_transition width=80%}

Both the p2 and the p2gg polymorphs
are comprised of the same dimer like units,
with the molecules facing each other.
Within the p2 structure,
these dimer units all have the same orientation,
resulting in a structure with two layers.
For the p2gg structure,
alternating layers of dimers are offset by \SI{90}{\degree}
resulting in a structure with four layers.
The rearrangements that take place within the solid state phase transition
are the rotations of dimers to match the orientation of the rows above and below.
That is, pairs of molecules reorient by \SI{90}{\degree}.
These reorientations are shown in @fig:solid_state_transition_structure,
where the middle row of blue/orange dimer pair
reorients to face the same direction as the layers above and below.
This process of reorientation continues along the crystal lattice.

::: {#fig:solid_state_transition class=subfigures}

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/phase_transition_0.svg){width=40% #fig:solid_state_transition_0}

![](../Projects/Crystal_Melting/figures/phase_transition_1.svg){width=40% #fig:solid_state_transition_1}

![](../Projects/Crystal_Melting/figures/phase_transition_2.svg){width=40% #fig:solid_state_transition_2}

![](../Projects/Crystal_Melting/figures/phase_transition_3.svg){width=40% #fig:solid_state_transition_3}

![](../Projects/Crystal_Melting/figures/phase_transition_4.svg){width=40% #fig:solid_state_transition_4}
<!-- markdownlint-enable MD045 -->

Steps showing the propagation of a defect within the p2gg crystal.
The p2gg crystal is coloured green, the p2 crystal is coloured yellow
and the liquid is coloured blue.
As the simulation progresses from (a) to (e),
the defect propagates from right to left
along a layer of the crystal.
The time between the first and last frame is \num{5e2},
or 0.05 of the rotational relaxation time.

:::

The reorientation of molecules along the layers of the crystal
is similar to the process of defect propagation
studied in amorphous materials [@Tondl2014]
and in other phase transitions. [@Allain1986;@Burakovsky2000]
In @fig:solid_state_transition_1 we see the creation of the defect,
two dimer units on the right hand side have flipped to reorient.
The remaining figures (@fig:solid_state_transition_2 to @fig:solid_state_transition_4)
show the propagation of the defect along the crystal lattice.
This propagation continues until it reaches
the other side of the crystal and is able to annihilate.
The propagation of the Trimer defect is interesting for three reasons.
Firstly, the motion of the defect is much faster than
the rotational relaxation time in the liquid,
with the rotational relaxation dominated
by relaxations in the crystal.
Defects significantly speeding up
the relaxation process was also observed by @Tondl2014,
so is an expected property of defects.
Secondly, the propagation of the defect
only occurs along a single dimension.
The crystal lattice defines a highly directional
structure on which the defect can move
resulting in motion along a single dimension.
This directionality of this motion is very different
to defects in amorphous materials.
Thirdly, the defects only facilitate
relaxation from the p2gg crystal to the p2.
The motion of the defect does occasionally
reverse along it's path of motion,
however there are no defects created in the p2 crystal.
The lack of reversibility means that
the final relaxed p2 configuration [@fig:transition_end]
contains three grain boundaries.

A characteristic feature of the transition
from the p2gg to p2 polymorph
is the stepped nature in which it takes place.
There are periods of rapid transition
followed by periods of no change.
This stepped pattern is noticeable
from a time of \num{4e4} to \num{1.6e4} in @fig:solid_state_transition.
The presence of these steps
can be described by a two step process.
The initial creation of a defect,
and the propagation of that defect,
where the propagation of the defect
occurs at a much higher rate than the nucleation.
The periods of no change
occur when all the defects have annihilated,
that is, they have converted their entire row to the p2 structure.
We only see the two step process
towards the end of the transformation
where most of the p2gg crystal has converted to p2.

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

### Investigating the fast melting of the pg structure

Both the p2 and the p2gg polymorphs
have comparable melting rates,
likely resulting from the solid state phase transition
of the p2gg structure to the p2 structure.
However, the pg polymorph has a significantly faster melting rate.
In this section we investigate the melting of this polymorph
to understand why is is so much faster.

The melting of the pg polymorph is shown in @fig:pg_melting,
which shows asymmetric melting of the crystal.
In the same time the bottom 30 layers of the crystal
have melted (from @fig:pg_melting_0 to @fig:pg_melting_2),
the top layer of the crystal remains completely intact,
containing the same molecules as the initial configuration.
There are many instances of crystals
having a melting or growth rate
dependent on the face of the crystal used for the measurement. [@Burke1988;@Tymczak1990;@Reinhart2017]
The melting rate which changes depending on
the direction along a crystal face
is a phenomenon for which I have found no other examples in the literature,
making it incredibly interesting for study.

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

<div id="fig:pg_crystal" class="subfigures">

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![Bottom beginning
](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_bottom_0.svg){#fig:pg_crystal_bottom width=40%}
![Top Beginning
](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_top_0.svg){#fig:pg_crystal_top width=40%}
<!-- markdownlint-enable MD045 -->

Zooming in on the pg crystal structure
at the beginning of the melting run
showing the configurations of the particles.
(a) at the bottom and (b) at the top.

</div>

Examining the dynamics at the interface [@fig:spatial_relaxation_pg]
there appears to be a difference
between the relaxation times at the top of the crystal
and those around the edges.
Extending beyond the top of the crystal,
there appears to be a large region where
the rotations are significantly longer than the mean,
indicating a suppression of the dynamics.
This suppression doesn't appear on the edges,
with relaxation times close to those of the equilibrium liquid.
Considering the gear network of @Zwanzig1987,
in creating a surface where rotations are unable to take place,
being the crystal,
molecules interacting with that surface
will be unable to rotate
since the surface won't move with it.

![Time for each molecule in a simulation melting
a crystal of the pg polymorph to rotationally relax.
The mean relaxation time in the liquid is white.
Relaxation times longer than the mean are coloured orange
and those shorter than the mean are coloured blue.
](../Projects/Crystal_Melting/figures/spatial_relaxation_pg.svg){#fig:spatial_relaxation_pg width=80%}

The same effect of the interface can also be
considered for the p2 interface. [@fig:spatial_relaxation_p2]
In this example the dynamics are
more even across the simulation.

![Time for each molecule in a simulation melting
a crystal of the p2 polymorph to rotationally relax.
The mean relaxation time in the liquid is white.
Relaxation times longer than the mean are coloured orange
and those shorter than the mean are coloured blue.
](../Projects/Crystal_Melting/figures/spatial_relaxation_p2.svg){#fig:spatial_relaxation_p2 width=80%}

### Fluctuations in the Lennard--Jones model {#sec:fluctuations}

The melting rates of the Trimer are significantly slower
than what is predicted by the classical theory,
yet the ideas are captured by the fluctuation theory.
How is this so different to a Lennard--Jones liquid?
As a point of comparison,
similar calculations for the fluctuations can be made for 2D Lennard-Jones discs,
though a different order parameter is required,
in this case using the hexatic order parameter, [@Strandburg1984;@Tobochnik1982]
indicative of the bond orientational order.
The hexatic order parameter is given as

$$ \psi_6 = \left|\frac{1}{6} \sum_j^n \exp(i 6 \theta)\right| $$

again normalised such that
the mean orientational order of the liquid
$\langle \psi_6 \rangle_\text{liquid} = 0$
and the mean orientational order of the crystal
$\langle \psi_6 \rangle_\text{crystal} = 1$.
The distribution of these values are shown in @Fig:disc_fluctuation.

![Distributions of the hexatic order parameter $\psi_6$
in the 2D Lennard-Jones disc at the melting point $D=0.53$
](../Projects/Crystal_Melting/figures/fluctuation_disc_normalised.svg){#fig:disc_fluctuation width=80%}

The distributions of order parameters
within these two different systems is wildly different.
While the Trimer (@fig:trimer_fluctuation)
has a clear separation of the liquid and crystal phases,
the LJ-Disc (@fig:disc_fluctuation) has a large overlap,
with no clear point distinguishing the two phases.
Additionally the distribution of values within the LJ-Disc
are much wider than that of the Trimer.
A rather interesting feature of the LJ-Disc
is the complexity of the distribution
containing small bumps which deviate from
a Gaussian distribution,
while the Trimer,
despite being a more complex molecule
has a near perfect Gaussian distribution.

These values are tabulated in @Tbl:fluctuation_curvature,
which demonstrates how constrained the Trimer is,
with the curvature of the liquid phase
being larger than the solid phase of the LJ-Disc.

Molecule   Phase  Curvature
-------- ------- ----------
Trimer    Liquid       5.69
Trimer   Crystal    2357.60
LJ-Disc   Liquid       1.26
LJ-Disc  Crystal       2.37

Table: The curvature of the distributions
for the phases of each Molecule. {#tbl:fluctuation_curvature}

:::{id=fig:fluctuation_harmonic class=subfigures}

![LJ-Disc](../Projects/Crystal_Melting/figures/fluctuation_parabola_disc.svg){width=40%}
![Trimer](../Projects/Crystal_Melting/figures/fluctuation_parabola_trimer.svg){width=40%}

A harmonic description of the fluctuations
demonstrating the large difference between
the LJ-Disc and the Trimer.

:::

The intersection of these two parabolas $M_c$
is at 0.95 for the Trimer and 0.42 for the LJ-Disc.

Describing the motion of crystal growth
as the motion of a configuration along the curve $\omega(M)$,
such that it has to pass through the transition state at $M_c$,
we can use describe the fractions of particles
able to make the transition
as a method of comparing the growth rates.
For the Trimer the fraction is 0.18%,
far less than the 34% of the LJ-Disc.

The highly rigid structure of the p2 crystal
is likely responsible for the high spinodal point
presented in @sec:spinodal.
Experiments [@Lu1998] and
simulation studies in 3D [@Benjamin2015;@Kerrache2008;@Rozmanov2011;@Jackson2002;@Ramakrishnan2017;@Iwamatsu1999]
and 2D [@Abraham1981]
find spinodal points ranging from $T/T_m = 1.08$ to $T/T_m = 1.2$.
Our value of $T/T_m = 1.6$,
is far above this range.
This analysis of the fluctuations
shows that transitions from the crystal to the liquid
are rare and require significant energy to take place.
