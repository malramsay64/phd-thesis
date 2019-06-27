# Introduction

The crystallisation of a solid from the liquid melt
is a process underpinning the production
of a wide range of materials.
The process of crystallisation
can be broken into two separate processes,
the nucleation rate---the formation of small crystals from the liquid, and
the crystal growth rate---the speed at which the bulk crystal grows.
The reason these two processes are considered separately,
is that the nucleation rate is orders of magnitude
slower than the crystal growth rate.
It is the slow nucleation rate
that allows liquids to be supercooled.
Instead of waiting for a statistically unlikely event to occur,
crystal growth of experiments uses a seed particle
from which the crystal growth can propagate.
The use of seed crystals,
in addition to initiating the crystal growth,
can also be used to influence the resulting crystal structure,
providing another level of control over the growth process.
In other cases, particle impurities in the liquid
or tiny scratches in glassware can also act
as a seed site,
from which the crystal grows at the crystal growth rate.

## Temperature Dependence of Growth Rates

Looking at the nucleation rate and the crystal growth rate separately.

Nucleation occurs when a fluctuation in the liquid state,
forms a crystalline configuration which is stable long enough to grow.
The size of this is influenced by the chemical energy difference
between the liquid and the crystal phases,
as well as the energy penalty of the interface between them.
As the size of an nucleation site increases,
the energy gained from the crystal phase increases
as the cube of the radius,
while the penalty for the surface area increases
as the square of the radius.
The two different power laws mean that at some finite size,
a crystalline configuration is stabilised
and can continue to grow.
The initial creation of this unstable state
arises from the random fluctuations of the liquid;
the average energy has spatial and temporal fluctuations
which with some rare occurrence,
create structures which are possible for nucleation.
As the temperature decreases the fluctuations creating
the higher energy crystal nucleus become rarer and rarer,
however also in favour is the larger energy gap
between the liquid and the crystal phases.

- supercooled liquids for pedestrians [@Cavagna2009a]

The classical theory of crystal growth
is attributed to Wilson[@Wilson1900] and Frenkel[@Frenkel1926],
where the growth rate is determined by the liquid diffusion
near the interface, and the chemical potential between the two phases.
At temperatures just below the melting point
the chemical potential is the rate limiting parameter,
while typically lower temperatures become limited
by the diffusion of particles near the interface.

## Anomalously Slow Growth Rates

In the study of many different crystals,
the growth rates between the different crystal faces
can vary by as much as three orders of magnitude [@Reinhart2018;@Burke1988].
This huge difference between growth rates
indicates that the growth of the crystal
is significantly more complicated than posited
in the discussion of the temperature dependence.

Tang and Harrowell [@Tang2013] found
for two similar alloys,
that the difference in crystal growth rates
could be attributed to
the ordering of atoms in the interface,
with the faster glass former displaying ordering
much further from the boundary of the crystal.
This observation is supported by the work of Reinhart et. al. [@Reinhart2018]
where in studying Janis particles,
the stricter the geometric constraints of the crystal phase,
the slower the growth rate.
While in work on Lennard Jones Particles Burke et. al. [@Burke1988]
attribute the slow growth rate of the (111) crystal face
to the degeneracy of fcc and hcp stacking,
with many stacking faults arising during the freezing process as a result.

While the Wilson-Frenkel theory has a characteristic timescale of diffusion
it may be that for more complicated crystal structures,
such as Janus Particles [@Reinhart2018], clathrates [@Yagasaki2016] and molecular crystals
the diffusion may no longer be the relevant characteristic timescale.
This is particularly important for molecular crystals,
where one of the major results has been the decoupling
of the rotational relaxation time and the diffusion constant,
with the rotational relaxation getting slower much faster than the dynamics.





- Methods of crystal detection
    - Simple methods
        - Density
        - energy
    - 2D Structural Methods
        - Hexatic order parameter
        - orientational order parameter
    - 3D Materials
        - Water (CHILL)
        - radial harmonics methods


## Calculation of Melting Rates

- Slab geometries
    - Growth/melting rate along a single crystal plane

- [@Reinhart2018]
    - "Small free energy differences between competing crystal phases interfering with
      the formation of large single crystals."
    - "that smaller patches lead to stronger anisotropy between crystal faces, with
      interface velocities up to 100 times faster for the BCT (001) face compared to
      (110) and 1000 times faster for the perovskite (110) compared to (100)."
    - Crystallisation of non-spherically symmetrical particles.
    - Used the local Steinhardt bond order parameter $\bar Q_6$
    - "Growth with patchy particles is an activated process and not collision-limited,
      as has been reported for isotropic particles."
    - "In all of our simulations, we found that smaller patches yielded slower interface
      velocities, even after adjusting for slower diffusion at their lower melting
      points. ... complete growth suppression at low $\Delta T$."
    - "This is likely a result of the strict geometric constraints imposed by the
      particles during attachment."
    - "The simulation time step was 0.005 $\tau$"
    - "We found that \si{2e5} to \si{8e5} time steps were sufficient to give robust
      measurements of the growth rate. Each simulation run required approximately
      \SI{1}{\hour} of computation time on a single GPU."

