# Dynamics notes

## Structural Relaxation

- [@Ediger1996]
    - By "structural relaxation" we mean the process by which a liquid forgets its
      structure from some earlier time, e.g., the decay of the density autocorrelation
      function.
    - Some relaxation times associated with structure may be considerably longer than
      the timescale for molecular rotation near $T_g$. This implies that structural
      relaxation has a stronger temperature dependence than molecular rotation or
      viscosity.
In the review by Ediger the concepts of
structural relaxation and viscosity
are definitely separate.

- [@Glotzer2000]
    - the self van Hove correlation function, $G_s(r,t)$, becomes non-Gaussian for times
      in the caging (or plateau) regime,
    - Experimentally, the breakdown of the SED relation, or decoupling of diffusion and
      structural relaxation
    - domains of fast particles should dominate diffusion, while domains of slow
      particles should dominate structural relaxation or viscosity.
This review article by Glotzer is a little confusing,
in one place the breakdown of Stokes-Einstein-Debye relations
means the decoupling of diffusion and structural relaxation,
although the SED relations describe viscosity.
So is viscosity and structural relaxation equivalent?
Then later in the article,
structural relaxation and viscosity are described separately,
although both having similar behaviour.
Additionally it is somewhat implied,
although not strictly stated that the van Hove correlation function
is a measure of structural relaxation.

- [@Debenedetti2001]
    - In supercooled liquids below approximately $1.2 T_g$ there occurs a decoupling
      between translations diffusion and viscosity, and between rotational and
      translational diffusion.
    - The self-intermediate scattering function is the space Fourier transform of the
      van Hove function $G_s(r, t)$ which is proportional to the probability of
      observing a particle at $r \pm \Delta r$ at time $t$ given that the same particle
      was at the origin at $t=0$
Here Debnedetti doesn't really mention structural relaxation at all,
everything is about the relationships between viscosity and other properties.
As for the calculation of the structural relaxation function, there is a good
explanation of the van Hove function,
however the only mention of how to actually calculate
what is shown to be something like a structural relaxation function
has no useful information.

- [@Kob1995]
    - Most of the results in this paper deal with the van Hove correlation functions
      (self and distinct part)
    - Equation 7 is wrong, probably $N_\alpha + N_\alpha$, however it is hard to check
      since "we define $G_d^{\alpha\alpha}(r, t)$ in a slightly different way than it is
      usually done in the literature
    - the value of the MSD in the vicinity of the plateau region is about 0.04, thus
      corresponding to a distance of 0.2. ... distance that is significantly shorter
      than the next nearest neighbour distance ... Thus it is still trapped in the cage
      of particles that surrounded it.
Here it appears as though Kob is using the van Hove correlation functions,
although is modifying the functions to get nicer behaviour on long times.
An issue with this is that there appears to be a typo in the equation,
or else there is some really inconsistent notation which is even more confusing.
Additionally here the relaxations which are referred to
are those of the intermediate scattering function.

- [@Angell2000]
    - breakdowns in the Stokes--Einstein relations between diffusion and viscosity, and
      the Debye--Einstein relation between reorientation time and viscosity
    - $R_\tau(=\tau_s/\tau_\sigma)$ ratios the average relaxation time for structural
      relaxation, bulk viscous relaxation time $\tau_s$, and the average relaxation time
      for conductivity relaxation $\tau_\sigma$
    - of the most fundamental relaxation process, the structural relaxation. This is
      represented by the intermediate scattering function $F (k,t)$ which monitors the
      decay of density fluctuations.
So this is really confusing, structural relaxation is really important but I'm not going
to provide an equation.

- [@Donati1999]
    - For example, many liquids cooled below their melting temperature exhibit rapid
      non-Arrhenius increases of viscosity and relaxation times with decreasing
      temperature, and two-step, stretched exponential decay of the intermediate
      scattering function $F(\mathbf(q), t)$.
    - We have studies deviations from the Gaussian form of the self-part of the van Hove
      correlation function $G_s(r, t)$.
Here both the self intermediate scattering function
and the van Hove correlations are used.
Also no equation for the scattering function,
although there is one for the non-Gaussian parameter.

- [@Ediger2012]
    - Fig. 1: Viscosity as a function of inverse temperature for SiO2 and o-terphenyl
      because the structural relaxation time $\tau_\alpha$ has nearly the same
      temperature dependence as viscosity, a single curve reasonably represents both
      functions.
