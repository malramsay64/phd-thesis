# Introduction

Crystallisation is important

## Detection of Crystals

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
      of \SI{50}{\nano\seconds} duration"
        - Timestep is \SI{1}{\femto\second}
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

- [@Harrowell and Ox Toby]
