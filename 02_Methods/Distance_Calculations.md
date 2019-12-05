# Calculating Distance in Molecular Dynamics

## Translational Distance

- minimum image convention
    - simple cells fine to wrap co-ordinates
    - more complex cells this is difficult
    - Instead create cell matrix
    - convert to fractional co-ordinates
    - wrap fractional co-ordinates
    - return to Cartesian co-ordinates

- This will only handle distances to half the cell length
    - use image information

- Track motion between cells
    - integration of distances
    - need to integrate each dimension separately

## Rotational Distance

- minimum image convention
    - wrap to -pi, pi
    - from quaternion representation

- This only handles very small rotational motion
    - fine for rotational relaxation
    - not fine for rotational diffusion

- Integrate motion
- keep track of position
- update change in rotation
- combine at the end

- equivalent to integrating angular momentum
- accounting for the changes between timesteps

This allows for studying rotations over longer timescales.
