# Results

This section models the melting rate of the p2 crystal
as a methods of understanding which part of the process
is responsible for the slow crystallisation and melting.
We start by finding the quantities used in the analysis of the melting rates,
followed by fitting the three theories described in @sec:crystal_growth_theories,
giving insight into why the crystal growth is slow.

## Important quantities for Melting and Growth

In this section we are calculating the quantities
needed to model the crystal growth.
The melting point $T_m$,
the spinodal temperature,
the chemical potential $\Delta \mu$, and
the transport coefficient.

### Melting Point

The melting point $T_m$ is the temperature
at which the rate of crystal growth
is the same as the rate of melting---the equilibrium state.
Typically the melting rate is the temperature
at which the measurement of the growth rate
crosses from negative (melting) to positive (growth).
No crystallisation has been observed for this molecule
so the melting rate is the temperature
at which the melting rate is no longer measurable.
I consider the limit of measuring the melting
rate being the removal of a single layer of crystal
over the timescale of the simulation, a rate of \num{1e-6}.
The timescale cannot be extended as a technical limit of HOOMD-blue [@hoomd_counter]
which can only store numbers up to $2^{32}-1$, slightly more than 4 billion.
In concert with the technical limitation
there is a practical limitation with simulations taking multiple weeks to run.

@GarciaFernandez2006

The melting points are tabulated in @Tbl:crystal_melting_point
with the values for the tables extracted
from @fig:melting_point_rates.

Pressure  Melting Point $T_m$
-------- ---------------------
1.00            0.36
13.50           1.35

