# What makes Crystal Growth Slow

One of the main goals of this thesis
was to understand the slow crystal growth associated with glass formation.
The observation of crystal growth was notably lacking from @sec:Crystal_Melting,
being slower than we could observe within a simulation.
Unexpectedly slow growth of a crystal has been observed in many different scenarios,
with each having a slightly different cause.
This chapter looks at some of the existing analyses of
anomalously slow crystal growth
to see if they apply to the Trimer molecule.

## Interfacial Region

Studies measuring the growth rate
on different surfaces of the same crystal
have observed rates that can vary by three orders of magnitude. [@Reinhart2018;@Burke1988]
With all surfaces having the same thermodynamic properties
there must be some structural component
which could explain the discrepancies in growth.
In simulations of triblock Janus particles,
@Reinhart2018 found growth suppression on
the (110) face of a Body Centered Tetragonal (BCT) crystal
and on the (100) and (111) faces of a perovskite crystal.
In these cases of suppressed growth,
the liquid--crystal interface is a smooth surface,
all belonging to the same layer of the crystal.
The growth along these layers can be described by
the time for the nucleation of a new layer
being much slower than the in-plane rate. [@Markov2003]
When described by an order parameter,
drawn from the crystalline to the liquid region,
a smooth surface will have an abrupt change in the order parameter,
with one layer being crystalline and the next being liquid.
This type of interface region can be described as narrow.
In a study of two alloys (\ce{CuZr} and \ce{NiAl}) with similar crystal structures
@Tang2013 find that the width of the interface region
is important for describing the growth rates.
The growth rate of \ce{NiAl} is an order of magnitude faster
than that of \ce{CuZr},
with the main difference being
the ordering of the liquid in \ce{NiAl} over
many atomic diameters near the crystal interface.
Further research to understand
the importance of the liquid--crystal interface
has found a large interface width
to be important for fast Turnbull type growth. [@Sun2018a]

## Competing Structures

An additional factor responsible for slow crystal growth
is the presence of competing structures
within the liquid and the crystal.
This is notable for the Trimer molecule
with the three polymorphs we are studying.
Simulations measuring growth rates of the Face Centered Cubic (FCC) crystal
have found the (111) face of the crystal to be much slower than
the (100) or (110) faces. [@Sun2004;@Celestini2002;@Ramakrishnan2017;@Broughton1982a]
The current understanding is that there are two degenerate sites a particle can occupy,
one resulting in a Hexagonal Close Packed (HCP) stacking and another resulting in an FCC stacking.
Particles will initially occupy either of these sites
which then grow islands of competing structures.
While it is possible for these islands of stacking faults to anneal over long timescales [@Pronk1999]
the crystal growth is slowed as these rearrangements take place.
In the same way that competition between the HCP and FCC crystal structures
provides competition in hard spheres, [@Gasser2009;@Gasser2001]
it has been theorised that small free energy differences between crystals
interfere with the formation of large single crystals of tri-block Janus colloids. [@Reinhart2018]
By designing a colloid with a single low energy crystal structure
@Romano2012 were able to grow single crystals much faster
and with significantly fewer defects.

Competing structures don't only occur in the freezing transition,
they can also occur in the melting transition.
The solid, Acetaldehyde Phenylhydrazone has been found to have
two different melting points,
one at \SI{56}{\degreeCelsius} and the other at \SI{80}{\degreeCelsius}. [@Lockemann1905]
The two melting points can be chosen
by adding trace amounts of acid or base to the crystal.
After much investigation and characterisation,
@Bernades2019 find the difference in melting points
originates from the same crystal melting to two different liquids.
The difference between the A/Z-isomer ratio in the crystal and liquid
results in the crystal melting to a metastable liquid at the lower temperature.
Trace amounts of base catalyse the isomerisation
allowing for melting to the equilibrium liquid.
While this is an unusual example,
it does highlight the range of possibilities
when understanding the transition between the liquid and solid phase.

## Goals

The primary goal of this chapter is to establish
the most stable polymorph of the Trimer molecule
which can be used to study growth and melting.
In @sec:static_analysis, we start with
a revisit of some of our assumptions about our crystal structures,
followed by an analysis of the configurations,
looking for additional structures we haven't considered.
This is followed in @sec:polymorphic_stability by
an analysis of the melting dynamics of each crystal structure,
looking at their stability and identifying competition between structures.

The simulation conditions used to generate the results
in this chapter are described in @sec:methods_melting.
The crystal structures that make up the initial states
are given in @fig:trimer_cyrstals,
and simulations of melting contain 4032 molecules
half of which are initially in a crystalline configuration.
