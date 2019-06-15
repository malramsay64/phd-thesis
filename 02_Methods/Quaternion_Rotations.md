# Quaternion Rotations

## Rotations in 3D

- There are many methods for representing rotations in 3D space.
    - Euler angles
        - Common in robotics applications
            - Typically a restriction of the robot
            - Rotations have to take place in a certain order
        - Value of the rotation is dependent on the order of the rotations

    - $3 \times 3$ rotation matrix
        - requires 9 floating point numbers
        - after many multiplications round off errors accumulate
        - difficult to re-orthogonalise

## Quaternions

- Quaternions are a method of representing rotations in 3D space.
    - Are very similar to complex numbers representing rotations in 2D
    - Mapping of S(3) to S(3)
    - They use 4 values to do this
    - represented as $q = a + bi +cj + dk$ where $i$, $j$, and $k$ are complex numbers
      about the x, y, and z axes respectively.
    - Quaternions can also represent orientation as a rotation from the 'origin'
    - While they have 4 degrees of freedom, quaternions representing rotations
        have a magnitude of $1$ restricting them to all points on the unit sphere.

- Alternative representations
    - Euler Angles
        - $\theta, \phi, \varphi$
    - Rotation Matrix
        - $3 \times 3$ matrix

- Quaternions, and their associated mathematical operations have found use in
  representing rotations and orientation in a number of fields
    - Aeronautics
    - Structure from Motion
    - Robotics
    - motion capture
    - many others ...

- This is because of their numerical stability
    - re-normalisation is simple
        - comparison to a matrix
    - No singularities at $\theta = 0$
        - Unlike Euler angles
        - Also known as gimbal lock
        - Other angles are no longer independent degrees of freedom [@Evans1977]


- Quaternions are the natural representation of orientation for the molecular dynamics
  simulation of rigid bodies.
    - The use of Euler angles results in a singularity at $\theta = 0$
        - This requires special handling
        - Quaternions don't have this issue
    - The Singularity is especially an issue for integration of Newtownian, Brownian, or
      Langevin motions
        - No inverse of singular matrix [@Evans1977]

- [@Evans1977]
    - This anomalous results is explained by the fact that at $\theta = 0$ the angles
      $\phi  and \varphi$ are not independent and are therefore not suiteable as
      generalised coordinates.
    - This equation is also a problem, for at $\theta = 0$ the matrix $\Xi$ is
      singular
      and its inverse does not exist.

## Mathematical Operations of Quaternions

- For ease of working with quaternions, they are typically represented as:
    - $$ q= a+ bi + cj + dk = a + \mathbf{v} $$

- Quaternion multiplication
    - What does a multiplication mean?
        - Rotating a quaternion by another
        - Non-commutative
        - Order of rotations matters (problem with euler angles)

- Quaternion division
    - Quaternion inverse

- Quaternion Logarithm
    - $$ \ln(q) = \ln \|q\| + \frac{\mathbf{v}}{\|\mathbf{v}\|} \arccos \frac{a}{\|q\|} $$

- Quaternion Exponent
    - $$ \exp(q) = \sum_{n=0}^\infty \frac{q^n}{n!}=e^{a} \left(\cos \|\mathbf{v}\| + \frac{\mathbf{v}}{\|\mathbf{v}\|} \sin \|\mathbf{v}\|\right) $$

## Angular Distance From Quaternions

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

        - Use the approach  $\Phi_6 = ∥ log(R1R2 )∥$
        -  $\Phi_3 = \arccos(|q1 · q2|)$

## Quaternions in 2D

- Still works even when constrained to rotations in a plane
- Range of motion
- Why not convert to angles
    - Fewer operations
    - same code works to 2 and 3 dimensions
