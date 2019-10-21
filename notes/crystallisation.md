# Crystallisation

## Nucleation and Growth

### Measuring

- @Reinhart2018
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

- @Burke1988
    - "The (111) grows at a considerable slower rate than the (100), and it is apparent
      that different mechanisms are responsible for growth on the two faces."
    - "The (111) system clearly shows no preference for either fcc or hcp stacking.
      Stacking faults occur in roughly half the layer growth and pictures of growing
      layers show nucleation on both hcp and fcc sites."

- @Benjamin2015
    - "Finally, performing a run over \si{500 000} time steps, we determine the interface
      velocity $v_1$."
    - timesteps of size 0.005 $\tau$

- @Tepper2001
    - "Except for very large deviations from the melting temperature, where homogeneous
      nucleation may dominate the dynamics, the process of melting and freezing of a
      crystal takes place at the interface."
    - "lead to the general observation that melting rates are larger than
      crystallisation rates, at equal amounts of supersaturations."
    - "in a successive paper of the Broughton group, they tried to complement their
      growth studies with melting, but they failed to produce steady state melting."
    - "300 thousand timesteps"

- Broughton group

- @Tang2013
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

- @Turnbull1969
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

- @Russo2018a
    - "Previous studies showed that glass formation is often linked to a suppression of
      the local order that promotes crystal formation."
    - "The key physical factor controlling the glass-forming ability is the structural
      difference between as crystal and its melt, which can be quantified by a single
      adimensional quantity."
    - "the drastic suppression of the nucleation rate is in fact due to a rapid increase
      of thermodynamic interface penaly, $\beta\gamma\sigma^2$, which is a macroscopic
      measure of the liquid--crystal structural differences."

- @Yagasaki2016
    - "A simulation is continued for 700 ns or until complete disappearance of either
      solid or liquid part"
    - "To obtain the growth rates of THF hydrate and ice, we evaluate the position of the
      solid--liquid interface at each timestep. It is possible to distinguish the solid
      regions from the aqueous solution using the $F_3$parameter because the
      tetahedrality of water molecules is much higher in ice and clathrate hydrates
      than in aqueous solution."
    - "This result demonstrates that the growth rate of THF hydrate is governed by a
      factor (of factors) other than diffusion coefficients.
    - "The temperature dependence of the growth rate of THF significantly deviates from
      the Wilson-Frenkel model."

- @Taffs2016
    - "This concept of competition between five-fold symmetry in the liquid and six-fold
      crystalline symmetry underpins the design of materials."
    - "Increasing five fold symmetry leads to an increase in surface tension between
      fluid and crystal, which acts to suppress nucleation."
    - "a slight trend to faster growth for reduced five-fold symmetry. This suggests
      that the growth rate and nucleation are decoupled"

### Modelling

**@Bagdassarian1994**

- Ignore all the complexities of crystal growth
- Have a quantity $M(\vec{r}, t)$ where;
    - $M(\vec{r}, t) = 0$ for the bulk liquid
        - This definition doesn't allow for any fluctuations
        - Also it only allows for fluctuations closer to the solid phase
    - $M(\vec{r}, t) = M_s$ for the bulk crystal
    - $M=0$
    - $M=M_s$
    - For a non-uniform system $0 \le M(r,t) \le M_s$
    - This value represents the local phase of the material
    - Plotting out to $r=20$ -> Definitely non-local
    - Will serve as an order parameter profile

- This does not allow for a distribution
    - there is perfect liquid and perfect crystal and everything in the middle is
      somewhere between the two?


- $\omega$ is a local dimensionless free energy which will characterise a uniform system
  with a degree of order $M$
    - Free energy as a function of $M$

- the familiar square-gradient expression of Cahn and Hilliard
- We choose the suggestive form
- What follows are straightforward manipulations
- It is an easy matter to
- Can be easily verified

@Russo2016

- Nucleation is hard to study due to the small sizes of molecules
- Theoretical and Experimental estimates of argon nucleation differ by 26 orders of
  magnitude
- Colloids are idea systems for studying our understanding of nucleation
- Simplest colloidal system predicted and observed nucleation differ by 10 orders of
  magnitude
