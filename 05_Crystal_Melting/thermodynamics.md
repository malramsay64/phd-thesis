# Thermodynamic quantities for Melting and Growth {#sec:melting_thermodynamics}

In this section we find the quantities
needed to model crystal growth
using the models described in @sec:crystal_growth_theories.
These quantities are
the melting point $T_m$ (@sec:melting_point),
the spinodal temperature (@sec:spinodal),
the chemical potential $\Delta \mu$ (@sec:chemical_potential), and
the transport coefficient (@sec:crystal_transport).

The simulations used to calculate these values
are documented in @sec:methods_melting,
with each simulation containing 4032 molecules,
half of which are in the p2 crystalline configuration
which is completely surrounded by the liquid.
The methods used to measure the melting of the initial crystalline region
are documented in @sec:measuring_melting,
which uses the supervised learning algorithm developed in @sec:supervised_learning
for identifying molecules that are locally crystalline.

## Melting Point {#sec:melting_point}

The melting point $T_m$ is the temperature
at which the rates of attachment and detachment
at the crystal surface are the same,
that is, there is no net growth or melting.
A standard method of determining the melting point in molecular dynamics simulations
is to find the temperature at which
the growth rate crosses from negative (melting) to positive (growth). [@GarciaFernandez2006]
Throughout the study of the Trimer molecule no crystallisation has been observed,
despite running simulations for as many timesteps as HOOMD-blue allows.
A technical decision in the development of HOOMD-blue
deemed a 32 bit unsigned integer enough to keep track of the current timestep,
meaning HOOMD-blue can only count up to $2^{32}-1$, slightly more than 4 billion. [@hoomd_counter]
With the chosen timestep in our simulations of 0.005,
the longest possible timescale for a simulation is $2e7$.
This limitation of HOOMD-blue is not an issue for
similar studies of crystal growth [@Reinhart2018;@Benjamin2015;@Tang2013;@Yagasaki2016]
which use timescales 2-4 orders of magnitude less than used here.
It is possible the maximum timescale could be extended by increasing
the size of the timestep [@Stocker2003;@Fass2018]
however, it is unlikely to increase the timescale
by the order of magnitude required to observe crystal growth.

With the absence of observed growth
we need an alternate description of the melting point.
We define the melting point as
the temperature at which melting is no longer observed,
with the limit of being the melting of a single layer of crystal.
This means the melting point becomes an estimate
since we are unable to distinguish between
the melting rate reaching zero because of thermodynamics
or the timescale being too short to observe.
The melting rate which corresponds to the melting
of a single layer of crystal over
the course of the entire simulation is \num{3e-7}.
This estimate is a upper bound of the melting point
and are tabulated in @tbl:crystal_melting_point
with the values extracted from @fig:melting_point_rates.
While the melting point is only an estimate,
as an upper bound, any lowering of the melting point
emphasises the results found within this thesis.

Pressure  Melting Point $T_m$
-------- ---------------------
1.00            0.36
13.50           1.35

Table: The melting points of the crystals
for both pressures studied in this thesis.
The values are obtained from @fig:melting_point_rates
where the melting rate is less than \num{3e-7}.{#tbl:crystal_melting_point}

::: {#fig:melting_point_rates class=subfigures}

![P=1.00](../Projects/Crystal_Melting/figures/melting_point_rates_P1.00.svg){width=80% #fig:melting_point_p1}

![P=13.50](../Projects/Crystal_Melting/figures/melting_point_rates_P13.50.svg){width=80% #fig:melting_point_p13}

The melting rates of the p2 crystal close to the melting point
for pressures of 1.00 (a) and 13.50 (b).
A melting rate of \num{3e-7} is less than a single layer of crystal
over the course of the simulation.
The estimate of the error taken from the standard deviation
of 5 simulation repetitions is used to draw the error bars.

:::

## Spinodal temperature {#sec:spinodal}

At some temperature above the melting point,
the crystal is no longer metastable,
spontaneously melting to form the liquid.
The temperature at which this spontaneous melting occurs
is known as the spinodal point $T_s$.
All the theories described in @sec:crystal_growth_theories
make the assumption that the melting and growth
is occurring at a well defined liquid--crystal interface.
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

::: {#fig:spinodal class=subfigures}

![T=0.50](../Projects/Crystal_Melting/figures/melting_disorder_P1.00-T0.50.svg){#fig:melting_disorderB width=45%}
![T=0.55 ($T_s$)](../Projects/Crystal_Melting/figures/melting_disorder_P1.00-T0.55.svg){#fig:melting_disorderA width=45%}

Melting behaviour below (a) and at (b) the spinodal.
These are configurations from a melting simulation
at a pressure of 1.0,
with (a) at a temperature of 0.50,
and (b) at a temperature of 0.55.
The defects in the center of the crystal
are spontaneously appear,
indicating spontaneous melting.

:::

Pressure  Spinodal Temperature
-------- ---------------------
1.00            0.55
13.50           2.00

Table: The temperatures at which the spinodal occurs for the crystal structure at both
pressures. These are obtained from visual inspections of the melting simulations.{#tbl:crystal_spinodal}

## Chemical Potential Energy {#sec:chemical_potential}

The change in the chemical potential $\Delta \mu$
between the liquid and crystal states
is an important part of describing crystal melting dynamics.
Finding the chemical potential at each temperature is a complex process,
so a standard approach [@Tang2013] is
to estimate the change in chemical potential $\Delta \mu$ as

$$ \Delta \mu = \frac{\Delta h_m(T_m - T)}{T_m} $$

where $\Delta h_m$ is the enthalpy of fusion per particle at the melting point,
a quantity that can be calculated once and applied to all temperatures.
The values for the enthalpy of melting $\Delta h_m$
are shown in @tbl:potential_energy_difference.
The higher pressure $P=13.50$ creates a slightly larger
enthalpy at the melting point than at the lower pressure $P=1.00$.

Pressure:                    1.00   13.50
----------                 ------  ------
Crystal Potential Energy   -1.873  -0.737
Liquid Potential Energy    -1.675  -0.535
Difference $\Delta h_m$    -0.198  -0.202

Table: The potential energy of the liquid and the crystal at the melting point for both
pressures. {#tbl:potential_energy_difference}

## Choosing a Transport Coefficient {#sec:crystal_transport}

Both the Wilson--Frenkel and the Semi-empirical density functional theories of growth
include a term for a transport coefficient,
normally the translational diffusion constant $D_t$. [@Jackson2002]
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
Because of the breakdown in the Stokes--Einstein--Debye relations (@sec:trans_rot_coupling)
and noting that the transition between the liquid and crystal
mostly takes place through orientational motions,
the inverse rotational relaxation time $1/\tau_r$ (@sec:rotational_diffusion)
has been chosen as the transport coefficient.
The rotational relaxation time $\tau_r$ is the time
for half of the molecules to have reoriented by \SI{90}{\degree}
a rotation important for orientational alignment with the crystal.
