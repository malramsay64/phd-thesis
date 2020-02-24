# Supercooled Liquids

## For Pedestrians

These are notes from Andrea Cavagna's review Supercooled Liquids for Pedestrians
[@Cavagna2009]

- Glasses are a distinctly kinetic effect, when the liquid falls out of equilibrium

Kinetic Spinodal $T_{sp}$
    ~ The temperature at which the the crystal nucleation time becomes shorter than the
        liquid relaxtion time.
    ~ A temperature below which an equilibrium supercooled liquid cannot exist due to
        the formation of the crystal phase.
    ~ Temperature at which spontaneous crystallisation takes place

Glass Transition Temperature $T_g$
    ~ The temperature below which the relaxtion time exceeds the experimental
        observation time
    ~ The temperature below which the equilibrium supercooled liquid cannot exist due to
        the relaxtion time being too long.

Goldstein's Temperature $T_x$
    ~ The temperature below which the dynamics is an activated process

Kauzmann's Temperature $T_k$
    ~ The theoretical point at which the liquid entropy becomes equal to that of the
        crystal.

Strain $u_{xy}$, $\gamma$
    ~ A displacement of a sample by some small distance

Stress $\sigma_{xy}$
    ~ The additional energy from an applied strain

Elastic Shear Modulus $G$
    ~ $\sigma_{xy} = Gu_{xy} = G\gamma $
        where $\sigma_{xy}$ is the stress, and $\gamma$ is the strain
    ~ The scaling factor by which an induced strain creates stress
    ~ This is a property of a solid, which doesn't change over time

Time-Dependent Shear Modulus (linear stress-relaxtion function) $G(t)$
    ~ A function tracks the change in the Shear Modulus over time
    ~ A property of a liquid, which will partially relax stress
    ~ In a liquid $G(t) -> 0 \text{as} t -> \inf$

Shear Relaxation Time $\tau_R$
    ~ The time for a stress appplied to decay

Homogeneous Nucleation
    ~ Nucleation arising from the thermal fluctuations within the liquid

Heterogeneous Nucleation
    ~ Nucleation which occurs due to impurities or boundaries
    ~ This is typically significantly faster than homogeneous nucleation

Nucleation Time

## Important Equations

The Maxwell model provides the following model of relaxation of stress,
$$ G(t) = G_\inf \exp(-t/\tau_R) $$
where $G_\inf$ is the infinite frequency (zero time) shear modulus.

For Maxwell Liquids it is possible to get relationship between
viscosity, relaxation time and shear modulus,
$$ \eta = G_\inf \tau_R $$

## Glasses

When going off equilibrium, as in the case of the glass,
we sharply cut the number of degrees of freedom accessible to the system.
This causes a chart drop (up to a factor of 2)
of the constant pressure specific heat $c_p$ at $T_g$.

### Jamming Transition

@vanHecke2010
@Torquato2010

An alternative structural model of the supercooled liquid
is the idea of the jamming transition
which is adapted from an understanding of granular materials.
[@Silbert2002;@Cates1998;@Cates2005;@Liu2010;@Torquato2010;@vanHecke2010]
A particle is considered jammed
when the number of contacts
is enough to restrict all the degrees of freedom,
this is known as *isostatic* jamming
with the requisite contact count $z_\text{iso}$ being

$$ z_\text{iso} = 2d_f $$

where $d_f$ is the number of degrees of freedom
available to a molecule ($d_f=3$ for our trimer).
When a molecule is jammed,
there are no degrees of freedom available
meaning it is unable to move.
Using contact numbers is notable
for concave shapes like the Trimer molecule
as the concavities allow for contact numbers
well above $z_\text{iso}$. [@Jennings2015]

The concept of jamming also applies to rotational motion
where @Zwanzig1987 considers a liquid of 2D gears.
Once three gears come in contact with each other,
they are no longer able to rotate.

### Geometric Frustration

Building upon some of the ideas of the jamming transition
is a model of geometric [@Frank1952] or packing [@Tarjus2005;@Kivelson1995] frustration.
This considers small regions of the liquid,
which form structures that minimise the local free energy,
however these structures are then unable to tile space.
This gives small regions of favourable local structure
which are highly favourable and unlikely to diffuse.

This idea of geometric frustration is notable for the Trimer molecule,
as there are a range of crystal structures it can take on. [@sec:stability-of-crystal-phases]
