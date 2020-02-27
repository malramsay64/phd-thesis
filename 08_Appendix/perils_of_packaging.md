# The Perils of Packaging in Python

2018-01-07

There are many guides to packaging a python application,
including the official [Python Packaging User Guide][python packaging user guide].
While these guides offer step by step instructions for
deploying a simple application,
when deviating from a guide there can be unexpected problems.

The application I have been trying to deploy is [this one][statdyn-analysis],
a collection of tools to assist in the analysis of
molecular dynamics trajectories for my PhD.
Most of the code I have written is python,
with small sections of Cython code for performance.
I have been running automated testing on Travis-CI
and have made many different attempts at deploying the package
to both [Anaconda Cloud][anaconda] and [PyPI][pypi].
I have been trying to have a deployment that when a git tag is pushed to github,
Travis will test, build and upload both the Anaconda and PyPI packages
for Linux and macOS.

Rather than document what I have found to be the 'perfect' method,
something which I still don't have,
this is a collection of my failures
that will hopefully prevent someone else making the same mistakes.

## Packaging and Deploying

### Versioning

In deploying an application a version scheme provides
an indication of the changes made,
especially where a semantic versioning scheme is used.
To make the versioning process simpler,
I have been using git tags as the 'true' version number.
To get the version number in the setup
I have been using the `setuptools_scm` package.
The versioning scheme that best fit how I have been thinking about
release versions is the [post-release][post-release] scheme,
using
```
use_scm_version={'version_scheme': 'post-release'}
```
The default state of setuptools_scm is to
only include the dirty flag when files committed in the project have changed,
rather than any untracked file in the directory.
This change to a post release scheme also changed this default,
meaning that when compiling on Travis every commit was dirty.
This was fixed by also specifying the local version scheme
```
use_scm_version={'version_scheme': 'post-release',
                 'local_scheme': 'dirty-tag'},
```

While having a hash after the version number is not a problem for me,
it is a large problem when trying to upload packages to PyPI,
which rejects it with the error
```
HTTPError: 400 Client Error: version: Cannot use PEP 440 local versions. for url: https://upload.pypi.org/legacy/
```

### Travis

