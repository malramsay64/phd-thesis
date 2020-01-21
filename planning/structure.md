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

- Crystal Growth and Melting
    - Growth theory
    - Nucleation theory
        - required for the formation of a supercooled liquid
- Supercooled liquids
- Glass Formation
    - Properties of the glass
    - Dynamics
- Understanding dynamics in ortho-terphenyl

- What are the deficiencies in existing theories and what am I trying to achieve.

## Computational Methods

- Correctness
- Reproducibility
- Literate programming

### Methods

- Molecular Definition
- Calculating Distance
- Choice of simulation program
- Random Numbers

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
    - MSD
    - Rotational Relaxation
    - Structural Relaxation
    - Gamma
- Machine Learning
- Crystal Melting

## Dynamics

### Introduction to Dynamics

### Dynamics Results

- Comparison of dynamics to other existing literature results
- Noting of interesting behaviour
- Is this an artefact of 2D dynamics
- Develop characteristic timescale for melting

## Machine Learning

### Introduction to Machine Learning

### Machine Learning Results

- Unsupervised classification trimer
    - what clusters are formed
    - how well do they match the crystal polymorphs
    - what other structures are found

- Supervised learning trimer
    - 'simple' methods

## Crystal Melting

### Introduction to Crystal Melting

### Crystal Melting Results

- Machine Learning is necessary for crystal detection
    - Solid state phase transition
    - comparison with existing methods
- Melting rates
    - Proportional to characteristic dynamic quantity
- An estimation of the melting point
- Defect creation and propagation
    - What different types of defects look like
    - How the crystal handles defects
- Melting rate behaviour
    - Why is crystallisation so slow
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
    - links to documentation, package, zenodo, and repository
- Software packages I have used
    - Specific version numbers
    - links to documentation, package, Zenodo/GitHub release, and repository

## Additional Ideas

- Simulations of 3D systems
    - Only part missing is the crystal structures
    - Rotational distance handled by quaternions
    - intrinsic distance