- Classical Nucleation theory
    - One dimensional process -> all parameters proceeding simultaneously
    - *Capillarity approximation* -> small crystalline nuclei are amenable to a
      thermodynamic description, that is they retain the properties of the bulk solid.
    - Surface tension -> not the relevant free energy cost
- Crystal nucleation involves two order parameters
    - translational
    - rotational
- breaking of these order parameters occurs at different temperatures
    - liquid crystals
- Crucial transport property for crystal nucleation and growth is not controlled by
  viscosity but by translational diffusion
    - Important where the Stokes-Einstein relation breaks down
- Effects of gravity for colloidal particles
- hydrodynamic interactions
- most descriptions of nucleation describe the liquid as structureless
    - supercooled liquid often does contain structural order
    - competition between different order plays a role in crystallisation or it's
      avoidance
    - spatial heterogeneities
- molecular liquids, discovered that the crystal growth rate can display an unusual
  enhancement below the glass transition temperature
- pre-ordering in advance of the front propagation
- CNT is still our best effective theory of nucleation

@Emmerich2009

- Any density of an extensive quantity varies smoothly from it's value in one phase to
  it's value in the other
- Phase-field modelling -> "numerical technique which helps to overcome the necessity of
  solving for the precise location of the interfacial surface at each timestep.
- phase-field models...are rigorously derived based on variational principles of
  irreversible thermodynamics as founded by Onsager.

@Granasy2019

- Phase Fields are used to model more complex behaviour
    - Dendrites, eutectic patterns, fractal like structures

@Ericsson2019

- phase-field method is widely recognised as a competent computational method to model
  the micro-structure evolution of metallic alloys
    - Used for;
        - dendritic growth
        - recrystallisation
        - nucleation
    - limited use in evolution
- phase field variables are continuous in space and time and represent the local atomic
  ordering of the micro-structure.
- required to vary smoothly between the phases
- Use the phase field variable to construct a free energy, the free energy as a function
  of the variable.
- Local minima in the liquid and solid phase, can be chosen quite freely
- Size of critical nucleus
- Vogel-Fulcher-Tammam
- The modelling is more complicated
    - The crystal forms with a higher concentration of one component, which means that
      there is a depleted layer at the interface. The rate of crystallisation is then
      limited by the diffusion of the lower concentration through the gradient.


@Jackson2002

- Molecular dynamics results suggest that there are two classes of materials. Once where
  there is an activation barrier for growth, and another where there is no activation
  barrier for growth.
- Equation for crystals growth mathematically equivalent to the ising model

@Tanaka2012

- Description of liquid as ideal and homogeneous -> $G(r)$
- long range disordered -> can still posses short range to medium range order
- A liquid has locally favourable structures which are formed normally within the liquid
- Use bond ordering to describe short range ordering
- Importance of orientational ordering has been often overlooked
- it is bond orientational order not translational order that triggers crystal
  nucleation

## Square Gradient

@Oxtoby2002

- Landau-Ginzberg free energy
The choice of order parameter plays an important role in phase transition
    - Quantities change discontinuously from one phase to another
    - density, local magnetisation, orientational order in the crystal
- The free energy can be expressed as a function of the order parameter,
  with the minimisation finding a double tangent which locates the first order phase
  transition.
- In some cases several order parameters are needed to characterise an observed phase
  diagram. Both positional and orientational order define phases in molecular systems.

Free energy functionals

If the free energy depends entirely locally on one or more order parameters,
unphysically sharp interfaces result. To correct for this, the simplest approximation
is to expand in gradients of the order parameters. Truncation at the lowest order gives
the square gradient approximation

$$ F[m(\vect{r})] = \d{r}\left[ f_u(m(\vect{r}) + K | \nabla m(\vect{r}|^2 \right] $$

he terminology changed with time: the SG approximation-based approaches were often considered as the simplest form of
density functional theories, whereas the phase-field theory originally meant an SG approach, in which a structural
order parameter (the phase field) monitors the crystal-liquid transition [23]

which is also referred to as a Landau-Ginzberg free energy.

Phase field -> DFT -> Square Gradient