While Travis appears to have good support for uploading to PyPI,
having a [deployment target][pypi deploy travis],
as far as I can tell it [doesn't support non alphanumeric
passwords](https://github.com/travis-ci/dpl/issues/377).
Unfortunately I was unable to get some alternative methods of including a password to work.
Authentication information for uploading to PyPI can be in the `~/.pypirc` file,
however when trying to write this file using variable expansion
```bash
echo -e "[pypi]\nusername=$PYPI_USERNAME\npassword=$PYPI_PASSWORD" > ~/.pypirc
```
resulted in the file
```
[pypi]
username=$PYPI_USERNAME
password=$PYPI_PASSWORD
```
with neither of the variables being expanded.
I quickly gave up on that approach
since it worked in every shell I tested it on locally.

A solution that works is to use [twine][twine]
which along with generally being more secure
is able to read the environment variables
`TWINE_USERNAME` and `TWINE_PASSWORD` to authenticate.

### Installing from Pip

Once a package is uploaded to PyPI it needs to be installable,
i.e. running
```
$ pip install <package>
```
actually works,
even in a clean environment.
A sample `setup.py` file for a python package typically looks something like the one below
([1](https://stackoverflow.com/questions/32528560/using-setuptools-to-create-a-cython-package-calling-an-external-c-library),
[2](https://stackoverflow.com/questions/35497572/using-python-setuptools-to-put-cython-compiled-pyd-files-in-their-original-folde),
[3](http://cython.readthedocs.io/en/latest/src/quickstart/build.html)).
```
# setup.py
from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy

my_extensions = [Extension(..., include_dirs=numpy.get_include())]

setup(
    name=...,
    ...,
    setup_requires=['Cython', 'numpy'],
    install_requires=['numpy']
    ...,
    ext_modules=cythonize(my_extensions),
)
```
Problem is, when installing into a new environment via pip
the install fails as reading the `setup.py` file requires
both Cython and numpy to be installed as they are imported at the top of the file.
This is a significant problem with python packaging
for which a solution has been accepted [PEP 518][PEP 518] and work is in [progress][pep 518 progress].
In meantime, distributing a wheel is a solution to this problem.

---

**Update 2018-08-12**

The release of pip 10.0 introduced support for a `pyproject.toml` file in which installation
dependencies can be specified. A `pyproject.toml` for the above project would look like:

```toml
# pyproject.toml
[build-system]
requires= ['setuptools', 'wheel', 'numpy', 'Cython']
```

---

## Wheels

I have included wheels as their own section
since I feel they are especially egregious.
The PyPI [documentation][pypi docs wheels] tells you that
"You should also create a wheel for your project."
Well sure, I will just follow the instructions in the docs
```bash
$ python setup.py bdist_wheel
$ twine upload dist/sdanalysis-0.4.4.post5-cp36-cp36m-linux_x86_64.whl
Uploading distributions to https://upload.pypi.org/legacy/
Enter your username: malramsay64
Enter your password:
Uploading sdanalysis-0.4.4.post5-cp36-cp36m-linux_x86_64.whl
HTTPError: 400 Client Error: Binary wheel 'sdanalysis-0.4.4.post5-cp36-cp36m-linux_x86_64.whl' has an unsupported platform tag 'linux_x86_64'. for url: https://upload.pypi.org/legacy/

```
Huh???
I also think it is great that I have to wait for the package to upload to get the error message.

Some googling later...

I need to use [auditwheel][auditwheel] to create a `manylinux1` wheel.
After installing via pip (conda-forge only has auditwheel versions for up to python 3.5)
```bash
$ auditwheel repair dist/sdanalysis-0.4.4.post5-cp36-cp36m-linux_x86_64.whl
Repairing sdanalysis-0.4.4.post5-cp36-cp36m-linux_x86_64.whl
usage: auditwheel [-h] [-V] [-v] command ...
auditwheel: error: cannot repair "dist/sdanalysis-0.4.4.post5-cp36-cp36m-linux_x86_64.whl" to
"manylinux1_x86_64" ABI because of the presence of too-recent versioned symbols. You'll need to
compile the wheel on an older toolchain.

```

Some more googling and reading documentation ...

From the auditwheel README:

>But in general, building manylinux1 wheels requires running on a CentOS5 machine, so we recommend using the pre-built manylinux Docker image.
```
$ docker run -i -t -v `pwd`:/io quay.io/pypa/manylinux1_x86_64 /bin/bash
```

Oh easy, now I have to set this up to build in a docker container...

For a great example of building a manylinux1 wheel,
I can suggest checking out the [pypa/python-manylinux-demo][manylinux demo] repository.
Unfortunately it is not linked from the python packaging documentation
and so is not that simple to find.


Packaging in python is hard.
I have over 70 builds this week on travis
just trying to get everything to actually work.
At the end of all this I still don't really know what I am doing
other than basically everything I try doesn't work
and that I shouldn't try any of the above,
since I already know it won't work.


## Building and Testing

A crucial aspect of deploying a piece of software is
having some confidence that it actually works,
even if that just means it doesn't break on import.
For my workflow this is an automated process,
with builds running on [Travis-CI][travis] when
a new commit is pushed to Github.
Even using a popular service live Travis didn't preclude me
from having plenty of failures.

### Travis, Python and macOS

I had automated testing set up on Travis-CI for my python module on linux,
however trying to extent this to also using macOS
I found some unusual behaviour.
At first I thought that testing on travis was going to be
as simple as adding it to the list of os's.
```yaml
# .travis.yml
language: python

os:
  - linux
  - osx
```
However it really wasn't because the build raised an error
before my code even started running.
```sh
$ sudo tar xjf python-3.6.tar.bz2 --directory /
tar: Unrecognized archive format
tar: Error exit delayed from previous errors.
The command "sudo tar xjf python-3.6.tar.bz2 --directory /" failed and exited with 1 during .
```

It turns out that on Travis-CI,
the python language is [unsupported on macOS][travis python macos].
So I had to bodge some kind of workaround,
especially since the [travis docs][travis python macos] on the issue
assume you are using [tox][tox].
I found were that when using conda to install python,
the simplest workaround is to use `language: generic`
and install python through conda for each OS.
```yaml
# .travis.yml
language: generic

os:
  - linux
  - osx

before_install:
  - if [[ $(uname -s) == "Darwin" ]]; then
      wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh;
    else
      wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
    fi
```
Alternatively, when just using the latest version of python
it can be installed using homebrew.
```yaml
# .travis.yml
language: python

matrix:
  include:
    - os: linux
      python: 3.6

    - os: osx
      language: generic
      before_install: brew install python3
```

### Frozen versions melt

When deploying with [Conda][conda] the recipe is created in a [meta.yaml][meta.yaml] file,
containing the requirements for each step,
in addition to instructions for building and testing of a package.
A very simple version is shown below specifying a patch version of python (`3.6.1`)
to use for both the build and the run phase.
```yaml
# file: meta.yaml
package:
  name: pyver_test
  version: 1.0.0

requirements:
  build:
    - python 3.6.1
  run:
    - python {{ pin_compatible('python', max_pin='x.x.x') }}

build: number: 0
test:
  commands: python --version
```
While the version number is adhered to in the build phase,
during the run phase the patch version is ignored,
instead installing the latest patch version of python,
which at the time of writing is 3.6.4.
This is the [intended behaviour][conda version issue],
albeit somewhat unexpected.

The reason that this was a problem for me is that
I came across an [unusual bug][freud bug] in a conda package
I was trying to use.
When installed on macOS
```sh
$  conda create -n freud -c glotzer freud
```
importing the module would crash python
```sh
$ python -c "import freud"
Fatal Python error: PyThreadState_Get: no current thread

zsh: abort           python -c "import freud"
```
This environment would use the latest patch version of python (currently 3.6.4)
and a simple workaround was to install `python==3.6.1`,
although it did make installing the package more difficult than I would have liked.
I don't know why this worked, it just did,
although I suspect it has something to do with linking to the python C libraries.

### When the porcelain stains

[Pipenv][pipenv] is a packaging manager for python that automates
the creation of virtual environments for python projects
in addition to the packages installed within them.
As Jannis Leidel is quoted in the testimonials;
>Pipenv is the porcelain I always wanted to build for pip.
However there are always unusual cases when abstracting that can cause issues.

The first of these issues I found was in the installation,
I primarily use Conda for my python and virtual environment configuration,
```sh
$ pip install pipenv
$ pipenv install numpy
ERROR: virtualenv is not compatible with this system or executable
```
However, it is required to install pipenv outside of a conda distribution
([issue#699](https://github.com/pypa/pipenv/issues/699), [issue#288](https://github.com/pypa/pipenv/issues/288)).
So installation can be performed by running
```sh
$ /usr/local/bin/pip install pipenv
```
or with conda 4.4
```sh
$ conda deactivate
$ pip install pipenv
```

One of the major features of Pipenv over other package managers for python
is that it includes hashes of the binaries as part of the version pinning.
This both ensures you are installing exactly the same code on different systems,
and provides security in preventing unknown changes from being installed.
These hashes are collected for all the package versions available on PyPI,
allowing for cross platform and python version use.

The problem that I came across is that a certain package [numpy-quaternion][numpy-quaternion]
has some nearly identical version numbers,

- `numpy-quaternion 2017.11.26.19.0.13`
- `numpy-quaternion 2017.11.26.19.00.13`

the second just having an additional zero.
The first of these version numbers contains all the pre-built wheels,
while the second contains the source.
When downloading the hashes,
pipenv downloads the hash for the source distribution
rather than for the wheels.
This means that when trying to install in a new virtualenv
the downloaded package fails the hash comparison
```txt
THESE PACKAGES DO NOT MATCH THE HASHES FROM Pipfile.lock!
```
and aborts the install,
incredibly frustrating when the initial install of the package works fine.

A workaround is to manually update the Pipfile.lock file
with the correct hashes,
which is fine while dependencies are not updated
and the Pipfile.lock file remains unchanged.

---

Update 2018-01-09

In a previous revision of the Installing from Pip section
I stated that importing the dependencies within a function call
was a solution to the import problems.
Thanks to [/u/vorpalsmith](https://www.reddit.com/r/Python/comments/7ope3j/a_guide_on_how_not_to_package_a_python_module/dscmwf5/)
for bringing it to my attention that this isn't a solution,
and that the success that I observed was a result of installing a wheel
rather than any changes to the code that I made.

[statdyn-analysis]: https://github.com/malramsay64/statdyn-analysis
[python packaging user guide]: https://packaging.python.org/
[anaconda]: https://anaconda.org/
[pypi]: https://pypi.python.org/pypi
[pipenv]: https://pypi.python.org/pypi/pipenv
[travis]: https://travis-ci.org/
[travis python macos]: https://docs.travis-ci.com/user/multi-os/#Python-example-(unsupported-languages)
[tox]: https://tox.readthedocs.io/en/latest/
[conda version issue]: https://github.com/conda/conda-build/issues/2571
[freud bug]: https://bitbucket.org/glotzer/freud/issues/154/conda-package-broken-on-macos-with-python#comment-41977740
[pipenv issue]: https://github.com/pypa/pipenv/issues/1272
[numpy-quaternion]: https://pypi.python.org/pypi/numpy-quaternion
[post-release]: https://www.python.org/dev/peps/pep-0440/#post-releases
[pypi deploy travis]: https://docs.travis-ci.com/user/deployment/pypi/
[pypi docs wheels]: https://packaging.python.org/tutorials/distributing-packages/#wheels
[auditwheel]: https://github.com/pypa/auditwheel
[PEP 513]: https://www.python.org/dev/peps/pep-0513/#the-manylinux1-policy
[manylinux demo]: https://github.com/pypa/python-manylinux-demo
[PEP 518]: https://www.python.org/dev/peps/pep-0518/
[ptp 518 progress]: https://github.com/pypa/pip/issues/4802
