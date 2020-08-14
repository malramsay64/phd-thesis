# Relaxations of Individual Molecules {#sec:molecular_relaxation}

Dynamic heterogeneities describe a liquid
with a wide range of relaxation timescales,
rather than the single timescale normally associated with the liquid.
One method of describing this is to describe the relaxation
of each particle within the simulation.
Attributing a relaxation to each particle
was an idea introduced by @Widmer-Cooper2009
where the structural relaxation is described
by the motion of each particle beyond a threshold distance.
This approach describes the structural relaxation function $F_d(t)$ as

$$ F_d(t) = \frac{1}{N} \left \langle \sum_i w_i(d, t) \right \rangle $$ {#eq:structural_relaxation}

where $w_i(d, t) = 1$ if the particle is within distance $d$
of its initial position at time $t$,
and zero otherwise.
The angle brackets signify an average over initial times.
The value of $d$ was chosen to be

$$ d = \frac{\pi}{2 k_{\text{bragg}}} $$

where $k_{\text{bragg}}$ is the wave-vector of
the maximum peak of the static structure factor $S(k)$.
This function describes the structural relaxation
in a similar manner to the self-intermediate scattering function
with the added benefit of being able describe each particle
as either not-relaxed, the particle is within a distance $d$ of its initial position,
or relaxed, the particle is greater than a distance $d$ of its initial position.
This idea of defining individual particles being in one of these two states,
provides an alternative method of defining a relaxation time.
We can define the relaxation time of each particle
as the time required to move a desired length scale.
This length scale can either be a translational motion, or a rotational motion.
Where the translational motion describes
structural relaxation and translational diffusion
while the rotational motion describes
the rotational relaxation time and rotational diffusion.
Rather than defining a single relaxation time for the entire simulation,
having timescales for each particle provides
additional insight into how each particle
contributes to the overall dynamics.
The individual relaxation times
can be combined into a transport property
by taking the mean,
allowing for a comparison with the existing measures
for the transport properties.

This section develops these molecular relaxation quantities
for all the transport properties,
and making a comparison to confirm that
they capture the same characteristics
as the existing properties.

## Reversible behaviour in structural relaxation

When using the intermediate scattering function for structural relaxation
we monitor the decay at the wave number $k$
corresponding to first peak in the structure (see @sec:intro_structural).
This wave number $k$ has a length scale $d$ associated with it, where

$$ d = \frac{\pi}{2k} $$

This is approach used by @Widmer-Cooper2009 for defining a relaxation distance.
We define the time for particles to first move
a distance $d$ from their initial position
as the first passage time $\tau_F$.
A comparison between the first passage time and the structural relaxation time
is shown in @fig:first_passage_time,
where the structural relaxation is an order of magnitude longer
than the first passage time at $T_m/T = 0.80$.
This highlights that reversible relaxations over short distances
are an important part of the dynamics.
This was an issue also faced by @Widmer-Cooper2009,
finding that particles were able to move beyond the distance $d$
without structural rearrangements even within the crystal.

![Structural relaxation compared with the first passage time
](../Projects/Dynamics/figures/first_passage_time.svg){width=80% #fig:first_passage_time}

The relaxations captured by the structural relaxation function
are those associated with an irreversible relaxation.
The typical distance considered for a particle
to have moved to a new local environment
is half the interparticle distance, [@deSouza2008]
however @Doliwa2003 find that particles
can move up to 4 times that distance
while still remaining in the same local environment,
returning to the previous position.
We are interested in the distance at which a particle
leaves the local environment it initially started in.
A distance once a particle has moved
it retains no memory of the previous environment.
A particle will take numerous attempts at escaping the local environment,
with many of them failing, giving rise to the results in @fig:first_passage_time.
A measure of successful relaxation
is one which results in the molecule moving further away,
out of the local environment.
Our approach to measuring the irreversible aspect of structural relaxation
is through the last passage time $\tau_L$.
That is, measuring the structural relaxation
however only confirming the relaxation
when the particle has definitively moved out of
its initial environment.
This can be represented by a particle being in one of three different states,
*local*, being it remains in the local environment before relaxation,
*relaxed*, where the particle has undergone relaxation,
and *diffusive*, where the particle is no longer in the local environment.
The distance a particle has to move to be considered diffusive is $3d$
chosen for being on the tail of the distribution of distances. [@Doliwa2003]
A state diagram describing these transformations is shown in @fig:last_passage_state.
The last passage time $\tau_L$ is compared to the structural relaxation time
in @fig:last_passage_time showing how this quantity
accurately describes the timescale of the irreversible relaxation.

![State diagram describing the transition between the three possible states
for the last passage time.
The arrows describe the possible changes in state,
and conditions describing when the state change occurs.
](../03_Glassy_Dynamics/figures/last_passage.pdf){#fig:last_passage_state width=80%}

![Structural relaxation compared with the last passage time
](../Projects/Dynamics/figures/last_passage_time.svg){width=80% #fig:last_passage_time}

## Single particle diffusion

Having defined the length scale of $3d$ to represent diffusive particles,
this same value is used to find the diffusive relaxation time $\tau_D$
for each particle.
This diffusive relaxation time can be compared to
the translational diffusion constant using the relation

$$ D_t = \frac{9d^2}{4\tau_D} $$

This is derived from @eq:jump_diffusion, [@Doliwa2003]
where we are measuring the average time for
each individual molecule to make a jump
rather than any molecule.
The suitability of comparing the diffusive relaxation time
to the diffusion constant is shown in @fig:diffusive_time,
where the diffusion constant calculated using the standard dynamics
is close to the values using the molecular relaxation method.

![Diffusion constant compared with the diffusive timescale
](../Projects/Dynamics/figures/diffusive_time.svg){width=80% #fig:diffusive_time}

## Single particle rotational relaxations

Of all the molecular quantities,
the rotational relaxations are
the most comparable to the traditional
dipole relaxation times (@fig:rotational_time).
This is because the length scale of the dipole relaxation,
measured in this thesis using the rotational relaxation function $R_2$,
is more well defined than for either
the structural relaxation or the diffusion.
The rotational relaxation function $R_2$ (@eq:rot_relax)
has its first zero at an angular displacement of $\pi/4$,
being the angular displacement required for
the relaxation quantity $\tau_{T4}$.
Likewise, the rotational relaxation function $R_1$
has its first zero at an angular displacement of $\pi/2$,
giving the relaxation quantity $\tau_{T2}$.

![Rotational relaxation times compared with the rotational relaxations
](../Projects/Dynamics/figures/rotational_time.svg){width=80% #fig:rotational_time}

A summary of the comparisons between each of the
traditional dynamics and the new molecular relaxation quantities
is shown in @fig:ratio_comparison.
This figure compares the ratio of the traditional and molecular relaxations
as a function of temperature,
with an excellent fit being the same temperature dependence,
that is a horizontal line.
The temperature dependence of the diffusion constant
has a different shape to that of the $\tau_D$,
displayed in the variable temperature dependence
which results from the presence of jump dynamics,
explored in @sec:jump_dynamics.
The remaining quantities show very similar
values independent of the method used to measure them,
demonstrating these describe the types of relaxations
we are investigating.

![Summary taking the ratio of each molecular relaxation quantity
with its traditional counterpart.
](../Projects/Dynamics/figures/ratio_comparison.svg){width=80% #fig:ratio_comparison}

## Heterogeneities in Molecular Relaxations {#sec:dynamic_heterogeneities}

One of the benefits of describing relaxation times for each particle
is being able to probe the distribution of timescales
over which processes occur.
The distribution of the last passage time $\tau_L$
is given in @fig:relaxation_distribution.
The very large relaxation times shown dominate the mean,
despite most of the relaxation times being short.
As the temperature drops,
the exceptionally slow dynamics on the tail of the relaxation time distribution
dominate the mean.
The presence of dynamic heterogeneities
is a measure of how much the tails of these distributions
impact the calculation of the mean.
It is possible to measure
the deviation of these relaxations from Gaussian,
and hence the degree of dynamic heterogeneities,
by finding the ratio between
the arithmetic mean and the harmonic mean of a relaxation quantity.
We introduce a quantity $\alpha_M$,

$$ \alpha_M = \frac{\langle \tau \rangle}{\left\langle \tau^{-1} \right\rangle^{-1}} $$

which calculates the dynamic heterogeneities of a molecular relaxation quantity
The means weight larger and smaller values differently,
the arithmetic mean is dominated by the longest relaxation times,
while the harmonic mean is the inverse, dominated by the small relaxation times.
The heterogeneity of each of the molecular relaxation quantities
is displayed in @fig:molecular_heterogeneities.
As the temperature drops,
the heterogeneities dramatically increase,
however the quantities don't do so equally.
Quantities which have a longer length-scale
demonstrate less heterogeneity,
with $\tau_F$ having the most while $\tau_D$ has the least.
For the rotational relaxations,
$\tau_{T4}$ has the largest heterogeneity and smallest distance, while
$\tau_{T2}$ has the smallest heterogeneity and largest distance,
and $\tau_{T3}$ sits between.
This follows the trend of the translations,
with quantities describing larger distances
having smaller heterogeneities,
suggesting that we have a general result being,
the longer the distance travelled
the more Gaussian the relaxation.

![Histogram displaying the distribution of the relaxation times
for the last passage time.
](../Projects/Dynamics/figures/histogram_last_passage.svg){width=80% #fig:relaxation_distribution}

![Degree of heterogeneity for each of the molecular relaxations
as a function of temperature.
](../Projects/Dynamics/figures/molecular_heterogeneities.svg){width=80% #fig:molecular_heterogeneities}
