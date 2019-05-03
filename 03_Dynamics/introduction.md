# Introduction

Current models of motion in the liquid state
are based on the Stokes-Einstein-Debye relationships[@Debye,@Stokes],
which are theoretical models of collective motion
derived from particles undergoing Brownian motion[@Einstein].
The most common relationships of the Stokes-Einstein-Debye models are

$$ D_t \eta / T = \text{constant} $$ {#eq:stokes_einstein}

and

$$ D_r \eta / T = \text{constant} $$ {#eq:einstein_debye}

where $D_t$ is the diffusion constant of the translational motion
$D_r$ is the diffusion constant of the rotational degrees of freedom,
$\eta$ is the shear viscosity, and
$T$ is the temperature.

One of the detractors of Brownian dynamics
is that it describes the dynamics of independent events,
making no account for momentum.
An alternative method of describing the dynamics of particles
is through Langevin Dynamics,
which does include the momentum of particles.
This ends up giving the same result
for the Stokes-Einstein-Debye relations.
This is because it is possible to consider
Brownian Dynamics as a more granular form
of Langevin Dynamics.

The  models are suitable for describing
the dynamic properties of most liquids, however,
there are instances,
particularly in supercooled liquids,
where the Stokes-Einstein-Debye relations
are insufficient for describing the dynamics which are observed.
The breakdown in dynamics is primarily
a case of the underlying particle motions
no longer adhering to Brownian motion.

## Glasses and Supercooled liquids

Typically when describing states of matter
we describe an equilibrium state,
being the lowest energy state 
at a set of conditions.
However, inherent in any experiment performed 
is a timescale over which observations take place.
The pitch drop experiment [@Cite???]
is an excellent example of how timescale
can affect our observations.
Over the course of minutes,
the pitch appears to be a solid, 
with no perceived motion,
while on the timescale of tens of years
we see motion that is liquid in character.

### Introduction to Supercooled Liquids

A Supercooled liquid is a liquid
that has been cooled to a temperature below the melting point
prior to the rare event of nucleation taking place.
Supercooled liquids are a metastable state,
although particularly in simulation studies
can be referred to as at equilibrium,
which is a reference to the rarity of the nucleation;
the supercooled liquid is able to sample
most of the available phase space
without encountering a nucleation configuration.
A typical method of determining when a supercooled liquid
has reached equilibrium is defining a relaxation timescale,
being a timescale over which a configuration
has no 'memory' of a previous configuration.

For each temperature we will have a relaxation time
---being the typical time for relaxation to occur---
and a nucleation time
---being the typical time for nucleation to occur.
Forming a supercooled liquid,
can then be expressed as a line between those of
the relaxation time and the nucleation time
as shown in @fig:supercooled_liquid_formation.
The example shown in @fig:supercooled_liquid_formation
demonstrates a well behaved example,
with the nucleation time always
being longer than the relaxation time, however
there are also supercooled liquids
where for some range of temperature,
the relaxation time becomes longer than the nucleation time
resulting in what is known as a *kinetic spinodal*,
a temperature where the supercooled liquid does not exist
since nucleation starts before equilibrium can be established.

### Introduction to Glasses

A glass is a disordered state of matter,
just like a liquid,
which has a viscosity of \SI{10e13}{\poise}.
The temperature at which the viscosity reaches this value
is known as the glass transition temperature, denoted $T_g$.
When running computer simulations,
a viscosity this high is beyond our current capability,
so instead a less stringent criteria is applied;
a disordered material which behaves as a solid 
on the timescale of the experiment.

This also means that as computational power
and algorithms improve,
simulated materials which have been considered glasses
can form crystals on longer time scales.

The formation of a glass
is considered a kinetic phase transition,
there are no thermodynamic changes
which would indicate a first order phase transition
typically associated with freezing.
However, despite the glassy transition
being arbitrarily defined,
many materials exhibit similar changes
in behaviour as they approach the glass transition temperature.

- Creating a glass
    - avoidance of critical point
        - Cooling fast enough to prevent nucleation
    - depiction on phase diagram

- Fragility of glass formers
    - Faster than expected change upon cooling


## Characteristic Temperatures

- Vogel--Tammann--Fulcher
    - temperature dependence of relaxation times
    - provides a measure of how far from Arrhenius
    - $\tau = \tau_0 \left ( \frac{T-T_0}{T_0} \right )^{-\beta}$
    - $\eta = A \exp(\frac{B}{T-T_0})$

- Slowdown near 2/3 of the melting point [@Angell2000]

- Glass transition temperature
    - Below $~1.2 T_g$ decoupling of rotations and translations occurs
    - Breakdown occurs between $1.15 T_g$ and $1.25 T_g$ in OTP -> experimental results

- Kauzmann Temperature $T_K$
    - Where the liquid would have lower entropy than the crystal
    - not possible, so provides a lower bound for the glass transition temperature
    - Have potential energy of liquid and crystal
    - $T_g \ge T_K$
    - Change in heat capacity

- Critical temperature $T_c$
    - where the is a divergence of multiple timescales
    - Definition depends on theory
    - Landscape theory this is where the landscape effects the dynamics
    - elsewhere the onset of different relaxation timescales
    - onset of heterogeneities
    - cite [@Goldstein????]
    - Strong liquids far above $T_g$, fragile close to $T_g$ [@Novikov1996] (Rossler)
    - Express fragility in terms of $T_c$, $\frac{T_g}{T_c - T_g}$

## Dynamics of Supercooled Liquids and Glasses

The theory of the behaviour of liquids
is primarily based on
the Stokes-Einstein-Debye relations,
which are derived from the equations for Brownian motion.

- What is viscosity?
    - How can we measure it in simulations?

### Structural Relaxation

Structural relaxation is the most fundamental relaxation process [@Angell2000]
being the process by which a liquid forgets it's structure
from some earlier time [@Ediger1996].
The process of structural relaxation occurs over distances
comparable to the size of the particles which
comprise the liquid [@Angell1985].
These small distances over which the structural relaxation take place
are comparable to the relaxations that take place
when the liquid is under a shear stress.
The motion of the liquid under a shear stress,
otherwise known as shear viscosity and denoted by $\eta$,
has been shown to have the same temperature scaling
as the structural relaxation time
in both experimental [@Ediger2012] and computational [@Perera1999] systems.

This relationship between the shear viscosity and the structural relaxation
allows us to rewrite the Stokes-Einstein-Debye relations as

$$ D \propto \frac{1}{\tau_s} \text{and} \tau_r \propto \tau_s $$

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

$$ F(\mathbf{k}, t) = \frac{1}{N}\langle \sum_j^N \exp{
    i\mathbf{k} \cdot [\mathbf{r}_j(0) - \mathbf{r}_j(t)]
} \rangle $$ {#eq:intermediate_scattering_function}

where the angle brackets denote averaging over multiple initial configurations
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

$$ \mathbf{k} = k \frac{1}{M}\sum_{a=1}^M [
    \cos\left(a\frac{2\pi}{M}\right), \sin\left(a\frac{2\pi}{M}\right)
] $$

Where the sum is over $N$ values of
the angle $\theta_i$ which ranges in value from $0$ to $2\pi$

The intermediate scattering function
is the spatial transform of the van-Hove relaxation function $G(r, t)$,
given by

$$G(r, t) = \frac{1}{4\pi r^2 \Delta r} \langle \delta[r_i(t) - r_i(0) - r] \rangle$$

which has also been used for computing structural relaxation
[@Glotzer2000,@Debnedetti2001,@Levesque1970,@Kob1995].

More recently, there has been an effort
to link structure with dynamics on a local level,
which has required a measure of structural relaxation
which makes the contribution of each particle explicit
rather than just the entire system as a whole.
Widmer-Cooper and Harrowell [@Widmer-Cooper2009a] defined
a structural relaxation $F_d(t)$ where

$$ F_d(t) = \frac{1}{N} \left \langle \sum_i w_i(d, t) \right \rangle $$

where $w_i(d, t) = 1$ if the particle is within distance $d$
of it's initial position at time $t$,
and zero otherwise.
The angle brackets denote an average over initial times.
The value of $d$ was chosen to be

$$ d = \frac{\pi}{2 k_{\text{bragg}}} $$

where $k_{\text{bragg}}$ is the wave-vector of
the maximum peak of the static structure factor $S(k)$.
This matches with the calculation of the intermediate scattering function
which will follow the same wave-vector $k_{\text{bragg}}$
as it will display the largest change over time.

### Rotational Relaxation

In experimental systems,
the rotational relaxation is typically measured
as the relaxation of a dipole moment [@citation].
The relaxation of a dipole $C_l$,
where the orientation of the dipole is represented by the vector $\vect u$
can be represented as

$$ C_{l} = \langle P_l(\vect{u}_i(t) \cdot \vect{u}_i(o)) \rangle_i $$

Here $P_l$ is the Legendre polynomial of degree $l$,
and the angle brackets denote an average over
all molecules and starting configurations.
To match simulation results with NMR and fluorescence experiments
the 2nd degree Legendre polynomial is calculated,
giving the equation

$$ C_2(t) = \frac{1}{2} \langle 3(\vect n(0) \cdot \vect n(t))^2 -1 \rangle. $$

It should be noted that this dipole relaxation
only captures at most two dimensions of the rotational relaxation,
a rotation about the axis of the dipole is not captured by this relation at all.
There are a number of different approaches which have been used,
Brodka et. al. [@Brodka1992] define the rotational relaxation
of the spectroscopically available rotation with the $C_2$ method
whilst other rotational degrees of freedom
were studied using an angular velocity autocorrelation function.
Alternatively Jas et. al. [@Jas2000] combine the rotational relaxations
for vectors along the $x, y,$ and $z$ axes into a single
complete rotational relaxation.
An approach which is only concerned with isotropic rotational motion
could also take the approach of Chen et. al [@Chen2017]
and represent molecular rotation using quaternions[@Furry1957,???],
which capture all rotational information.
It should be noted that
the quaternion representation can also be decomposed
into the component rotational relaxations,
just as the vectors for each axis
can be combined into an isotropic relaxation.
The advantage with using the quaternion approach
is that quaternions are the most sensible approach
for computationally representing rotations in three dimensions[@Huynh2009]
and is commonly used in molecular dynamics simulations
[@Ciccotti1986,@Omelyan1998,@Rog2003,@Anderson1983,@Refson2000,@Nose1983,@Evans1977,@Rapaport1985].

### Methods of rotational relaxations

The Debye model predicts an exponential decay of the $l$th rank
single-particle orientation time correlation function $C_l^s$,
$$ C_l^s = \exp \frac{-t}{\tau_l} $$
which gives the corresponding relaxation time
$$ \tau_l = \frac{1}{l(l+1)D_r}, $$
where $D_r$ is the rotational diffusion coefficient.
Comparing this relationship for
the first and second-order relaxation functions
$$ \tau_1/\tau_2 = \frac{2(2 + 1) D_r}{1(1+1) D_r} = 3$$
Where molecules rotate inertially, that is,
they carry out rotations over reasonably large angular displacements
before being interrupted by a collision,
resulting in non-exponential decay, where
$$ 1 < \tau_1/\tau_2 < 3.$$

The value of 3 (or 4 for 2D systems) is given by Brownian dynamics,
that is, assuming rotations take place through a process of small random steps.
Where there are large changes in orientation,
the two relaxation times become correlated,
since there are much fewer steps required for rotational relaxation to occur,
with the limit of this being
single jumps account for both relaxations simultaneously.

In many experimental and simulation studies
at high temperatures [???]
the relationship $\tau_1/\tau_2 = 3$ has held true.
In supercooled liquids however,
there have been many studies
which have found $\tau_1/\tau_2 < 3$,
which has given credence to the
idea of rotational relaxations
taking place through the process of large angular jumps.

- Understanding Dynamics
    - $\alpha$ and $\beta$ relaxations
    - Increasing length scale
        - higher dimensional space
        - No direct evidence for this as an idea
            - Is this the appropriate method of investigating
    - Cooperative motion
        - Kinetics of cooperative motion
            - Can we keep the activation energy the same, yet change the rate to include
              multiple particles?

- Kivelson Scaling
    - viscous slowdown due to packing frustration [@Kivelson1995]

- Step Dynamics
    - Motion is an activated process
    - instead of moving freely, diffusion takes place as a number of small steps
    - Jumps of rotations and translations -> how are these coupled together
    - when can we ignore hopping

- Breakdown of Stokes-Einstein-Debye
    - Viscosity scales differently to diffusion
    - Relationship of rotation relaxation, viscosity, and diffusion

- Relaxation functions
    - exponential relaxations are expected
        - Why???
    - heterogeneous dynamics are a possible reason for this
    - alternatively there is also a non-exponential process

- Structural component
    - Is packing frustration a factor in glass formation
    - Many different crystals formed, just unable to tile space
    - or in this case forming different incompatible crystal structures

- Correlations of rotation and translation
    - reptation

- How properties are calculated / expressed
    - Averaging techniques
        - mean
        - harmonic mean
        - median
    - Most probable vs average

### Dynamics in Experimental systems

- How are these dynamics measured
    - Techniques
    - How they relate to simulation quantities
    - Limitations of these techniques and simulations
