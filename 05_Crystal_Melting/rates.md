# Melting Rates

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

## Classical Theories of Growth

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

## Semi-empirical Density Functional

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
