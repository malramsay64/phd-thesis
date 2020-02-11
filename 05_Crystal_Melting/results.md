# Results

This section measures the melting rate of the p2 crystal
and describes the rates using different models of growth.
This allows us to understand which aspects of the growth and melting rates
are important for describing the process,
giving an understanding of why crystallisation and growth is so slow.
We start by finding the quantities used in the analysis of the melting rates,
followed by fitting the three theories described in @sec:crystal_growth_theories
discussing how each of them describe the melting process.

## Important quantities for Melting and Growth

In this section we are calculating the quantities
needed to model crystal growth.
The melting point $T_m$,
the spinodal temperature,
the chemical potential $\Delta \mu$, and
the transport coefficient.

### Melting Point

The melting point $T_m$ is the temperature
at which the rates of attachment and detachment
at the crystal surface are the same,
there is no net growth or melting.
A method of determining the melting point
from molecular dynamics simulations
is finding the temperature at which
the growth rate crosses from
crosses from negative (melting) to positive (growth). [@GarciaFernandez2006]
Throughout the study of the Trimer molecule,
no crystallisation has been observed,
despite running simulations as long as HOOMD-blue allows.
A technical decision in the development of the HOOMD-blue
molecular dynamics package deemed that a 32 bit unsigned integer
was enough to keep track of the number of timesteps;
HOOMD-blue can only count up to $2^{32}-1$, slightly more than 4 billion. [@hoomd_counter]
This means with the chosen timestep of 0.005,
the longest possible timescale for a simulation is $2e7$.

With the absence of crystal growth,
the melting point becomes as estimate.
The melting point is defined here
as the temperature at which melting is no longer observed,
with the limit of being the melting of a single layer of crystal.
The melting rate which corresponds to the melting
of a single layer of crystal over
the course of the entire simulation is \num{3e-7}.
This estimate is a upper bound of the melting point
and are tabulated in @Tbl:crystal_melting_point
with the values extracted from @fig:melting_point_rates.

Pressure  Melting Point $T_m$
-------- ---------------------
1.00            0.36
13.50           1.35

Table: The melting points of the crystals
for both pressures studied in this thesis. {#tbl:crystal_melting_point}

::: {#fig:melting_point_rates class=subfigure}

![P=1.00](../Projects/Crystal_Melting/figures/melting_point_rates_P1.00.svg){width=80% #fig:melting_point_p1}

![P=13.50](../Projects/Crystal_Melting/figures/melting_point_rates_P13.50.svg){width=80% #fig:melting_point_p13}

The melting rates of the p2 crystal close to the melting point
for pressures of 1.00 (a) and 13.50 (b).
A melting rate of \num{3e-7} is less than a single layer of crystal
over the course of the simulation.

:::

### Spinodal temperature

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

All the theories described in @sec:crystal_growth_theories
make the assumption that the melting and growth
is occurring at a well defined interface.
There is an alternative method of melting,
which takes place spontaneously
which has been known as the Homogeneous Nucleation Catastrophe. [@Lu1998]
This onset of this spontaneous melting occurs at the spinodal point
defining an upper limit for which interfacial melting can occur.
The spinodal point can also exist as a lower temperature bound [@Cavagna2009]
with spontaneous crystallisation at many points within the liquid.
The spinodal point for crystallisation within the liquid
is beyond the reach of our current simulations
and so is not studied here.

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

### Chemical Potential Energy

The change in the chemical potential energy $\Delta \mu$
is an important part of describing the crystal melting dynamics
in the classical models of melting.
Finding the chemical potential energy at each temperature
is a complex process,
so a standard approach [@Tang2013]
is to estimate the change in chemical potential $\Delta \mu$ as

$$ \Delta \mu = \frac{\Delta h_m(T_m - T)}{T_m} $$

where $\Delta h_m$ is the enthalpy of fusion per particle.

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
@Ediger2008 has noted that the viscosity
is not an appropriate transport coefficient
on account of the dynamic heterogeneities present at low temperatures.
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
the inverse rotational relaxation time $1/\tau_r$ [@sec:rotational_diffusion]
was chosen as the transport coefficient.
The rotational relaxation time $\tau_r$ is the time
for half of the molecules to have reoriented by \SI{90}{\degree}.

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

### Classical Theories of Growth

The expression for classical theories of crystal growth [@eq:crystal_growth_general]
can be rewritten as

$$ \frac{v(T)}{p(T)} \propto \left[1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)}\right] $$ {#eq:crystal_growth_refactor}

where $p(T) \propto k(T)$ having removed the constants
and only describing the temperature dependence of the transport property.
If these models describe the observed crystal growth behaviour
plotting $v(T)/p(T)$ vs $1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)}$
will give a straight line.

The Turnbull model of melting defines $p(T) = \sqrt{T}$
which is plotted in @fig:melting_turnbull.
The ratio between the two axes displayed
is nothing close to a straight line,
indicating it is a very poor fit to this data.
Another interesting feature of @fig:melting_turnbull
is that the two pressures have very different ratios
between these quantities.
The constants which are used in creating the Turnbull model, [@eq:constants_turnbull]
the interatomic spacing, the diffusional mean free path and the collision factor
all describe values which are similar between pressures.
It is not surprising the Turnbull model,
normally used for materials which crystallise quickly,
doesn't describe the growth of such a fragile liquid.

![Determining the relationship between components of the Turnbull model
of melting. The contribution from the chemical potential is on the x axis
while the thermal contribution is on the y axis.
The lack of a linear relationship indicates
they Turnbull model is not suitable for describing the melting.
](../Projects/Crystal_Melting/figures/melting_turnbull.svg){#fig:melting_turnbull width=80%}

The Wilson--Frenkel model which would be expected to model the growth of the trimer,
defines the temperature dependent function $p(T) = D(T)$,
where we have chosen $1/\tau_r$ for the transport coefficient $D(T)$. [@sec:transport_coefficient]
The ratio for the Wilson--Frenkel model is shown in @fig:melting_wilson.
The ratio between the two components is much improved over the Turnbull model,
showing a linear region close to the melting point
which is where the x axis is zero,
that is $1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)} = 0$.
Further further away from the melting point there is a sharp deviation,
with what looks to be a completely different model of melting.

