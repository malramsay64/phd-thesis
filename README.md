# PhD Thesis

This is a repository reflecting the current state of my PhD thesis
and the project management surrounding completing the write-up.

## Compilation

The thesis is being automatically built using [travis-ci] with the resulting files uploaded as a
[release][github releases] on GitHub.

To compile yourself requires the installation of [Miniconda] which allows for all dependencies to
be installed using

```shell
conda env create
```

followed by

```shell
conda activate thesis
```

to activate the environment containing the dependencies.

Note that to update the dependencies the command

```shell
conda env update
```

is required.

The build itself is completed with

```shell
make
```

which generates a file thesis.tex in the current directory.

## Linting

In addition to the tools to build the thesis,
I have a range of tools to identify poor writing.
These tools are not all perfect,
with a degree of false positives,
and not entirely suited to academic writing,
however they do make me look harder at certain aspects of what I write.

These tools require that `nodejs` is installed
which is one of the dependencies installed using conda above.
With the `thesis` conda environment activated
running the command

```shell
npm install
```

will install all the packages required for these checks.

The command

```shell
make lint
```

will then run all the checks for the files.

These checks can also be configured to show up in your text editor,
making it much easier to see and fix each of the issues
which are highlighted.

## Common Issues

If there is an error

```error
biber: error while loading shared libraries: libcrypt.so.1:
cannot open shared object file: No such file or directory
```

installing libraries for backwards compatibility is required,
for example on fedora 30

```sh
dnf install libxcrypt-compat
```

is required for biber 2.5 to run.

Another error is

```error
biber: error while loading shared libraries: libnsl.so.1:
cannot open shared object file: No such file or directory
```

which can be resolved by installing libnsl,
a library that was previously part of glibc.

```sh
dnf install libnsl
```

[travis-ci]: https://travis-ci.org
[github releases]: https://github.com/malramsay64/phd-thesis/releases
[Miniconda]: https://conda.io/miniconda.html
