PhD Thesis
==========

This is a repository reflecting the current state of my PhD thesis.

Compilation
-----------

The thesis is being automatically built using [travis-ci] with the resulting files uploaded as a
[release][github releases] on GitHub.

To compile yourself requires the installation of [Miniconda] which allows for all dependencies to
be installed using

```shell
conda env update
```

followed by

```shell
conda activate thesis
```

to activate the environment containing the dependencies.

The build itself is completed with

```shell
make
```

which will generate a file thesis.tex in the current directory.

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

[travis-ci]: https://travis-ci.org
[github releases]: https://github.com/malramsay64/phd-thesis/releases
[Miniconda]: https://conda.io/miniconda.html
