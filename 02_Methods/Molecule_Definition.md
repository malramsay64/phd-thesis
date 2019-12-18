# Molecular Definition

The Trimer molecule is comprised of;
a central particle which has a defined radius of $1.0$, and
two identical radial particles.
The radius of the radial particles is defined by the variable $r$,
while the positions are defined by
the distance $d$ from the center of the central particle,
and the angle $\theta$ between the centers of the two radial particles.

![This shows the construction of the trimer molecule.](02_Methods/figures/trimer.pdf)

This gives the positions of the particles $\mathbf{P}`$ as;

$$
\mathbf{P}` = \left [
\begin{matrix}
    0 & 0 & 0 \\
    d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} & 0 \\
    -d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} & 0
\end{matrix}
\right ]
$$

The variables $r$, $d$, and $\theta$ were chosen
for being the simplest basis set for defining these types of molecules.
The algebraic definition of the molecule allows for
modelling a range of shapes.

## Representation in Hoomd

The integration of rigid bodies in Hoomd is performed by
calculating the force on all the particles and then
using the calculated forces to integrate a central particle of a molecule
which undergoes both the translations and rotations.

Since the center of mass is not at one of the existing particle positions
I have added an additional non-interacting particle labelled 'R'.
This 'R' particle is at the center-of-mass,
with a mass of 3 and a moment-of-inertia $I$,
which are the properties of the entire molecule.

With the addition of the center-of-mass particle,
the positions of the particles have to be adjusted,
with the adjusted position denoted $\mathbf{P}$.

\begin{align}
\mathbf{C} &= \left [ \sum_i \mathbf{P}`_{i0}, \sum_i \mathbf{P}`_{i1}, \sum_i \mathbf{P}`_{i2} \right ] \\
\mathbf{P} &= {[\mathbf{P}`_{ij} - \mathbf{C}_j]}_{ij}
\end{align}

Using the position $\mathbf{P}$ of molecules from the center of mass,
I am calculating the moment-of-inertia $I$.

$$ \mathbf{Q} = \left [
\begin{matrix}
    0 & 1 & 1 \\
    1 & 0 & 1 \\
    1 & 1 & 0
\end{matrix} \right ] \times \mathbf{P} $$

$$ I = \left [
\sum_i \mathbf{Q}_{i0}, \sum_i \mathbf{Q}_{i1}, \sum_i \mathbf{Q}_{i2}
\right ] $$

Since the trimer molecules are two dimensional,
the $x$ and $y$ components of the moment-of-inertia
$I_0$, and $I_1$ are set to $0$.

With the center-of-mass particle defined,
the interacting particles are defined with the positions $P$.
The central particles is labelled 'A',
with the interaction parameter $\sigma_{AA} = 2$.
The two radial particles are labelled 'B'
with interaction parameter $\sigma_{BB} = 2r$.
The mixed interaction potential $\sigma_{AB} = 1+r$.

## Reduced Units

The units used throughout this thesis are based on
the fundamental units of

- distance $\mathcal{D}$,
- energy $\mathcal{E}$, and
- mass $\mathcal{M}$

with all other units derived from these.
For the Lennard Jones system these values are all dimensionless.

The units of temperature are $kT$,
where $k$ is the Boltzmann constant,
having a value of 1 in LJ units.

From the fundamental units derived units can be calculated [@hoomd_units]

- time: $\tau = \sqrt{\frac{\mathcal{M}\mathcal{D}^2}{\mathcal{E}}}$
- volume: $\mathcal{D}^3$
- velocity: $\mathcal{D}/\tau$

By setting values for the fundamental units,
appropriate for a molecular system,
the derived units can also be calculated.
For simulating *ortho*-terphenyl, [@Pedersen2011]

- $\mathcal{D} = \SI{0.242}{\nano\metre}$
- $\mathcal{E} = k_B\times\SI{600}{\kelvin} \approx \SI{4.988}{\kilo\joule\per\mole}$
- $\mathcal{M} = \SI{76.760}{\atomicmassunit}$

which derives a time $\tau = \SI{0.95}{\nano\second}
