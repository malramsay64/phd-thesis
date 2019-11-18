# Introduction

The Stokes-Einstein-Debye models (@sec:???) are suitable for describing
the dynamic properties of most liquids, however,
there are instances in supercooled liquids,
where the Stokes-Einstein-Debye relations
are insufficient for describing the dynamics which are observed.
The breakdown in dynamics is primarily
a case of the underlying particle motions
no longer adhering to Brownian motion.

With the motions of individual particles
no longer strictly undergoing Brownian Motion,
does this affect how we can describe the
collective dynamics of the liquid.

## Structural Relaxation

Structural relaxation is the most fundamental relaxation process [@Angell2000]
being the process by which a liquid forgets it's structure
from some earlier time [@Ediger1996].
The process of structural relaxation occurs over distances
comparable to the size of the particles within the liquid [@Angell1985].
These small distances over which the structural relaxation take place
are comparable to the relaxations that take place
when the liquid is under a shear stress.
The motion of the liquid under a shear stress,
otherwise known as shear viscosity and denoted by $\eta$,
has been shown to have the same temperature scaling
as the structural relaxation time
in both experimental [@Ediger2012] and computational [@Perera1999] systems.
A rationalisation of this relationship
can be to consider a force pushing on one part of the configuration,
the structural relaxation time is indicative of
the time the state takes to adjust to the applied force.
In a liquid, applying force results in flow
with the viscosity being a measure of the resistance to flow.

This relationship between the shear viscosity and the structural relaxation
allows us to rewrite the Stokes-Einstein-Debye relations as

$$ D \propto \frac{1}{\tau_s} \text{ and } \tau_r \propto \tau_s $$

where we are using the structural relaxation time
as the fundamental relaxation time,
providing a link between
the diffusion constant $D$ and the rotational relaxation time $\tau_r$.

### Measuring structural relaxation

In practical experiments on liquid dynamics,
the structural relaxation is measured using
x-ray or neutron scattering,
finding the intermediate scattering function $F(k, t)$
a measure of how close a configuration is
to a reference configuration at an earlier point in time.
The intermediate scattering function is measuring
the local density fluctuations[@Angell2000] through a density-density autocorrelation.
Although the density-density autocorrelation is one method of calculating
structural relaxation for computational experiments,
a more common approach is to use
the intermediate scattering function $F(k, t)$ represented as;

