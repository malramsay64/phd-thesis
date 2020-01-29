# Conclusion

Machine learning is a valuable tool
for the understanding of crystal structures in molecular dynamics simulations.
This is shown using clustering in @sec:clustering
to find local structures which are highly stable,
that is highly occupied.
The identification of these structures within additional configurations
can then be done using supervised learning,
shown in @sec:supervised_learning.
However most important to machine learning
is the understanding of the data being used,
whether that is finding a description of the local structure
which best describes the differences
between the states of interest.
This allows for simpler models
which are both faster to compute
but also more understandable and describable.

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
