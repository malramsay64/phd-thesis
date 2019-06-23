# Results

## Stability of Crystal Phases

The crystal structures for the trimer molecule
have been found using an isopointal search algorithm[@Jennings2015]
which finds the best packing of the shape.
It has been assumed that the structures resulting from
the optimal packing of hard shapes
will be closely related to the lowest energy structures
of the molecules with the Lennard Jones potential.

The best packed structures have the following potential energies

Crystal Packing Fraction Potential Energy per Molecule
------- ---------------- -------------
p2
p2gg
pg

Table: The potential energy for each molecule for the crystal structures with the best
packing fractions. The potential energy was evaluated at a temperature of 0.1 and
a pressure of 1.00. {#tbl:potential_energy}


While the potential energy gives the ground state crystal structure
molecules will often have a range of crystal structures
which are stable in different temperature regimes.
This means evaluating the stability of each of the crystal phases
at the conditions we are interested in.

Additionally another method of finding the most stable crystal
is the crystal which has the highest melting point.
So this is a method of narrowing down the melting point of the crystal.

- Figure: tracking the proportion of each crystal phase in a simulation.

Most notable is the behaviour of the p2gg crystal
which undergoes a solid state phase transition
at a rate which significantly exceeds the melting rate.

The p2 crystal appears to be the lowest energy crystal structure.

## Melting Rates

The above simulations show that the p2 crystal
is the most stable,
so this is the crystal used
for further analysis of the melting rate.
The isotropic melting rate of the p2 crystal
is the chosen metric,
measured using an estimated radius,
found from the volume
by assuming a circular crystal.
@fig:melting_radius shows the time dependence
which is linear,
fitting the expected behaviour,
over all temperatures.

![This figure shows the change in the estimated radius of the crystal as a
function of time. The radius is estimated from the volume assuming a circular crystal.
Each set of conditions is repeated five times starting from independent
configurations, which are used to estimate the confidence intervals. The change in
the radius is expected to change linearly, which is reflected in all the data.
](../Projects/Crystal_Melting/figures/melting_radius.pdf){#fig:melting_radius}

With the time dependence of the estimated radius
matching the expected linear dependence,
the crystal growth rate is the slope of a linear fit.
@fig:growth_rates shows the growth rates and their respective errors.
The normalisation of the melting point
brings both pressures onto a single curve,
which is the same result seen for the dynamic quantities.

This is the observation for temperatures
still well above the melting point.
I will include more temperatures
as the results from the
longer crystal melting simulations are finished.

![The crystal growth rates normalised by the melting point. For clarity a light grey
line has been marked at a growth rate of 0. These results are for both high and low
pressure melting, which when normalised by the melting point collapse onto the same
curve.](../Projects/Crystal_Melting/figures/growth_rates_err.pdf){#fig:growth_rates}


- Figure: Rotational relaxation times
    - Note pressures collapse onto a single curve
    - These results have been interrupted by the Artemis maintenance window

The normalisation by the temperature allows
for the comparison between different pressures,
while a normalisation by the dynamics
shows how the process of crystal growth changes
as a function of temperature (@fig:normalised_melting).
This is now the distance the interface travels
in the relaxation time.
As the temperature decreases the distance
tends to get smaller,
which is the expected behaviour.

![This normalises both the temeprature by the melting point, and the growth rate by the
rotational relaxation. The large confidence intervals, reflect the large errors In this
figure we can see that the growth rate is increases faster than would just be explained
by the
dynamics.](../Projects/Crystal_Melting/figures/normalised_melting_err.pdf){#fig:normalised_melting}

Theory which describes the temperature dependence of the melting rate,
formulated from a characteristic dynamic timescale of the system
and the chemical potential energy difference between the phases.
The chemical energy difference is often replaced with
the potential energy difference at the melting point.


Pressure  Crystal Potential Energy Liquid Potential Energy Difference
--------  ------------------------ ----------------------- ----------
1.00
13.50

Table: The potential energy of the liquid and the crystal at the melting point for both
pressures.{#tbl:potential_energy_difference}

Using the results in @tbl:potential_energy_difference
to fit the points in @fig:normalised_melting_err
gives a result which is not a good fit for the resulting data,
having a concavity which doesn't match that of the results.
Fitting the values to both parameters,
provides a much improved fit with a potential energy difference
of about 100 times the calculated value.
