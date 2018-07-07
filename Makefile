#
# Makefile
# Malcolm Ramsay, 2018-07-03 10:48
#

# Find all the markdown files which have a path starting with two digits
subfiles = $(shell find . -name "*.md" -path "./[0-9][0-9]*")

.PHONY: thesis.pdf subfiles clean

all: thesis.pdf

thesis.pdf: thesis.tex
ifeq ($(shell uname -s),Darwin)
	latexmk -outdir=output -pdf thesis.tex
	cp output/thesis.pdf .
else
	tectonic thesis.tex
endif

thesis.tex: $(subfiles:.md=.tex)
	python src/include_tex.py

subfiles: $(subfiles:.md=.tex)

%.tex: %.md  # Convert markdown files to latex using pandoc
	pandoc -t latex $< -o $@ --filter pandoc-eqnos --filter pandoc-fignos --filter pandoc-tablenos 

clean:
	rm -rf output/*
	rm thesis.pdf

# vim:ft=make
#
