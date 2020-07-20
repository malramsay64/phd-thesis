# Conclusion {#sec:conclusion_ml}

Machine learning is a valuable tool that can be used
for the understanding of crystal structures in molecular dynamics simulations.
In this chapter we have demonstrated two of the ways
in which it can be used.
The first being clustering,
where in @sec:clustering we showed a method for identifying
the range of structures present in a series of configurations.
The only prior knowledge used
was an appropriate method of describing the local configuration
which we developed using visualisation tools in @sec:visualisation.
Clustering was able to identify the range of structures
we generated to test the algorithm which we manually labelled.
The manually labelling of the structures allows these structures to be used
to train a supervised learning algorithm.
Supervised learning is the second use of machine learning in this chapter,
in @sec:supervised_learning for tracking the presence of these structures within a simulation,
used for understanding the transition between each state.
However most important to machine learning
is the understanding of the data,
whether that is finding a description of the local structure
that best describes the differences between the states of interest
or ways to simplify the high dimensional data.
Understanding the data allows for simpler models
that are both faster to compute,
a very important factor when considering millions of local configurations,
and also more understandable and describable.

An extension of this work is the validation of this method
on a wide variety of molecular shapes.
This would involve the process of generating crystal structures
using the isopointal search technique [@Hudson2011]
and following the methodology used here
for creating the liquid and crystal configurations.
For molecular crystals with less orientational ordering,
additional parameters may be needed to completely describe
the crystal structures.
It is envisioned that the limitations of orientational ordering
would be most noticeable in 3D, requiring additional features.
However, it is possible this method can be generalised
to have a set of features which works for most molecules,
only requiring training to be useful for monitoring growth.
