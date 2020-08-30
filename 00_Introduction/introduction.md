---
top-level-division: chapter
title: Introduction
---

Molecular solids have been an integral part of
our technological progress for hundreds of years,
used for a diverse range of applications including
pharmaceuticals, [@Datta2004]
fertilisers, [@Honer2017]
pesticides, [@Yang2017]
pigments, [@Hao1997]
semiconductors, [@Mei2013]
and optoelectronics. [@Ostroverkhova2016]
The wide range of uses and the specialised applications
has led to fields dedicated to the design of
molecular materials [@Corpinot2019;@Schmidt1971]
using computational models [@Sliwoski2014]
to predict the crystal structure and mechanical properties. [@Reddy2010]
One of the key processes for the formation of the
solid phase is crystallisation from the melt. [@Shimura2012;@Shimura2017;@Harkonen2005]
Despite extensive study to understand molecular liquids,
we have identified two key areas for further study,
the non-Arrhenius temperature dependence of the dynamics, and
crystal growth rates orders of magnitude slower than atomic liquids.
Understanding these properties will greatly aid
in the design and production of the diverse range of molecular materials.

# Non-Arrhenius Temperature Dependence {#sec:intro_vtf}

A key property observed within molecular liquids is
a non-Arrhenius temperature dependence,
where the motion of particles is not governed by
a single activated process.
This non-Arrhenius behaviour is shown in @fig:angell,
where the viscosities of molecular liquids are plotted.
values along the diagonal from bottom left to top right
describe an Arrhenius temperature dependence of the viscosity.
The highly non-Arrhenius temperature dependence of the viscosity
is characteristic of molecular liquids.
The Vogel--Tammann--Fulcher[^vtf] (VTF) relation [@Debenedetti2001]
is a widely used relation describing non-Arrhenius behaviour of the viscosity $\eta$

