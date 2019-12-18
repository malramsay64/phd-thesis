# Calculating Distance in Molecular Dynamics

The periodic boundary conditions of molecular dynamics simulations
make the calculation of distances somewhat more challenging.
When given an initial position $\vect{r_0}$ and a final position $\vect{r_t}$
with the periodic boundary conditions there are two possible directions
the particle could have moved in each direction. [@fig:periodic_distance]
The same is also true for rotational motion.
The standard method of handling this is the minimum image convention,
where the distance is calculated for the shortest of the two paths.

![Demonstrating periodic boundary conditions
](../placeholder_figure.png){width=80% #fig:periodic_distance}

The problem with the minimum image convention
is it breaks down for large motions,
especially for rotations.

## Integrated Distances

An alternate approach is to keep track of
the distance moved during a simulation.
This means that calculating the rotational motion $\Delta \varphi(t)$
is expressed as the integration of the angular velocity [@Kammerer1997;@Lombardo2006]

$$ \Delta \vect{\varphi}(t) = \vect{\varphi}(t) - \vect{\varphi}(0) =
\int_0^t \dt' \vect{\omega}(t') $$

In practice, this involves summing the rotation at every preceding configuration.

$$ \Delta \vect{\varphi}(t) = \sum_0^t \vect{\varphi}(t) - \vect{\varphi}(t-\Delta t) $$

This is allows for keeping track of rotational motions over large timescales
and allowing many rotations.
It should be noted that this approach still uses the minimum image convention,
however the timescales and distances of comparison are typically smaller
avoiding ambiguity.
The same approach can also be used to study translational motions.

## Periodic distances for Translations

The calculation periodic distances of a single dimension
can be performed using a comparison.
Given the length of a periodic box `len_x`,
and the translational motion `delta_x`
the periodic_distance can be calculated using conditionals

```python
if delta_x > len_x / 2:
    delta_x -= len_x
elif delta_x < -len_x / 2:
    delta_x += len_x
```

This approach only works for wrapping a coordinate
which is in the next periodic cell,
that is, `3 * len_x` will only get wrapped to `2 * len_x`.
Additionally when using multiple dimensions
where the simulation cell is no longer orthogonal,
the checks required are complicated and error-prone.

The approach used by many molecular dynamics simulation tools
[@Giorgino2019;@Gowers2016;@Harper2016;@lumol-org/lumol;@Linke2019]
is to convert the distance to fractional coordinates,
calculate the periodicity in the fractional coordinates
followed by the conversion back to real coordinates.
Using a matrix representation for the cell $C$ and coordinates $\vect{x}$

$$ C(C^{-1} \vect{x} - \floor{C^{-1} \vect{x}}) $$

## Rotational Distance using Quaternions

Measuring rotational motion in three dimensional space
is something performed in many applications including

- robotics,
- computer graphics,
- aviation, and
- molecular dynamics.
However in all cases,
there is a need to represent an orientation in 3D space.
There are many different methods which achieve this,
each with different strengths and weaknesses.

### Rotational Representations

Mathematically, rotations in 3D belong to the special orthogonal group
A rotation is a mapping from a position in real space $\mathbf{R}^n$
to another position in real space,
presenting the angles between and distances of transformed vectors.
This space of transformations is known as the Special Orthogonal group $SO(3)$.

#### Euler Angles

Euler Angles use three different rotations
to describe the orientation of a body in 3D space,
relative to a fixed coordinate system.
A common terminology for these angles is roll, pitch, and yaw,
however, there are twelve different sequences
in which the Euler Angles can be defined,
so their use requires clarification
of the ordering.

While Euler Angles are the simplest rotational coordinate system,
they also suffer from a significant issue in Gimbal Lock,
where two of the rotational axes align,
restricting motion of the gimbal to two dimensions;
the angles are no longer independent degrees of freedom. [@Evans1977]
While this restriction is only present for a single value,
it presents problems with precision close to the gimbal lock,
where large changes in the Euler Angle are required
to describe small absolute changes.

In certain applications,
the "problem" of gimbal lock
turns out to be a benefit.
In robotics applications,
where the movement of a robotic joint is restricted,
the Gimbal lock can be avoided by
aligning the reference frame appropriately.
For most other fields however,
the Euler Angles are not an appropriate
representation of orientation.

#### Rotation Matrix

This is an alternative to Euler Angles,
which uses a $3 \times 3$ matrix $R$ to represent rotation.
For a matrix to properly represent a rotation
it has to preserve both
the length
and the orientation of a transformed vector.
For a matrix to preserve length,
the columns of the matrix have to form an orthonormal basis,
which can be expressed as satisfying the condition

$$ R\,R^T = R^TR = I $$

where $R^T$ is the transpose of $R$ and $I$ is the identity matrix.
For an orthonormal matrix to preserver orientation
it is required to have a determinant $\text{det}\,R = 1$.