This combines the two ideas of structural relaxation and velocity
in two experimental systems by noticing that the curves overlap.
This doesn't really demonstrate a good reason for
both ideas being the same,
replacing structural relaxation with viscosity for the breakdown SED.
Additionally there is absolutely no mention of
a measure of structural relaxation.

- [@Levesque1970]
    - The self correlation function is given by
        $$G_s (r, t) = \frac{1}{4\pi r^2 \Delta r} \langle N(r_i(t) - r_i(0) - r) \rangle$$
      where $N(X - r)$ is equal to 1 where the distance $X$ lies between $r$ and $\Delta r$
      and zero otherwise.
This provides us with a formula for the van Hove self correlation function,
which nicely doesn't try and pretend we can deal with
infinitesimally small numbers in a computer simulation.
However it doesn't actually use this function for any computations.

- [@Widmer-Cooper2008]
    - The structural or 'alpha' relaxation time $\tau_\alpha$ is defined as the time
      required for the self intermediate scattering function $F_s(q, t)$,
      $$ F_s(q, t) = \frac{1}{N}\langle \exp{i\mathbf{q} \cdot [\mathbf{r}_j(0) -
      \mathbf{r}_j(t)} \rangle $$
      to decay to a value $1/e$. The magnitude of the wavevector $q$ is set equal to the
      value at the first Bragg peak.
Here structural relaxation is the decay of the self-intermediate scattering function,
however what is going on with $q$?
$q$ is passed to the function as a scalar quantity,
then is suddenly a vector $\mathbf{q}$,
what's up with this?
Also I now need to work out finding the value at the first Bragg peak.

- [@Rapaport2004]

Gives code and equations for van Hove and Shear Viscosity.
There is no mention of structural relaxation

- [@Tong2018]
    - To monitor the structure relaxation, we use $w_i(t)=1$ if $|r_i(t) - r_i(0)|<b$,
      and zero otherwise, and set $b=0.15$.
Here there is no mention of why this value of $b$ was chosen.

## Rotational Relaxation

- [@Dote1981]
    - in a typical NMR experiment a single particle correlation time $\tau_2$ is
      determined, $\tau_2$ being given as
      $$\tau_2 = \int_0^\inf \frac{\langle P_2(\cos \theta_t)) P_2(\cos \theta_0) \rangle}
      {\langle | P_2(\cos \theta_0) |^2 \rangle}$$
      where $P_2$ is a second-rank Legendre polynomial, $\theta$ is the time-dependent
      angle of orientation of a given molecular and the angula brackets indicate an
      equilibrium ensemble average.
There is nothing here that really specifies a method for computing the rotational
relaxation for a simulation.

- [@Chen2017]
    - In the isotropic approximation, rotational diffusion is a function of the total
      rotational angle $\theta_q$ alone, without regard to coordinate fame or notation
      direction. According to rigid-body Brownian dynamics, the probability distribution
      of finding rotation of magnitude $\theta_q$ after time $\Delta t$ is
      $$ P_{rand}(\theta_q) = \frac{2}{\pi} \sin^2(\frac{\theta_q}{2}) $$
    - $D_{iso}$ is the isotropic diffusion constant
    - It is worth noting that the $l=2$ solution is used when applying the {\em unit-vector}
      method above to NMR and fluorescence, so as to describe the underlying physical
      process (i.e., $\tau_{iso,NMR} = (6D_{iso})^{-1}$). Since this work directly
      retrieves dynamics information from simulation trajectories, we adopt the simpler
      $l=1$ solution where $\tau_{iso} = (2D_{iso})^{-1}$, and anisotropic diffusion is
      described by only three time-constants instead of five.
The isotropic rotations are those that are independent of direction,
unlike the dipole interaction which is only taking into account a single type of
rotation.

- [@Shinoda2003]
    - The rotational relaxation time of the water dipole axis, $\tau$, was investigated
      to check the quality of MD calculations. The relaxation time was estimated by
      using the rotational correlation function, defined as
      $$ C(t) = P_1(t) = \langle \cos \theta(t) \rangle = \langle \vect{d_i} (t) \cdot
      \vect{d_i}(0) \rangle $$
      where $\vect{d}_i(t)$ is the dipole axis of the $i$th water molecule at time $t$
This defines a dipole relaxation,
which only includes one set of rotational reorientations,
the other axes are ignored in this analysis.

