# Polymorphic Stability in simulations {#sec:polymorphic_stability}

In the previous section we examined the static properties of local configurations,
concluding that the crystal structures we have been studying
are the lowest energy structures of the Trimer.
This section investigates the melting behaviour
of each crystal structure
to understand what makes the melting and growth so slow.
The main goal of this section is to find
the most stable of the p2, p2gg, and pg polymorphs
to be used for calculating the melting rate in @sec:Crystal_Melting.

A comparison of the melting for an initial crystal of each polymorph
is shown in @fig:melting_comparison.
This monitors the radius of the region considered crystalline
as the melting progresses.
The pg polymorph melts the fastest,
an expected result based on the higher potential energy
than the other polymorphs (@tbl:potential_energy).
The other polymorphs, being p2 and p2gg follow this trend,
the p2 polymorph with the lowest potential energy melts the slowest.
The melting of the entire crystalline region
shows a high level view macroscopic view of the melting process.
To understand more we can investigate how individual particles
are involved in the melting process.

![Comparison of the melting of each of the different crystal types.
These values are compared at a pressure of 13.50 and a temperature of 1.40.
The pg crystal melts faster than either the p2 or p2gg crystals.
](../Projects/Crystal_Melting/figures/melting_crystal_comparison.svg){#fig:melting_comparison width=80%}

## Investigating the Solid State phase transition of the p2gg polymorph

Using the machine learning algorithm developed in @sec:Machine_Learning,
it is possible to monitor the fraction of each polymorph within a simulation,
providing a more complete understanding of melting.
The fraction of each state is shown in @fig:solid_state_transition,
monitoring the melting of a crystal that starts as the p2gg polymorph.
This figure shows most of the p2gg polymorph
undergoing a solid state transition to the p2 polymorph,
such that a configuration that is initially ~40% p2gg becomes ~38% pg.
The rate of this solid state transition
is orders of magnitude faster than melting,
with the transition taking place before melting is observed.
The timescale of the solid state transition
is similar to the rotational relaxation time
of the liquid, $\tau_R = \num{1.0e4}$.
More than half the particles have undergone the transition
in only twice the rotational relaxation time.
This is within a crystal structure
highly resistant to melting through rotational relaxations.
Along with the speed of the transition,
the shape of conversion is notable,
the initial fast reaction
is followed by a period of no reaction taking place,
followed by a fast reaction, then nothing.
This profile is similar to that of crystal growth
where the nucleation of a new island on the interface
is very slow relative to the growth rate. [@Markov2003]

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
![](../Projects/Crystal_Melting/figures/phase_transition_4.svg){width=40% #fig:solid_state_transition_4}
<!-- markdownlint-enable MD045 -->

Steps showing the propagation of a defect within the p2gg crystal.
The colouring of particles is according to the orientation.
As the simulation progresses from (a) to (d),
the defect in the middle layers of the crystal
propagates from right to left.
At each step, more of the particles have
flipped from the four layers of the p2gg crystal
to the two layers of the pg crystal.
The time between the first and last frame is \num{5e2},
or 1/20th of the rotational relaxation time.

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
the other side of the crystal annihilating in the liquid.
The propagation of the Trimer defect is interesting for three reasons.
Firstly, the motion of the defect is much faster than
the rotational relaxation time in the liquid,
meaning that the creation of the defect
must unlock a low energy pathway between the two structures.
Defects significantly speeding up relaxation processes
is also observed in atomic systems, [@Tondl2014;@Pertsinidis2001]
and have been considered as playing a role
in the dynamic heterogeneities of glass formers. [@Bendler1992;@Pan2016;@Chandler2010;@Garrahan2014]
Additionally in the transformation between quasi-crystal and crystalline structures,
the presence of defects greatly accelerates the phase transition. [@Steurer2005;@Gittus1978;@Roshal2000]
Secondly, the propagation of the defect
only occurs along a single dimension.
The crystal lattice defines a highly directional
structure on which the defect can move
resulting in motion along it.
The restriction of this motion to a single dimension
plays an important role in the speed of this transition,
once a defect has been created,
it propagates along the crystal lattice with some thermodynamic driving force
converting all local configurations along the way.
The defect has to visit every site along that lattice,
a condition not present in higher dimensional space.
Thirdly, the defects only facilitate
relaxation from the p2gg crystal to the p2.
The motion of the defect does occasionally
reverse along its path of motion,
however there are no defects created in the p2 crystal.
This means there must be a significant driving force
for the conversion between the local structures.
With the small enthalpy difference between the polymorphs (@tbl:potential_energy)
it is likely this is an entropic driving force
in favour of the p2 crystal.
A byproduct of the non-reversibility of this reaction
is that the final structure from the phase transition
contains three grain boundaries (@fig:transition_end),
resulting from the nucleation occurring
at random sites along the crystal.

A characteristic feature of the transition
from the p2gg to p2 polymorph
is the stepped nature in which it takes place.
There are periods of rapid transition
followed by periods of no change.
This stepped pattern is noticeable
from a time of \num{4e4} to \num{1.6e4} in @fig:solid_state_transition.
The presence of these steps
can be explained by a two-step process,
the first step being the creation of a defect,
and the second the propagation of that defect along the crystal lattice.
As mentioned above,
the one dimensional confinement of the defect
results in it propagating incredibly quickly.
This results in the periods of no change
occurring when all the defects have annihilated,
that is, they have converted their entire row to the p2 structure.
The two-step process of the phase transition
becomes more noticeable as it progresses,
providing additional information for understanding nucleation.
Nucleation is a process which can occur on any layer of the crystal,
however as the phase transition progresses
the possible layers which will result in
a favourable phase transition diminish exponentially.
Rather than the nucleation being slow,
it is instead the number of possible sites dropping.

::: {#fig:solid_state_transition_structure class=subfigures}

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

:::

Overall the dynamics of the Trimer molecule
are phenomenally slow (@sec:Dynamics),
however the speed of the solid state transition is fast,
indicating a low energy pathway between different configurations.
The flipping of a dimer doesn't
require much rearrangement from the neighbouring molecules,
since it can take place within the crystal.
This means it is possible the same types of rearrangements
could be taking place within the liquid,
as there are many instances of the dimer present.

## Investigating the fast melting of the pg structure

The pg polymorph has a significantly faster melting rate than the other polymorphs.
In this section we investigate the melting of this polymorph
to understand why is is so much faster.
Configurations from the melting of the pg polymorph (@fig:pg_melting)
show an asymmetric melting of the crystal structure.
In the same time 30 layers of crystal from the $\{0 \bar{1}\}$ face have
melted (from @fig:pg_melting_0 to @fig:pg_melting_2),
the surface layer of the crystal in the $\{0 1\}$ face remains completely intact,
containing the same molecules as the initial configuration.
While there are many instances of crystals having a melting or growth rate
dependent on the face of the crystal used for the measurement, [@Burke1988;@Tymczak1990;@Reinhart2017]
having a melting rate dependent on the direction along a crystal
is a phenomenon for which I have found no other examples in the literature.

::: {#fig:pg_melting class=subfigures}

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

:::

The primary difference between
the $\{0 1\}$ and the $\{0 \bar{1}\}$ faces of the pg crystal
is the part of the molecule exposed to the liquid.
The $\{0 1\}$ face of the crystal exposes the larger particle,
while the $\{0\bar{1}\}$ face exposes all three component particles.
Interactions at the $\{0\bar{1}\}$ face of the crystal
can have much stronger interactions with the liquid
than at the $\{0 1\}$ face of the crystal,
interactions that can help remove particles from the crystal.
Looking at the melting process, (@fig:pg_melting_1)
the melting takes place along the $\{1 \bar{1}\}$ and $\{\bar{1} \bar{1}\}$ planes
resulting in the observed triangular shape.
The melting along these diagonal faces indicates
a weakness in the crystal structure at the corners.
Along the $\{0 1\}$ and $\{0 \bar{1}\}$ faces of the crystal,
the molecules are interlocked,
with the small particles in the concavity of the neighbouring particle
creating a gear like connection that hinders rotational motion. [@Zwanzig1987]
At the ends of each layer,
the $\{1 \bar{1}\}$ and $\{\bar{1} \bar{1}\}$ planes,
there is no interlocking molecule
allowing for free rotation and consequently melting.

::: {#fig:pg_crystal class=subfigures}

![$\{0  1\}$ Interface
](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_top_0.svg){#fig:pg_crystal_top width=40%}
![$\{0 \bar{1}\}$ Interface
](../Projects/Crystal_Melting/figures/configuration-P13.50-T1.40-pg_bottom_0.svg){#fig:pg_crystal_bottom width=40%}

A look at the molecular arrangement of the pg crystal structure
at the beginning of a simulation trajectory
showing the configurations of the molecules
(a) along the $\{0 1\}$ interface and (b) along the $\{0 \bar{1}\}$ interface.
The colouring of molecules is the classifications assigned by
the Machine Learning algorithm developed in @sec:supervised_learning.
Molecules coloured red are the pg crystal,
those coloured blue are liquid,
and the single green molecule is locally p2gg.
This shows the different sides of the molecule
facing the liquid between the top and the bottom faces
and the interlocking of molecules
along the $\{0 1\}$ and $\{0 \bar{1}\}$ faces of the crystal.

:::

Examining the dynamics at the interface (@fig:spatial_relaxation_pg),
there appears to be a large region extending from
the $\{0 1\}$ face of the crystal
where the rotational relaxations are significantly longer than the mean.
This indicates that the $\{0 1\}$ face suppresses the dynamics of the liquid
resulting in an asymmetric melting rate.
The mechanism for this suppression could be explained
by considering the molecular system as a network of gears, [@Zwanzig1987]
such that neighbouring molecules must have angular velocities
which are equal in magnitude and opposite in sign.
All molecules within the crystal
have an average angular velocity of 0,
with the order of the crystal inhibiting all rotation.
This is an extreme view of the rotations,
with the neighbourhood of the liquid changing regularly,
however, it describes a mechanism by which
the crystal can inhibit the rotational dynamics.
The same suppression of rotational motion at the interface
can be considered for the p2 polymorph (@fig:spatial_relaxation_p2).
The p2 polymorph displays a similar suppression along the $\{1 0\}$ and $\{\bar{1} 0\}$ faces,
although it is less pronounced.
This is possibly a result of the crystal faces
not aligning with the edges of the crystal,
instead being angled.

![Time for each molecule in a simulation melting
a crystal of the pg polymorph to rotationally relax.
The mean relaxation time in the liquid is white.
Relaxation times longer than the mean are coloured orange
and those shorter than the mean are coloured blue.
](../Projects/Crystal_Melting/figures/spatial_relaxation_pg.svg){#fig:spatial_relaxation_pg width=80%}

![Time for each molecule in a simulation melting
a crystal of the p2 polymorph to rotationally relax.
The mean relaxation time in the liquid is white.
Relaxation times longer than the mean are coloured orange
and those shorter than the mean are coloured blue.
](../Projects/Crystal_Melting/figures/spatial_relaxation_p2.svg){#fig:spatial_relaxation_p2 width=80%}
