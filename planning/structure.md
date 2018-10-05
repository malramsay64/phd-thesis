# Thesis Structure

Title: A vocabulary of motion: Understanding the melting and growth of molecular crystals.

Abstract:

## Introduction

## Section I: Computational Methods

### Introduction

### Methods

- Molecules

    - Molecular Definition (Geometric)

        - Types of molecules
        - Degrees of freedom

    - Simulation of Rigid molecules

        - Force calculation
        - Integration using COM

- Quaternions for Rotations

    - Introduction to quaternions
    - Rotational distances with quaternions
    - Computing rotational distance

- Exponential Step Series

    - Dynamics on many timescales
    - Small steps -> too much data, large steps -> no detail
    - Linear region + exponential increase in step size

- Periodic Distances

    - Minimum image convention
    - Dealing with tilted simulation box

- Data Visualisation

    - Encoding of rotational information
    - Investigate large and small scale at the same time
    - Key element of 2D systems is being able to see entire simulation
    - Web interface to large datasets
    - Share results without sharing large files

- Dependency Management

    - Ensuring the software running is the same I know it works with
    - Updates can break things
    - Old versions lack functionality

- Experi

    - Management of HPC jobs
    - Record of experiment conducted
    - Easily update and only run

- Using university resources (RDS, Artemis, Argus, VM)

    - Combining the resources to do useful research
    - Each has their own strengths and limitations

## Section II: Liquid Dynamics

### Introduction

### Methods

- Dynamics Quantities

    - MSD
    - Rotational Relaxation
    - Structural Relaxation
    - Gamma

- Relaxation Quantities

    - Diffusion constant
    - Rotational relaxation time
    - Structural relaxation time

- Particle Dynamics Quantities

    - particle structural relaxation
    - last passage time
    - particle diffusion
    - particle rotation

### Results

- Characterisation of trimer dynamics using methods

### Discussion

- Comparison of dynamics to other existing literature results
- Noting of interesting behaviour
- Is this an artefact of 2D dynamics
- Develop characteristic timescale for melting

## Section III: Detecting Crystal Structures with Machine Learning

### Introduction

### Methods

- Measuring success

    - confusion matrices
    - accuracy
    - precision
    - Recall
    - F1 score
    - false positives/negatives

- Supervised Learning

    - Labelling datasets
    - Types of classifiers
    - Cross Validation

- Dataset creation

    - simulations
    - labelling

- Unsupervised Learning

    - Approach to clustering

### Results

- Supervised learning trimer

    - 'simple' methods
    - neural networks

- Unsupervised classification trimer

    - what clusters are formed
    - how well do they match the crystal polymorphs
    - what other structures are found

### Discussion

- need for complicated metrics
- over-fitting
- How suitable is unsupervised classification to this problem

## Section IV: Crystal Melting

### Introduction

### Methods

- Crystal detection
- Creation of an interface
- Calculation of melting rates

    - spatial clustering
    - convex hull for surface area and volume

- Finding the melting point

### Results

- Machine Learning is necessary for crystal detection

    - Solid state phase transition
    - comparison with existing methods

- Melting rates

    - Proportional to characteristic dynamic quantity

- An estimation of the melting point
- Defect creation and propagation

    - What different types of defects look like
    - How the crystal handles defects

### Discussion

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

#### Introduction

- Why a structure is necessary
- Best practices for project structure
- Data Science project
- Reproducibility

#### Methods

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
    - links to documentation, package, zenodo/github release, and repository

## Additional Ideas

- Simulations of 3D systems

    - Only part missing is the crystal structures
    - Rotational distance handled by quaternions
    - intrinsic distance
