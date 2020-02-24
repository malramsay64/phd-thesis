# Conclusion

The introduction of new molecular relaxations in @sec:molecular_relaxation
provides a method of describing the relaxation
of each individual particle.
We use the Trimer model to show these quantities
are comparable to the traditional dynamics quantities,
having similar timescales and temperature dependences.
We calculate a measure of dynamic heterogeneity
for each of these molecular relaxation quantities,
finding that the dynamic heterogeneities have a
length scale dependence.

In @sec:jump_dynamics we find the onset of jump dynamics
to explain the presence of dynamic heterogeneities.
As the temperature drops,
the length scale of re-organising the local environment increases,
resulting in large jumps between configurations.
For these large jumps to be described by Brownian dynamics
many of them need to be observed.
The distribution of these jumps is much wider than for Brownian dynamics,
with particle motion dominated by
relaxations which have a long timescale but low probability.
When averaging over many relaxation times as in @fig:jump_heterogeneties,
the distribution returns to a Gaussian.
The increasing length scale of the jumps
is likely related to the increasing length scale
of dynamic heterogeneities described by
the free energy model of dynamics.

@sec:sed explains the breakdown of the Stokes--Einstein--Debye relations.
This describes two types of dynamics,
the short timescale jump dynamics
where the assumption of Brownian dynamics no longer holds.
Motions over the length scale of the structural and rotational relaxations
are highly correlated as they tend to occur in a single jump.
Over larger length and time scales,
like those associated with translational diffusion,
the dynamics returns to Brownian in nature.
This dual nature of the dynamics
describes the problems replicating the decoupling
of translational and rotational motion in simulations.
This is further explained in @sec:trans_rot_coupling
where rather than the different temperature dependences
describing a decoupling of translations and rotations,
when looking at the motions of individual molecules
there is actually a coupling of motions.

The onset of jump dynamics and the coupling of rotational and translational motion
break two fundamental assumptions of the Stokes--Einstein--Debye (SED) relations.
The observed breakdown is a result of the model
not accounting for the types of motion which are present.
While SED describes the dynamics at high temperatures,
alternative models which incorporate the motions present in
liquids close to the glass transition should be used instead.
