# Molecular Definition

The Trimer molecule is comprised of;
a central particle which has a defined radius of $1.0$, and
two identical radial particles.
The radius of the radial particles is defined by the variable $r$,
while the positions are defined by
the distance $d$ from the center of the central particle,
and the angle $\theta$ between the centers of the two radial particles.

![This shows the construction of the trimer molecule.][trimer.pdf]

This gives the positions of the particles $\mathbf{P}`$ as;

$$
\mathbf{P}` = \left [
\begin{matrix}
    0 & 0 & 0 \\
    d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} 0 \\
    -d\sin{\frac{\theta}{2}} & d\cos{\frac{\theta}{2}} 0 \\
\end {matrix}
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
with the adjusted position denoted $P$.

$$
COM = \left [ \sum_i P`_{i0}, \sum_i P`_{i1}, \sum_i P`_{i2} \right ]
P = [P`_{ij} - COM_j]_{ij}
$$

Using the position $P$ of molecules from the center of mass,
I am calculating the moment-of-inertia $I$.

$$
Q = \left [
\begin{matrix}
    0 & 1 & 1 \\
    1 & 0 & 1 \\
    1 & 1 & 0
\end{matrix} \right ] \times P
$$

$$
I = \left [ \sum_i Q_{i0}, \sum_i Q_{i1}, \sum_i Q_{i2} \right ]
$$

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