While the rotation matrix doesn't suffer
the Gimbal Lock issue of the Euler Angles,
it has complications of it's own in practical applications.
Euler angles require 3 floating point numbers,
while a rotation matrix requires 9,
which can become an issue in storage
capacity and bandwidth when using many values.
Another problem is that errors with the finite precision
of floating point values can add up,
moving the rotation matrix away from orthonormal,
which requires a computationally costly
re-orthonormalisation step to correct.

#### Quaternions

In the same way rotations in 2D can be represented
using complex numbers,
rotations in 3D can be represented using quaternions $q$,
which have the representation

$$ q = a + bi + cj + dk $$

where $i$, $j$, and $k$ are complex numbers about
the $x$, $y$, and $z$ axes respectively.
The dimensionality of quaternions is
larger than the space of rotations,
however like with complex numbers,
by restricting rotations to the unit circle,
in this case the unit sphere,
a normalised quaternion can represent all rotations.

Because quaternions have no issues with gimbal lock,
and there are no issues with matrix normalisation,
they are a natural choice for describing orientations
in molecular dynamics simulations. [@Evans1977;@Evans1977a]

### Mathematical Operations of Quaternions

As part of dealing with quaternions
understanding their mathematical operations is important.
Firstly the multiplication of the quaternions has the following rule

$$ i^2 = j^2 = k^2 = ijk = -1 $$

Which corresponds to the following table of multiplications

$\times$ | **$i$** | **$j$** | **$k$**
:-------:|:-------:|:-------:|:--:
 **$i$** | $-1$    | $k$     | $j$
 **$j$** | $-k$    | $-1$    | $i$
 **$k$** |$j$      |$-i$     | $-1$

Table: The results of multiplying the value in the left hand column,
with the label at the top of each row.

When working with quaternions,
the imaginary components are often referenced by a vector $\vect{v}$
such that

\begin{align}
q &= r + bi + cj + dk \\
  &= r + \vect{v}
\end{align}

With this representation,
the addition of quaternions
$q_1 = (r_1, \vect{v_1})$ and
$q_2 = (r_2, \vect{v_2})$
is expressed as

$$ (r_1, \vect{v_1}) + (r_2, \vect{v_2})  = (r_1 + r_2, \vect{v_1} + \vect{v_2}) $$

while the multiplication can be expressed as

$$ (r_1, \vect{v_1})(r_2, \vect{v_2}) =
(r_1r_2 - \vect{v1}\cdot\vect{v_2}, r_1\vect{v2}+r_2\vect{v_1} + \vect{v_1} \times \vect{v_2}) $$

where $\cdot$ is the dot product and the $\times$ is the cross product.
Quaternion multiplication is non-commutative,
which comes from the non-commutativity of the cross product.

The multiplication of one quaternion by another $q_1 \times q_2$
gives a resulting quaternion equivalent to
the rotation $q_2$ followed by $q_1$.

Like complex numbers,
quaternions also have a complex conjugate $q^*$
which can be expressed as

$$q^* = (r - \vect{v}) $$

The conjugate allows us to define the norm of a quaternion

$$ ||q|| = \sqrt{qq^*} $$

which is $1$ for quaternions used to define rotations.

The quaternion logarithm is defined as

$$ \ln(q) = \ln \|q\| + \frac{\mathbf{v}}{\|\mathbf{v}\|} \arccos \frac{a}{\|q\|} $$

while the exponent is defined as

$$ \exp(q) = \sum_{n=0}^\infty \frac{q^n}{n!}=e^{a}
    \left(\cos \|\mathbf{v}\| + \frac{\mathbf{v}}{\|\mathbf{v}\|} \sin \|\mathbf{v}\|\right) $$

### Angular Distance From Quaternions

When using quaternions for representing rotations
there are a range of different methods for finding
the distance between them. [@Huynh2009]
Each of these methods can give a different value.
The two constraints for choosing an appropriate distance measure
is that it maps well to rotational distance calculated by other means
like using Euler angles,
and that the calculation is fast to compute.
The method chosen to calculate angular distance is $\phi_3$
computing the relationship

$$ \phi_3 = \arccos(|q_1 q_2|) $$

giving values on the range $[0, \pi/2)$.
Using the minimum image convention,
the maximum rotational distance is $\pi$,
when a quaternion is antiparallel to another.
This means finding the angle $\theta$
subtended by two quaternions is

$$ \theta = 2\arccos(|q_1 q_2|) $$

Quaternion operations are not a standard component
of either python or numpy. [@Walt2011]
There are some established python implementations of quaternion operations,
namely pyquaternion [@Wynn2019] and quaternion [@Boyle2019],
however these are not optimised for calculating rotations
on arrays of quaternions.
More recently the rowan [@Ramasubramani2018] software package was published,
which is designed for analysing molecular dynamics simulations
and the array type operations required.
The function `rowan.geometry.intrisic_distance` implements the calculation of $\phi_3$
with the angular rotation being calculated as twice this value.
