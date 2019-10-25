# Packing Optimisation

Alternate approach to finding a crystal structure
- Where we are not concerned with the dynamics
  it is possible to take shortcuts to finding the minima

- Large body of research with many different techniques
    - finding the global minima vs maxima is the same problem, with a minus sign
    - This belongs in the space of problems where evaluating every possible value is
      untenable.
    - Need some heuristic measure to find the optimal configuration
        - Thermal annealing

Isopointal Search
- Reduce the dimensionality
- Choose the space group
    - This then dictates other parameters like the cell type and structure
    - The different symmetry groups
    - The different cell types
    - This produces the collection of space groups
- Wyckoff sites
    - General sites
        - any molecule can be placed with no requirements
    - Special sites
        - The space groups require specific symmetry elements
        - These can be satisfied by a single molecule,
          if that molecule contains those elements
        - These come with additional restrictions on the positions
          and on the molecular symmetry
        - These further reduce the dimensionality of the problem

Monte Carlo Optimisation
- Thermal annealing
- Many simulations
- Heavy use of Pseudo Random Number Generators (PRNG)
