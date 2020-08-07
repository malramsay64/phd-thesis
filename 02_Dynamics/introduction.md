# Introduction

## Characterisation of Dynamics {#sec:intro_dynamics}

The Trimer model is designed to model the dynamics of a fragile liquid.
In particular, we want it to display dynamics similar to ortho-terphenyl.
Here we introduce dynamics quantities measured in
both experiments and simulations that allow for a comparison
between results measured experimentally for ortho-terphenyl
and those obtained in simulations of the Trimer molecule.

## Structural Relaxation {#sec:intro_structural}

The structural relaxation is the most fundamental relaxation process [@Angell2000]
describing the time required for the structure of a liquid to
return to equilibrium after a small perturbation. [@Ediger2012]
The process of structural relaxation takes place over distances
comparable to the size of the particles within the liquid. [@Angell1985]
It "describes the process by which a liquid forgets its structure
from some earlier time" [@Ediger1996]
and can be measured using density fluctuations. [@Angell2000]
There are a range of experimental techniques to
measure structural relaxation including;
neutron scattering, [@Mezei1987;@Bartsch1995;@Tolle2001]
probe molecules, [@Wendt1998;@Cicerone1995]
light scattering, [@Sidebottom1993;@Li1992;@Singh1998;@Griffin2012]
NMR, [@McCall1969;@Dries1988;@Bohmer1996;@Hinze1996;@Fujara1992]
and dielectric relaxation. [@Hansen1997;@Naoki1987;@Richert1994;@Richert2005]
These experiments measure two distinct types of relaxations,
the probe molecules, NMR, and dielectric relaxations measure
the full-intermediate scattering function $F_D(\vect{k}, t)$,
while the neutron scattering and light studies measure
the self-intermediate scattering function $F_s(\vect{k}, t)$.
The self-intermediate scattering function
is a Fourier transform of the density-density autocorrelation,
measuring the quantity in wave-vector space rather than real space. [@Angell2000]
The self-intermediate scattering function is also calculated in simulations
[@Shi2013;@Chong2004;@Kawasaki2019;@Widmer-Cooper2004]
and is given by

