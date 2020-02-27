---
top-level-division: chapter
title: Code Snippets
---

```{.python caption="The function used to calculate the static structure factor"
#lst:structure_factor}
import numpy

def static_structure_factor(
    rdf: freud.density.RDF, wave_number: float, num_particles: int
):
    dr = rdf.R[1] - rdf.R[0]
    integral = dr * numpy.sum((rdf.RDF - 1) * rdf.R * numpy.sin(wave_number * rdf.R))
    density = num_particles / rdf.box.volume
    return 1 + 4 * numpy.pi * density / wave_number * integral
```

```{.python #lst:msd}
import numpy
import freud

def mean_squared_displacement(
    box: freud.box.Box,
    initial: numpy.ndarray,
    final: numpy.ndarray
) -> numpy.ndarray:
    return numpy.square(numpy.linalg.norm(box.wrap(final - initial), axis=1))
```

```{.python #lst:intermediate_scattering_function caption="The calculation of the intermediate scattering function."}
def create_wave_vector(wave_number: float, angular_resolution: int):
    """Convert a wave number into a radially symmetric wave vector."""
    angles = numpy.linspace(
        0, 2 * numpy.pi, num=angular_resolution, endpoint=False
    ).reshape((-1, 1))
    wave_vector = numpy.concatenate(
        [numpy.cos(angles), numpy.sin(angles)], axis=1
    )
    return wave_vector * wave_number

def intermediate_scattering_function(
    box: freud.box.Box,
    initial_position: numpy.ndarray,
    current_position: numpy.ndarray,
    wave_number: int,
    angular_resolution: int = 60,
) -> float:
    """Calculate the intermediate scattering function for a specific wave-vector."""
    wave_vector = create_wave_vector(wave_number, angular_resolution)

    # We only want the x and the y values from the displacements
    displacement = box.wrap(initial_position - current_position)[:, :2]

    return numpy.mean(numpy.cos(numpy.dot(wave_vector, displacement.T)))
```

```{.python #lst:state_machine}
for state, dist, status in zip(self._state, distance, self._status):
    if state == 2:
        # The threshold has been reached so there is now nothing to do
        continue
    elif state == 1:
        # Need to check whether the relaxation has crossed a threshold
        if dist > self._irreversibility:
            state = 2
        elif dist < self.threshold:
            state = 0
        else:
            continue
    elif state == 0:
        if dist > self.threshold:
            status = timediff
            state = 1
        else:
            continue
    else:
         RuntimeError("Invalid State")
```

```{.c++ #lst:gaussian_rng caption="Converting uniformly distributed random numbers on a gaussian distribution using a Box-Muller transformation."}
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
