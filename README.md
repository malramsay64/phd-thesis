PhD Thesis
==========

This is a repository reflecting the current state of my PhD thesis.

Compilation
-----------

The thesis is being automatically built using [travis-ci][] with the resulting
files uploaded as a [release][github releases] on GitHub.

To compile yourself requires the installation of [Miniconda][] which allows for the majority of the
dependencies to be installed using

```shell
conda env update
```

followed by

```shell
conda activate thesis
```

to activate the environment containing the dependencies.

The only dependency not installable using Miniconda is biber, specifically biber version 2.5 which
can be downloaded for a range of platforms from [sourceforge][sourceforge-biber2.5].

The build itself is completed with

```shell
make
```

which will generate a file thesis.tex in the current directory.

[travis-ci]: https://travis-ci.org
[github releases]: https://github.com/malramsay64/phd-thesis/releases
[Miniconda]: https://conda.io/miniconda.html
[sourceforge-biber2.5]: https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/2.5/binaries/
