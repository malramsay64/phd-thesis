# Extra Dynamics

These are additional figures for the analysis of the dynamics
which are not required for the main narrative,
acting as supporting information.

## Translational Diffusion

The translational diffusion is characterised by the
Mean Squared Displacement (MSD) of particles
which is shown in @fig:msd.
The two-step relaxation process seen in the structural relaxation (@fig:structural_relaxation)
is also seen in the MSD.
At lower temperatures,
the transition from the initial ballistic region
to the long timescale diffusive region
includes a plateau where the MSD barely increases.
A physical description of this plateau region
describes particles trapped in a cage comprising of it's nearest neighbours. [@Cavagna2009]
As the temperature drops the local cage becomes stiffer,
and particles take longer to escape.
The diffusion constants,
found by fitting the long timescale regions
of the mean squared displacement are shown in @fig:diffusion_constant.
The diffusion constant displays the same
non-Arrhenius behaviour as the structural relaxation.

![The Mean Squared Displacement of the trimer molecule
over a range of temperatures for a pressure $P=13.50$.
Note the logarithmic scale of both axes.
](../Projects/Dynamics/figures/mean_squared_displacement.svg){width=80% #fig:msd}

![The translational diffusion constant as a function of
normalised temperature for high and low pressures.
](../Projects/Dynamics/figures/diffusion_constant_summary.svg){width=80% #fig:diffusion_constant}

## Rotational Relaxations

The rotational relaxations are given by the relaxation of a dipole (@eq:rot_relax)
and shown in @fig:rotational_relaxation.
Like the structural relaxation and mean squared displacement,
the rotational relaxation is characterised by a two step process.
The rotational relaxation time is
the time taken for the relaxation function to decay to $1/e$.
When the rotational relaxation function
is approximated as a exponential decay,
the relaxation time is the rate of the decay.

![The rotational relaxation of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/rotational_relaxation.svg){width=80% #fig:rotational_relaxation}
