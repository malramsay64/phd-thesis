# Quaternion Rotations

Measuring rotatiaonal motion in three dimensional space
is something performed in many applications including

- robotics,
- computer graphics,
- aviation, and
- molecular dynamics.
However in all cases,
there is a need to represent an orientation in 3D space.
There are many different methods which achieve this,
each with different strengths and weaknesses.

## Rotational Representations

Mathematically, rotations in 3D belong to the special orthogonal group
A rotation is a mapping from a position in real space $\mathbf{R}^n$
to another position in real space,
presenting the angles between and distances of transformed vectors.
This space of transformations is known as the Special Orthogonal group $SO(3)$.

### Euler Angles

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

### Rotation Matrix

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

## Quaternions

Just like how rotations in 2D can be represented
using complex numbers,
in 3D the equivalent is the Quaternion $q$,
which has the representation

$$ q = a + bi + cj + dk $$

where $i$, $j$, and $k$ are complex numbers about
the $x$, $y$, and $z$ axes respectively.
The dimensionality of quaternions is
larger than the space of rotations,
however just like complex numbers,
by restricting rotations to the unit circle,
or in this case the unit sphere,
a normalised quaternion can represent all rotations.

Because quaternions have no issues with gimbal lock,
and there are no issues with matrix normalisation,
they are a natural choice for describing orientations
in molecular dynamics simulations. [@Evans1977;@Evans1977a]

## Mathematical Operations of Quaternions

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

For simplWhen working with quaternions,
for ease of use the imaginary part is typically referenced by a vector $\vect{v}$
such that

\begin{align}
q &= a+ bi + cj + dk
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

## Angular Distance From Quaternions

When using quaternions for representing rotations
there are a many different methods of representing
the distance between them. [@Huynh2009]

<!-- TODO Discussion on quaternions ref #72 -->

- There are many different methods for finding the distance between two quaternions
  [@Huynh2009]
    - Discussion on methods
    - The specific method we want and why
    - The range of values this method provides

- Since this is a fundamental operation of computational analysis,
    it needs to be fast.
    - Quaternion operations are not natively built into python or numpy [@Walt2011]
    - There are python implementations pyquaternion [@Wynn2019], quaternion [@Boyle2019]
        These however are not optimised for arrays of data

    - rowan [@Ramasubramani2018] Is a package designed for computing quaternions for
      molecular dynamics simulations
        - Using the `rowan.geometry.intrisic_distance` function, which implements the
          optimised distance in [@Huynh2009], we get optimised distance calculations
uses 4 multipliations, 1 arccos, 1 comparison

The approach used for the quaternion $\phi_3$
computes the relationship

$$ \arccos(|q_1 q_2|) $$

which gives values on the range $[0, \pi/2)$.
Since the maximum rotational distance is $\pi$
the angle $\theta$ subtended by two quaternions is

$$ \theta = 2\arccos(|q_1 q_2|) $$

## Quaternions in 2D

- Still works even when constrained to rotations in a plane
- Range of motion
- Why not convert to angles
    - Fewer operations
    - same code works to 2 and 3 dimensions
