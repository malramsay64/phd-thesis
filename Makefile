#
# Makefile
# Malcolm Ramsay, 2018-07-03 10:48
#

# Find all the markdown files which have a path starting with two digits
subfiles := $(shell find . -name "*.md" -path "./[0-9][0-9]*")
subfiles := $(subfiles:.md=.tex)

# The file which comprise the preamble
preamble = $(wildcard Classes/*.sty)

# The directory which will contain all the temporary output files
makedir = output
makesubdirs = $(addprefix $(makedir)/, $(wildcard [0-9]*))

pandoc_filters = --filter pandoc-crossref
pandoc_options = -M fignos-cleverref=True -M eqnos-cleverref=True -M tabnos-cleverref=True
pandoc_options =


figures = $(shell find Projects/ -name "*.svg")

.PHONY: all clean clean_subfiles test figures submodules

all: submodules thesis.pdf

submodules:
	git submodule update

figures: $(figures:.svg=.pdf)

thesis.pdf: thesis.tex $(subfiles) bibliography/bibliography.bib $(figures:.svg=.pdf) $(preamble) | $(makedir) $(makesubdirs)
	tectonic -o $(makedir) --keep-intermediates -r0 $<
	if [ -f $(makedir)/$(notdir $(<:.tex=.bcf)) ]; then biber --input-directory $(makedir) $(notdir $(<:.tex=)); fi
	tectonic -o $(makedir) --keep-intermediates $<
	cp $(makedir)/$(notdir $@) .

%.tex: %.md  # Convert markdown files to latex using pandoc
	pandoc -t latex $< -o $@ --biblatex $(pandoc_filters) $(pandoc_options)

$(makedir) $(makesubdirs): %:
	mkdir -p $@

%.pdf: %.svg
	cairosvg $< -o $@

test:
	mdl .

clean: clean_subfiles
	rm -rf output/*
	rm -f thesis.{pdf,bcf,blg,bbl}
	rm -f texput.log

clean_subfiles:
	rm -f $(subfiles)
	rm -f pandoc.out

#
# Linting
#
# A set of rules to enfore style within the repsitory
#

.PHONY: lint style grammar

lint: style grammar

style:
	markdownlint $(subfiles:.tex=.md)

grammar:
	textlint $(subfiles:.tex=.md)

# vim:ft=make
#
