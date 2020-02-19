# Introduction

- There are many aspects of molecular liquids which are not understood
    - growth rates
    - fragile liquid

- Molecular liquids are challenging
    - Rotational motion
    - more degrees of freedom
    - chemical interactions
    - crystal polymorphs

- Ortho-terphenyl is a widely studied molecule for both growth rates and being a fragile
  liquid
    - Many models of various degrees of approximation
    - Simplest is Lewis--Wahnström
    - Simulations still run into issues, periodic boundary effects, timescales
    - Where do the simulations fail to explain results

There are many experiments studying ortho-terphenyl,
[@Cicerone1996;@Andreozzi1997;@Chang1994;@Fujara1992;@Mapes2006]
using a range of techniques to better understand the molecule.
These have presented a range of observations
that don't fit within the scope of Stokes--Einstein--Debye dynamics.
Of primary concern is the breakdown of the scaling of
translational and rotational diffusion with structural relaxation.
That is, the relations

$$ D_t \propto D_r \propto 1/\tau_S $$ {#eq:sed_proportionality}

don't hold true for a range of temperatures.
With the translational motion faster than expected
based on the rotational relaxation times. [@Cicerone1996;@Chang1994]

While experiments can provide critical information
in confirming a theoretical idea,
they provide a limited amount of information of the underlying'
processes which are taking place.
Computer simulations provide a time and spatial resolution
unavailable to experiments,
allowing for the development of ideas and theories,
which can then be tested in experiment.
The presence of spatially heterogeneous dynamics,
was identified in computer simulations @Hurley1995
and allowed for the design of experiments
to match these simulated observations. [@Cicerone1995a;@Cicerone1995b;@Schiener1997]

- The idea of taking a computationally simple system that is easy to visualise and
  applying the ideas to 3D has been done in many cases
    - dynamic heterogeneities
    - packing of Trimers
    - binary Lennard Jones discs

## Modelling ortho-terphenyl

The iterative process of

1) making experimental observations,
2) designing simulations to understand them,
3) developing theories to describe them, and
4) designing experiments to test the theories,

is an important cycle for understanding
the complex phenomenon found in ortho-terphenyl.
For the development of the simulations,
there are many different levels of approximately modelling ortho-terphenyl,
with each looking at different properties.

### Lewis-Wahnström model

The Lewis-Wahnström [@Wahnstrom1993] model of ortho-terphenyl
is probably the simplest possible model to capture
some of the molecular features.
The model is comprised of three particles,
one for each of the Benzene rings,
interacting via the Lennard-Jones potential

$$ v(r) = 4 \epsilon \left[\left(\frac{\sigma}{r}\right)^{12} - \left(\frac{\sigma}{r}\right)^6\right] $$

where $\epsilon$ is a measure of the energy of the interaction,
while $\sigma$ is the distance of the interaction.
The Lennard-Jones potential is a standard interaction
within the field of Molecular Dynamics,
and is an approximation of van-Der Waals interactions
which is how the Benzene rings will be interacting.
To capture the shape of ortho-terphenyl,
the three particles are arranged rigidly
with a side length of $\sigma$ and an angle of $75^\circ$
which is displayed in @fig:lewis_wahnstrom_mol

