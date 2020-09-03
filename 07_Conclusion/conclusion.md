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
The combination of being able to visualise the entire simulation
while also being able to explore larger and longer simulations
allowed for a greater understanding of the behaviours of this molecule.
The next step for continuing this analysis of dynamics
is to apply these same analysis techniques to
the Lewis--Wahnström model,
giving an insight into whether these effects hold in 3D.
A downside of using the 2D Trimer model
is that there is only a single rotational degree of freedom in 2D,
rather than the three degrees of freedom in 3D.
The additional degrees of freedom available to rotations in 3D,
could reduce the effect of the slow rotational motions.
A further effect observed of the Trimer molecule,
is the onset of dynamic heterogeneities above the melting point,
suggesting dynamic heterogeneities are a property of the glass transition
rather than the melting point.

With the Trimer being a suitable model
to study the behaviour of supercooled liquids,
in @sec:Glassy_Dynamics we introduced new dynamic quantities
that describe the relaxation of each individual molecule.
These new dynamic quantities
are shown to be useful for the Trimer model,
through are yet to be more widely tested.
Further work applying these new tools
to well characterised models, like Lewis--Wahnström,
would greatly help develop their general applicability.
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
The benefits of this machine learning approach
is the potential to be applied to a range of crystal structures.
Further work is to demonstrate this applicability
to a range of different molecules and their crystal structures.
The general nature of the approach has potential
to describe a method that works for nearly any molecular crystal.
The most difficult part of a general approach
will be the transition from describing crystals in 2D space
to describing crystals in 3D space,
where the number of nearest neighbours increases from six to twelve,
increasing the dimensionality of the feature space accordingly.

We use the machine learning algorithm in @sec:Crystal_Melting
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
A significant downside of the exceptionally slow melting rates,
is that there was no observed crystal growth.
A further study of the Trimer model
could investigate methods for speeding up the crystal growth rates,
with a potential method being modifications to the shape
reducing the effective size of the outer particles.
This reduced size would allow for more freedom of rotation
and hence the fluctuations which the Semi-Empirical model is based on.
Moving to studying a 3D system,
like the Lewis--Wahnström model,
would also increase the speed of growth,
by providing more rotational degrees of freedom
the liquid and crystal structures will be less constrained
giving larger fluctuations of the order parameter
used in the Semi-Empirical Density Fluctuation model.

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
requiring timescales that are not computationally accessible.
Understanding the Trimer model is made easier by
the 2D nature of the simulations,
so there could be benefit to speeding up the crystallisation rate.
An alternative approach to studying crystallisation
would be to use the Lewis--Wahnström model
that also undergoes nucleation on an observable timescale. [@Pedersen2011]
Combining this model,
with the highly accurate local structure detection
of the machine learning methodology,
could provide insights into both nucleation and crystal growth
leading to a complete understanding.
