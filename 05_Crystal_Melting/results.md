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

- Figure: Change in volume over time for range of temperatures
    - Track the melting of the crystal structure

- Figure: Melting rates including errors
    - Normalise temperature by the melting temperature

- Figure: Rotational relaxation times
    - Note pressures collapse onto a single curve

- Figure: Melting rates normalised by the rotational relaxation time
    - This includes the data for both pressures
    - Do the melting rates track the same for both pressures
    - More than just bulk dynamics
