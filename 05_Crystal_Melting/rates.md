# Melting Rates {#sec:melting_rates}

The simulations in @sec:polymorphic_stability find
the p2 polymorph to be the most stable crystal structure,
so it is used for this analysis of the melting rate.
We measure the isotropic melting of the p2 crystal
by estimating the radius of the crystal
found from the volume and assuming a circular crystal.
This assumption of a circular crystal is validated by @fig:melting_radius
showing the expected linear melting over all temperatures.
With the time dependence of the estimated radius
matching the expected linear dependence,
the crystal growth rate is the slope of a linear fit.
@Fig:melting_rates shows the growth rates and their respective errors.
The normalisation of the melting point
brings both pressures onto a single curve,
the same result as seen for the dynamic quantities.

:::{#fig:melting_radius class=subfigures}

![P=1.00](../Projects/Crystal_Melting/figures/melting_radius_P1.svg)

![P=13.50](../Projects/Crystal_Melting/figures/melting_radius_P13.svg)

This figure shows the change in the estimated radius of the crystal as a
function of time. The radius is estimated from the volume assuming a circular crystal.
Each set of conditions is repeated five times starting from independent
configurations, which are used to estimate the confidence intervals.
The radius is expected to change linearly,
which is reflected at all temperatures and pressures.

:::

The normalisation by the temperature allows
for the comparison of the rates between different pressures,
with both pressures collapsing on to the same curve. [@fig:melting_rates]
The same collapse of both pressures onto a single curve
when normalised by the melting point
is also seen in the dynamics (@sec:dynamics_results).

![The crystal growth rates normalised by the melting point.
These results are for both high and low pressure melting,
which collapse onto the same curve when normalising the temperature by
the melting point.
](../Projects/Crystal_Melting/figures/melting_rates_err.svg){#fig:melting_rates}

## Classical Theories of Growth

The expression for classical theories of crystal growth (@eq:crystal_growth_general)
can be rewritten as a proportionality, removing all the constant terms

$$ \frac{v(T)}{p(T)} \propto \left[1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)}\right] $$ {#eq:crystal_growth_refactor}

where $p(T) \propto k(T)$ having removed the constants
and only describing the temperature dependence of the transport property.
If these models describe the observed crystal growth behaviour
plotting $v(T)/p(T)$ vs $1-\exp{\left(\frac{-\Delta G_\text{crystal}(T)}{k_\text{B} T}\right)}$
will give a straight line.

The Turnbull model of melting gives $p(T) = \sqrt{T}$,
plotted in @fig:melting_turnbull.
The ratio between the two axes is highly non-linear
indicating it is a poor fit to this data.
While there is a clear non-linearity,
what is also interesting is that the Turnbull model
has a different temperature dependence for each pressure,
primarily resulting from the thermodynamic term.
The large deviation between the two pressures studied
predicted by the Turnbull model,
and not observed in simulation,
describe a melting process
that is not limited by Thermodynamics.
While thermodynamics could play part a small role
in the slow melting rates,
another factor is more significant.
The Turnbull model is not suitable
for describing the melting of the Trimer molecule.

![Determining the relationship between components of the Turnbull model
of melting. The contribution from the chemical potential is on the x axis
while the thermal contribution is on the y axis.
The lack of a linear relationship indicates
the Turnbull model is not suitable for describing the melting.
](../Projects/Crystal_Melting/figures/melting_turnbull.svg){#fig:melting_turnbull width=80%}

The Wilson--Frenkel model defines the temperature dependent function $p(T) = D(T)$,
where we have chosen $1/\tau_r$ for the transport coefficient $D(T)$
(@sec:crystal_transport).
The ratio (@eq:classical_growth_factor) for the Wilson--Frenkel model is shown in @fig:melting_wilson,
which describes an improved relationship over the Turnbull mode.
Close to the melting point,
which is the value of 0 on the x axis of @fig:melting_wilson,
there is a linear region for both pressures.
In both cases the linear region deviates sharply,
having a different temperature dependence.
In a study of Janus particles which require rotational reorientation,
@Reinhart2018 also find that the Wilson--Frenkel model of growth
is insufficient for describing their observations.
It is hypothesised that the strict geometric requirements
for the Janus particles to join the crystal
create an activation barrier large enough to dominate the growth rate.
This idea of an activation barrier preventing growth
is supported by our data, where,
at low temperatures,
there is significantly slower melting.

![Determining the relationship between components of
the Wilson--Frenkel model of melting.
The contribution from the chemical potential is on the x axis
while the thermal contribution is on the y axis.
A linear relationship indicates that the Wilson--Frenkel model
adequately describes the melting,
which occurs close to $x=0$.
](../Projects/Crystal_Melting/figures/melting_wilson.svg){#fig:melting_wilson width=80%}

In evaluating whether the melting of the crystal is slow,
the slope of the lines in @fig:melting_wilson
give the proportionality constant for the Wilson--Frenkel model. [@eq:constants_wilson]
This is comprised of the interatomic spacing,
the mean free path and the collision factor.
This collision factor can be compared across different materials
and can help to understand why the growth is so slow.
The slope of the lines where the Wilson--Frenkel model
is a good fit, that is $T/T_m < 1.2$,
are $-4.5$ for $P=1.00$ and $-5.6$ for $P=13.50$.
Since we are using the rotational relaxation rather than a diffusion constant,
we can make the assumption that
the interatomic spacing and mean free path are close to 1.
@Tang2013 find a collision factor of $5.3$ for NiAl,
close to the value of our Trimer molecule.
Their anomalously slow crystalliser CuZr has a collision factor of $0.4$,
much smaller than the Trimer.
This tells us that the melting is occurring over a similar number of collisions
only the collisions take place far slower than other materials
as a result of the slow dynamics.

The classical melting theory is unable to
adequately describe the melting behaviour
of the Trimer molecule.
In particular,
the classical theory predicts different melting rates
based on the difference in chemical potential
between the liquid and the solid.
We don't observe this significant difference in the melting rates
within simulations,
with both pressures having the same melting rate.
We can look at alternate models to describe
the melting behaviour.

## Semi-empirical Density Functional

The choice of order parameter to describe the crystal growth
is the orientational order parameter $O_\theta$

$$ O_\theta = \frac{1}{N} \left\langle \sum_{i=1}^N \cos^2(\theta_i - \theta_0) \right\rangle $$

which describes the local order around reference particle
with orientation $\theta_0$.
This order parameter is described in @sec:ml_introduction
where the description of the local environment with a single value
was unsuitable for that task.
For the semi-empirical density functional model
we want to describe the local environment using a single value,
which makes this an excellent choice.
Additionally we are only comparing the p2 polymorph
with the liquid configurations.
To ensure the orientational order parameter
has the distribution of values expected for $M$,
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
from the fluctuation of each phase.
In representing the model as this proportion
we are able to plot the proportionality
in the same way we have for the classical models.
@Fig:melting_dft shows the proportionality of @eq:proportionality_dft,
with a straight line indicating perfect proportionality.
Using the fluctuations shows a much improved
fit to the model than either of the classical models (@fig:melting_turnbull and
@fig:melting_wilson).
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
