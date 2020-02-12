# Glass Formation

Typically when describing states of matter
we describe an equilibrium state,
being the lowest energy state
at a set of conditions.
However, inherent in any experiment performed
is a timescale over which observations take place.
The pitch drop experiment [@Webb2014]
is an excellent example of how timescale
can affect our observations.
Over the course of minutes,
the pitch appears to be a solid,
with no perceived motion,
while on the timescale of tens of years
we observe the formation of droplets
characteristic of a liquid.

Now we have learnt about nucleation and growth,
we know how to avoid it.
In @fig:supercooled_liquid_formation,
a supercooled liquid is formed by following a cooling scheme
which remains between the relaxation time and the nucleation time.
A glass is a state no longer at equilibrium,
so where crystallisation is crossing the solid nucleation line,
glass formation is crossing the dashed relaxation line.
In experiments, the glass transition occurs
when the relaxation time, measured as the viscosity
reached a value of \SI{e13}{\poise}.
The temperature at which the viscosity reaches this value
is known as the glass transition temperature, denoted $T_g$.
In computer simulations a viscosity this high is beyond our current capability. [@Plimpton1995a]
Instead the glass transition occurs when the timescale of the simulation
is less than that of the relaxation time.
This also means that as computational power
and algorithms improve,
simulated materials which have been considered glasses
can form crystals on longer time scales.

## Intrinsic Properties of the Glass

The formation of a glass
is considered a kinetic phase transition,
there are no thermodynamic changes
indicating a first order phase transition
typically associated with freezing.
However, despite the glassy transition
being arbitrarily defined,
many materials display similar changes
in behaviour as they approach the glass transition temperature,
indicating an intrinsic property of materials.
The similarity of a range of materials
is best demonstrated with an Angell plot (@fig:angell_plot).

![The viscosities of a range of supercooled liquids
as a function of inverse temperature.
While the shapes of these curves have large variances,
from the *strong* liquids,
being those which have a linear relationship
to the *fragile* liquids displaying a highly
non-linear relationship,
each liquid has a significant change in the heat capacity
at the glass transition temperature. \
*Adapted with permission from @Lubchenko2007 © Annual Reviews*
](01_Introduction/figures/angell.png){#fig:angell_plot}

The most famous of the strong glass formers is \ce{SiO2},
where the polymerisation of the \ce{SiO2} polyhedra
give rise to a viscosity dependent on
the breaking of an Si---O---Si bond [@McMillan1994]
a constant energy process which means it obeys
an Arrhenius rate equation over the entire temperature range
corresponding to the straight line in @fig:angell_plot.
On the other end of the spectrum,
a well studied fragile glass former is ortho-terphenyl,
which has unlike \ce{SiO2} has a
strongly temperature dependent relaxation process.
The best understanding of this process
attributes the temperature dependence
to the onset of dynamic heterogeneities.
That is, regions of the liquid which have
vastly different relaxation times,
which can differ by up to five orders of magnitude.[@Ediger2000]

Because of the kinetic nature of the glass transition
understanding the dynamics is the key to understanding the transition.
