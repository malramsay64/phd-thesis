---
top-level-division: chapter
title: Conclusion
---

In this thesis we have used the Trimer molecule
to understand two of pre-eminent problems in molecular liquids;
the fragility close to the glass transition temperature,
and the slow crystal growth rates.
Our analysis of the dynamics of the trimer in @sec:Dynamics
show that it is a suitable model of a fragile liquid,
displaying the same liquid state dynamics as ortho-terphenyl.
Additionally in this section we observe the onset
of the dynamic heterogeneities well above the melting point,
highlighting that the onset of dynamic heterogeneities
is associated with the glass transition temperature
rather than the supercooled liquid.
With the Trimer being a suitable model
to study the behaviour of supercooled liquids,
in @sec:Glassy_Dynamics we introduced new dynamic quantities
that describe the relaxation of each individual molecule.
These molecular relaxations provide a new method
for investigating dynamic heterogeneities,
finding the dynamic heterogeneities arise
from the onset of jump dynamics (@sec:jump_dynamics).
As the temperature decreases
the size of translational and rotational motions increase
and the dynamics can no longer be suitably described as Brownian
causing a breakdown in the Stokes--Einstein--Debye dynamics.
This breakdown is not only a result of the jump dynamics,
where in @sec:sed we find coupling between
rotational and translational motions,
with structural relaxation requiring both motions to occur.
The presence of jump dynamics and the coupling of rotational and translational motion
results in the breakdown of the Stokes--Einstein--Debye relations
and alternative models of dynamics are required for
liquids close to the glass transition.

@Sec:Machine_Learning introduces a new machine learning methodology
which is able to identify local structures
which have a high incidence,
like those within a crystal structure using clustering.
We also introduce a supervised learning algorithm
which is able to distinguish three crystal polymorphs of the Trimer
from the liquid phase.
We use this machine learning algorithm in @sec:Crystal_Melting
where the high accuracy allows us to measure
melting rates which are 4 orders of magnitude slower
than anything else in the literature.
When fitting these melting rates to models of melting,
we find that a Semi-Empirical Density functional model,
which uses the fluctuations of a order parameter
to best model the temperature dependence of the melting rate.
This Semi-Empirical Density functional model
explains the slow melting rates of the Trimer model
through the rigidity of the liquid and crystal structures.

While we are able to measure the melting rates of the Trimer,
we are unable to observe crystal growth
within the timescale of simulations.
@Sec:Melting_Behaviour investigates reasons for why
the growth rate is so phenomenally slow.
Here we find that the slow growth
is a result of the suppression of rotational motion
close to the surface of the crystal.
The lack of rotations within the crystal
is preventing the rotations within the liquid.
We can study the effect of this suppression
in the melting of the pg polymorph,
which shows suppression of rotations on the ${0 1}$ face
and fast melting on the ${0 \bar{1}}$ face.

The Trimer molecule has proved to be an excellent model
with which to study the unusual behaviours
of low temperature liquids.
The combination of being able to visualise the entire simulation
while also being able to explore larger and longer simulations
allowed for a greater understanding of the behaviours of this molecule.
The next step for continuing this analysis of dynamics
is to apply these same analysis techniques to
the Lewis--Wahnström model,
ensuring that these results are the same in 3D.