- [@Brodka1992]
    - We calculated the rotational relaxation function $G_{20}(t)$, defined as
      $$ G_{20}(t) = \langle P_2(\vect u_i(t) \cdot \vect u_i(0)) \rangle $$
      where $\vect u_i$ is the unit vector parallel to the $C_3$ axis and $P_2$ is the
      Legendre polynomial
    - The angular velocity correlation functions were studied separately for the
      spinning and tumbling motions
      $$ G_\omega^x(t) = \frac{\langle \omega^x_i(t) \cdot \omega^x_i(o) \rangle}
      {\langle \omega^x_i(0) \cdot \omega^x_i(0) \rangle} $$
    - The anisotropy of rotational motion is clearly visible in Fig. 7. Rotational
      freedom of the spinning motion in the bulk liquid decreases with diminishing
      temperature and the density jump at the transition point induces additional
      restrictions to this motion in the plastic phase.
In this paper Brodka has uses the 2nd Legendre polynomial
for the rotational relaxation.
It is also interesting to note that they acknowledge that
the rotational relaxation function they are calculating
only takes into account one of the possible rotations,
and they have a different rotational relaxation function
for the other relaxations.
These other correlations are the same as the velocity autocorrelation functions.
Comparison of the second order Legendre polynomial with experimental results

- [@Zasetskty2010]

Uses the first, second and third order Legendre autocorrelation functions in a simulation study.

- [@Jas2000]
    - Experimental methods for studying rotational diffusion measure quantities
      relaxed to the correlation function
      $$ C_2(t) = \langle 3(\vect n(0) \cdot \vect n(t))^2 -1 \rangle/2 $$
Calculates the diffusion constant for each molecular axis, combining them for a total
rotational diffusion constant.
Rotational diffusion is calculated using the first order Legendre polynomial
Demonstrates how to combine the multiple relaxation functions for each axis

- [@Kim2015]
    - There are two formalisms in order to estimate $D_R$: Einstein and Debye
      formalisms. In the Einstein formalism, we calculate the mean square angular
      displacement
      $\langle [\Delta\phi(t)]^2\rangle = \langle|\phi(t) - \phi(0)|^2\rangle$
      where $\phi(t) is the unbounded angle of the vector $\vect u (t)$ of a tracer at
      time $t$. ... And $D_R$ is obtained by using the relation
      $D_R = \lim_{t->\inf}\langle [\Delta \phi(t)]^2 \rangle / 2t$.
      On the other hand, in the Debye formalism, the rotational correlation function
      $U_l(t)$ if tracers is considered, i.e.,
      $U_l(t) = \langle \exp [il\Delta\phi(t)]\rangle$,
      where $l$ is the order of the rotational correlation function.
In this paper there is a fair amount of space dedicated to
the comparison between the Debye formalism and the Einstein formalism,
with both giving the same results.

## Rotational Relaxation

- Debye vs Einstein Dynamics
    - There are two formalisms in order to estimate $D_R$: Einstein and Debye
      formalisms. In the Einstein formalism, we calculate the mean square angular
      displacement
      $\langle [\Delta\phi(t)]^2\rangle = \langle|\phi(t) - \phi(0)|^2\rangle$
      where $\phi(t)$ is the unbounded angle of the vector $\vect u (t)$ of a tracer at
      time $t$. ... And $D_R$ is obtained by using the relation
      $D_R = \lim_{t->\inf}\langle [\Delta \phi(t)]^2 \rangle / 2t$.
      On the other hand, in the Debye formalism, the rotational correlation function
      $U_l(t)$ of tracers is considered, i.e.,
      $U_l(t) = \langle \exp [il\Delta\phi(t)]\rangle$,
      where $l$ is the order of the rotational correlation function.

- [@Kivelson1988]
    - In many cases, the nature of the relaxation process, together with the coarseness
      of the observations, have allowed
      $$\langle Y_{lm}(t)Y_{lm}(0)*\rangle$$
      to be represented as a single exponential, in which case $\tau_l$ is its decay
      time. Under the assumption that a rotating molecule can ber represented as a
      brownian particle of volume $v$ in a homogenous, continuous hydrodynamic flud,
      the correlation time $\tau_l$ can be expressed as
      $$ \tau_l = \frac{v\rho}{k_BTl(l+1)}8\pi C$$
      where $k_B$ is the Boltzmann constant and $C$ is a paramter...
For diffusional motion we expect that $\tau_1/\tau_2 = 3$
For internally rotating molecules,
we expect $1 < \tau_1/\tau_2 < 3$
For supercooled liquids, we get behaviour which is non-diffusive,
that is $\tau_1/\tau_2 < 3$,
which suggests that the relaxation takes place by means of large angular jumps.
