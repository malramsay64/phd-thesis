# Introduction

The Trimer molecule is designed to model the dynamic quantities of ortho-terphenyl.
What do these look like.

What is a successful model of OTP?
    - fragile liquid
    - dynamic heterogeneities
    - Stokes--Einstein--Debye breakdown

## Dynamics in Experimental Systems

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

@Schiener1997 dielectric hole burning

Another relation used to describe the dynamics in experiments
is the Vogel--Tammann--Fulcher[^vtf] (VTF) relation [@Debenedetti2001]

$$ \eta = A \exp(\frac{B}{T-T_0}) $$ {#eq:vtf}

[^vtf]: I have chosen to use Vogel--Tammann--Fulcher to describe this equation,
however, there seems to be significant disagreement within the literature
over the appropriate term to use.
@Debenedetti2001 use Vogel--Tammann--Fulcher to describe this relation, while
@Lubchenko2007 use Vogel--Fulcher to describe and @Royall2018 uses
Vogel--Fulcher--Tammann.
Furthermore, @Cummins1997 uses both Vogel--Fulcher and Vogel--Fulcher--Tammann within the same paper.

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

In practical experiments measuring liquid dynamics,
the structural relaxation is measured using techniques
including; x-ray and neutron scattering, and
neutron spin echo [@Mezei1987]
probe molecules [@Wendt1998]
light scattering [@Sidebottom1993;@Li1992;@Singh1998]
Find more from @Berry2006
These experiments measure the intermediate scattering function $F(k, t)$
a measure describing the similarity of a configuration
to a reference configuration from an earlier point in time.
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
in an isotropic liquid we can take a spherical average
over all wave-vectors.
giving $\mathbf{k}$ the form;

$$ \mathbf{k} = k \frac{1}{M}\sum_{a=1}^M \left[
    \cos\left(a\frac{2\pi}{M}\right), \sin\left(a\frac{2\pi}{M}\right)
\right] $$

Where the sum is over $N$ values of
the angle $\theta_i$ which ranges in value from $0$ to $2\pi$

$$ F(k, t) = \frac{1}{NM} \left \langle \sum_j^N\sum_{a=1}^M \cos \left (
k \left[\cos\left(a\frac{2\pi}{M}\right), \sin \left(a\frac{2\pi}{M} \right) \right]
\cdot [\Delta x_{j}(t), \Delta y_{j}(t)]
\right ) \right \rangle $$ {#eq:intermediate_scattering_function}

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

<!-- TODO What does OTP do -->

## Diffusion Constant

The Diffusion is measured in experimental systems
using \ce{1H}-NMR [@Chang1994;@Chang1994a;@Fujara1992;@Mapes2006;@Andreozzi1997]
which allows for direct comparison with simulation.

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

The Mean-Squared-Displacement (MSD) has a characteristic shape,
with the initial section representing the ballistic motion
before particles have collided with any other.
Since the particles are moving freely,
the MSD has increases as a power law of order 2.
This ballistic region transitions into a diffusive region
where the dynamics are governed by many small steps.
This diffusive regime defines the diffusion constant,
so the calculation of the diffusion constant
is often written as

$$ D = \frac{1}{2tN} \lim_{t\to\infty} \langle \Delta \vect{r}(t)^2 \rangle $$

reflecting the long timescale behaviour.

## Rotational Relaxation

The rotational relaxation functions $C_l$
have equivalences in experiments.
The 2nd degree Legendre polynomial corresponds
to NMR [@Dote1981] and fluorescence experiments.

What is termed rotational relaxation,
is typically measured as a dipole relaxation.
This describes rotational motion as a sequence of
small infinitesimal jumps of a dipole around the unit sphere
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

$$ C_2(t) = \frac{1}{2} \langle 3(\hat{\vect{n}}(t) \cdot \hat{\vect{n}}(0))^2 -1 \rangle. $$ {#eq:rot_relax}

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

## Breakdown in Stokes--Einstein--Debye

@Ediger2012

Dynamics are important to both Crystal Growth, as a rate term
and to understanding the Glass.

Consider a force pushing on the material,
the structural relaxation is the timescale
over which the material can rearrange to reduce that force.
When the force is continuous,
we are measuring the viscosity,
so the structural relaxation is used within experiments
in the place of viscosity.

This relationship between the shear viscosity and the structural relaxation
allows us to rewrite the Stokes-Einstein-Debye relations as

$$ D \propto \frac{1}{\tau_s} \text{ and } \tau_r \propto \tau_s $$

where we are using the structural relaxation time
as the fundamental relaxation time,
providing a link between
the diffusion constant $D$ and the rotational relaxation time $\tau_r$.

## Goals for Dynamics

In @sec:dynamics_results we analyse the dynamics of the Trimer molecule
using standard quantities which are related to
experimentally determined values.
This is to establish that the behaviours observed
match those of existing molecular liquids,
and that the liquid displays the behaviour of a fragile liquid
like that of ortho-terphenyl which we are modelling.
