---
top-level-division: chapter
title: Introduction
---

Molecular solids have been an important part of our society for hundreds of years,
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
solid phase is from the melt. [@Shimura2012;@Shimura2017;@Harkonen2005]
Despite extensive study to understand molecular liquids,
there are two main aspects which are poorly understood,
the non-Arrhenius temperature dependence of the dynamics, and
the phenomenally slow crystal growth rates.
Understanding these properties will greatly aid
in the design and production of this wide range of molecular materials.

# Non-Arrhenius Temperature Dependence {#sec:intro_vtf}

The viscosity of many molecular liquids are shown in @fig:angell,
where values along the diagonal from bottom left to top right
describe an Arrhenius temperature dependence of the viscosity.
The highly non-Arrhenius temperature dependence of the viscosity
is an characteristic of molecular liquids.
The non-Arrhenius behaviour can be described by
the Vogel--Tammann--Fulcher[^vtf] (VTF) relation [@Debenedetti2001]

$$ \eta = A \exp(\frac{B}{T-T_0}) $$ {#eq:VTF}

[^vtf]: I have chosen to use Vogel--Tammann--Fulcher to describe this equation,
however, there seems to be significant disagreement within the literature
over the appropriate term to use.
@Debenedetti2001 use Vogel--Tammann--Fulcher to describe this relation, while
@Lubchenko2007 use Vogel--Fulcher to
and @Royall2018 uses Vogel--Fulcher--Tammann.
Furthermore, @Cummins1997 uses both Vogel--Fulcher and Vogel--Fulcher--Tammann within the same paper.

where $\eta$ is the viscosity (or another dynamic quantity),
$T_0$ is an extrapolated temperature found from fitting, and
$B$ is a parameter extrapolated from fitting.
The VTF relation allows for defining a quantity $m$, known as the *fragility*,
which describes how much the temperature dependence
deviates from an Arrhenius relation.
The fragility $m$ is given by;

$$ m = \frac{\d \log(\eta)}{\d T_g/T} \vert_{T=T_g} $$

being the slope at the glass transition temperature and
has values ranging from $\approx 16$ for strong liquids to 200 for fragile liquids. [@Bohmer1993;@Meenakshisundaram2019]
Ortho-terphenyl has a fragility $m=80$. [@Bohmer1993;@Schug1998]

![The viscosities of a range of liquids plotted against inverse temperature.
Substances with Arrhenius-like temperature dependence,
shown by the blue line from the bottom left to top right of the figure,
are considered strong liquids.
The visibly convex curves are describes as fragile liquids. \
*Figure from @Lubchenko2007 used with permission © Annual Reviews*
](../00_Introduction/figures/angell.png){#fig:angell width=80%}

The crystal growth rates of molecular crystals
are two orders of magnitude slower than those of alloys
and six orders of magnitude slower than pure metals (@fig:growth_rates),
yet there is no understanding of why this is the case.
Understanding the crystal growth of these materials
is inherently tied to understanding the lack of crystal growth,
also known as glass formation. [@Berthier2011;@Cavagna2009]
Many materials including
organic molecules,[@Alba-Simionesco1999] metals, [@Wang2004] and phase-change materials [@Wuttig2007]
have applications in both the crystal and amorphous glassy state.

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
These results of these experimental studies
are unable to be described by our current theories
of dynamics or crystal growth.
Experiments can provide critical information
in confirming theoretical ideas,
they provide a limited amount of information of the underlying
processes which take place.
Computer simulations provide time and spatial resolution
beyond those available in experiments
allowing for the development of ideas and theories.

# Modelling ortho-terphenyl

The experimental studies of ortho-terphenyl
are also supported by simulation studies,
with models using different levels of approximation.
These simulations studies have been important
in studying the microscopic processes
designing new experiments to confirm results.
Computational modelling is important part
of the iterative process of;
making experimental observations,
designing simulations to understand them,
developing theories to describe them, and
designing experiments to test the theories,
for understanding natural phenomena.
There are a range models of ortho-terphenyl which are used,
depending on the type of question being asked of the simulation.

## Lewis-Wahnström model

The Lewis-Wahnström [@Wahnstrom1993] model of ortho-terphenyl
describes the complexity of the molecular shape
in a minimal structure of three rigid particles,
each corresponding to a benzene ring of the molecule.
Each particle interacts via the Lennard-Jones potential

$$ v(r) = 4 \epsilon \left[\left(\frac{\sigma}{r}\right)^{12} - \left(\frac{\sigma}{r}\right)^6\right] $$

where $\epsilon$ is a measure of the energy of the interaction,
while $\sigma$ is the distance of the interaction.
close to the glass transition temperature.
The Lennard-Jones potential is a standard interaction
within the field of Molecular Dynamics.
This model is not designed to perfectly capture
all the complex inter- and intra-molecular interactions of ortho-terphenyl,
rather it simplifies everything to focus on the shape of the molecule.
The Lennard--Jones potential approximates
the van-Der Waals interactions of the Benzene rings,
while the three particles are arranged
with a side length of $\sigma$ and an angle of $75^\circ$,
shown in @fig:lewis_wahnstrom_mol.
While the Lewis--Wahnström model is highly simplified,
it retains many of the dynamic properties characteristic of ortho-terphenyl,
replicating experimental results.
The Lewis--Wahnström model displays the same two-step relaxation process [@Wahnstrom1993,@Wahnstrom1997,@Lombardo2006]
that is characteristic of fragile liquids in experiments.

![The geometry of the Lewis--Wahnström model.
There is an angle of \SI{75}{\degree} subtending the centers of the thee particles.
](../00_Introduction/figures/lewis_wahnstrom.svg){width=80% #fig:lewis_wahnstrom_mol}

The Lewis--Wahnström model of ortho-terphenyl is the most widely studied
computational model of ortho-terphenyl,
chosen for it's relative simplicity.
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

## Alternative Models

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

# Improving Computational Tractability {#sec:computational_tractability}

Part of the issue of modelling glass formation
is the long timescales required for the simulations.
By reducing the complexity of computational models
it becomes easier to access longer timescales,
why the Lewis--Wahnström model only comprises 3 particles.
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
Using only two dimensions reduces with computational tractability in a few ways.
Firstly the calculations are simpler having fewer degrees of freedom,
although there are also additional benefits
like fewer neighbour interactions to consider.
Additionally fewer particles are needed to remove finite size effects
since particles only extend in two dimensions.
Finally, the analysis of data in 2D is much easier to visualise.
One of the reasons @fig:dynamic_heterogeneities is used so widely
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

## Introducing the Trimer Molecule

The Trimer molecule is our simplification of the Lewis--Wahnström model
to two dimensions.
The Trimer molecule is comprised of;
a central particle which has a defined radius of $1.0$, and
two identical radial particles.
The radius of the radial particles is defined by the variable $r$,
while the positions are defined by
the distance $d$ from the center of the central particle,
and the angle $\theta$ between the centers of the two radial particles.

![This shows the construction of the trimer molecule.
The variant used within this thesis has $d=1, r=0.637556,$ and $\theta=180^\circ$
](../01_Methods/figures/trimer.pdf)

# Project Outline

This thesis uses the Trimer molecule to investigate two problems
in the understanding of molecular liquids,
the dynamics of a fragile liquid close to the glass transition, and
the slow growth rates of molecular crystals.
In @sec:Dynamics we establish that the Trimer molecule models
the dynamic behaviours of ortho-terphenyl and other fragile liquids,
making comparisons with experimental results.
Then in @sec:Glassy_Dynamics we use the Trimer molecule
to introduce a collection of new dynamics quantities
allowing for the understanding of dynamics at the molecular level.
These tools describe the motions of individual molecules
providing a link between local environments and dynamics.
These new tools are then used to provide an insight
into what makes these liquids so fragile
and the observed breakdown in the Stokes--Einstein--Debye dynamics.
In @sec:Machine_Learning we introduce a new machine learning methodology
for the identification of the diverse range of crystal polymorphs
present in molecular liquids.
This allows for monitoring the state of local configurations
throughout a simulation to identify the transition
between the crystal polymorphs and the liquid with a high accuracy.
This machine learning methodology is then used in @sec:Crystal_Melting
to characterise the melting rate of the Trimer crystal,
finding which aspects of theoretical models
are required to properly describe the melting rate.
Finally in @sec:Melting_Behaviour
we analyse the melting of different polymorphs of the Trimer
to understand what makes the melting so incredibly slow.

<!-- markdownlint-disable-file MD025 -->
