# Results

To allow the comparison of dynamics between materials with a range of properties,
dynamics quantities are presented relative to the melting point of the material,
that is using the quantity

$$ T/T_m $$

where $T$ is the experimental temperature and $T_m$ is the melting point.
For the results presented here,
we don't have an accurate determination of the melting point,
instead using our best approximation,
the details of which are discussed in \ref{sec:crystal_melting}
and presented in @tbl:melting_points.

 Pressure   Melting Point
 --------  --------------
 1.00            0.36
 13.50            1.35

Table: The melting points of the trimer molecule for different pressures. {#tbl:melting_points}

## Comparison with other systems

Much of the theory of dynamics in molecular systems
has been built around the
Stokes-Einstein relation [@Einstein1956]

$$ D_t \eta / T = \text{constant} $$

and the Stokes-Einstein-Debye relations [@Debye1929].

$$ D_r \eta / T = \text{constant} $$

where $D_t$ is the diffusion constant of the translational motion
$D_r$ is the diffusion constant of the rotational degrees of freedom,
$\eta$ is the shear viscosity, and
$T$ is the temperature.

## Structural Relaxation

The measurement of structural relaxation in two dimensions
is the same as for three dimensional systems,
using the intermediate scattering function (@eq:intermediate_scattering_function).
To compute the values monitoring
the structural relaxation,
we first have to compute the value of the wave-number
which will give the greatest change
In computing the values for this function,
it is first required to
find the wave-number which corresponds to
to first maximum of the static structure factor.

### Static Structure Factor

The static structure factor
is a function describing how a crystal
scatters incident radiation,
being used extensively to understand and interpret
scattering patterns in diffraction experiments
of both ordered and disordered materials.
In computational systems,
the static structure factor is computed from
the radial distribution function $G(\vect r)$
given by

$$ G(\vect r) = \frac{1}{\rho} \left \langle
  \sum_{i \ne 0} \delta(\vect r-\vect{r}_i )
\right \rangle $$

where $\vect r$ is the position vector,
$\rho$ is the density of the system,
the reference particle is given the index 0,
with all other particles $r_i, i \ne 0$
some distance away.
The angle brackets $\langle \rangle$ denote
an ensemble average
over many particles.

The radial distribution function
for the trimer molecule
is shown in @fig:radial_distribution.
This shows that the distribution
is more complicated than
a single component liquid,
being more comparable to a binary mixture.

![The radial distribution function of the Trimer liquid at a pressure $P=13.50$ and a
temperature $T=1.50$. The radial distribution is taken as an average over 100 configurations of
the input trajectory. There shape of the molecule means there are three distinct first
shell peaks. In further shells the only
impact on shape is the longer than usual tails of the peaks.
](../Projects/Dynamics/figures/radial_distribution.svg){width=80% #fig:radial_distribution}

From the radial distribution function $G(r)$,
we can obtain the static structure factor $S(k)$
for an isotropic liquid
using the following transformation

$$ S(k) = 1 + 4 \pi \rho\, \frac{1}{q} \int \d{r}\ r \sin(qr)[G(r) - 1] $$

plotted for the trimer molecule
in @fig:static_structure_factor.
The position of the first peaks
for the two pressures studies are
given in @tbl:wave_numbers.
The values of the wave-number
over the range of temperatures
was considered to be close enough
that a single value was to be used
for each pressure
which are given below.

![The static structure factor of the Trimer liquid at a pressure $P=13.50$ and a
temperature $T=1.50$. This is calculated from an average over 100 configurations.
within the trajectory. The first peak corresponds to a value of 2.90.
](../Projects/Dynamics/figures/static_structure_factor.svg){width=81% #fig:static_structure_factor}

Pressure|$k$
--------|-----
1.00    | 2.80
13.5    | 2.90

Table: The wave-numbers $k$ used for each of the pressures studied. {#tbl:wave_numbers}

### Intermediate Scattering Function

Having found the value of the wave number
to calculate the decay of the intermediate scattering function,
we can move out attention to the calculation of the value.
When dealing with an isotropic liquid in two dimensions,
we can evaluate the intermediate scattering function
using the below equation

$$ F(k, t) = \frac{1}{NM} \left \langle \sum_j^N\sum_{a=1}^M \cos \left (
k \left[\cos\left(a\frac{2\pi}{M}\right), \sin \left(a\frac{2\pi}{M} \right) \right]
\cdot [\Delta x_{j}(t), \Delta y_{j}(t)]
\right ) \right \rangle $$ {#eq:intermediate_scattering_function}

![The intermediate scattering function of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale on the time axis.
](../Projects/Dynamics/figures/scattering_function.svg){width=81% #fig:intermediate_scattering_function}

At low temperatures ($T=1.25$ to $T=1.4$)
the relaxation of the intermediate scattering function
takes place through a two step process,
the initial relaxation to a plateau at \num{1e4} timesteps,
with the bumps indicating a reversal of relaxation.
Both these features,
the two step relaxation,
and the reversal of relaxation
are features characteristic of a supercooled liquid,
an interesting phenomenon,
particularly since there is an onset above
the melting point.

![The characteristic timescales for the intermediate scattering function
over a range of temperatures and pressures.
To put multiple pressures on a single scale,
all the temperatures have been scaled
relative to the melting point.
](../Projects/Dynamics/figures/scattering_function_summary.svg){width=80% #fig:isf_relaxation}

Taking the characteristic timescale of the
relaxation of the intermediate scattering function,
which is the rate coefficient of the exponential decay,
we get @fig:isf_relaxation.
This includes results from both
a high pressure simulation ($P=13.50$),
and a low pressure simulation ($P=1.00$).
Plotting the results from both simulations
normalising the temperature by
the melting point of each pressure,
the results collapse onto a single curve.

@fig:isf_relaxation is also an excellent example
of non-Arrhenius behaviour commonly found in supercooled-liquids,
with there being a distinct shift in the temperature dependence
above and below $T_m/T$ of 0.8.
What is particularly interesting about this behaviour
is that it occurs above the melting point,
that is, in a liquid not supercooled.

- Fit -> degree of non-arrhenius
- Predict glass transition temperature
- Pressure dependence
    - [@Ediger1996]
    - Does the fragility change with compression?

### Contribution of Individual Particles

The intermediate scattering function
describes the relaxation of the entire configuration
with no way of ascribing relaxation to individual particles.
Here we use the structural relaxation defined in @eq:structural_relaxation
where particles contributing to relaxation
can be identified at each timestep.

![The structural relaxation of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale on the time axis.
](../Projects/Dynamics/figures/structural_relaxation.svg){width=80% #fig:structural_relaxation}

The shape of @fig:structural_relaxation has
many of the same features as @fig:scattering_function,
the reversal of relaxations at \num{10e4} timesteps,
the exponential relaxation.
The large difference between the two types of relaxation
is that the two step relaxation process
is much more noticeable @fig:scattering_function.

## Diffusion

The Stokes-Einstein relation was derived for particles undergoing Brownian motion,
which over long enough timescales because of the collisions with other particles
will move away from its initial position at a linear rate
where the diffusion constant $D$ has the relation

$$ D = \frac{1}{4}\lim_{t->\infty} \langle \Delta \vect{r}^2 \rangle $$

Plotting the Mean Squared Displacement (MSD) of the trimer molecule
gives the image below.

![The Mean Squared Displacement of the trimer molecule
over a range of temperatures
at a pressure of 13.50.
Note the logarithmic scale of both axes.
](../Projects/Dynamics/figures/mean_squared_displacement.svg){width=80% #fig:msd}

At high temperatures the MSD moves from the ballistic regime,
where the particles haven't collided
so the displacement is increasing with a power law of order 2.
There is then a quick transition to the diffusive regime,
where particles are undergoing Brownian motion.
At lower temperatures,
the quick transition from the ballistic becomes much longer
forming a plateau region.
This plateau region is indicative of dynamics
which are not described by Brownian motion,
and more notably regions of dynamic heterogeneities.
A structural description of this region
describes the particles being stuck in 'cages',
local regions which require significant free energy to escape.
The value of the Mean Squared Displacement
which corresponds to the end of the plateau region
can be interpreted as the

![The diffusion constant as a function of temperature
normalised by the melting point for a range of pressures.
](../Projects/Dynamics/figures/diffusion_constant_summary.svg){width=80% #fig:diffusion_constant}

## Rotational Relaxations

While it is typical to consider translational diffusion constants,
instead of a rotational diffusion constant $D_r$,
the quantity typically calculated for rotations
is a rotational relaxation time $\tau_r$
where $\tau_r \propto 1/D_r$.
This is a way of dealing with the periodicity of rotational motion,
instead of keeping track of every rotation of a molecule,
the rotational relaxation function $C(t)$ is a measure of
how orientationally aligned a configuration is to another
and is given as

$$ C(t) = \langle \hat{\vec{e}}(0) \cdot \hat{\vec{e}}(t) \rangle $$

where $\hat{\vec{e}}(0)$ and $\hat{\vec{e}}(t)$ are the orientations
The rotational relaxation time is
the time taken for the relaxation function to decay to $1/e$.
When the rotational relaxation function
is approximated as a exponential decay,
the relaxation time is the rate of the decay.

![The rotational relaxation of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note the logarithmic scale of the time axis.
](../Projects/Dynamics/figures/rotational_relaxation.svg){width=80% #fig:rotational_relaxation}

- the dynamics are similar to existing systems
- not apparent pathological 2D behaviour
- Above melting point
- Also well above 1.2 Tg
    - product of simulation?

## Dynamic heterogeneities

Dynamic heterogeneities have been described qualitatively,
with features of the previous dynamic quantities
noted as a characteristic sign of heterogeneous dynamics.
However to discuss them,
they need to be adequately measured.

### Translational heterogeneities

Dynamic heterogeneities are a phenomenon
where there are multiple timescales within a single material,
that is, some regions of the material are moving fast
while others are moving slow.
This phenomenon has been observed in a wide range of materials
both simulated and experimental.
The quantity used to measure this is the non-Gaussian parameter $\alpha$,
which is a measure of how far the distribution of motions
deviates from the expected Gaussian distribution [@Donati1999;@Rahman1964].

![The non-Gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/non_gaussian.svg){width=80% #fig:non-gaussian}

As the temperature decreases from 2.5 to 1.30,
the maximum value of non-Gaussian parameter increases,
demonstrating an increase in the dynamic heterogeneities,
that is, there is a big difference between
the fastest and the slowest particles.
In addition to the increase in
the value of the maximum,
the time at which the maximum occurs
becomes later moving from high temperature to low.

### Rotational Heterogeneity

The rotational heterogeneities can be calculated
in the same way as the translational heterogeneities,
describing the deviation of the dynamics
from those expected by a Gaussian distribution.

![The rotational non-Gaussian of the trimer molecule
over a range of temperatures at a pressure of 13.50.
Note that time axis is plotted using a logarithmic
scale.](../Projects/Dynamics/figures/rotational_alpha.svg){width=80% #fig:rotational_non-gaussian}

The rotational heterogeneities (@fig:rotational_non-gaussian)
have a very similar shape to that of
the translational heterogeneities (@fig:non-gaussian).
One of the main differences,
is that the curves for the rotational motion
all follow a single curve before branching out
to reach the maximum and decay.
The calculations of the non-Gaussian parameter [@Donati1999;@Horbach1998]
typically have differing behaviour like in @fig:non-gaussian,
so it is interesting that the rotations all obey this single "master curve".

![Map of the translational and rotational
heterogeneities](../placeholder_figure.png){width=80% #fig:spatial_heterogeneities}

- heterogeneities appear related to structure
    - structure is a minimum in the potential energy landscape
- co-location in figure
- Related to structure @Widmer-Cooper2004

## Individual Molecule Relaxations

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

- described as molecular relaxations

This builds upon the ideas of Widmer-Cooper and Harrowell [@Widmer-Cooper2009]
in tying the motion of a particle
at a particular length scale to relaxation.
In this case, though,
rather than defining a relaxation function
with a characteristic time,
The relaxation time of each individual particle,
being the time taken to move the characteristic distance,
is the quantity that is averaged over.

### Reversible behaviour in structural relaxation

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
a local structural relaxation quantity. [@Widmer-Cooper2009a]
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
is guaranteed to return to it's original position, [@cite]
and with a probability of 59% in 3D. [@cite]

The approach to solving these issues is using the last passage time,
building upon the ideas of @Widmer-Cooper2009a and @deSouza2008
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

### Single particle diffusion

The length scale which we have associated with diffusion is $3 \frac{\pi}{2k} \approx 1.2$
chosen for being close to a value of 1
with the idea that $D = 1/\tau_D$.
While this does hold true over the range of temperatures (@fig:diffusive_time)
the timescale is possibly too small.

![Diffusion constant compared with the diffusive timescale
](../Projects/Dynamics/figures/diffusive_time.svg){width=80% #fig:diffusive_time}

### Single particle rotational relaxations

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

### Summary

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

- valid measure of relaxation
    - comparable to traditional quantities

### Heterogeneities in Molecular Relaxations

- Distribution of relaxation times

![Histogram displaying the distribution of the relaxation times
for the last passage time.](../placeholder_figure.png){width=80% #fig:relaxation_distribution}

The molecular relaxation quantities also provide a method
to calculate the dynamic heterogeneities.
By finding the ratio between the arithmetic mean and the harmonic mean
of each molecules relaxation
we can find the degree of heterogeneities $\alpha_M$

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

## Jump Dynamics

The foundation of the Stokes--Einstein--Debye relations
is Brownian motion,
that is the motion of the particles occurs through
a sequence of small independent jumps.
What if the issue with dynamic heterogeneities
and non-Gaussian behaviour,
is rather than observing many jumps, hence Brownian motion,
only a small number of jumps are observed
resulting in the observed behaviour.
The single particle relaxation times
provide a method to investigate this idea.

The typical picture of jump dynamics
is that of the rotational motion,
where the quantity $\tau_1/\tau_2$ has a value of 4
when the motion is comprised of small angular jumps,
and reduces in value to 1 when
the motion is comprised of large angular jumps. [@Kivelson1970]
This is depicted in @fig:rotational_jumps
which has both the traditional $\tau_1/\tau_2$ quantity
in addition to the ratio of the molecular relaxation quantities $\tau_{T2}/\tau_{T4}$.
These both display motion of small jumps,
which becomes large jumps as the temperature drops.

![jump dynamics](../Projects/Dynamics/figures/rotational_jumps.svg){width=80% #fig:rotational_jumps}

This describes angular jumps of the rotations,
however what does this actually look like
and does it also occur with translations?
@Fig:molecule_trajectory shows the translational and rotational displacement
of two molecules at each time point.
For a fast molecule (@fig:molecule_trajectory_fast)
there is some time spent in the initial cage,
before a large jump including both angular and translational displacement
puts it within a new cage.
This is in contrast to the slow molecule (@fig:molecule_trajectory_slow)
which spends all the time within the initial cage,
however the size of that cage is significantly larger.

:::{class=subfigure id="molecule_trajectory"}

![Fast Particle](../Projects/Dynamics/figures/molecule_trajectory_fast.svg){width=48% #fig:molecule_trajectory_fast}
![Slow Particle](../Projects/Dynamics/figures/molecule_trajectory_slow.svg){width=48% #fig:molecule_trajectory_slow}

The distinct positions of the fast particle are visible as clustered regions,
with time spent in each one before a large rearrangement
which is comprised of both a large translational and rotational motion.
The slow particle has not moved from it's initial state.

:::

In taking the relaxation time of each particle within a simulation,
we have the distribution of relaxation times that take place.
So making the assumption that once relaxation has taken place,
the particle is completely independent of it's initial configuration
it will then need to undergo another relaxation event to move further.
This can be modelled by drawing consecutive relaxation times for a particle
from our experimentally determined distribution of relaxation times.
This modelling of consecutive relaxations is shown in @fig:jump_heterogeneities
for the last passage time $\tau_L$,
which was chosen as a timescale for which
the relaxation is considered irreversible.
When we consider long enough length scales (or timescales),
the heterogeneities within the dynamics disappear.
Where the long relaxation times
dominate the averaging over a single time period,
they are rare occurrences,
so over multiple relaxation times
their effect averages out.

![Heterogeneous dynamics taking progressively more relaxation
times](../placeholder_figure.png){width=80% #fig:jump_heterogeneities}

So here we do observe an increasing length scale
as the liquid is supercooled;
the length over which the observed dynamics
can be considered Brownian.
This can be an important consideration,
when comparing the different relaxations.
The ratio $\tau_1/\tau_2$ shows that
the rotational relaxation is dominated
by jump dynamics in the supercooled liquid,
while the diffusion constant
is a much longer timescale phenomenon.
Is the different regions of dynamics
responsible for the observed decoupling
of rotational and translational motion?

In the picture of the decoupling of diffusion and rotation @fig:trans_rot_otp
there are quantities on two different length scales,
the diffusion measured over a long distance,
while the rotation is a quantity over a short distance.
Additionally, as we have seen in @fig:molecular_heterogeneities,
the way a quantity is averaged, can play a role
in the resulting value,
with fast particles dominating the diffusion
while slow particles dominate the structural relaxation
and rotational relaxation.

This also answers a question posed by @Ahn2013,
"Are rare, long waiting times between rearrangement events
responsible for the slowdown of dynamics at the glass transition?"
Although Betteridge's law of Headlines @Betteridge2009
would imply this is definitively not the case,
it seems that it depends.
For long timescale quantities like the diffusion constant,
this is likely not the case,
since it is mostly the fastest particles
which contribute to this quantity,
however the structural and dipole relaxations
are likely to be affected by the prevalence
of long times between rearrangement events.

- Jump dynamics solve SED
    - just use larger jumps
    - Turns out this is not the case
    - @Kawasaki2019 also observes similar phenomenon
- more to this problem

![Comparison of the structural relaxation vs the
rotational and translational diffusion.
The range of rotational metrics describe
different measures of rotational diffusion.
](../placeholder_figure.png){width=80% #fig:trans_rot_trimer}

## Coupling of translational and rotational motion

There are two main assumptions that the Stokes--Einstein--Debye relations make.

1. Small motions
2. Translations and rotations independent

The first of these assumptions was addressed above.
So now we address the second.

- Decoupling at macro-scale
    - different temperature dependences
- on the micro-scale
    - idea that individual motions are coupled

### Rotational and Translational Heterogeneity

With the non-Gaussian identifying the presence of heterogeneous dynamics
in both translational and rotational motion,
an integral part of understanding this
is how these two types of motion are combined.
There are three different descriptions of this

1. No relation between translational and rotational motion,
2. coincidence, where the rotational and translational motion
  happen to have similar timescales with no connection between them,
3. correlation, where the timescales of both motions are similar for each molecule
  possibly as a result of the local environment, and
4. coupling, where rotations are required for translations to occur.

As we go from 1 to 4,
the requirements for establishing these become more stringent.
From the analysis of the translational and rotational heterogeneities,
with each having a similar timescale,
it is at least a coincidence that the timescales are the same.
This is not a very powerful statement,
which requires additional analysis.
Based on work by @Faraone2003 on water,
the coupling parameter $\gamma$

$$ \gamma = \frac{\langle(\Delta r \Delta\theta)^2 \rangle}
    {\langle\Delta r^2\rangle\langle\Delta\theta^2\rangle} - 1 $$

provides a method of demonstrating correlation
between the translational and rotational motion.
The values of $\gamma$ are large
for molecules with large values of $\Delta r \Delta \theta$,
with both components of the motion contributing.
In @fig:gamma the coupling parameter is very
similar to the non-Gaussian parameters,
indicating that highly mobile molecules
have both degrees of freedom available to them.
This provides the evidence to establish
there is correlation between
rotational and translational motion.

![A plot of the coupling parameter $\gamma$
](../Projects/Dynamics/figures/gamma.svg){width=80% #fig:gamma}

An alternative way of representing this correlation of the motion
is to plot the spatial distribution of the mobility (@fig:spatial_heterogeneities).
The plot shows the mobile regions contain
both types of motion,
indicating that the local environment is important
in enabling the motion to occur.

Comparing the timescale of the heterogeneities,
the rotational heterogeneities have their maximum
slightly before the translational heterogeneities.
Does this mean that rotational motion
is causing the translational motion?
This question, which would mean there is coupling
between the rotations and translations
requires additional analysis.

![Comparison of the different
heterogeneities](../placeholder_figure.png){width=80% #fig:heterogeneities}

- Length scale of heterogeneities

### Coupling of molecular relaxation times

- Rotational distribution at first and last passage time
    - rotations responsible for irreversible motions
    - put another way, rotations allow the escape of the cage

## Possible Investigations

- Spatial correlation
    - How are the fastest and slowest particles correlated with each other spatially
    - Does this change as a function of temperature?
    - Does this change as we increase/decrease the timescale?
    - Ref [@Kob1997; @Donati1999]

- Onset of activated process?

- Spatial heterogeneities
    - How long to remove these
    - Measure of heterogeneous dynamics $\alpha$ follows a single curve
        - the difference is where the relaxation tips over
        - What causes the 'master curve'?
        - What is the cause of the tipping point?
        - What prevents it from occurring earlier?

- Over the timescale of heterogeneities there is a direction to the motion
    - See the papers on following tubes, 1D dynamics
    - Can rotations do the same thing
        - no longer getting motion which is random because of collective dynamics

The dynamics studied here are primarily above the melting point,
however the liquid displays behaviour normally attributed
to a supercooled liquid while above the melting point.
