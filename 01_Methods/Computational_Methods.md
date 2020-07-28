# Computational Methods {#sec:methods_computational}

In the development of the software packages used within this thesis,
I have employed recommendations for high quality and reproducible code,
building upon the examples of others within the field
which are described in @sec:computational_methods
Each time I make a small change to one of my projects,
a Continuous Integration (CI) service will
run two static analysis tools, `pylint` and `mypy`
ensuring that these produce no warnings.
These static analysis tools enforce style on the code
that includes checking for functions that are too long and complicated.
The CI service will then run a suite of unit tests
running functions to ensure they produce the intended output.
The only guideline above not adhered to
is the review of the code by another engineer.
I have made the review possible by open-sourcing
all the code used for this thesis
with the details documented in @sec:software_projects.
The openness also extends to this thesis,
which is available on GitHub at [github.com/malramsay64/phd-thesis](https://github.com/malramsay64/phd-thesis)
and a near final version archived for 1000 years in the Arctic code vault. [@code_vault]
All figures within the thesis
are drawn from the projects from which they were created,
which contain the code and dependencies required to recreate them.
These projects are [Dynamics](https://github.com/malramsay64/Dynamics),
used for the results in @sec:Dynamics and @sec:Glassy_Dynamics,
[MLCrystals](https://github.com/malramsay64/MLCrystals) used to generate the results in @sec:Machine_Learning,
and [Crystal_Melting](https://github.com/malramsay64/Crystal_Melting)
used for the results in @sec:Crystal_Melting and @sec:Melting_Behaviour.
These three projects all make use three pieces of software
I have developed throughout my PhD that are for
managing variables in simulations (@sec:simulation_management),
running batches of simulations (@sec:running_simulations), and
analysing the results of simulations (@sec:simulation_analysis).
