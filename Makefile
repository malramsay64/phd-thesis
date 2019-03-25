#
# Makefile
# Malcolm Ramsay, 2018-07-03 10:48
#

# Find all the markdown files which have a path starting with two digits
subfiles := $(shell find . -name "*.md" -path "./[0-9][0-9]*")
subfiles := $(subfiles:.md=.tex)

# The directory which will contain all the temporary output files
makedir = output
makesubdirs = $(addprefix $(makedir)/, $(wildcard [0-9]*))


.PHONY: all clean clean_subfiles test

all: thesis.pdf

thesis.pdf: thesis.tex $(subfiles) | $(makedir) $(makesubdirs)
	tectonic -o $(makedir) -w "https://tectonic.newton.cx/bundles/tlextras-2016.0r4/bundle.tar" --keep-intermediates -r0 $<
	if [ -f $(makedir)/$(notdir $(<:.tex=.bcf)) ]; then biber --input-directory $(makedir) $(notdir $(<:.tex=)); fi
	tectonic -o $(makedir) -w "https://tectonic.newton.cx/bundles/tlextras-2016.0r4/bundle.tar" --keep-intermediates $<
	cp $(makedir)/$(notdir $@) .

%.tex: %.md  # Convert markdown files to latex using pandoc
	pandoc -t latex $< -o $@ --biblatex --filter pandoc-eqnos --filter pandoc-fignos --filter pandoc-tablenos

$(makedir) $(makesubdirs): %:
	mkdir -p $@

test:
	mdl .

clean: clean_subfiles
	rm -rf output/*
	rm -f thesis.{pdf,bcf,blg,bbl}
	rm -f texput.log

clean_subfiles:
	rm -f $(subfiles)
	rm -f pandoc.out

# vim:ft=make
#
