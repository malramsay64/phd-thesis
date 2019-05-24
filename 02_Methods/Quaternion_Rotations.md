# Quaternion Rotations

## Quaternions

The issue of representing rotation
in three dimensions is not entirely simple.
A natural approach,
representing the rotation through
the component rotations in each Cartesian coordinate
an approach known as Euler angles
runs in the to problem of gimbal lock.
Euler angles have the additional concern
that the composite rotation
depends on the order the rotations are applied.

A complete approach to this is to use
the $3 \times 3$ rotation matrix,
defining the rotation in each coordinate.
The rotation matrix does have
the advantage of working well
with other symmetry transformations
like mirror and glide planes.
However the use of a nine floating point values
for the representation of values in SO(3).
A mapping of a 3 dimensional space to another.

Quaternions are to 3D space
as complex numbers are to 2D.

Quaternions are used in many fields to represent rotations,
including flight simulation, motion capture, other fields.



- What are quaternions
- Where are quaternions used
- Calculation of Rotation using quaternions
- Rotational distance [@Huygn2009]
    - Formula for distance
    - Algorithm for distance, how to actually calculate it

- Use of rowan [@Ramasubramani2018]
    - Tested and documented
    - Performance
