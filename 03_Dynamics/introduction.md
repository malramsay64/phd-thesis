# Introduction

## Glasses and Supercooled liquids

- Creating a glass
    - avoidance of critical point
        - Cooling fast enough to prevent nucleation
    - depiction on phase diagram

- Timescale of experiment
    - kinetic effect
    - unstable/metastable states

- Supercooled liquids in equilibrium
    - How do we define equilibrium of a metastable state?
    - Liquid below melting point with no crystals
    - Nucleation of crystals is a slow process, can ignore

### Characteristic Temperatures

- Slowdown near 2/3 of the melting point [@Angell2000]

- Glass transition temperature
    - Below $~1.2 T_g$ decoupling of rotations and translations occurs
    - Breakdown occurs between $1.15 T_g$ and $1.25 T_g$ in OTP -> experimental results

- Kauzmann Temperature $T_K$
    - Where the liquid would have lower entropy than the crystal
    - not possible, so provides a lower bound for the glass transition temperature
    - Have potential energy of liquid and crystal
    - $T_g \ge T_K$
    - Change in heat capacity

- Critical temperature $T_c$
    - where the is a divergence of multiple timescales
    - Definition depends on theory
    - Landscape theory this is where the landscape effects the dynamics
    - elsewhere the onset of different relaxation timescales
    - onset of heterogeneities
    - cite [@Goldstein????]
    - Strong liquids far above $T_g$, fragile close to $T_g$ [@Novikov1996] (Rossler)
    - Express fragility in terms of $T_c$, $\frac{T_g}{T_c - T_g}$

### Dynamics of Supercooled Liquids and Glasses

- Brownian Dynamics
    - Foundation of most of theory on glass formers
    - Assumes a type of motion

- Langevin Dynamics
    - Takes into account momentum
    - generates same results for statistical properties

- What is viscosity?
    - How can we measure it in simulations?

- What is structural relaxation
    - The process by which a liquid forgets it's previous structure
    - Density autocorrelation function
    - Intermediate scattering function
        - measured by neutron spin echo

- Fragility of glass formers
    - Faster than expected change upon cooling

- Vogel--Tammann--Fulcher
    - temperature dependence of relaxation times
    - provides a measure of how far from Arrhenius
    - $\tau = \tau_0 \left ( \frac{T-T_0}{T_0} \right )^{-\beta}$
    - $\eta = A \exp(\frac{B}{T-T_0})$

- Understanding Dynamics
    - $\alpha$ and $\beta$ relaxations
    - Increasing length scale
        - higher dimensional space
        - No direct evidence for this as an idea
            - Is this the appropriate method of investigating
    - Cooperative motion
        - Kinetics of cooperative motion
            - Can we keep the activation energy the same, yet change the rate to include
              multiple particles?

- Kivelson Scaling
    - viscous slowdown due to packing frustration [@Kivelson1995]

- Step Dynamics
    - Motion is an activated process
    - instead of moving freely, diffusion takes place as a number of small steps
    - Jumps of rotations and translations -> how are these coupled together

- Breakdown of Stokes-Einstein-Debye
    - Viscosity scales differently to diffusion
    - Relationship of rotation relaxation, viscosity, and diffusion

- Relaxation functions
    - exponential relaxations are expected
        - Why???
    - heterogeneous dynamics are a possible reason for this
    - alternatively there is also a non-exponential process

- Structural component
    - Is packing frustration a factor in glass formation
    - Many different crystals formed, just unable to tile space
    - or in this case forming different incompatible crystal structures

- How properties are calculated / expressed
    - Averaging techniques
        - mean
        - harmonic mean
        - median
    - Most probable vs average

### Dynamics in Experimental systems

- How are these dynamics measured
    - Techniques
    - How they relate to simulation quantities
    - Limitations of these techniques and simulations