![Determining the relationship between components of
the Wilson--Frenkel model of melting.
The contribution from the chemical potential is on the x axis
while the thermal contribution is on the y axis.
A linear relationship indicates that the Wilson--Frenkel model
adequately describes the melting,
which occurs close to $x=0$.
](../Projects/Crystal_Melting/figures/melting_wilson.svg){#fig:melting_wilson width=80%}

It would appear that the classical melting theory
is unable to describe the melting behaviour.
In particular,
while the classical theory predicts different melting rates
based on the difference in chemical potential
between the liquid and the solid.
For the trimer molecule there is not this relationship.
The difference in the Chemical Potential energy $\Delta \mu$
between the liquid and crystal changes based on the pressure,
however, when normalised by the melting point, [@fig:melting_rates]
there is no discernible difference between the melting rates.
We will need to look to alternate descriptions
of the melting behaviour
which better match the observed results.

### Semi-empirical Density Functional

The choice of order parameter for to describe the crystal growth
is the orientational order parameter $O_\theta$

$$ O_\theta = \frac{1}{N} \left\langle \sum_{i=1}^N \cos^2(\theta_i - \theta_0) \right\rangle $$

which is described in @sec:ml_introduction.
In machine learning, the reduction in dimensionality was problematic
while in this case we are looking for a one-dimensional description
making this an excellent choice.
To make the orientational order parameter
have the distribution of values expected for $M$,
the values are modified so that
the mean orientational order of the liquid
$\langle O_\theta \rangle_\text{liquid} = 0$
and the mean orientational order of the crystal
$\langle O_\theta \rangle_\text{crystal} = 1$.
This is done using the below relation

$$ M = \frac{O_\theta - \langle O_\theta \rangle_\text{liquid}}
{\langle O_\theta \rangle_\text{crystal} - \langle O_\theta \rangle_\text{liquid}} $$

The distributions of these values are shown in @Fig:trimer_fluctuation
where the distribution of the crystal phase
is far narrower than that of the liquid phase,
with very little overlap.

![Distribution of the orientational order parameter $O_\theta$
for the liquid and the crystal phases at the melting point $T=1.35$.
](../Projects/Crystal_Melting/figures/fluctuation_normalised.svg){#fig:trimer_fluctuation width=80%}

![The relationship of the thermally normalised relaxation on the y axis
to the rate description of the semi-empirical density functional model
on the x axis.
A straight line means a perfect description of the melting behaviour.
](../Projects/Crystal_Melting/figures/melting_dft.svg){#fig:melting_dft width=80%}

Fitting the fluctuation model to the melting rates
gives the curves in @fig:fluctuation_rate.
This predicts the melting over the entire temperature range
interfacial melting was observed.

![Fitting the semi-empirical density functional model
to the melting rate.
Both pressures are fit with the same constant $K=3.7$.
](../Projects/Crystal_Melting/figures/fluctuation_rate_fit.svg){width=80%}
