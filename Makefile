#
# Makefile
# Malcolm Ramsay, 2018-07-03 10:48
#

# Find all the markdown files which have a path starting with two digits
subfiles = $(shell find . -name "*.md" -path "./[0-9][0-9]*")

.PHONY: all subfiles

all: thesis.pdf

thesis.pdf: thesis.tex
	latexmk -outdir=output -pdf -interaction=nonstopmode thesis.tex && mv output/thesis.pdf .

thesis.tex: $(subfiles:.md=.tex)
	python src/include_tex.py

subfiles: $(subfiles:.md=.tex)

%.tex: %.md  # Convert markdown files to latex using pandoc
	pandoc -t latex $< -o $@ --filter pandoc-eqnos --filter pandoc-fignos --filter pandoc-tablenos 


# vim:ft=make
#
