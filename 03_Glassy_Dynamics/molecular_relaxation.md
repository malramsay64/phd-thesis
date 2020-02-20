# Relaxations of Individual Molecules {#sec:molecular_relaxation}

The relaxations we have been calculating
are characteristic times for
the entire simulation configuration.
From the presence of the dynamic heterogeneities,
there are different timescales
on which relaxation takes place.
So rather than having a single characteristic time
for the entire simulation,
having characteristic timescales for every particle
gives us more information on how
the different relaxations are linked
for each individual particle.
This idea of applying a relaxation
to each individual particle
was introduced by @Widmer-Cooper2009
for the structural relaxation.
Here we build upon this idea
developing relaxation times
for all the dynamics quantities.

One of the key differences introduced
is rather than defining a relaxation function
which describes the total relaxation,
the relaxation of each particle is considered.
With the characteristic timescale
taken from the average over all the particles.

## Reversible behaviour in structural relaxation

When calculating structural relaxation though
the intermediate scattering function
we use a characteristic wave number.
This wave number $k$ inherently has a
length scale $d$ associated with it

$$ d = \frac{\pi}{2k} $$

This distance can then be used to define relaxation
with particles having moved further than this distance
being considered relaxed.
Here we are looking for the time taken
for a particle to first move beyond this characteristic distance.
This length scale is typically considered
the distance a particle has to move
to completely forget it's previous environment.[@cite]
When comparing the structural relaxation time
to the relaxation time $\tau_F$ (@fig:first_passage_time)
there is a distinct different in both the timescale
and the shape of the two curves,
with a particularly noticeable deviation in shape
at $T_m/T = 0.80$.

![Structural relaxation compared with the first passage time
](../Projects/Dynamics/figures/first_passage_time.svg){width=80% #fig:first_passage_time}

The idea that reversible relaxations
play an important role in dynamics
is one which has been investigated previously [@deSouza2008]
and presented as an issue when introducing
a local structural relaxation quantity. [@Widmer-Cooper2009]
@Doliwa2003 find metabasins with radii up to 4 times
the size of the simulated particles
which is far larger than a half radius
which is typically considered as
the escape from the local environment.
The return to the previous structure is important
since once a particle leaves it's local neighbourhood
it should have no memory of where it was.
This raises the idea
that a molecule will make multiple attempts
at escaping the local environment,
with many of them failing,
resulting in a reversed relaxation.

When a particle completely escapes it's local environment
it is entirely possible to return
as a part of the random process.
A particle undergoing a random walk in 2D
is guaranteed to return to it's original position, [@Polya1921]
and with a probability of 34% in 3D. [@Watson1939;@Weisstein]

The approach to solving these issues is using the last passage time,
building upon the ideas of @Widmer-Cooper2009 and @deSouza2008
in acknowledging a particle will undergo reversible relaxations,
however there is a distance beyond which
the particle has no 'memory' of it's previous location,
this distance is the diffusive distance,
and is $3 \frac{\pi}{2k} \approx 1.2$.
The last passage time $\tau_L$ is the time
a particle undergoes a structural relaxation,
that is moves a distance $\approx 0.4$,
before it moves beyond the diffusive distance.
The last passage time $\tau_L$ is far better at describing
the structural relaxation (@fig:last_passage_time),
closely following the shape of the structural relaxation timescale.

![Structural relaxation compared with the last passage time
](../Projects/Dynamics/figures/last_passage_time.svg){width=80% #fig:last_passage_time}

## Single particle diffusion

The length scale which we have associated with diffusion is $3 \frac{\pi}{2k} \approx 1.2$
chosen for being close to a value of 1
with the idea that $D = 1/\tau_D$.
While this does hold true over the range of temperatures (@fig:diffusive_time)
the timescale is possibly too small.

![Diffusion constant compared with the diffusive timescale
](../Projects/Dynamics/figures/diffusive_time.svg){width=80% #fig:diffusive_time}

## Single particle rotational relaxations

Of all the molecular quantities,
the rotational relaxations are
the most comparable to the traditional
dipole relaxation times (@fig:rotational_time).
The reason for this is that the length scale
for the dipole relaxation is more well defined
that either the structural relaxation or the diffusion.
The rotational relaxation $C_2$ has it's first zero
at an angular displacement of $\pi/4$,
which is the angular displacement required for
the relaxation quantity $\tau_{T4}$.

![Rotational relaxation times compared with the rotational relaxations
](../Projects/Dynamics/figures/rotational_time.svg){width=80% #fig:rotational_time}

As a way of summarising the relationships between
the traditional quantities and the newer molecular relaxation quantities
@fig:ratio_comparison shows the temperature dependence of
the ratios of the old and new quantity.
At $T_m/T < 0.5$ the temperature dependence deviates,
however at lower temperatures,
there is a nearly constant relation
between the two types of relaxation.
This demonstrates these quantities
are appropriate for developing our
understanding of dynamics.

![Summary of comparisons
](../Projects/Dynamics/figures/ratio_comparison.svg){width=80% #fig:ratio_comparison}

## Heterogeneities in Molecular Relaxations {#sec:dynamic_heterogeneities}

One of the benefits of describing relaxation times
for each individual molecule
is it provides methods of probing
the distribution of timescales
over which these processes occur.
This provides methods of understanding
the effect of unusually slow events
on the overall dynamics.

The distribution of the last passage time $\tau_L$
is given in @fig:relaxation_distribution.
As the temperature drops,
the proportion of relaxations
which are far longer than the mean increases,
which results in raising the mean.

![Histogram displaying the distribution of the relaxation times
for the last passage time.](../placeholder_figure.png){width=80% #fig:relaxation_distribution}

It is possible to measure
the deviation of these relaxations from Gaussian
by finding the ratio between
the arithmetic mean and
the harmonic mean
of each molecules relaxation.
Giving a metric for the dynamic heterogeneities $\alpha_M$

$$ \alpha_M = \frac{\langle \tau \rangle}{\left\langle \tau^{-1} \right\rangle^{-1}} $$

In effect this weights larger and smaller values differently,
the arithmetic mean is dominated by the longest relaxation times,
while the harmonic mean is the inverse,
dominated by the small relaxation times.
The heterogeneity of each of the molecular relaxation quantities
is displayed in @fig:molecular_heterogeneities.
As the temperature drops,
the heterogeneities dramatically increase,
however the quantities don't do so equally.
Quantities which have a longer length-scale
demonstrate significantly less heterogeneity,
with $\tau_F$ having the most while $\tau_D$ has the least.
The longer the distance travelled
the more Gaussian the relaxation.

![Heterogeneous dynamics of the molecular relaxations
](../Projects/Dynamics/figures/molecular_heterogeneities.svg){width=80% #fig:molecular_heterogeneities}