- [@Burke1988]
    - "The (111) grows at a considerable slower rate than the (100), and it is apparent
      that different mechanisms are responsible for growth on the two faces."
    - "The (111) system clearly shows no preference for either fcc or hcp stacking.
      Stacking faults occur in roughly half the layer growth and pictures of growing
      layers show nucleation on both hcp and fcc sites."

- [@Benjamin2015]
    - "Finally, performing a run over \si{500 000} time steps, we determine the interface
      velocity $v_1$."
    - timesteps of size 0.005 $\tau$

- [@Tepper2001]
    - "Except for very large deviations from the melting temperature, where homogeneous
      nucleation may dominate the dynamics, the process of melting and freezing of a
      crystal takes place at the interface."
    - "lead to the general observation that melting rates are larger than
      crystallisation rates, at equal amounts of supersaturations."
    - "in a successive paper of the Broughton group, they tried to complement their
      growth studies with melting, but they failed to produce steady state melting."
    - "300 thousand timesteps"

- Broughton group

- [@Tang2013]
    - "The crystallisation rate is determined by the nucleation rate and the crystal
      growth rate."
    - "but failed to find any sign of crystallisation in the CuZr mixture, despite runs
      of \SI{50}{ns} duration"
        - Timestep is \SI{1}{fs}
        - 50 million timesteps
    - The growth rate $v$ has been determined as follows:
        $$ v = \frac{V d_1}{2N_1(V_c - V1)} $$
        where $V$ is the rate of change of the volume of the simulation cell, $d_1$ is
        the spacing between crystal layers along the interface normal, $N_1$ is the
        average number of atoms in an as-grown crystal layer....and $V_c$ and $V_1$ are
        the specific volumes of the bulk crystal and liquid phases respectively.
    - "The coefficient $k(T)$ corresponds to the rate per unit area at which material is
      added to the interface, whereas the term in brackets represents the fraction of of
      the added material that is not removed by the reverse process."
    - "In units of the diffusion time, the NiAl surface is laying down ten layers for
      every layer of CuZr."
    - "The major finding of this Letter is that a striking difference exists in the
      crystal/liquid interface when comparing a good glass-forming alloy with a poor
      glass former."

- [@Turnbull1969]
    - "At the liquid--glass transition viscosity, \SI{e15}{\poise}, and $\Delta T_r =
      0.1$ eqn. (1) predicts that $u$ should be only 1 molecular spacing per 10 to 100
      days."
    - "Consider now what conditions must be fulfilled by the crystal nucleation
      frequency and the cooling rate of the liquid is crystallisation is to be
      bypassed."
    - "the glass forming ability should increase with the reduced glass temperature
      $T_g/T_m = T_{rg}$....Liquids with glass temperatures as high as $2/3T_m$ if
      seed-free would practivally only crystalllise within a narrow temperature range,
      and then only slowly"

- [@Russo2018a]
    - "Previous studies showed that glass formation is often linked to a suppression of
      the local order that promotes crystal formation."
    - "The key physical factor controlling the glass-forming ability is the structural
      difference between as crystal and its melt, which can be quantified by a single
      adimensional quantity."
    - "the drastic suppression of the nucleation rate is in fact due to a rapid increase
      of thermodynamic interface penaly, $\beta\gamma\sigma^2$, which is a macroscopic
      measure of the liquid--crystal structural differences."


- [@Yagasaki2016]
    - "A simulation is continued for 700 ns or until complete disappearance of either
      solid or liquid part"
    - "To obtain the growth rates of THF hydrate and ice, we evaluate the position of the
      solid--liquid interface at each timestep. It is possible to distinguish the solid
      regions from the aqueous solution using the $F_3$parameter because the
      tetahedrality of water molecules is much higher in ice and clathrate hydrates
      than in aqueous solution.s
    - "This result demonstrates that the growth rate of THF hydrate is governed by a
      factor (of factors) other than diffusion coefficients.
    - "The temperature dependence of the growth rate of THF significantly deviates from
      the Wilson-Frenkel model."


- [@Taffs2016]
    - "This concept of competition between five-fold symmetry in the liquid and six-fold
      crystalline symmetry underpins the design of materials."
    - "Increasing five fold symmetry leads to an increase in surface tension between
      fluid and crystal, which acts to suppress nucleation."
    - "a slight trend to faster growth for reduced five-fold symmetry. This suggests
      that the growth rate and nucleation are decoupled"
