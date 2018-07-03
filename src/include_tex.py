#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 Malcolm Ramsay <malramsay64@gmail.com>
#
# Distributed under terms of the MIT license.

"""This is a script to include all the .tex files exising in subdirectories to included in the
master document. """

import logging
from pathlib import Path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
logging.basicConfig(level="DEBUG")


def get_include_list():
    include_list = []
    directories = list(Path.cwd().glob("??_*"))
    directories.sort()
    logger.debug("Found directories: %s", " ".join([str(d) for d in directories]))
    for directory in directories:
        logger.debug("Searching directory: %s", directory)
        for file in sorted(list(directory.glob("*.tex"))):
            include_list.append(r"\include{" + file.stem + "}\n")
    return include_list


def main(filename):
    # Find line to insert files in input file
    with open(filename, "r+") as dst_file:
        lines = dst_file.readlines()
        insert_index = 0
        finished_index = 0
        for index, line in enumerate(lines):
            if r"%% Insert" in line:
                logger.debug("Found insert location")
                insert_index = index + 1
            # End of inserted files
            elif insert_index > 0 and line == "\n":
                logger.debug("Found finished location")
                finished_index = index
                break

            logger.debug("Line contents: %s", line)

        if finished_index == 0:
            finished_index = len(lines)

        lines = lines[:insert_index] + get_include_list() + lines[finished_index:]

        # Return to start of file to write updated contents
        dst_file.seek(0)
        dst_file.writelines(lines)


if __name__ == "__main__":
    main(filename="thesis.tex")
