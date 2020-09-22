# Calculation of Dynamics Quantities {#sec:dynamics_calculations}

## Data Collection

The collection of the data is an important part of calculating dynamics quantities.
Because of the large timescale of the simulations
and the range of timescales of dynamics quantities,
we capture data at a sequence of timesteps where
the time between configurations increases
as the total time increases.
The sequence of the steps is displayed in @tbl:step_sequence
with each row having 100 steps,
and the size of the steps increasing by a power of 10
as we move down the rows.
This sequence of steps allows for a singe value
of the dynamics quantities for,
however the stochastic nature of simulations means this trajectory
is only representative of a single possible outcome.
A typical method of creating many trajectories from a single one
is the comparison of every measurement with every other, [@Buyl2018]
an approach which only works when there is equal spacing between configurations.
As an alternative method of evaluating statistics from a single simulation trajectory,
we use *key-frames*,
configurations spaced evenly throughout the simulation
indicating start points of this exponential sequence.
The positions and orientations of particles are then
compared back to their reference key-frame.
The key-frames are spaced so they are independent configurations,
at a timescale of the structural relaxation time.
This independence means allows us to use
standard statistical methods to estimate errors.

Step Size |      |       |       |       |       |       |        |
---------:|:---- |:----- |:----- |:----- |:----- |:----- |:----   | :------
1         |   1  |  2    | 3     | ...   | 97    | 98    | 99     | 100
10        | 110  | 120   | 130   | ...   | 970   | 980   | 990    | 1000
100       |1100  | 1200  | 1300  | ...   | 9700  | 9800  | 9900   | 10000
1000      |11000 | 12000 | 13000 | ...   | 97000 | 98000 | 99000  | 100000

