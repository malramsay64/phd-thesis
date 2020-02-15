# Results

This section measures the melting rate of the p2 crystal,
found to be the best candidate for growth, @sec:Melting_Behaviour
describing the growth rates through different models.
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
This limitation of HOOMD-blue is not an issue for
similar studies of crystal growth [@Reinhart2018;@Benjamin2015;@Tang2013;@Yagasaki2016]
which use timescales 2-4 orders of magnitude less than used here.
It is possible the maximum timescale could be extended by increasing
the size of the timestep [@Stocker2003;@Fass2018]
however that is unlikely to increase the timescale
by the order of magnitude required to observe crystal growth.

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
While the melting point is only an estimate,
as an upper bound, any lowering of the melting point
emphasises the results found within this thesis.

Pressure  Melting Point $T_m$
-------- ---------------------
1.00            0.36
13.50           1.35

Table: The melting points of the crystals
for both pressures studied in this thesis. {#tbl:crystal_melting_point}

::: {#fig:melting_point_rates class=subfigures}

![P=1.00](../Projects/Crystal_Melting/figures/melting_point_rates_P1.00.svg){width=80% #fig:melting_point_p1}

![P=13.50](../Projects/Crystal_Melting/figures/melting_point_rates_P13.50.svg){width=80% #fig:melting_point_p13}

The melting rates of the p2 crystal close to the melting point
for pressures of 1.00 (a) and 13.50 (b).
A melting rate of \num{3e-7} is less than a single layer of crystal
over the course of the simulation.

:::

### Spinodal temperature {#sec:spinodal}

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
normally the diffusion constant $D$. [@Jackson2002]
@Ediger2008 has noted that the viscosity
is not an appropriate transport coefficient
on account of the dynamic heterogeneities present at low temperatures.
For the Trimer molecule,
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

The simulations in @sec:polymorphic_stability find
the p2 polymorph to be the most stable crystal structure,
so is used for an analysis of the melting rate.
The isotropic melting rate of the p2 crystal is the rate we are measuring,
measured by estimating the radius of the crystal
found from the volume and assuming a circular crystal.
This assumption is validated by @fig:melting_radius
showing the expected linear melting over all temperatures.
With the time dependence of the estimated radius
matching the expected linear dependence,
the crystal growth rate is the slope of a linear fit.
@fig:melting_rates shows the growth rates and their respective errors.
The normalisation of the melting point
brings both pressures onto a single curve,
the same result as seen for the dynamic quantities.

![This figure shows the change in the estimated radius of the crystal as a
function of time. The radius is estimated from the volume assuming a circular crystal.
Each set of conditions is repeated five times starting from independent
configurations, which are used to estimate the confidence intervals. The change in
the radius is expected to change linearly, which is reflected in all the data.
](../Projects/Crystal_Melting/figures/melting_radius.svg){#fig:melting_radius}

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

The Turnbull model of melting defines $p(T) = \sqrt{T}$,
plotted in @fig:melting_turnbull.
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
being where the x axis is zero,
that is $1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)} = 0$.
Further further away from the melting point there is a sharp deviation,
with what looks to be a different temperature dependence of melting rate.
In a study of Janus particles which require rotational reorientation,
@Reinhart2018 also find that the Wilson--Frenkel model of growth
is insufficient for describing their observations.
The strict geometric requirements
for the Janus particles to join the crystal
are hypothesised to form
an activation barrier large enough to dominate the growth rate.

![Determining the relationship between components of
the Wilson--Frenkel model of melting.
The contribution from the chemical potential is on the x axis
while the thermal contribution is on the y axis.
A linear relationship indicates that the Wilson--Frenkel model
adequately describes the melting,
which occurs close to $x=0$.
](../Projects/Crystal_Melting/figures/melting_wilson.svg){#fig:melting_wilson width=80%}

The slope of the lines shown in @fig:melting_wilson
give the proportionality constant for the Wilson--Frenkel model. [@eq:constants_wilson]
This is comprised of the interatomic spacing,
the mean free path and the collision factor.
This collision factor can be compared across different materials
and gives us a place to understand why the growth is so slow.
The slope of the lines where the Wilson--Frenkel model
is a good fit $T/T_m < 1.2$ are $-4.5$ for $P=1.00$ and $-5.6$ for $P=13.50$.
Since we are using the rotational relaxation rather than a diffusion constant,
we make the assumption that
the collision factor and mean free path are close to 1.
@Tang2013 found a collision factor of $5.3$ for NiAl,
close to the value of our Trimer molecule.
Their anomalously slow crystalliser CuZr has a collision factor of $0.4$,
much smaller than the Trimer.
This means it is likely that the slow crystal melting
is a result of the slow dynamics of the Trimer.

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

described in @sec:ml_introduction.
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

The distributions of these values are shown in @fig:trimer_fluctuation
where the distribution of the crystal phase
is far narrower than that of the liquid phase,
with very little overlap.

![Distribution of the orientational order parameter $O_\theta$
for the liquid and the crystal phases at the melting point $T=1.35$.
](../Projects/Crystal_Melting/figures/fluctuation_normalised.svg){#fig:trimer_fluctuation width=80%}

The equation for the growth rate of
the semi-empirical density functional model [@eq:dft_growth_rate]
can be written as

$$ v(T) D(T) \propto f(T) \Delta \mu(T) $$ {#eq:proportionality_dft}

where

$$ f(t) = \frac{(\sqrt{\lambda_\text{liquid}}(T) +
\sqrt{\lambda_\text{crystal}}(T))^2}
{\lambda_\text{crystal}(T)\sqrt{\lambda_\text{liquid}(T)} +
\lambda_\text{liquid}(T)\sqrt{\lambda_\text{crystal}}(T)} $$

that is, the contribution to the growth rate
from the fluctuations.
In representing the model as this proportion
we are able to plot the proportionality
in the same way we have for the classical models.
@Fig:melting_dft shows the proportionality of @eq:proportionality_dft,
with a straight line indicating perfect proportionality.
Using the fluctuations shows a much improved
fit to the model than either of the classical models. [@fig:melting_turnbull;@fig:melting_wilson]
There is a change in the melting behaviour
near the middle of the temperature range
so this is not a perfect model,
however unlike either of the classical models,
the fluctuation model has both pressures on a single line.
This means there is a single set of constants describing the growth,
evidence the model properly describes the melting.
Fitting the fluctuation model to the melting rates
gives the curves in @fig:fluctuation_rate.

![The relationship of the thermally normalised relaxation on the y axis
to the rate description of the semi-empirical density functional model
on the x axis.
A straight line means a perfect description of the melting behaviour.
](../Projects/Crystal_Melting/figures/melting_dft.svg){#fig:melting_dft width=80%}

![Fitting the semi-empirical density functional model
to the melting rate.
Both pressures are fit with the same constant $K=3.7$.
](../Projects/Crystal_Melting/figures/fluctuation_rate_fit.svg){#fig:fluctuation_rate width=80%}