![The geometry of the Lewis--Wahnström model](../placeholder_figure.png){width=80% #fig:lewis_wahnstrom_mol}

While this model is highly simplified,
it still retains many of the characteristics of ortho-terphenyl,
replicating behaviour observed in experimental data.
The incoherent scattering function $F^s(q, t)$
displays the same two-step relaxation process
observed within simulations
for both translational and rotational motion.[@Wahnstrom1993,@Wahnstrom1997,@Lombardo2006]
This has allowed investigations of dynamic heterogeneities,
which are typically associated with translational motion
to be applied to rotational motion[@Lombardo2006]
which has similar non-Gaussian behaviour at short times.
It also allows the crystallisation behaviour to be studied. [@Pedersen2011]

The Lewis-Wahnström model is a computationally fast method
of modelling the behaviour of ortho-terphenyl.
Importantly it mimics the shape,
a property of molecular glass formers.
There are also some limitations of the model,
with the primary limitation being
the prediction of diffusion constants,
with simulations finding
translations diffusion constants three orders of magnitude
rotational diffusion constants seven orders of magnitude
larger than the experimental values near 260 K. [@Lombardo2006;@Lewis1994;@Rinaldi2001]

### Alternative Models

Alternative models of ortho-terphenyl
trade the long timescales available to the Lewis--Wahnström model
with a more accurate description of the molecule.

Rather than describing each phenyl ring as a single particle,
@Mossa2001 models each carbon atom,
giving rise to the geometry of the rings.
This models the effect of the phenyl groups
and the rotational freedom they have,
degrees of freedom not present in the Lewis--Wahnström model.
By comparing the results to the Lewis--Wahnström
we could start to understand the effect these
additional degrees of freedom have on the overall dynamics.
A limitation of this model,
is that it still uses the Lennard--Jones potential
to model interatomic interactions.

Taking the modelling of ortho-terphenyl further
@Berry2006 use the Accelrys COMPASS force field [@Rigby2004]
to accurately model gas and liquid state properties.
This force field allows more degrees of freedom for each molecule,
increasing the computational complexity
while also improving the prediction capability of the model.

While these more complex models can provide
more accurate information over short timescales,
the additional computational cost makes them less useful
for the study of glass formation.
Glass formation is inherently a long timescale phenomenon.
The current state of the art in molecular dynamics simulations
is millisecond timescales @Chen2019a,
while glass formation takes place over thousands of seconds.

## Computational Tractability

Part of the issue of modelling glass formation
is the long timescales required for the simulations.
By reducing the complexity of computational models
it becomes easier to access longer timescales,
why the Lewis--Wahnström model only comprises 3 particles.

By using so few particles in a simulation,
it is possible to model larger systems,
important to minimize finite size effects. [@Maginn2018]
These are properties measured in a simulation which
depend on the size of the simulation.
They arise from the periodic boundary conditions
in which most molecular dynamics simulations take place.
This can change the dynamics by more than 10% [@Kikugawa2015]
and has been raised as an issue with studies of the Lewis--Wahnström model. [@Pedersen2011]

Using simulations in two dimensional space
is a technique which has already been used to great success
in understanding the dynamics of supercooled liquids. [@Hurley1995]
Using only to dimensions helps with computational tractability in a few ways.
Firstly the calculations are simpler having fewer degrees of freedom,
although there are also additional benefits
like fewer neighbour interactions to consider.
Additionally fewer particles are needed to remove finite size effects
as there are only particles extending in two dimensions.
Finally, there are benefits in the analysis of data.
One of the reasons @fig:dynamic_heterogenaeties is used so widely
to describe dynamic heterogeneities
is that it so succinctly captures the idea,
something made possible by the 2D nature of the simulation.
Using 2D simulations as a discovery tool,
using visualisations to develop ideas and analyses
which can then be applied to more complex systems.

This approach of developing an idea in 2D
has been employed by @Griffith2018 in understanding
dense and jammed packing of Trimers.
A year later [@Griffith2019] they follow up
applying the lessons learnt to 3D systems.

- Here we introduce the Trimer
    - molecule definition

## Project Outline

- Demonstrate the trimer molecule is an appropriate model for the dynamic behaviours of
  ortho-terphenyl and other fragile liquids.
- Use the trimer to introduce new dynamics quantities which allow for a better
  understanding of the dynamics at the molecular level. This is done by describing the
  origin of the breakdown of the Stokes--Einstein--Debye relations.
- Introduce a new method for the identification of crystal polymorphs and the liquid
  state. This will be required to observe the slow growth rate of this molecule.
- Characterise the melting rate of the Trimer molecule, comparing it to different
  theories.
- Investigate the slow melting rates of the trimer.