Table: The step sequence broken into its two components.
Across each row are the linear steps,
while dropping down to the next row
increases the size of the linear step by a power of 10. {#tbl:step_sequence}

The main source of error within the dynamics simulations
is sampling the equilibrium liquid.
While the size of the simulation is large enough to
minimise system size dependent effects, [@Yeh2004]
it is not large enough to capture the full distribution of
equilibrium liquid states.
For this we use the *key-frames* defined above,
using the Standard Error of the Mean (SEM) [@Gurland1971]
to estimate the errors present in the calculated quantities at each timestep.
To calculate the errors,
each of the below quantities is calculated for every key-frame and time interval,
with the mean and SEM calculated over the key-frames
giving a value for each time interval.

## Dynamics Quantities

This section describes the calculation of the dynamics quantities
used in @sec:Dynamics.
Each of these quantities has the code snippet
used for the calculation in @sec:code_snippets
and uses Numpy [@Harris2020] to calculate the values efficiently.
The implementation of all calculations is in
`statdyn-analysis` (@sec:simulation_analysis)
with all implementations using the best practices
described in @sec:best_practices.

### Calculation of Wave numbers

The first step in the calculation of wave numbers
is finding the radial distribution function.
This shows the distribution of particles at each radius
and can be related to the experimentally measurable self-intermediate scattering
function (@eq:self_intermediate_scattering_function)
through a Fourier transformation.
I used the function `freud.density.RDF` from
the freud python package [@Harper2016]
for the analysis of the radial distribution function.
The radial distribution is averaged over 1000 frames
at the melting point shown in @fig:radial_distribution.

![The radial distribution function of the Trimer liquid at a pressure $P=13.50$ and a
temperature $T=1.50$. The radial distribution is taken as an average over 100 configurations of
the input trajectory. There shape of the molecule means there are three distinct first
shell peaks. In further shells the only
impact on shape is the longer than usual tails of the peaks.
](../Projects/Dynamics/figures/radial_distribution.svg){width=80% #fig:radial_distribution}

### Computing the structure factor

Now that we have nicely computed the radial distribution function
we can convert it to the structure factor $S(k)$
using @eq:structure_factor.

$$ S(k) = 1 + \rho \int dr e^{-ikr} [G(r) - 1] $$ {#eq:structure_factor}

Although the computation of the structure factor
is described as a Fourier transform,
with the isotropic nature of the liquid,
we can assume spherical symmetry giving

$$ S(k) = 1 + 4 \pi \rho \frac{1}{k} \int dr r \sin(qr) [G(r) - 1] $$

where $\rho$ is the number density of the liquid.
Additionally because we can only take finite steps,
the integration is discretised as

$$ S(k) = 1 + 4 \pi \rho \frac{1}{k} \Delta r \sum_r r \sin(qr) [G(r) - 1] $$

The structure factor is calculated using
the function in @lst:structure_factor.

The wave number $v$ is the maximum value
of the static structure factor,
and can be used to find the characteristic Bragg length $k_\text{bragg}$

$$ k_\text{bragg} = \frac{\pi}{2 v} $$

![The static structure factor of the Trimer liquid at a pressure $P=13.50$ and a
temperature $T=1.50$. This is calculated from an average over 100 configurations.
within the trajectory. The first peak corresponds to a value of 2.90.
](../Projects/Dynamics/figures/static_structure_factor.svg){width=81% #fig:static_structure_factor}

### Structural Relaxation

Knowing the value of the wave vector $k_\text{bragg}$
it is possible to monitor how particles
move relative to that characteristic distance
using the self-intermediate scattering function

$$ F_s(k, t) = \left \langle \cos \left\{
k \left[\cos\left(a\frac{2\pi}{M}\right), \sin \left(a\frac{2\pi}{M} \right) \right]
\cdot
[\Delta x_{j}(t), \Delta y_{j}(t)]
\right\} \right \rangle $$

This is converted to a python function
which shown in @lst:intermediate_scattering_function.

### Diffusion

To calculate the translational diffusion constant
we first need to calculate the mean squared displacement $MSD$.
The mean squared displacement is calculated as in @lst:msd
where `freud` [@Harper2016] is used for the calculation of
the periodic boundary conditions.

The linear region of the mean squared displacement,
which are points with displacements from 2 to 50
are fit to the linear function

$$ \log(MSD) = m \log(t) + b $$

where $t$ is time and $m = 4D_t$.

The values are aggregated
over all the starting configurations
by calculating the diffusion constant of each time sequence
and using bootstrapping to estimate the mean
and the confidence interval.

### Rotational Relaxation

The rotational relaxation function, $C_l(t)$
is calculated for both the first,

$$ C_1(t) = \langle \cos[2\cos^{-1}(|q(t) q(0)|)] \rangle $$

and second

$$ C_2(t) = \langle 2\cos^2[2\cos^{-1}(|q(t) q(0)|)] - 1 \rangle $$

Legendre polynomials,
where $q(t)$ is the quaternion representing the orientation at time $t$.
The calculation the quaternion angle
is done using the Rowan package [@Ramasubramani2018],
specifically using the function `rowan.geometry.intrinsic_distance`.
See @sec:quaternion_rotations for more details
in using quaternions for representing orientations.

For both these values,
the characteristic relaxation time $\tau_s$ was found by
finding the first time which the relaxation function
dropped below the value $1/\text{e}$.
The expected value and confidence interval
was estimated by using the bootstrap procedure
over all the key frames.

### Heterogeneous dynamics {#sec:heterogeneous_dynamics}

Particles undergoing Brownian motion
will have a distribution of distances $\Delta r$
which has a Gaussian distribution.
The non-Gaussian parameter $\alpha$
is a measure of how far the actual distribution
of distances deviates from a Gaussian distribution [@Rahman1964]
The equation typically reported [@Kob1997] for the non-Gaussian is

$$ \alpha = \frac{3\langle \Delta r^4\rangle} {5\langle \Delta r^2 \rangle^2} - 1 $$

which measures the deviation from Gaussian motion in a system
with 3 degrees of freedom,
like rotational or translational motion in 3D space.
For motions in 2D,
like the translations in this thesis,
the following equation is used;

$$ \alpha = \frac{\langle \Delta r^4\rangle} {2\langle \Delta r^2 \rangle^2} - 1 $$ {#eq:non-gaussian}

The general case of the non-Gaussian is

$$ \alpha_D = \frac{D\langle \Delta r^4\rangle} {(D + 2)\langle \Delta r^2 \rangle^2} - 1 $$ {#eq:non-gaussian_general}

where D is the number of dimensions accessible to the motion.

Like translational motion,
the rotational motion is also expected to have
a Gaussian distribution,
which means it can be expressed in a similar way
to the translational non-Gaussian parameter.
In a 2D system,
the rotational motion is constrained to a single dimension
meaning we need to use the 1D form of @eq:non-gaussian_general;

$$ \alpha_\text{rotation} = \frac{\langle \Delta \theta^4\rangle} {3\langle \Delta
\theta^2  \rangle^2} - 1 $$ {#eq:non-gaussian_rotation}

measuring the deviation of rotational motions $\Delta \theta$.

It is additionally possible to investigate
the coupling of the rotational and translational displacements,
measured using the parameter $\gamma$.

$$ \gamma = \frac{\langle(\Delta r \Delta\theta)^2 \rangle}
    {\langle\Delta r^2\rangle\langle\Delta\theta^2\rangle} - 1 $$

This formulation is simplified from @Faraone2003
using the same approach as the rotational and translational
non-Gaussian parameters.

Each of these quantities,
the translational non-Gaussian parameter $\alpha$,
the rotational non-Gaussian parameter $\alpha_\text{rotation}$, and
the coupling of rotational and translational displacements $\gamma$,
has a characteristic timescale;
the time at which the dynamics is maximally heterogeneous.
This allows for the comparison of these quantities
as a function of temperature.
