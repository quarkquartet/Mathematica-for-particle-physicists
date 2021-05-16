# Mathematica for Particle Physicists

## Introduction

This repository offers a quick, minimal setup of mathematica for particle physicists, inspired by [EverettYou/Mathematica-for-physics](https://github.com/EverettYou/Mathematica-for-physics). With comprehensive and detailed set up, this repository gives a fantastic experience of using mathematica if you are a condensed matter theorist.

The repository in this link, though is much more greater than mine, has some deficits for me that I have to fix, includes:

- These packages are designed for condensed matter theory, while they may not be widely used in particle physics. Some of which may conflict with the wide-used mathematica package, [FeynCalc](https://feyncalc.github.io/). I have to uninstall them.
- The DiagramEditor is out of date since Mathematica v12.2. The function `Canvas[]` is now a new function of MMA itself. It reports error message every time you load it.
- I do not like to toggle the toolbar and lock it for the stylesheet. I prefer to give the freedom to use toolbar or not to users.
- Keybindings for the stylesheets are a little bit uncomfortable. I changed them slightly.
- The academic theme, although pretty nice, changed the defined RGB colors in MMA. That's not a good idea for me.
- Code assists, options after results, etc, are turned off. I need those features, bro...... (because I am a weak user...)

And, most importantly, that repository is not being maintained anymore.

## Features

Features of this repository includes:

- Academic theme without changing any MMA color definitions. Main reference is [StackExchange: Is it possible to define a new PlotTheme?](https://mathematica.stackexchange.com/questions/54545/is-it-possible-to-define-a-new-plottheme), which is the main part of [Mathematica-for-Physicists/Theme](https://github.com/EverettYou/Mathematica-for-physics/tree/master/Themes). The author of this code is exactly [EverettYou](https://github.com/EverettYou/).
- FeynCalc and FeynArts installation.
- [Cambria Article stylesheet](https://github.com/EverettYou/CambriaArticle).
- [CMU Article stylesheet](https://github.com/EverettYou/Mathematica-for-physics/blob/master/FrontEnd/CMU%20Article.nb): a beautiful, modern stylesheet. The required font, the CMU font, has to be installed separately.
- Some option settings, referenced from [EverettYou/Mathematica-for-physics](https://github.com/EverettYou/Mathematica-for-physics).

## Installation

- To download, click the "download ZIP" button to the right -->

- To install everything:

  1. unzip this repository in a folder,

  2. open `install.m` in Mathematica,

  3. click the `Run Package` button to the top right. It may ask you some questions. If it's asking for permissions, allow it. If it's asking for whether you want some features of FeynCalc, answer it according to what you want.

  4. quit Mathematica and restart.
