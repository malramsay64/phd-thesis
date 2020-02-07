# Thesis Structure

Title: Liquid Dynamics and Crystal Melting of a Two Dimensional Molecular Liquid

Abstract:

- Dynamic heterogeneities exist above the melting point
- Breakdown of Stokes--Einstein--Debye
    - Increasing length scale present in the jump dynamics
        - no longer Brownian in character over the distances of interest
    - Coupling of rotational and translational motions
        - no longer independent degrees of freedom
- Slow crystal melting a result of the confinement of the liquid phase

## Introduction

- Crystal Growth and Melting => General overview of the field and basic assumptions
    - Growth theory => This is the theory we are using within the thesis
        - Classical Growth theory => Activated process
        - Wilson--Frenkel => Dynamic process
    - Nucleation theory => required for Understanding the formation of a supercooled liquid
- Supercooled liquids
    - State of matter => what is it and why is it important for glasses
    - Relationship to nucleation time => metastability
- Glass Formation
    - Properties of the glass => Heat capacity
        - Equilibrium properties => temperature and pressure
        - Strong and fragile liquids => Why do these liquids display this behaviour
        - Timescale dependent in simulations => materials which were considered glasses previously will
          crystallise
    - Glass formation is related to slow crystal growth => good glass formers are slow
      crystal growers
        - growth rates of OTP and other crystals
- Dynamics in Supercooled Liquids => display interesting behaviours
    - Introduction to theories of liquid dynamics
        - Built upon Brownian motion => small infinitesimal jumps
        - Diffusion constant => long time relaxation
        - Structural relaxation => short timescale
        - Rotational relaxation => measured as a dipole relaxation
        - Stokes--Einstein--Debye relations => brining these quantities together
    - Dynamic Heterogeneities => Supercooled liquids are unusual
    - Breakdown in Rotational Coupling

- Computational modelling of supercooled liquid dynamics
    - Abstract models show the same properties as experiments making them useful
    - Complex computer models have their own downsides
    - There are still computational issues in current models
    - Using 2D systems for simplifying computations

### Project Goals

- What are the deficiencies in existing theories and what am I trying to achieve?
    - What differentiates ortho-terphenyl as a fragile liquid from the strong liquids
      like SiO2
    - Molecular glasses are fantastically slow at crystallisation, can we understand
      what might be contributing to that process

## Computational Methods

- Care is required when using computer modelling
- Important for complex projects

### Best Practices for Computational Methods

- Correctness
- Reproducibility
- Literate programming

- The code and data for this project, including the entire history is available at ...
- Followed these best practices

### Molecular Dynamics Methods

- Choice of simulation program
- Molecular Definition
- Reduced units => Including conversion to ortho-terphenyl
- Calculating Distance
    - Periodic distances
    - Integrated distances
    - Rotational representations and distances
- Quaternion Operations
- Random Numbers

### Calculation of Dynamics Quantities

- Data collection => Timesteps and how data was collected
- Wavenumbers/Structure factor/structural relaxation
- MSD => Diffusion Constant
- Heterogeneous dynamics
- Rotational Relaxation => rotational relaxation time
- Structural Relaxation =>  structural relaxation time
- Molecular relaxation quantities

### Machine Learning Methods

- Supervised Learning
    - Labelling datasets
    - Types of classifiers
    - Cross Validation
- Dataset creation
    - simulations
    - labelling
- Unsupervised Learning
    - Approach to clustering

### Measuring Crystal Melting

- Crystal detection
- Creation of an interface
- Calculation of melting rates
    - spatial clustering
    - convex hull for surface area and volume
- Finding the melting point

### Simulation Conditions

- Dynamics
- Machine Learning
- Crystal Melting

## Dynamics

### Introduction to Dynamics

- Measuring structural relaxation => why I am using these quantities
    - How this is done in experiments
    - Replications in simulations
    - Further simplifications
- Rotational diffusion => what makes these quantities useful
    - Measurement using spherical harmonics
    - Jump dynamics => experimental grounding
- Dynamics in experiments => linking simulation results to those from experiments
    - relationships found from experiments
    - All in supercooled liquids
    - Decoupling of rotations and translations
- Theory of dynamics
    - Different theories to explain observations
    - Length scale is important

#### Dynamics Key Results

