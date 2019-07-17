#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 Malcolm Ramsay <malramsay64@gmail.com>
#
# Distributed under terms of the MIT license.

import hsluv


def rgb_to_latex(rgb, name: str) -> str:
    r, g, b = rgb
    return rf"\definecolor{name}{{rgb}}{{{r:.5f}, {g:.5f}, {b:.5f}}}"


def main():
    saturation = 100
    luminance = 30
    hues = [
        ("myred", 50),
        ("myyellow", 65),
        ("mygreen", 140),
        ("myblue", 250),
        ("mypurple", 295),
    ]
    for name, hue in hues:
        rgb = hsluv.hsluv_to_rgb((hue, saturation, luminance))
        print(rgb_to_latex(rgb, name))

    rgb = hsluv.hsluv_to_rgb((0, 0, luminance))
    print(rgb_to_latex(rgb, "mygrey"))


if __name__ == "__main__":
    main()