$$ F(\mathbf{k}, t) = \frac{1}{N}\left\langle \sum_j^N \exp(
i\mathbf{k} \cdot [\mathbf{r}_j(0) - \mathbf{r}_j(t)]
) \right\rangle $$ {#eq:intermediate_scattering_function}

where the angle brackets signify averaging over multiple initial configurations
$N$ is the total number of particles,
$i = \sqrt{-1}$, and $\mathbf{k}$ is the wave vector.

Since the intermediate scattering function
is a measure of the scattering from a radiation source,
and we have an isotropic liquid,
where all orientations are equivalent,
by rotating the incident radiation,
that is choosing a range of values for the wave-vector
around the unit circle,
we can get a much better representation
of the relaxation of the liquid.
This transformation gives $\mathbf{k}$ the form;

$$ \mathbf{k} = k \frac{1}{M}\sum_{a=1}^M \left[
    \cos\left(a\frac{2\pi}{M}\right), \sin\left(a\frac{2\pi}{M}\right)
\right] $$

Where the sum is over $N$ values of
the angle $\theta_i$ which ranges in value from $0$ to $2\pi$

The intermediate scattering function
is the spatial transform of the van-Hove relaxation function $G(r, t)$,
given by

$$G(r, t) = \frac{1}{4\pi r^2 \Delta r} \langle \delta[r_i(t) - r_i(0) - r] \rangle$$

which has also been used for computing structural relaxation
[@Glotzer2000;@Debenedetti2001;@Levesque1970;@Kob1995].

More recently, there has been an effort
to link structure with dynamics on a local level,
which has required a measure of structural relaxation
that makes the contribution of each particle explicit
rather than aggregated over the entire system.
Widmer-Cooper and Harrowell [@Widmer-Cooper2009a] defined
a structural relaxation $F_d(t)$ where

$$ F_d(t) = \frac{1}{N} \left \langle \sum_i w_i(d, t) \right \rangle $$ {#eq:structural_relaxation}

where $w_i(d, t) = 1$ if the particle is within distance $d$
of it's initial position at time $t$,
and zero otherwise.
The angle brackets signify an average over initial times.
The value of $d$ was chosen to be

$$ d = \frac{\pi}{2 k_{\text{bragg}}} $$

where $k_{\text{bragg}}$ is the wave-vector of
the maximum peak of the static structure factor $S(k)$.
This matches with the calculation of the intermediate scattering function
which will follow the same wave-vector $k_{\text{bragg}}$
as it will display the largest change over time.

## Translational Diffusion

The translational diffusion constant $D_t$
is a measure of how fast particles within the liquid
move over a long time period.
It's formulation is based upon Brownian dynamics,
where, over long time periods,
the displacement from the origin $\Delta x(t)$ at time $t$
averaged over many initial configurations
has the relation

$$ \langle \Delta x(t)^2 \rangle = 2 D_t t $$

where the angle brackets $\langle\rangle$ represent
the average over many initial conditions.
In the case of a molecular dynamics simulation
this is over all the individual particles.
The relation shown above is for a 1D random walk,
with each dimension contributing to the diffusion giving

$$ \langle \Delta \vect{r}(t)^2 \rangle = 4 D_t t $$

for the 2D case and

$$ \langle \Delta \vect{r}(t)^2 \rangle = 6 D_t t $$

for the 3D case.
Where $\Delta \vect{r}(t)$ is the displacement over all dimensions.

- TODO Characteristic shape of the diffusion constant

This behaviour is consistent with experimental results
where \ce{H1}-NMR is used to measure the diffusion constant
[@Chang1994;@Chang1994a;@Fujara1992;@Mapes2006;@Andreozzi1997].

## Rotational Diffusion

Rotational diffusion can be treated
in the same way as translational diffusion,
by measuring the small rotational changes over time

$$ \frac{\d}{\d{t}} \langle \Delta \theta^2(t) \rangle = 2D_r $$

However, while the translational diffusion
is directly comparable to experimental results,
there not a comparable experimental observation.
Instead rotational diffusion is described
using a dipole relaxation formulation developed by @Kivelson1970.
This describes rotational motion as a sequence of
small infinitesimal jumps around the unit sphere
using spherical harmonics $Y_l^m$.
This allows us to express a rotational relaxation function $R_l(t)$
in terms of those spherical harmonics

\begin{align}
R_l(t) &= \langle Y_l^m(0) Y_l^{-m}(t) \rangle \\
       &= \exp(-D_r\,l(l+1)t)
\end{align}

This formulation represents the rotational relaxation as an exponential.
The exponential is nice in that we can find a characteristic timescale $\tau_l$
for relaxation to occur, where

$$ \tau_l = \frac{1}{D_r\,l(l+1)} $$

Here relaxation is the time taken for relaxation from
the initial value of $Y_l^m$ to it's first zero.

The relaxation of a dipole $C_l$,
where the orientation of the dipole is represented by the vector $\vect u$
can be represented as

$$ C_{l} = \langle P_l(\vect{u}_i(t) \cdot \vect{u}_i(0)) \rangle_i $$

Here $P_l$ is the Legendre polynomial of degree $l$,
and the angle brackets signify an average over
all molecules and starting configurations.

The rotational relaxation functions $C_l$
have equivalences in experiments.
The 2nd degree Legendre polynomial corresponds
to NMR [@Dote1981] and fluorescence experiments.
Which can be calculated in Molecular Dynamics simulations
through an equation of the form

$$ C_2(t) = \frac{1}{2} \langle 3(\hat{\vect{n}}(t) \cdot \hat{\vect{n}}(0))^2 -1 \rangle. $$

where $\hat{\vect{n}}(t)$ is the unit vector through the center of mass of a molecule.
It should be noted that this dipole relaxation
only describes at most two dimensions of the rotational relaxation,
rotations about the axis of the dipole are not expressed.
There are many different approaches which have been used,
@Brodka1992 define the rotational relaxation
of the spectroscopically available rotation with the $C_2$ method
whilst other rotational degrees of freedom
were studied using an angular velocity autocorrelation function.
Alternatively @Jas2000 combine the rotational relaxations
for vectors along the $x, y,$ and $z$ axes into a single
complete rotational relaxation.
An approach only concerned with isotropic rotational motion
could also take the approach of @Chen2017
and represent molecular rotation using quaternions[@Furry1957],
which capture all rotational information.
It should be noted that
the quaternion representation can also be decomposed
into the component rotational relaxations,
in the same way the vectors for each axis
can be combined into an isotropic relaxation.
The advantage with using the quaternion approach
is that quaternions are the most sensible approach
for computationally representing rotations in three dimensions[@Huynh2009]
and is commonly used in molecular dynamics simulations
[@Ciccotti1986;@Omelyan1998;@Rog2003;@Andersen1983;@Refson2000;@Nose1983;@Evans1977;@Rapaport1985].

The Debye model predicts an exponential decay of the $l$th rank
single-particle orientation time correlation function $C_l^s$,

$$ C_l^s = \exp\left(\frac{-t}{\tau_l}\right) $$

which gives the corresponding relaxation time

$$ \tau_l = \frac{1}{l(l+1)D_r}, $$

where $D_r$ is the rotational diffusion coefficient.
Comparing this relationship for
the first and second-order relaxation functions

$$ \tau_1/\tau_2 = \frac{2(2 + 1) D_r}{1(1+1) D_r} = 3$$

When molecules rotate inertially, that is,
there are large angular displacements between collisions.
The type of relaxation is no longer exponential,
and can be identified by the ratio $\tau_1/\tau_2$
falling in the range

$$ 1 < \tau_1/\tau_2 < 3 $$

The value of 3 (or 4 for 2D systems) is given by Brownian dynamics,
that is, assuming rotations take place through a process of small random steps.
Where there are large changes in orientation,
the two relaxation times become correlated,
since there are much fewer steps required for rotational relaxation to occur,
with the limit of this being
single jumps account for both relaxations simultaneously.

In many experimental and simulation studies
at high temperatures [@cite???]
the relationship $\tau_1/\tau_2 = 3$ has held true.
In supercooled liquids however,
there have been many studies
which have found $\tau_1/\tau_2 < 3$,
which has given credence to the
idea of rotational relaxations
taking place through the process of large angular jumps.

## Dynamic Heterogeneities

1.2 Tg

### Translational Heterogeneities

- Developing the idea in 2D
- @Widmer-Cooper2004 -> elements of structure

### Rotational Heterogeneities

## Dynamics in Experimental Systems

- Characteristic temperatures
    - collective observations
    - dynamic heterogeneities
    - breakdown of rotational and translational diffusion

- Theory and computation drive new experimental observations
    - design of experiments

- In supercooled liquids below approximately $1.2 T_g$ there occurs a decoupling
  between translations diffusion and viscosity, and between rotational and
  translational diffusion.[@Debenedetti2001]

- Slowdown near 2/3 of the melting point [@Angell2000]

- Vogel--Tammann--Fulcher
    - temperature dependence of relaxation times
    - provides a measure of how far from Arrhenius
    - $\tau = \tau_0 \left ( \frac{T-T_0}{T_0} \right )^{-\beta}$
    - $\eta = A \exp(\frac{B}{T-T_0})$

## Theoretical Treatment of Dynamics

There are numerous methods which can be used to describe
different aspects of the motion of particles.
However each individual piece of information
is only able to tell part of the story,
so we need to be able to have some theoretical framework
which provides a scaffolding for combining these values.

Experimental observations of supercooled liquids
find that the breakdown of the Stokes--Einstein--Debye relations at $~1.2\,T_g$
across a range of different materials. [@Debenedetti2001]
The general consensus among theories is that something
occurs at this temperature changing the dynamics.
In Goldstein's[@Goldstein1969] energy landscape model of dynamics,
this change in dynamic behaviour is characterised
by the transition from free diffusion,
where the energy of the particles
is greater than the energy of the barriers between configurations,
to activated diffusion,
where the transition from one position to another
requires the concentration of energy at a certain point.
There has been evidence of this transition from
free to activated diffusion in simulations of atomic systems [@Barrat1991;@Wahnstrom1991]
where the dynamics change from many small random motions
to a large motions from one site to another
often as part of a correlated motion.
Where dynamics occurs by the process of large jumps,
the assumptions made about the Brownian motion start to break down.
While atomic systems seem to make the transition to jump dynamics,
there is not the same evidence for molecular systems, [@Lewis1994;@Barrat1991;@Wahnstrom1991]
namely the Lewis-Wahnström model of *ortho*-terphenyl,
where rotational motion occurs through jump dynamics
while the translational motion takes remains Brownian in nature.

One of the key predictions of the energy landscape model of dynamics
is the incorporation of more dimensions in the motion
when the molecules no longer have the energy
to cross potential energy boundaries.
Since including more dimensions to a motion
is including more particle degrees of freedom,
the increased dimensionality is expected to manifest in
an increase in a length scale as the temperature drops.
Despite significant effort searching for
this increasing length scale, [@cite]
there has been no evidence of it.

An alternative structural model of growth
has a structural view of the supercooled liquid.

- Kivelson Scaling
    - viscous slowdown due to packing frustration @Kivelson1995

- purely structural
    - packing,
    - jamming
    - gears @Zwanzig1987

Despite these models being useful in understanding
the processes of motion within a liquid,
there is still the decoupling of the rotational and translational motion.
Why is one type of motion
more affected by supercooling than another?
A consequence of dynamic heterogeneities,
which is measured by the non-Gaussian parameter $\alpha$
is the deviation of the distribution of motions
from that of a Gaussian distribution,
with the dynamic heterogeneities having
many orders of magnitude difference
between the fastest and the slowest particles.
It is entirely possible
that the differences between
the translational and rotational dynamics
is a result of the averaging we are using.
For the diffusion constant measured from the mean-squared-displacement,
particles with fast motions contribute disproportionately
to increasing this value,
while for the rotational relaxation it is
the slow particles which increase this value.

## Additional Quantities

- Correlations of rotation and translation
    - reptation

Introduce some new quantities

- Comparable to existing values

- Single value representing dynamics is challenging
    - The method of averaging has a large impact on the resulting value

- Alternative methods for understanding dynamics
    - Identify whether a particle has undergone relaxation
    - Distance for relaxation

- Reversible relaxation
    - This is guaranteed for an infinite random walk on 2D
    - Likely for 3D as well, though not guaranteed

- How do we define additional characteristics
    - heterogeneities
    - coupling
