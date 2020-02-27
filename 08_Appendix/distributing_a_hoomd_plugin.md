# Distributing a Hoomd Plugin

2018-06-03

A piece of software I have been using in my reasearch is [Hoomd][],
a 'relatively' new package for running Molecular Dynamics (MD) simulations.
These MD simulations have the basic premise of
throwing hundreds of balls into a box and shaking it
to find out what happens.
The relative newness of Hoomd
is in comparison to other software packages like [LAMMPS][] and [GROMACS][]
which have been around for decades,
while the initial release of Hoomd was in 2012.
There are some major benefits of a newer approach to MD simulations
and Hoomd is most notably designed to leverage the computational power of GPUs.
Despite the benefits of a modern approach,
Hoomd doesn't have the range of built-in simulation types
of the more mature software packages.
To allow researchers with specific problems to still use Hoomd,
it has a plugin architecture
to simplify the implementation of custom functionality.

This article documents how I took a plugin I wrote for my research
and made it installable in a conda environment alongside Hoomd.


## The Plugin

The example plugin is one which I have written for my own research.
It implements a harmonic pinning potential on the
positions and rotations of rigid bodies
in a MD simulation.
The complete plugin is available for reference on [GitHub][hoomd-harmonic-force].

To get started writing your own plugin
there is a short guide in the [documentation][hoomd-plugin-docs]
which directs you to the `example_plugin` in the Hoomd source code.
This code is located on [bitbucket][hoomd-bitbucket] and there is also a copy on [GitHub][hoomd-github].
I also found that finding a class that shared the same base class was useful for writing the implementation.

## The Makefile

The example code for the `example_plugin` doesn't include a `Makefile`,
requiring multiple steps to compile the plugin.
A Makefile is useful in this case for
both being able to install with a single command
and ensuring the install options are consistent with the conda installed Hoomd.

While my plugin doesn't use CUDA for calculations,
for compatibility with the conda installed Hoomd
enabling CUDA on Linux is required.
When I was compiling with CUDA disabled I came across unusual behaviour,
for example numbers being far too large, which appeared to be a buffer overflow.
I believe this is because of conditional definitions in the header files
resulting in a slightly different memory layout
for a class defined with or without CUDA.

If you are able to build your plugin using `cmake` like the example plugin,
the following Makefile will make compilation simpler
and set the appropriate flags assuming Hoomd was installed using conda.

```makefile
build_dir = build

# Check OS to determine if CUDA is enabled, defaults to True
CUDA_ENABLED=True
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	CUDA_ENABLED=True
endif
ifeq ($(UNAME_S),Darwin)
	CUDA_ENABLED=False
endif

all: $(build_dir)
	cd $(build_dir); cmake .. -DENABLE_CUDA=$(CUDA_ENABLED)
	$(MAKE) -C $(build_dir)

install: all
	$(MAKE) -C $(build_dir) install

clean:
	rm -rf $(build_dir)

test:
	pytest

$(build_dir):
	mkdir -p $@

.PHONY: test clean
```

Apart from making it simpler to install the package manually,
it also makes it simplifies the build using conda.

## Packaging

The conda package manager is the recommended method of installing Hoomd,
primarily because of the simplicity of installation.
Conda allows you to upload your own packages for anyone to download,
which is how we are going to make this plugin simple to install.

To define the package for upload to the [Anaconda Cloud][] repository
we have to write a `meta.yaml` file.
This defines everything required to build the package including;
the package details,
where to find the source code,
dependencies required to build the package,
dependencies to install the package, and
how to build the package.
There is [extensive documentation][meta.yaml documentation] for the `meta.yaml` file
which covers a variety of use cases.
The file uses the [yaml][] syntax,
which is a method of encoding python data structures
in a more human readable format.

The `meta.yaml` file contains a series of sections
each containing different information about the package.
Some of these keys are;

- `package`,
- `about`,
- `source`,
- `dependencies`, and
- `test`.

The documentation link above contains more extensive information on the options available for each
of these sections. I am going to explain how I have used all the different sections to create this
plugin.

