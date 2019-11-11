# Understanding ortho-terphenyl

## Experimental understanding

@Cicerone1996

- Probe translational motion at $T_g$ occurs 2 orders of magnitude faster than expected
based on rotation times.
- Probe Rotation times are dominated by the dynamics of slowly relaxing regions while
  translational diffusion coefficients are heavily influenced by the more mobile
  regions.

- excellent glass former
- experimentally interesting
- experiments only provide so much insight

## Modelling ortho-terphenyl

There are many different levels of approximation
for computationally modelling ortho-terphenyl,
with each looking at different properties.

### Lewis-Wahnström model

The Lewis-Wahnström [@Wanstrom1993] model of ortho-terphenyl
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

\begin{figure}
    \begin{tikzpicture}[scale=2]
        \draw (0, 0) circle (0.5) coordinate(x);
        \draw (0.602, 0.793) circle(0.5) coordinate(y);
        \draw (-0.602, 0.793) circle(0.5) coordinate(z);
        \draw (x) -- (y) node [midway, below] {$\sigma$};
        \draw (x) -- (z) node {};
        \pic [draw, ->, angle radius=1.2, "$75^\circ$"] {angle = y--x--z};
    \end{tikzpicture}
\end{figure}

While this model is highly simplified,
it still retains many of the characteristics of ortho-terphenyl,
replicating behaviour observed in experimental data.
The incoherent scattering function $F^s(q, t)$
displays the same two step relaxation process
observed within simulations
for both translational and rotational motion.[@Wahnstrom1993,@Wahnstrom1997,@Lombardo2006]
This has allowed investigations of dynamic heterogeneities,
which are typically associated with translational motion
to be applied to rotational motion[@Lombardo2006]
which has similar non-Gaussian behaviour at short times.
It also allows the crystallisation behaviour to be studied. [@Pedersen2011]

The Lewis-Wahnström model is a computationally simple method
of modelling the behaviour of ortho-terphenyl.
Importantly it mimics the shape,
a property of molecular glass formers.
There are also some limitations of the model,
with the primary limitation being
the prediction of diffusion constants,
with simulations finding
translations diffusion constants three orders of magnitude
rotational diffusion constants seven orders of magnitude
larger than the experimental values near 260 K. [@Lombardo2006;@Wahnstrom1994;@Rinaldi2001]

### Alternative Models

Alternative

@Mossa2001

@Berry2006

Molecular-LJ
Molecular potentials

Computational complexity

- glass formation is a long timescale phenomenon
- state of the art is reaching ms times
- glasses are on the order of 1000s

## What makes OTP such a good glassformer

The question we are really asking is why is crystallisation so slow?

Factors inhibiting crystal growth

- Crystal with low potential energy saving
- interface
- competition from competing structures
- jamming

Just like @Griffith2018 initially developed an idea in 2D
before moving to 3D.[@Griffith2019]

## Computational Tractability in 2D

- Finite size effects
    - issues with previous simulations
    - need fewer particles in 2D
- Visualisation
    - 2D page, so 2D is simpler
- Method used previously for understanding glass formation [@Hurley1995]