Table: The melting points of the crystals
for both pressures studied in this thesis. {#tbl:crystal_melting_point}

![The melting rates of the p2 crystal close to the melting point
for pressures of 1.00 and 13.50.
A melting rate of \num{1e-9}
is less than a layer of crystal
over the course of the simulation.
](../Projects/Crystal_Melting/figures/melting_point_rates.svg){width=80% #fig:melting_point_rates}

### Spinodal temperature

All the theories described in @sec:crystal_growth_theories
make the assumption that the melting and growth
is occurring at a well defined interface.
There is an alternative method of growth,
where the crystal spontaneously melts,
which has been known as the Homogeneous Nucleation Catastrophe. [@Lu]
This spontaneous melting can be described as a spinodal point
and defines the upper limit
for which interfacial melting can occur.
The spinodal point can also exist as a lower temperature bound [@Cavagna2009]
with spontaneous crystallisation at many locations,
however that is beyond the reach of our current simulations.

<div id="fig:spinodal" class="subfigures">

<!-- These captions are intentionally left blank -->
<!-- markdownlint-disable MD045 -->
![](../Projects/Crystal_Melting/figures/melting_disorder_P1.00-T0.55.svg){#fig:melting_disorderA width=45%}
![](../Projects/Crystal_Melting/figures/melting_disorder_P1.00-T0.50.svg){#fig:melting_disorderB width=45%}
<!-- markdownlint-enable MD045 -->

Melting behaviour above (a) and below (b) the spinodal. These are configurations from a
melting simulation at a pressure of 1.0, with (a) at a temperature of 0.55 and (b) at a
temperature of 0.50. While (b) shows defects within the crystal, these are transient,
retuning the crystal to its original structure as they move along the lattice
dimension. This is unlike in (a) where the defects are persistent and support the
propagation of melting in the surrounding crystal.

</div>

Pressure  Spinodal Temperature
-------- ---------------------
1.00            0.55
13.50           2.00

Table: The temperatures at which the spinodal occurs for the crystal structure at both
pressures. {#tbl:crystal_spinodal}

The Spinodal temperatures in @tbl:crystal_spinodal represents
the temperature where is is no longer possible to study melting
at an interface as a result of
nucleation of the liquid phase within the crystal.
This is the temperature at which a simulation of
the crystal phase will spontaneously melt
from the formation of the defects
within the crystal structure.

This is well above the range of melting rates
measured in simulations of 3D systems;

- @Benjamin2015 go up to $T/T_m = 1.06$,
- @Kerrache2008 goes up to $T/T_m = 1.07$,
- @Rozmanov2011 go up to $T/T_m = 1.08$,
- @Jackson2002 go up to $T/T_m = 1.08$, and
- @Ramakrishnan2017 go up to $T/T_m = 1.12$.
- @Iwamatsu1999 observes nucleation at $T/T_m = 1.11$

which are all in agreement with @Abraham1981,
in determining the spinodal of
the 2D Lennard Jones to be $T/T_m = 1.08$

Along with comparable melting studies,
@Lu1998 find the onset homogeneous nucleation,
that is the spinodal temperature,
for a range of metals at $T/T_m = 1.2$.
And as another example
@Norman2002 study rates of nucleation within the crystal
up to $T/T_m = 1.25$.
From a comparison with all these studies
it would appear that the spinodal temperature $T/T_m = 1.6$
is highly unusual and well above any other materials.

When studying melting it is important to understand
the range of temperatures over which the melting is well defined.
At the lower bound this is the melting point $T_m$,
the temperature at which the crystal neither melts or grows.
The upper bound of melting is the spinodal point.

In characterising crystal growth
the most important temperature is the melting point $T_m$
at which both the liquid and crystals phases
exist at equilibrium.
That is, the rate of particles attaching to the interface
is equal to the number of particles detaching from the interface.
The melting point can be found through simulation
as the temperature at which the growth rate goes from negative to positive.

In @sec:supercooled_liquids it was discussed that
a liquid can exist as a metastable state below the melting point.
The same is also true of the crystal above the melting point.
At some temperature above the melting point,
the crystal is no longer metastable,
spontaneously melting to form the liquid.
The temperature at which this spontaneous melting occurs
is known as the spinodal temperature.
When a crystal is surrounded by liquid above the melting point,
melting will occur at the liquid--crystal interface.
This interfacial melting is explained by
the Wilson-Frenkel theory of crystal growth.
It is when the melting is not only occurring at the interface,
at many points within the crystal itself
that the temperature is above the spinodal.

Along with the crystal existing as
a metastable state above the melting point.
The liquid exists as a metastable state
below the melting point.
Like the crystal above the melting point,
at some temperature below the melting point,
the liquid will spontaneously crystallise,
another spinodal temperature.

### Chemical Potential Energy

@Tang2013

Standard to use alternative measure.

Theoretical models of the melting rates
are able to help understand which aspects
of the melting behaviour are important
allowing an explanation of the slow rate of the trimer.
These theories require the difference in enthalpy
between the liquid and crystal
as an estimate of the chemical potential energy.

Pressure:                    1.00   13.50
----------                 ------  ------
Crystal Potential Energy   -1.991  -1.111
Liquid Potential Energy    -1.811  -1.045
Difference $\Delta h_m$    -0.180  -0.066

Table: The potential energy of the liquid and the crystal at the melting point for both
pressures. {#tbl:potential_energy_difference}

### Choosing a Transport Coefficient

Both the Wilson--Frenkel and the Semi-empirical density functional theories of growth
include a term for a transport coefficient,
which is normally the diffusion constant $D$. [@Jackson2002]
In the case of the Trimer molecule,
we have both the translational diffusion constant $D_t$
and the rotational diffusion constant $D_r$,
both of which could be used here.
In studies of the crystallisation of liquid water,
the translational diffusion constant
has been used as the transport coefficient, [@Xu2016;@Rozmanov2011]
with no mention of rotational diffusion.
Another place where there are multiple transport coefficients
is the study of alloys,
where @Tang2013 use the slowest diffusion rate
to model with Wilson--Frenkel growth,
noting that the choice of transport coefficient
didn't make much difference to the fit.
Because of the breakdown in the Stokes--Einstein--Debye relations [@sec:trans_rot_coupling]
and noting that the transition between the liquid and crystal
mostly takes place through orientational motions,
the inverse rotational relaxation time $1/\tau_r$ [@sec:rotational_relaxations]
was chosen as the transport coefficient.
The rotational relaxation time $\tau_r$ is the time
for half of the molecules to have reoriented by \SI{90}{\degree}.

@Ediger2008

- Viscosity is not an appropriate measure of growth
as a result of dynamics heterogeneities.

## Melting Rates

The simulations in @sec:polymorphic-stability show the p2 crystal to be most stable,
so is used for further analysis of the melting rate.
The isotropic melting rate of the p2 crystal
is the chosen metric,
measured using an estimated radius,
found from the volume
by assuming a circular crystal.
@fig:melting_radius shows a linear time dependence
fitting the expected behaviour,
over all temperatures.

![This figure shows the change in the estimated radius of the crystal as a
function of time. The radius is estimated from the volume assuming a circular crystal.
Each set of conditions is repeated five times starting from independent
configurations, which are used to estimate the confidence intervals. The change in
the radius is expected to change linearly, which is reflected in all the data.
](../Projects/Crystal_Melting/figures/melting_radius.svg){#fig:melting_radius}

With the time dependence of the estimated radius
matching the expected linear dependence,
the crystal growth rate is the slope of a linear fit.
@fig:melting_rates shows the growth rates and their respective errors.
The normalisation of the melting point
brings both pressures onto a single curve,
the same result as seen for the dynamic quantities.

This is the observation for temperatures
still well above the melting point.
I will include more temperatures
as the results from the
longer crystal melting simulations are finished.

![The crystal growth rates normalised by the melting point. For clarity a light grey.
These results are for both high and low
pressure melting, which collapse onto the same curve when normalising the temperature by
the melting point.
](../Projects/Crystal_Melting/figures/melting_rates_err.svg){#fig:melting_rates}

The normalisation by the temperature allows
for the comparison between different pressures,
while a normalisation by the dynamics
shows how the process of crystal growth changes
as a function of temperature. [@fig:normalised_melting_fit]
This is now the distance the interface travels
in the relaxation time.
As the temperature decreases the distance
tends to get smaller,
matching the expected behaviour.

### Turnbull Theory of Melting

![turnbull](../Projects/Crystal_Melting/figures/melting_turnbull.svg)

### Wilson--Frenkel Theory of Melting

![Wilson](../Projects/Crystal_Melting/figures/melting_wilson.svg)

The classical theory of crystal describes growth
normalised by a relaxation time [@eq:normalised_growth].
Using the points from @fig:melting_rates and the values from @tbl:potential_energy_difference,
the unknown parameter $c$ of @eq:normalised_growth was found using the
Levenberg--Marquardt algorithm [@Levenberg1944;@Marquardt1963;@More1978;@Jones2001] for least squares fitting of non-linear functions.
This gives the lines of fit displayed in @fig:normalised_melting_fit.
The parameters of the fit displayed in @tbl:rate_coefficient.

Pressure            $c$
-----------     -----------------
1.0             \num{-0.77(5)}
13.50           \num{-1.5(5)}

Table: The constant defining the rate of crystal growth
for each of the pressures.
These values are obtained from the fitting in
@fig:normalised_melting_fit {#tbl:rate_coefficient}

The lines depicting the fit of
the Wilson-Frenkel theory in @fig:normalised_melting_all
predict significantly slower melting rates
than observed in the simulations
for temperatures $T/T_m > 1.20$.
A possible cause for this would be the onset of spinodal
with the melting occurring throughout the structure,
through this is not observed.
When only looking at the temperatures close to the melting point
[@fig:normalised_melting_zoom]
the data would seem to fit a melting point at 0.97,
slightly lower than was predicted by observing melting.
Without observing crystal growth,
the melting point is going to be an estimated value,
and the current estimate is within the error of the simulations.

### Semi-empirical Density Functional

The incredibly high spinodal point of the trimer,
is indicative of a highly constrained crystal structure
with very little fluctuation.
An analysis of the fluctuations within the structure
can provide more information on this.

Measuring the fluctuation of the Trimer molecule
is done using the Orientational order parameter $O_\theta$

$$ O_\theta = \frac{1}{N} \left\langle \sum_{i=1}^N \cos^2(\theta_i - \theta_0) \right\rangle $$

normalised such that
the mean orientational order of the liquid
$\langle O_\theta \rangle_\text{liquid} = 0$
and the mean orientational order of the crystal
$\langle O_\theta \rangle_\text{crystal} = 1$.
The distributions of these values are shown in @Fig:trimer_fluctuation
where the distribution of the crystal phase
is far narrower than that of the liquid phase,
with very little overlap.

![Distribution of the orientational order parameter $O_\theta$
for the liquid and the crystal phases at the melting point $T=1.35$.
](../Projects/Crystal_Melting/figures/fluctuation_normalised.svg){#fig:trimer_fluctuation width=80%}

![dft](../Projects/Crystal_Melting/figures/melting_dft.svg){#fig:melting_dft width=80%}

Fitting the fluctuation model to the melting rates
gives the curves in @fig:fluctuation_rate.
This predicts the melting over the entire temperature range
interfacial melting was observed.

![fluctuation
modelling](../Projects/Crystal_Melting/figures/fluctuation_rate_fit.svg){width=80%}
