# Quaternions for Orientation in MD (2017-09-13)

In the understanding of the dynamics of a molecule in a Molecular Dynamics (MD) Simulation
the two main properties we use to understand liquid behaviour are
the translational motion and the rotational motion of the atoms or molecules.
These motions reflect changes in the position and the orientation of the molecules.
When calculating these motions in an MD simulation
it makes sense to represent each molecule as;

- the position of the Center of Mass (COM), and
- the orientation within the lab reference frame.

This representation allows for quick and simple calculation of
the motion between two separate times.
In the simplest case, conceptually this is just computing

\begin{align}
\text{displacement} &= \text{norm}(\text{position}_2 - \text{position}_1) \\
\text{rotation} &= \text{norm}(\text{orientation}_2 - \text{orientation}_1).
\end{align}

For the displacement,
we can just use a standard Euclidean distance norm.
Which is simple enough to compute.
The rotations are somewhat more difficult.
In a two dimensional system it would be possible to use just the angle,
where the norm is a function keeping the rotation within a sensible bounds, like $(-\pi, \pi]$.
However in three dimensions using angles gets more complicated
and computationally expensive.
The approach that is used in [hoomd][hoomd]
and likely many other molecular dynamics programs is
to use quaternions for the representation of orientation.

This post aims to give an understanding of quaternions
and how to use them to compute a rotation
from one orientation to another.

## Orientation in 2D

We will start with a simple case,
orientation in two dimensions.
In two dimensions it is possible to describe the orientation of a molecules
using a single angle, $\theta$.
This is a perfectly reasonable representation.
We can find the rotational distance $\Delta\theta$ between two orientations as

$$ \Delta\theta = \theta_2 - \theta_1 $$

This can become a bit of an issue if we want to keep our angle bounded.
A reasonable range for an angle of rotation is $(-\pi,pi]$,
as we can assume a rotation larger occurred in the opposite direction.
The code to implement this in python would look something like the function below;

```python
import math

def rotationalDistance(theta1, theta2):
    delta_theta = theta2 - theta1
    if delta_theta > math.pi:
        delta_theta -= 2*math.pi
    elif delta_theta <= -math.pi:
        delta_theta += 2*math.pi
    return delta_theta
```

### Complex Numbers

An equally valid method for the representation of angle in 2D is to use complex numbers.
Any complex number $z = a+ib$ can be represented in exponential form

$$ z = r\text{e}^{i\theta} $$

where $r$ is the length, or modulo, of $z$

$$ r = \sqrt{a^2 + b^2} $$

and $\theta$ is the argument of $z$,
which for the first quadrant is

$$ \theta = \tan^{-1}\frac{b}{a} $$

Due to the range of the $\tan^{-1}$ function only being $[-\pi/2, \pi/2]$,
the quadrant of the complex number is important to having values in the range $(-\pi,pi]$.
There is a nice computational solution to this problem implemented in almost all languages,
the `atan2` function which works out the quadrant for us,
giving an angle in our desired range.

$$ \theta = \text{atan2}(b, a) $$

Make special note of the order of arguments to the `atan2` function.

Now that we understand how to convert our final complex number to a rotation,
we need to construct it from the distance between two orientations.
When we multiply two complex numbers together it can be thought of as rotating by an angle.
This can be demonstrated by performing a multiplication with
the polar form of a complex number.

\begin{align}
z &= r_1e^{i\theta_1} \times r_2e^{i\theta_2}\\
&  = r_1r_2e^{i\theta_1 + i\theta_2}\\
&  = r_1r_2e^{i(\theta_1 + \theta_2)}
\end{align}

Conversely division of a complex number by another is the distance between the two angles

\begin{align}
z &= r_1e^{i\theta_1} / r_2e^{i\theta_2} \\
  &= \frac{r_1}{r_2}e^{i\theta_1 - i\theta_2} \\
  &= \frac{r_1}{r_2}e^{i(\theta_1 - \theta_2)}
\end{align}

It is possible to do all our intermediate calculations using
the mathematics of complex numbers.
Then when we need an rotational distance
the complex number representing that can be converted to a angle.