$$ \eta = A \exp(\frac{B}{T-T_0}) $$ {#eq:VTF}

[^vtf]: I have chosen to use Vogel--Tammann--Fulcher to describe this equation.
However, there seems to be significant disagreement within the literature
over the appropriate terminology to use, with
Vogel--Tammann--Fulcher [@Debenedetti2001],
Vogel--Fulcher [@Lubchenko2007], and
Vogel--Fulcher--Tammann [@Royall2018]
all used to describe this same relation.
Further confusing terminology @Cummins1997 use both
Vogel--Fulcher and Vogel--Fulcher--Tammann within the same paper.

where $T_0$ is an extrapolated temperature found from fitting, and
$B$ is a parameter extrapolated from fitting.
The VTF relation allows for defining a quantity $m$, known as the *fragility*,
which describes how much the temperature dependence
deviates from an Arrhenius relation.
The fragility $m$ is given by;

$$ m = \frac{\d \log(\eta)}{\d (T_g/T)} \vert_{T=T_g} $$

describing the slope at the glass transition temperature and
has values ranging from $\approx 16$ for strong liquids to 200 for fragile liquids. [@Bohmer1993;@Meenakshisundaram2019]
The molecular liquid with the largest fragility in @fig:angell,
ortho-terphenyl, has a fragility $m=80$. [@Bohmer1993;@Schug1998]

![The viscosities of a range of liquids plotted against inverse temperature.
Substances with Arrhenius-like temperature dependence,
shown by the blue line from the bottom left to top right of the figure,
are considered strong liquids.
The visibly convex curves are describes as fragile liquids. \
*Figure from @Lubchenko2007 used with permission © Annual Reviews*
](../00_Introduction/figures/angell.png){#fig:angell width=80%}

# Molecular Growth Rates

The crystal growth rates of molecular crystals
are two orders of magnitude slower than those of alloys
and six orders of magnitude slower than pure metals (@fig:growth_rates),
yet there is no understanding of why this is the case.
Understanding the crystal growth of these materials
is inherently tied to understanding the lack of crystal growth,
also known as glass formation. [@Berthier2011;@Cavagna2009]
Both the crystal, and amorphous glass have material applications in
organic molecules,[@Alba-Simionesco1999] metals, [@Wang2004] and phase-change materials [@Wuttig2007]

![Growth rates of a range of crystal structures
plotted as a function of temperature.
The upward arrows show the temperature at which
the crystal growth rate is maximum,
while the downward arrows indicate the glass transition temperature.
The data for silver is from molecular dynamics calculations
while all other results are from physical measurements. \
*Figure from @Orava2014 used with permission © AIP Publishing*
](../00_Introduction/figures/molecular_growth_rates.png){#fig:growth_rates width=80%}

The most notable and well studied molecular liquid is ortho-terphenyl,
chosen for having both an incredibly slow growth rate [@Orava2014]
and being a highly fragile liquid. [@Angell2000;@Chong2004]
There are many experiments on ortho-terphenyl,
[@Cicerone1996;@Andreozzi1997;@Chang1994;@Fujara1992;@Mapes2006]
using a range of techniques to better understand
the dynamics and the melting behaviour of the molecule.
Results of these experimental studies cannot be
described by our current theories of dynamics or crystal growth.
Experiments provide critical information
for confirming theoretical ideas,
providing specific information on a studied property.
Computer simulations provide time and spatial resolution
beyond those available in experiments
allowing for the development of ideas and theories.

# Modelling ortho-terphenyl

The experimental studies of ortho-terphenyl
are also supported by simulation studies,
with models using different levels of approximation.
These simulation studies have been important
in studying the microscopic processes,
guiding researchers to design new experiments
confirming or rejecting these computational results.
Computational modelling is important part
of the iterative process of;
making experimental observations,
designing simulations to understand them,
developing theories to describe them, and
designing experiments to test the theories,
for understanding natural phenomena.
There are a range of computational models of ortho-terphenyl
chosen depending on the goals of the research.

## Lewis-Wahnström model

The Lewis-Wahnström [@Wahnstrom1993] model of ortho-terphenyl
describes the complexity of the molecular shape
in a minimal structure of three rigid particles,
each corresponding to a benzene ring of the molecule.
Each particle interacts via the Lennard-Jones potential

$$ v(r) = 4 \epsilon \left[\left(\frac{\sigma}{r}\right)^{12} - \left(\frac{\sigma}{r}\right)^6\right] $$

where $\epsilon$ is a measure of the energy of the interaction,
while $\sigma$ is the distance of the interaction.
The Lennard-Jones potential is a standard interaction
within the field of Molecular Dynamics.
This model is not designed to perfectly capture
all the complex inter- and intra-molecular interactions of ortho-terphenyl,
rather it simplifies everything to focus on the shape of the molecule.
The Lennard--Jones potential approximates
the van-der Waals interactions of the Benzene rings,
while the three particles are arranged
with a side length of $\sigma$ and an angle of $75^\circ$,
shown in @fig:lewis_wahnstrom_mol.
While the Lewis--Wahnström model is highly simplified,
it retains many of the dynamic properties characteristic of ortho-terphenyl,
replicating experimental results.
The Lewis--Wahnström model displays the same two-step relaxation process [@Wahnstrom1993,@Wahnstrom1997,@Lombardo2006]
that is characteristic of fragile liquids in experiments.

![The geometry of the Lewis--Wahnström model,
with each circle representing a 3D Lennard--Jones potential.
There is an angle of \SI{75}{\degree} subtending the centers of the thee particles.
](../00_Introduction/figures/lewis_wahnstrom.svg){width=80% #fig:lewis_wahnstrom_mol}

The Lewis--Wahnström model of ortho-terphenyl is the most widely studied
computational model of ortho-terphenyl,
chosen for its relative simplicity.
In removing much of the complexity of the molecular system including;
the bond vibrations,
most of the molecular interactions, and
the torsional rotations of the benzene rings,
calculating the motion of the molecule
within a molecular dynamics simulation is significantly simpler.
The computational simplicity allows for
the simulation of long timescale phenomena,
describing both crystallisation and dynamics.
The removal of complexity does come with limitations;
simulations predict translational and rotational diffusion constants
three and seven orders of magnitude larger than experiments near 260 K. [@Lombardo2006;@Lewis1994;@Rinaldi2001]
This discrepancy comes from fitting the Lewis--Wahnström model
to the properties of ortho-terphenyl at a temperature of 400K. [@Lewis1994]

## Alternative Models

Alternative models of ortho-terphenyl
trade the computational simplicity of the Lewis--Wahnström model
with a more accurate description of the molecule.
While a more complex molecule limits the number of molecules
and the timescale of the simulation,
they can model interesting behaviours
like the flexing of the phenyl rings
that aren't present in the Lewis--Wahnström model.

Rather than describing each phenyl ring as a single particle,
@Mossa2001 simulate each carbon atom,
describing the geometry of the rings.
This models the effect of the phenyl groups
and the rotational freedom they have,
degrees of freedom not present in the Lewis--Wahnström model.
By comparing the results to the Lewis--Wahnström
we could start to understand the effect these
additional degrees of freedom have on the overall dynamics.
A limitation of this model,
is that it still uses the Lennard--Jones potential
to model intermolecular interactions,
requiring additional fit parameters
for describing intra-molecular motions.

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

# Improving Computational Tractability {#sec:computational_tractability}

Part of the issue of modelling glass formation in simulations
is the long timescales required to observe the behaviour.
Accessing these long timescales is possible though either
running simulations for a long period of time, or
simplifying the simulation to run each timestep faster.
The Lewis--Wahnström model is one such approach of simplifying a computational model,
using 3 particles to represent each molecule.
The number of particles within each molecule are important
because many molecules are required to simulate the liquid.
When modelling the dynamics of a liquid
the number of molecules used can influence the calculated properties,
with 500 being a recommended lower limit. [@Kikugawa2015;@Moultos2016;@Maginn2018]
This influence on the size of the simulation
is known as the finite-size effect
and results from the periodic boundary conditions
in which liquid simulations take place.
The finite size effects have been shown to change
dynamic quantities by more than 10%. [@Kikugawa2015]

Even though the Lewis--Wahnström model is heavily simplified,
there are still issue running simulations large enough to rule out
finite size effects. [@Pedersen2011]
And additionally there are still many open questions.
Using simulations in two dimensional space
is a technique which has already been used to great success
in understanding the dynamics of supercooled liquids. [@Hurley1995]
Performing simulations using two dimensional space
reduces the computational tractability in three ways.
Firstly the calculations are simpler having fewer degrees of freedom,
although there are also additional benefits
like fewer neighbour interactions to consider.
Additionally fewer particles are needed to remove finite size effects
since particles only extend in two dimensions.
Finally, data from 2D simulation is much easier to visualise,
being able to show all particles and interactions on a single figure.
Simulations of two dimensional space are a useful discovery tool,
providing efficiencies in computation,
and using visualisations to develop ideas and analyses
for use in more complex systems.
This approach of developing an idea in 2D
has been employed by @Griffith2018 in understanding
dense and jammed packing of Trimers,
using the lessons learnt in 2D [@Griffith2018]
as a building block for 3D systems. [@Griffith2019]

## Introducing the Trimer Molecule

The Trimer molecule is our simplification of
the Lewis--Wahnström model to two dimensions.
The Trimer molecule is comprised of;
a central particle which has a defined radius of $1.0$, and
two identical radial particles.
The radius of the radial particles is defined by the variable $r$,
while the positions are defined by
the distance $d$ from the center of the central particle,
and the angle $\theta$ between the centers of the two radial particles.
The Trimer model differs from the Lewis--Wahnström model
in the choice of all $r$, $d$ and $\theta$,
with the Lewis--Wahnström having $r=1$, $d=2$ and $\theta=75^\circ$,
compared to the Trimer using $r=0.637556$, $d=1$ and $\theta=120^\circ$.

![This shows the construction of the trimer molecule.
The variant used within this thesis has $d=1, r=0.637556,$ and $\theta=120^\circ$
](../01_Methods/figures/trimer.pdf){#fig:trimer}

# Project Outline

This thesis uses the Trimer molecule to investigate two problems
in the understanding of molecular liquids,
the dynamics of a fragile liquid close to the glass transition, and
the slow growth rates of molecular crystals.
This starts in @sec:Dynamics where we compare
the dynamics of the Trimer molecule
to that of the Lewis--Wahnström model and ortho-terphenyl,
finding our new model exhibits characteristic behaviours of molecular liquids.
This verifies the Trimer is a suitable model
for developing an understanding of molecular liquids.
As part of calculating the dynamic quantities for comparing with existing models
we establish reference timescales for molecular motion
used in @sec:Crystal_Melting and @sec:Melting_Behaviour.
Knowing the Trimer molecule exhibits
the dynamic behaviours of characteristic molecular liquids,
we use it in @sec:Glassy_Dynamics
to introduce a set of new dynamic quantities
allowing a molecular description of dynamics.
These tools describe the motions of individual molecules
providing a link between local environments and dynamics.
These new tools are then used to provide an insight
into what makes these liquids so fragile.
Having developed descriptions of the dynamics of the Trimer molecule,
we look to the problem of slow crystal growth.
The measurement of this growth and melting
first requires the development of new tools to measure this growth.
In @sec:Machine_Learning we introduce a new machine learning method
for the identification of the diverse range of crystal polymorphs
present in molecular liquids.
This chapter develops tools for the visualisation
of high dimensional data,
a clustering approach for identifying crystal structures present,
and a classification algorithm for the identification of crystals.
This new method allows for monitoring
local configurations throughout a simulation trajectory
identifying the presence of
crystalline structure within the liquid with a high accuracy.
The classification of crystal structures is developed for @sec:Crystal_Melting
and used to measure the melting rate of the Trimer crystal.
And the clustering is used in @sec:Melting_Behaviour
to check for the presence of crystal structures.
In @sec:Crystal_Melting we measure the melting rates of the trimer,
making a comparison to a range of theories of melting
to identify which aspects of these theories describe the observed results.
Modelling the different theories of crystal growth
requires the transport properties calculated in @sec:Glassy_Dynamics
and the thermodynamic properties calculated in @sec:Melting_Behaviour.
This chapter on crystal melting also introduces
our estimate for the melting point of the Trimer that is
used a reference temperature in this chapter,
and in @sec:Melting_Behaviour and @sec:Glassy_Dynamics.
Finally, in @sec:Melting_Behaviour
we analyse the melting of different polymorphs of the Trimer
to understand what makes the melting so incredibly slow.
In this chapter we compare polymorphs of the Trimer
to identify the most stable structure,
which is used in @sec:Crystal_Melting to calculate melting rates.
This chapter combines the analysis of timescales from @sec:Dynamics,
the newly introduced dynamics quantities in @sec:Glassy_Dynamics,
the melting rates from @sec:Crystal_Melting and
the classification and analysis from @sec:Machine_Learning
to provide a qualitative understanding of the slow crystal growth.

<!-- markdownlint-disable-file MD025 -->
