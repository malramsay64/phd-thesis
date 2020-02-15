# Introduction

The Stokes-Einstein-Debye models (@sec:introduction-to-dynamics) are suitable for describing
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

## Measuring structural relaxation

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

## Rotational Diffusion {#sec:rotational_diffusion}

There are two different formalisms of estimating rotational diffusion $D_r$,
referred to as the Einstein and Debye formalisms. [@Kim2015;@Lombardo2006]
The Einstein formulation treats the rotational motion
in the same way as translational diffusion,
by measuring the small rotational changes over time,
giving

$$ \frac{\d}{\d{t}} \langle \Delta \theta^2(t) \rangle = 2D_r $$

for rotations in 2D.

However, while the translational diffusion
is directly comparable to experimental results,
there not a comparable experimental observation.
Instead the Debye model of rotational diffusion is described
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
where the orientation of the dipole is represented by the vector $\hat{\vect{u}}$
can be represented as

$$ C_{l} = \langle P_l(\hat{\vect{u}}_i(t) \cdot \hat{\vect{u}}_i(0)) \rangle_i $$

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

In experimental and simulation studies
at high temperatures [@Laage2006]
the relationship $\tau_1/\tau_2 = 3$ has held true.
In supercooled liquids however,
there have been many studies
which have found $\tau_1/\tau_2 < 3$,
which has given credence to the
idea of rotational relaxations
taking place through the process of large angular jumps.

## Dynamics in Experimental Systems

The transition from a liquid to a glass
is a purely kinetic phenomenon,
making the study of the dynamic behaviour
the key to understanding the phase change.

One of the key experimental observations
is that the relaxation behaviour
becomes increasingly non-exponential [@Ediger1996]
and is often fit to the Kohlrausch--Williams--Watts (KWW) equation [@Williams1970;@Kohlrausch1854]

$$ F(t) = c \e^{-(t/\tau_\alpha)^\beta} $$

The expected relaxation behaviour is an exponential,
so this raises two possible explanations;

1. each particle is undergoing some alternative non-exponential relaxation process, or
2. the relaxation of each particle is exponential, however there is a distribution of
   relaxation timescales. [@Richert1994]

Many experiments and simulations
[@Hurley1995;@Kob1997;@Cicerone1996;@Cicerone1995b;@Chang1997;@Mapes2006;@Mishra2015;@Lacevic2003;@Glotzer2000]
have found the cause of the non-exponential relaxation
to be heterogeneous dynamics.

Another relation used to describe the dynamics in experiments
is the Vogel--Tammann--Fulcher (VTF) relation

$$ \eta = A \exp(\frac{B}{T-T_0}) $$ {#eq:vtf}

where;

- $\eta$ is the viscosity (or any other dynamic behaviour)
- $T_0$ is an extrapolated temperature found from fitting
- $B$ is another parameter extrapolated from fitting.

The VTF relation allows for defining a quantity $m$,
known as the *fragility*,
which describes how much the temperature dependence
deviates from an Arrhenius relation

$$ m = \frac{\d \log(\eta)}{\d T_g/T} \vert_{T=T_g} $$.

The onset of these heterogeneous dynamics
occurs at approximately $1.2\ T_g$ for ortho-terphenyl
and comparable fragile liquids. [@Angell2000;@Blackburn1996;@Rossler1994;@Mapes2006]
Additional to the onset of heterogeneous dynamics at $1.2\ T_g$,
there is a decoupling between translational diffusion and viscosity,
and between rotational and translational diffusion. [@Debenedetti2001;@Fujara1992;@Cicerone1996;@Ediger2000]
The presence of these changes in dynamics
has led to a range of theories
which provide different methods of describing these phenomenon.
These theories help drive the design of new simulations
and experiments which can provide additional insights
into this problem.

## Theoretical Treatment of Dynamics

There are numerous methods which can be used to describe
different aspects of the motion of particles.
However each individual piece of information
is only able to tell part of the story,
so we need to be able to have some theoretical framework
which provides a scaffolding for combining these values.

### Free Energy Landscape

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
namely the Lewis--Wahnström model of *ortho*-terphenyl,
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

### Jamming Transition

An alternative structural model of the supercooled liquid
is the idea of the jamming transition
which is adapted from an understanding of granular materials.
[@Silbert2002;@Cates1998;@Cates2005;@Liu2010;@Torquato2010;@vanHecke2010]
A particle is considered jammed
when the number of contacts
is enough to restrict all the degrees of freedom,
this is known as *isostatic* jamming
with the requisite contact count $z_\text{iso}$ being

$$ z_\text{iso} = 2d_f $$

where $d_f$ is the number of degrees of freedom
available to a molecule ($d_f=3$ for our trimer).
When a molecule is jammed,
there are no degrees of freedom available
meaning it is unable to move.
Using contact numbers is notable
for concave shapes like the Trimer molecule
as the concavities allow for contact numbers
well above $z_\text{iso}$. [@Jennings2015]

The concept of jamming also applies to rotational motion
where @Zwanzig1987 considers a liquid of 2D gears.
Once three gears come in contact with each other,
they are no longer able to rotate.

### Geometric Frustration

Building upon some of the ideas of the jamming transition
is a model of geometric [@Frank1952] or packing [@Tarjus2005;@Kivelson1995] frustration.
This considers small regions of the liquid,
which form structures that minimise the local free energy,
however these structures are then unable to tile space.
This gives small regions of favourable local structure
which are highly favourable and unlikely to diffuse.

This idea of geometric frustration is notable for the Trimer molecule,
as there are a range of crystal structures it can take on. [@sec:stability-of-crystal-phases]

### Conclusion

The jamming model looks at dynamic heterogeneities
in a different way to Goldstein's energy landscape model.
The jamming describes the slow parts of the heterogeneities,
molecules do not have the degrees of freedom to rearrange.
Conversely, the energy landscape explains the regions of motion,
co-operatively rearranging to move between local minima.

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

### Coupling of Translational and Rotational Motion

Part of this story which is still being actively studied
is the coupling of the rotational and translational motions
on short timescales.
A famous result is the decoupling of rotational and translational
motion in a supercooled liquid, [@Chang1994;@Griffin2012;@Fujara1992]
indicating a breakdown in the Stokes-Einstein-Debye
theory of dynamics.
This result however is an observation of the overall properties
and doesn't consider the microscopic coupling that takes place.
In the potential energy landscape model
as the temperature is lowered,
it is predicted that more degrees of freedom
will be used for motion to occur
and some of these are in
the rotational motion of molecules.
This coupling between rotational and translational motion
on the microscopic scale
has been observed in simulations of water [@Meyer2019;@Nair2019;@Faraone2003]
and liquid crystals [@Jose2006].
