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

- The p2 crystal is demonstrated to be the most stable in the above simulations

![This figure shows the change in volume of an inital crystal surrounded by liquid as a
function of time. Each set of conditions was repeated five times from independent
configurations, with the results from each configuration shown as a dot.The change in
volume proceeds fairly linearly over the changes in volume presented
here.](../Projects/Crystal_Melting/figures/melting_radius.pdf){#fig:melting_radius}

![The crystal growth rates normalised by the melting point. For clarity a light grey
line has been marked at a melting rate of 0. These results are for both high and low
pressure melting, which when normalised by the melting point collapse onto the same
curve. Multiple independent result for every set of conditions are marked
individually.](../Projects/Crystal_Melting/figures/growth_rates_err.pdf){#fig:growth_rates}

- Figure: Rotational relaxation times
    - Note pressures collapse onto a single curve

![This normalises both the temeprature by the melting point, and the growth rate by the
rotational relaxation. In this figure we can see that the growth rate is increases
faster than would just be explained by the dynamics. The shape of the curve seems to
indicate a slowing down of this effect, which is opposite of what is expected. This
effect is currently
unexplained.](../Projects/Crystal_Melting/figures/normalised_melting_err.pdf){#fig:growth_rates}