- The 2D molecular liquid exhibits the same behaviour as theory and experiments predict
- Dynamic heterogeneities above the melting point
- Length scale of dynamics increases => jump dynamics over short time/length scales
- Coupling of rotations and translations => SED assumes independent
- Relaxations of individual molecules provide important insights

### Dynamics Results

- Structural Relaxation
    - Trimer is a Fragile liquid => strongly fragile
        - comparison to studies
    - Estimation of glass transition temperature
    - Contribution of individual particles
- Diffusion => normal though fragile
- Rotational Relaxations => normal but fragile

- Summary

### Dynamic Heterogeneities

- Translational heterogeneities
- Rotational heterogeneities

- Rotations and translational heterogeneities are colocated spatially

### Molecular Relaxations

- These match their counterparts

### Jump Dynamics

### Translational and Rotational Coupling

### Dynamics Conclusion

- The 2D molecular liquid exhibits the same behaviour as theory and experiments predict
- Dynamic heterogeneities above the melting point
- Length scale of dynamics increases => jump dynamics over short time/length scales
- Coupling of rotations and translations => SED assumes independent
- Relaxations of individual molecules provide important insights

## Machine Learning

- overview of problem machine learning is solving
- why existing techniques are not adequate

### Introduction to Machine Learning

- What differentiates machine learning from statistics
- Classification problems => Supervised learning
- Unsupervised classification => Unsupervised learning
- Introduce Jargon

#### ML Key Results

- Unsupervised learning is a process allowing for the identification of regions of local
  structure which are locally favoured
- Supervised learning is a suitable method for crystal detection and monitoring

### Machine Learning Results

- Unsupervised learning trimer
    - Referred to as clustering
    - what clusters are formed
    - how well do they match the crystal polymorphs
    - what other structures are found

- Supervised learning trimer
    - 'simple' methods

### Machine Learning Conclusion

- Unsupervised algorithms are a useful tool for identifying interesting local
  structures within a simulation
- Supervised algorithms were highly suited to monitoring regions of crystal to measure
  melting and growth

## Crystal Melting Rates

### Introduction to Crystal Melting

- Crystal Growth in glass formers
    - Examples of OTP and others
- Potential reasons for slow growth rates
- Theories of Crystal Growth/Melting
    - Turnbull => no diffusion limiting/thermal activation
    - Wilson--Frenkel => Diffusion limited, activated
    - Density functional methods

### Crystal Melting Results

- An estimation of the melting point
    - Needed for melting models
    - Timescale
    - Estimation => upper bound
    - estimation of spinodal point

- Melting rates
    - Measured rates of melting

    - Modelling with different methods
        - Fit Turnbull model
        - Fit Wilson--Frenkel model
        - Fit SEDF model

- Why is melting so slow?
    - Comparison to other materials
        - OTP
        - LJ

## A Qualitative Understanding of Melting

### Introduction to Melting Behaviour

### Results

- No melting
- Correct crystal structure
    - Clustering analysis
    - packing analysis
- Instead refocus on crystal growth

- What happens when they melt
- polymorphic stability
    - Unusual behaviour of p2gg => solid state phase transition
    - pg => asymmetric growth
        - Observed in other materials
        - Density difference

- Defect creation and propagation
    - What different types of defects look like
    - How the crystal handles defects

- Solid state behaviour
    - How this motion compares to the melting rate
    - Defects are important in mobility

- What can defects tell us about melting/growth
- Is this a pathological property of 2D systems

## Conclusion

## Appendices

### Project Structure

#### Introduction to Project Management

- Why a structure is necessary
- Best practices for project structure
- Data Science project
- Reproducibility

#### Implementing Project management

- Why this structure
- Projects are available on GitHub
- data management

### Software Development

- What makes good software
    - Reference to JOSS guidelines
    - Other best practice resources
- Testing code
    - How the various pieces of code I am using are tested
- Testing of simulations
    - Physical testing -> are the physics right

### Software

- Installation instructions
    - How to replicate project
- Software packages I have developed
    - Include README
    - links to documentation, package, Zenodo, and repository
- Software packages I have used
    - Specific version numbers
    - links to documentation, package, Zenodo/GitHub release, and repository

## Additional Ideas

- Simulations of 3D systems
    - Only part missing is the crystal structures
    - Rotational distance handled by quaternions
    - intrinsic distance