Implementing this is produces a function that looks like the one below,

```python
import math

def complexRotation(initial, final):
    delta = final/initial
    return math.atan2(delta.imag, delta.real)
```

While the code is written in python,
most programming languages will handle complex numbers in a similar fashion.

## Orientation in 3D

Dealing with the 2D case was relatively simple.
There was a single orientation to deal with,
you are probably somewhat familiar with complex numbers
(or at least were at some point),
and it is simple to draw and visualise.
In 3D things are a little more difficult.
When expressing orientation using rotations in 3D,
known as Euler angles,
there is a phenomenon known as gimbal lock.
This is where you lose a degree of freedom of expressing orientation,
similar to in spherical coordinates where if you have $\theta = 0$
then all values of $\phi$ are equivalent i.e. that degree of freedom is lost.
This means it is typically a bad idea to represent 3D orientation using angles.
Instead we use the equivalent of complex numbers, quaternions.

### Quaternions

Just like complex numbers,
quaternions are a mathematical construct that allow us to represent rotations,
only in three dimensions instead of two.
As the name suggests quaternions consist of four values of the form

$$ a + b\mathbf{i} + c\mathbf{j} + d\mathbf{k} $$

where the relationships

$$ \mathbf{i}^2 = \mathbf{j}^2 = \mathbf{k}^2 = \mathbf{ijk} = -1 $$

hold true.
These relationships are essentially giving us the rules for
the operations on the quaternions.

These operations on quaternions are very similar to those on complex numbers.
The conjugate of a quaternion $q$ is;

$$ q^\* = a - b\mathbf{i} - c\mathbf{j} - d\mathbf{k} $$

The norm of $q$ is

$$ ||q|| = \sqrt{q^\*q} = \sqrt{qq^\*} = \sqrt{a^2 + b^2 + c^2 + d^2} $$

The reciprocal of $q$ is given as

$$ q^{-1} = \frac{q^\*}{||a||^2} $$

Quaternions have the same properties of multiplication and division as complex numbers.
Multiplying a quaternion by another is applying a rotation,
and the division is finding the rotation from one quaternion to the other.

### Rotational Magnitude

There are a number of methods for computing rotational magnitude using quaternions,
some of which trade of speed of calculation for accuracy.
For an overview of the different methods of computing rotational distance Du Q. Huynh[^1]
does an excellent comparison of six different methods.

Of the methods used to compute rotational magnitude $\Phi$,
the one I think is most suitable for use in Molecular Dynamics is

$$ \Phi = 2\ \text{arccos}(|\mathbf{q}_1 · \mathbf{q}_2|) $$

This gives a value on the range $[0, 2\pi]$ in units of radians.
I think this is most suitable as it gives results in units of radians,
rather than some approximate distance,
while remaining simple and fast to compute.
Implemented in python this function is;

```python
import numpy

def quaternion_distance(initial, final):
    return 2*numpy.arccos(numpy.abs(numpy.dot(initial, final)))
```

For an optimised computation in python over an array of values,
the below is the fastest implementation I could find.

```python
import numpy
def quaternion_distance_array(initial, final):
    return 2*numpy.arccos(numpy.abs(numpy.einsum('ij,ij->i', initial, final)))
```

For more complicated operations using quaternions I would suggest having a look at [quaternion][pyquaternion],
an open source python module by Mike Boyle which adds support for quaternions to numpy.
Mike also has a [C++][cquaternion] version of the library available.

[^1]: Huynh, D. Q. (2009). Metrics for 3D rotations: Comparison and analysis. Journal of Mathematical Imaging and Vision, 35(2), 155–164. [doi: 0.1007/s10851-009-0161-2](https://doi.org/10.1007/s10851-009-0161-2) ([#icanhazpdf](http://ai2-s2-pdfs.s3.amazonaws.com/5617/8de1001efe54792ad93f6980de5d5e91906b.pdf))
[hoomd]: http://glotzerlab.engin.umich.edu/hoomd-blue/
[pyquaternion]: https://github.com/moble/quaternion
[cquaternion]: https://github.com/moble/Quaternions

<!-- markdownlint-disable-file -->