$$ F_s(\mathbf{k}, t) = \frac{1}{N}\left\langle \sum_j^N \exp(
i\mathbf{k} \cdot [\mathbf{r}_j(t) - \mathbf{r}_j(0)]
) \right\rangle $$ {#eq:self_intermediate_scattering_function}

where the angle brackets signify averaging over multiple initial configurations
$N$ is the total number of particles,
$i = \sqrt{-1}$, and $\mathbf{k}$ is the wave vector.
While the self-intermediate scattering function considers the motion
of each particle over time,
the full-intermediate scattering function considers
the cross interaction of all molecules with the initial configuration.

$$ F_D(\mathbf{k}, t) = \frac{1}{N} \sum_{j=1}^N \sum_{k=1}^N \exp(
i\mathbf{k} \cdot [\mathbf{r}_j(t) - \mathbf{r}_k(0)]
) $$ {#eq:full_intermediate_scattering_function}

Within this thesis we calculate the self-intermediate scattering function.
This calculation makes use of properties of an isotropic liquid,
where all directions are equivalent,
allowing us to take a spherical average over all wave-vectors,
giving $\mathbf{k}$ the form;

$$ \mathbf{k} = k \frac{1}{M}\sum_{a=1}^M \left[
    \cos\left(a\frac{2\pi}{M}\right), \sin\left(a\frac{2\pi}{M}\right)
\right] $$

Where the sum is over $M$ values of
the angle $\theta_i$ which ranges in value from $0$ to $2\pi$

$$ F_s(k, t) = \frac{1}{NM} \left \langle \sum_j^N\sum_{a=1}^M \cos \left (
k \left[\cos\left(a\frac{2\pi}{M}\right), \sin \left(a\frac{2\pi}{M} \right) \right]
\cdot [\Delta x_{j}(t), \Delta y_{j}(t)]
\right ) \right \rangle $$ {#eq:calc_self_intermediate_scattering_function}

The structural relaxation of ortho-terphenyl
becomes a two-step process close to the glass transition.
This behaviour is shown in @fig:otp_structural_relaxation,
where the relaxation at high temperatures (\SI{>255}{\kelvin})
takes place through a single exponential process,
while for lower temperatures (\SI{<248}{\kelvin})
there is an initial fast relaxation followed by a plateau
then the slower secondary relaxation.
This two-step relaxation process is present
in experiments [@Mapes2006;@Chang1994;@Sidebottom1993;@Li1992;@Mezei1987]
and simulations [@Chong2004;@Rinaldi2001;@Roland1997;@Donati1999] of supercooled liquids.
The two-step process describes two types of relaxations,
fast $\beta$-relaxations which are the relaxations before the plateau
and slow $\alpha$-relaxations being the long timescale relaxations. [@Cavagna2009]
The $\beta$-relaxations are only present at the low temperatures
and are associated with supercooled liquids and the onset of the glass transition.
The $\alpha$-relaxation is present for all temperatures
and is the relaxation measured by the structural relaxation time $\tau_S$
being the longest timescale relaxation.
As the structural relaxation behaviour becomes increasingly non-exponential, [@Ediger1996]
it is often fit to the Kohlrausch--Williams--Watts (KWW) equation [@Williams1970;@Kohlrausch1854]

$$ F(t) = c \e^{-(t/\tau_\alpha)^\beta} $$ {#eq:kww}

Where the values for $\beta$ and $\alpha$ represent
the fast and slow relaxations respectively.

![Experimentally determined structural relaxation of ortho-terphenyl
using photon correlation spectroscopy,
a technique that measures the full-intermediate scattering function
(@eq:full_intermediate_scattering_function)
here denoted $g_1(q, t)$.
This displays the transition to a two-step relaxation process
characteristic of ortho-terphenyl and other supercooled liquids. \
*Image from @Mallamace2014 Licensed under CC-BY-NC-SA 3.0*
](../00_Introduction/figures/ortho-terphenyl_structural.png){#fig:otp_structural_relaxation width=80%}

## Dynamic Heterogeneities

The expected shape of structural relaxation is an exponential decay,
meaning the observed non-exponential shape needs to be explained.
The non-exponential shape is the average over a range of particles
which gives rise to two possible explanations for non-exponentially; [@Richert1994]
each particle is undergoing the same non-exponential relaxation process, or
the relaxation of each particle remains exponential,
however non-exponential is a distribution of relaxation timescales.
This was initially investigated by simulation studies,
which found the presence of spatially heterogeneous dynamics within the liquid. [@Hurley1995]
This idea is encapsulated in @fig:dynamic_heterogeneities
where there are regions of the simulation
in which particles remain in their initial positions,
while other regions show motion over many particle distances.
This visualisation of dynamic heterogeneities
is one which has been, and still is, used extensively
in describing this phenomenon.
It captures the phenomenon so succinctly
because the simulation is in 2D,
allowing everything to be represented on the page.
These same spatially heterogeneous regions
are also present in simulations of ortho-terphenyl, [@Lombardo2006]
and other fragile liquids. [@Hurley1995;@Kob1997;@Chang1997;@Mapes2006;@Mishra2015;@Lacevic2003;@Glotzer2000]
There are also many experimental techniques
which have been designed to measure dynamic heterogeneities;
probe molecules, [@Cicerone1995a;@Cicerone1995b]
hole burning experiments, [@Schmidt-Rohr1991;@Cicerone1995;@Schiener1997]
photobleaching, [@Cicerone1993]
and optical microscopy. [@Bartko1999]

The quantity used to measure this is the non-Gaussian parameter $\alpha$ (@sec:heterogeneous_dynamics),
which is a measure of how far the distribution of motions
deviates from the expected Gaussian distribution [@Donati1999;@Rahman1964].
Other than using the same greek letter $\alpha$,
there is no link between the non-Gaussian parameter
and the $\alpha$-relaxations described in @eq:kww.

![The trajectories in a simulation of over 20 structural relaxation times.
The lines represent the trajectories each particle took within the simulation. \
*Used with permission from @Hurley1995 © 1995 American Physical Society*
](../00_Introduction/figures/dynamic_heterogeneities.png){#fig:dynamic_heterogeneities width=80%}

## Stokes--Einstein--Debye Relations {#sec:intro_sed}

The Stokes--Einstein--Debye relations [@Debye1929;@Einstein1956] describe the relationship
between three important components of dynamics,
the viscosity or structural relaxation,
the translational diffusion constant $D_t$, and
the rotational diffusion constant.

### Translational Diffusion Constant

The translational diffusion constant $D_t$
is a measure of how fast particles within the liquid
move over a long time period.
Its formulation is based upon Brownian dynamics,
where, over long time periods,
the displacement from the origin $\Delta \vect{r}(t)$ at time $t$
averaged over many initial configurations
has the relation

$$ \langle \Delta \vect{r}(t)^2 \rangle = 2 N_\text{dim} D_t t $$

where $N_\text{dim}$ is the number of spatial dimensions in $\vect{r}$
and the angle brackets $\langle\rangle$ represent
the average over many initial conditions.
The left hand side of the above equation $\langle \Delta \vect{r}(t)^2 \rangle$
is known as the Mean-Squared-Displacement.
The Mean-Squared-Displacement has a timescale dependence
so the calculation of the diffusion constant
is normally written as;

$$ D = \frac{1}{2N} \lim_{t\to\infty} \frac{1}{t} \langle \Delta \vect{r}(t)^2 \rangle $$

reflecting the intended long timescale behaviour.
Within experiments, the diffusion constant is often measured using
\ce{1H}-NMR [@Chang1994;@Chang1994a;@Fujara1992;@Mapes2006;@Andreozzi1997]
which allows for the comparison with simulations.

### Rotational Diffusion Constant {#sec:rotational_diffusion}

While the values calculated for the translational diffusion constant
in simulations and experiments are comparable,
the rotational diffusion is a little different.
Experimental systems measure the rotational relaxation time $\tau_r$
rather than measuring rotational diffusion $D_r$.
The equivalence of the rotational relaxation time to the diffusion constant
can be described using spherical harmonics,
representing the rotational relaxation function $R_l(t)$ as

\begin{align}
R_l(t) &= \langle Y_l^m(0) Y_l^{-m}(t) \rangle \\
       &= \exp(-D_r\,l(l+1)t)
\end{align}

where $l$ describes the degree of the spherical harmonic.
This formulation represents the rotational relaxation as an exponentially decaying
function like the self-intermediate scattering function,
allowing the relationship between the rotational relaxation time
and the rotational diffusion constant to be expressed as

$$ \tau_l = \frac{1}{D_r\,l(l+1)} $$ {#eq:debye_rotational_diffusion}

the inverse of the diffusion constant.
The rotational relaxation time is found using techniques including;
dielectric spectroscopy, [@Fujara1992]
optical anisotropy, [@Williams1970;@Williams1971;@Shears1973]
NMR, [@Dote1981]
and spin resonance spectroscopy [@Andreozzi1996;@Andreozzi1997]
It should be noted that while these experiments
describe their measurements of a rotational relaxation time,
they actually measure a dipole relaxation,
ignoring the rotational motion about the axis of the dipole.
The measurement of the dipole relaxation extends to simulations
where the rotational relaxation is described by
the 2nd degree Legendre polynomial
chosen for matching the spectroscopic rotation [@Brodka1992]
with the form;

$$ R_2(t) = \frac{1}{2} \langle 3(\hat{\vect{n}}(t) \cdot \hat{\vect{n}}(0))^2 -1 \rangle. $$ {#eq:rot_relax}

### Rotational Motion through Jump Dynamics {#sec:intro_jump_dynamics}

When describing rotation dynamics using spherical harmonics
there are multiple choices for the order of the Legendre polynomial $l$,
where @eq:debye_rotational_diffusion describes the relationship
between the relaxation times and rotational diffusion constant
for difference choices of $l$.
The ratio $\tau_1/\tau_2$ is used to measure the contribution
of large angular jumps towards rotational relaxation. [@Jose2006;@Kivelson1970]
When the rotations undergo Brownian dynamics,
that is a process of small angular motions,
a 3D system has the ratio $\tau_1/\tau_2$

$$ \tau_1/\tau_2 = \frac{2(2 + 1) D_r}{1(1+1) D_r} = 3$$

and a value of 4 for rotations in 2D.
When the ratio $\tau_1/\tau_2$ falls within the range

$$ 1 < \tau_1/\tau_2 < 3 $$

for 3D systems, or

$$ 1 < \tau_1/\tau_2 < 4 $$

for 2D systems,
the rotational relaxation takes place
through a small number of large angular displacements
rather than the many small angular displacements
described by Brownian dynamics.
The presence of large angular displacements
described as the onset of jump dynamics.
At the limit, a single large angular displacement describes
both relaxation quantities simultaneously,
where $\tau_1/\tau_2 = 1$.
The presence of jump dynamics has been observed within ortho-terphenyl [@Andreozzi1996]
using electron spin resonance to capture both rotational relaxation quantities.

### Decoupling of Translational and Rotational motion

Models describing the dynamics of ortho-terphenyl
are based on the Stokes-Einstein-Debye relationships, [@Einstein1956;@Debye1929]
which are derived from particles undergoing Brownian motion.
There are two predicted relationships which are important,
with the Stokes--Einstein relation describing
the translational diffusion constant

$$ D_t = \frac{k_\text{B} T}{6 \pi \eta R} $$

and the Stokes--Einstein--Debye relation describing the rotational diffusion constant

$$ D_r = \frac{k_\text{B} T}{8 \pi \eta R^3} $$

where $\eta$ is the shear viscosity,
$T$ is the temperature, and
$R$ is the radius of the particles within the liquid.
These equations can be simplified by grouping all the constant terms [@Shi2013]

$$ \frac{D_t \eta}{T} = \text{constant} $$ {#eq:stokes_einstein}

and

$$ \frac{D_r \eta}{T} = \text{constant} $$ {#eq:einstein_debye}

The shear viscosity $\eta$ is difficult to calculate within simulations [@Barrat1990]
and the structural relaxation time $\tau_s$
is commonly used as a substitute. [@Shi2013;@Ikeda2011;@Jeong2010;@Tarjus1995]
This substitution allows us to describe a proportionality between all
the dynamic quantities described above

$$ \frac{D_t}{T} \propto \frac{D_r}{T} \propto \frac{1}{\tau_rT} \propto \frac{1}{\tau_s} $$ {#eq:sed_proportionality}

the translational diffusion constant $D_t$ ,
the rotational diffusion constant $D_r$,
the rotational relaxation time $\tau_r$,
and the structural relaxation time $\tau_s$.
One of the characteristic features of the dynamics of ortho-terphenyl
is the breakdown of these relations, that is,
the proportionality described in @eq:sed_proportionality no longer hold true. [@Chang1994]
This is described as the decoupling of rotational and translational motion
where and is shown in @fig:trans_rot_otp as the
different behaviour for the rotations and translations below \SI{290}{\kelvin}
when plotted against viscosity.
This decoupling has been observed in further studies
of supercooled liquids
and remains an unexplained phenomenon. [@Debenedetti2001;@Fujara1992;@Cicerone1996;@Ediger2000]

![Translational ($\square$, $\CIRCLE$, $\vartriangle$)
and Rotational ($\lozenge$,$\blacklozenge$) diffusion coefficients
of ortho-terphenyl.
The coupling of these quantities breaks down below 290K,
where the translational diffusion is faster than the rotational diffusion. \
*Figure from @Chang1994 used with permission © Elsevier*
](../00_Introduction/figures/trans_rot_coupling.png){#fig:trans_rot_otp width=80%}

## Successfully Modelling ortho-terphenyl

The aim of this chapter is to establish that the Trimer
is an appropriate dynamical model for ortho-terphenyl.
To do this we need to consider which elements of
the dynamical behaviour of ortho-terphenyl
we expect the Trimer model to display.
These are;

1. the non-Arrhenius temperature dependence characteristic of a fragile liquid
2. the two-step structural relaxation described in @sec:structural_relaxation
3. The presence of dynamic heterogeneities
4. Jump dynamics in the rotational relaxation
5. Decoupling of translational and rotational motion

The simulation methods described in @sec:methods_dynamics
are used to generate the trajectories
for analysis of the above behaviour,
using simulations of 1024 molecules
and using 500 distinct starting configurations
to give results reflective of the equilibrium liquid
rather than a single configuration.
The calculation of the analysis quantities
is described in @sec:dynamics_calculations.

The dynamic quantities calculated for the simulated trimer molecules
are compared to the results observed in experiments for ortho-terphenyl.
@Sec:structural_relaxation describes points 1 and 2,
@sec:dynamic_heterogeneities describes point 3,
while points 4 and 5 are covered in @sec:sed.