The `package` key contains the name and version of the package. This section is
compulsory, while all others are optional, although that doesn't mean they
aren't required.

```yaml
package:
    name: hoomd-harmonic-force
    version: 0.1.7
```

The `about` key is where you can find more information on the package, including the
homepage and the license the package uses. In this case the homepage is a link to the Github
repository.

```yaml
about:
  home: https://github.com/malramsay64/hoomd-harmonic-force
  license: MIT
  license_file: LICENSE
```

The `source` section defines where to find the source code for the build phase. I have specified
a specific tag from the git repository, enabling me to checkout an old commit to build an older
version.

```yaml
source:
  git_url: https://github.com/malramsay64/hoomd-harmonic-force.git
  git_rev: v0.1.7
```

Another useful option for the `source` section is use the `path` key. This key
allows for the specification of the relative (or absolute) path to the source
code. This is most useful in the development process, allowing for quickly
testing whether a change has worked.

```yaml
source:
    path: ./
```

The next section is the `requirements`, defining both the packages required for
the build phase, and those required when the package is installed. These package definitions
include the specification of compatible versions of the dependencies. The version specification
is flexible enough for complex build processes, while also having the option for simplicity.
In this guide I describe the simplest method of version specification. When you need something more complex,
the documentation on [build variants][conda-build-variants] covers a wide range of use cases.

The build requirements are all the programs required for the build; in this
case compilation with `cmake`. Since we are building a python module we require
both python and setuptools. I am using python 3.6, so have set the python
version to `3.6.*` which means any point release of python 3.6, at the time of
writing being 3.6.5. The numpy and Hoomd dependencies are also requirements of
the build process, for which I have specified the latest versions. For python,
numpy and Hoomd you can specify the versions you use for your work. Where you
use multiple versions, like python 2.7, 3.5, and 3.6, the start of the [build
variants documentation][conda-build-variants] has examples to adapt. The next
dependency, cudatoolkit, is not strictly necessary in this case, however before
Hoomd v2.2.5 there was a typo in the Hoomd version specification allowing
a newer incompatible version to be installed. The final requirement, `cmake`,
builds the package and while you might have it installed on your system
already, someone else may not. It should be noted that the `nvcc` binary is
also required on linux which I can't find a conda package for.

```yaml
requirements:
  build:
    - python 3.6.*
    - setuptools
    - numpy 1.14.*
    - hoomd 2.3.*
    - cudatoolkit 8.*
    - cmake >=2.8.0
```

With the build dependencies specified, we need to specify the run dependencies.
Version numbers under the [semantic versioning][] scheme have a format of
`<major>.<minor>.<patch>`. Version numbers with the same major and minor
numbers are typically compatible which is why I have specified the run
requirements with the same minor version as the build requirements. I have come
across previous versions of Hoomd which are only compatible with a singe patch
version of python. Unfortunately, you can't pin the python version to a single patch
as conda build [overrides the pinning][conda-build-pinning-issue].

```yaml
requirements:
  run:
    - python 3.6.*
    - numpy 1.14.*
    - hoomd 2.3.*
    - cudatoolkit 8.*
```

Having waded through the complications of dependency specification we now need
to tell conda how to build our plugin. This is where creating the Makefile is
useful, we can now use the same commands for build process as for a manual
installation; `make clean && make install`. The `make clean` command removes
the build files when using the `path` option for the `source`. The other
element of the build section is the number, incremented when uploading another
package with the same version and reset to 0 on a new version. The number acts
as a sub-version number allowing for small fixes, like correcting the version
pinning, without incrementing the package version number.

```yaml
build:
  script: make clean && make install
  number: 0
```

The final section I will discuss is the test section. At its simplest this can
import your newly created package, or it can run a complex unit and integration
test suite. The test section failing will be a fail the build, providing
a final check for bugs before release. In the example below I am checking the
package will import as a first simple test, before running more extensive
testing with [pytest][]. To ensure pytest is installed, there is
a `requirements` key in the `test` section allowing for the specification
of test specific requirements. I have also specified the files for running the
tests using the `source_files` key, which is the entire directory of test
files. The final key is the `commands` to run your test suite. Since I have the
test rule configured in my Makefile I make use of it here.

