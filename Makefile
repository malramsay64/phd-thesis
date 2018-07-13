#
# Makefile
# Malcolm Ramsay, 2018-07-03 10:48
#

# Find all the markdown files which have a path starting with two digits
subfiles := $(shell find . -name "*.md" -path "./[0-9][0-9]*")
subfiles := $(subfiles:.md=.tex)

# The directory which will contain all the temporary output files
makedir = output

.PHONY: clean clean_subfiles

all: thesis.pdf

thesis.pdf: thesis.tex $(subfiles) | $(makedir)
	tectonic -o $(makedir) --keep-intermediates -r0 $<
	if [ -f ${makedir}/$(notdir $(<:.tex=.bcf)) ]; then biber2.5 --input-directory ${makedir} $(notdir $(<:.tex=)); fi
	tectonic -o $(makedir) --keep-intermediates $<
	cp ${makedir}/$(notdir $@) .

%.tex: %.md  # Convert markdown files to latex using pandoc
	pandoc -t latex $< -o $@ --filter pandoc-eqnos --filter pandoc-fignos --filter pandoc-tablenos

$(makedir):
	mkdir -p $@

clean: clean_subfiles
	rm -rf output/*
	rm thesis.pdf

clean_subfiles: $(subfiles)
	rm -f $<

# vim:ft=make
#
