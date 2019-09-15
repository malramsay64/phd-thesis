# Random Numbers

Random numbers are used in a number of places in this thesis.
However, for the purposes of reproducibility
and computational performance,
rather than generating truly random numbers[@Haahr1998;@Noll1998],
pseudo random number generators are used instead.
A Pseudo Random Number Generator (PRNG)
is an algorithm for generating statistically random values
that is, their distribution matches that of true randomness,
while being possible to exactly replicate a sequence.

## Random Numbers in Hoomd

Random numbers are used in Hoomd
for the initialisation of translational and rotational velocities.
Hoomd uses the Saru PRNG [@Afshar2013],
which was chosen for it's performance on GPUs,
in particular the algorithm for generating random values
takes a seed comprising three numbers,
one of which is the identity of the body
for which the number is being generated.
This allows for the PRNG to generate
random numbers without communication
with every other thread.

The Saru PRNG generates numbers on
a uniform distribution with the range $[0, 1)$.
However, for a Maxwell-Boltzmann distribution
of total velocities,
each directional velocity requires values
which are normally distributed.
For transformation of random values from
a uniform distribution to a normal distribution
the Box-Muller transformation is used,
specifically the polar coordinates version.
The polar version is used to
avoid trigonometric functions
which are particularly slow on a GPU.
This transformation takes two random values,
$u$ and $v$, with each value in the range $[-1, 1)$,
which is simply a rescaling of the values from
the $[0, 1)$ distribution.
These two random values are combined
such that $s = u^2 + v^2$,
with values of $s >= 1$ being discarded,
redrawing values until this condition holds.
Once an appropriate value has been drawn,
this transformation provides two independent
values from a Gaussian distribution

\begin{align}
z_0 &=  x \sqrt{\frac{-2 \ln{s}}{s}a}
z_1 &=  y \sqrt{\frac{-2 \ln{s}}{s}a}
\end{align}

This algorithm as implemented in Hoomd,
only returns a single value
as displayed below.

```c++
inline float gaussian_rng(RNG &rng, const float sigma) {
    // use Box-Muller transformation to get a gaussian random number
    float u, v, s, z0;

    do  {
        u = rng.s(-1.0, 1.0);
        v = rng.s(-1.0, 1.0);
        s = u * u + v * v;
    } while ( s >= 1.0 );

    w = fast::sqrt((-2.0 * log(w)) / w);
    z0 = u * w;

    return z0 * sigma;
}
```

## Random Numbers in Packing

The packing codebase uses Pseudo random numbers extensively
since it is a Monte Carlo method.
In this case, the PCG family [@ONeill2014] of PRNG
has been chosen for a combination of performance
and statistical qualities.
In particular the PCG family passes all tests[@ONeill2014;@Cook2017;@Cook2017a]
from the TestU01[@LEcuyer2007;@LEcuyer] suite.

## Reproducibility

While there are typically no guarantees
that a random number generator will be the same
across platforms and versions,
or for that matter a numerical seed
giving the same initial state.
The seeds for random number generation are listed below.

Note that for the PCG random number generators,
there is a transformation from the seed
to the initial state of the PRNG.

The initial seed for random numbers in Hoomd is
42 for most simulations.
Where there are multiple replications of a simulation,
with each having it's own simulations id
as specified in the filename,
the initial seed is the value of the simulation id.

For the packing analysis,
there are many replications run,
(with the default being 32)
with each replication having a seed
which is the index of the replication.