```yaml
test:
  imports:
    - hoomd.harmonic_force
  requires:
    - pytest
  source_files:
    - test/*
  commands:
    - make test
```

I have put all the snippets into a single block of code at the end of this article or downloadable
[here][meta.yaml]. For more complex examples, you can have a look at the [Hoomd
repository][hoomd-conda-recipe] or the example in [my repository][harmonic-force-meta].

## Building and Distribution

With all the metadata defined, conda makes it straightforward to create the
package for upload. There are two conda packages required for building and
uploading to [Anaconda Cloud][], which are both required in the root
environment. You can install both packages with the command below, where the
`-n` flag specifies installing to the `root` environment.

```shell
$ conda install -n root conda-build anaconda-client
```

With the `conda-build` package installed, you can run `conda build .` where the
`.` is the path to the directory containing `meta.yaml` file. As part of build
process conda will create new environments for both the build and test phases,
preventing the packages in your current environment from interfering with the
build process and ensuring you have specified all requirements. The build phase
prepares the package for upload to [Anaconda Cloud][], which is handled by
anaconda client. If you have already provided credentials the upload *should*
be automatic, though on failure the error messages include steps to complete
the upload.

With your package uploaded to the Anaconda Cloud, anybody can install it by specifying your
repository. You can install my plugin with the command

```shell
$ conda install -c malramsay hoomd-harmonic-force
```

although I wouldn't recommend using it at this stage. That said, contributions
are most welcome.

While the process of packaging is difficult, I have hopefully made it somewhat
more approachable. The good thing is that once you have a `meta.yaml` file for
a project, maintenance will mostly be updates of version numbers. As an added
benefit, installing or updating your software is much simpler for you, and
importantly, anyone else that wants to try it out. For why open source software
if you don't intend for someone else to actually use it.


## Entire `meta.yaml`

I have included the entire `meta.yaml` file below for ease of copying.

```yaml
# meta.yaml

package:
  name: hoomd-harmonic-force
  version: 0.1.7

about:
  home: https://github.com/malramsay64/hoomd-harmonic-force
  license: MIT
  license_file: LICENSE

source:
  git_url: https://github.com/malramsay64/hoomd-harmonic-force.git
  git_rev: v0.1.7

requirements:
  build:
    - python 3.6.*
    - setuptools
    - numpy 1.14.*
    - hoomd 2.3.*
    - cudatoolkit 8.*
    - cmake >=2.8.0

  run:
    - python 3.6.*
    - numpy 1.14.*
    - hoomd 2.3.*
    - cudatoolkit 8.*

build:
  script: make clean && make install
  number: 0

test:
  imports:
    - hoomd.harmonic_force
  requires:
    - pytest
  source_files:
    - test/*
  commands:
    - make test
```


[hoomd-plugin-docs]: http://hoomd-blue.readthedocs.io/en/stable/developer.html
[hoomd-bitbucket]: https://bitbucket.org/glotzer/hoomd-blue/src/maint/
[hoomd-github]: https://github.com/joaander/hoomd-blue
[hoomd-conda-recipe]: https://bitbucket.org/glotzer/hoomd-blue/src/maint/conda-recipe/
[conda-build-variants]: https://conda.io/docs/user-guide/tasks/build-packages/variants.html
[Anaconda Cloud]: https://anaconda.org/
[harmonic-force-meta]: https://github.com/malramsay64/hoomd-harmonic-force/blob/master/meta.yaml
[hoomd-harmonic-force]: https://github.com/malramsay64/hoomd-harmonic-force
[pytest]: https://docs.pytest.org/en/latest/
[Hoomd]: http://hoomd-blue.readthedocs.io/en/stable/
[LAMMPS]: http://lammps.sandia.gov/
[GROMACS]: http://www.gromacs.org/
[yaml]: http://yaml.org/
[meta.yaml]: /static/code/hoomd-plugin/meta.yaml
[conda-build-pinning-issue]: https://github.com/conda/conda-build/issues/2571
