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

pandoc_filters = --filter ../src/pandoc-svg.py --filter pandoc-crossref
pandoc_options = --listings -M listings -M codeBlockCaptions

figures = $(patsubst %.gv, %.pdf, $(shell find . -name "*.gv"))

.PHONY: all clean clean_subfiles test figures submodules

all: thesis.pdf

submodules:
	git submodule update

figures: $(figures)

thesis.pdf: thesis.tex $(subfiles) bibliography/bibliography.bib $(preamble) version.tex | $(makedir) $(makesubdirs)
	tectonic -o $(makedir) --keep-intermediates -r0 $<
	if [ -f $(makedir)/$(notdir $(<:.tex=.bcf)) ]; then biber --input-directory $(makedir) $(notdir $(<:.tex=)); fi
	tectonic -o $(makedir) --keep-intermediates $<
	cp $(makedir)/$(notdir $@) .

%.tex: %.md $(figures) # Convert markdown files to latex using pandoc
	cd $(dir $<); pandoc -t latex $(notdir $<) -o $(notdir $@) --biblatex $(pandoc_filters) $(pandoc_options)

$(makedir) $(makesubdirs): %:
	mkdir -p $@

%.pdf: %.gv
	dot -Tpdf $< -o $@

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
	@./node_modules/.bin/markdownlint $(subfiles:.tex=.md)

fix:
	@./node_modules/.bin/markdownlint --fix $(subfiles:.tex=.md)

grammar:
	@./node_modules/.bin/textlint $(subfiles:.tex=.md)

# vim:ft=make
#
