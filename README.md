# Mathematica for Particle Physicists

**This repository is currently under construction and for private use. Therefore there is no guarantee that it will work well on other platforms.**

**This alert will be removed once I (personally) think this is ready to face the public.**

## Introduction

This repository offers a quick, minimal setup of mathematica for particle physicists, inspired by [EverettYou/Mathematica-for-physics](https://github.com/EverettYou/Mathematica-for-physics), which offers a comprehensive and detailed setup, giving a fantastic experience of using mathematica if you are a condensed matter theorist.

This repository, on the contrary, is designed for theoretical particle physicists. Some of the key modifications are related to conflicted packages, including:
- Some packages, like the LoopIntegrate and the PauliAlgebra, conflicts with [FeynCalc](https://feyncalc.github.io/) and trigger some alerts. I prefer to keep the FeynCalc. If there is anyway to make them consistent, I'll be very excited to learn.
- The DiagramEditor is out of date since Mathematica v12.2. The function `Canvas[]` is now a new function of MMA itself. It reports error message every time you load it.
  
Other of them are personal habits. I prefer to keep the original default settings like code suggestions and RGB definition for named colors.

Furthermore, I'm gradually adding some other stylesheets, packages, and private functions into it.

## Features

### Theme and Stylesheets

- Academic theme without changing any MMA color definitions. Main reference is [StackExchange: Is it possible to define a new PlotTheme?](https://mathematica.stackexchange.com/questions/54545/is-it-possible-to-define-a-new-plottheme), which is the main part of [Mathematica-for-Physicists/Theme](https://github.com/EverettYou/Mathematica-for-physics/tree/master/Themes). The author of this code is exactly [EverettYou](https://github.com/EverettYou/).
- [Cambria Article stylesheet](https://github.com/EverettYou/CambriaArticle), with some modified shortcuts.
- [CMU Article stylesheet](https://github.com/EverettYou/Mathematica-for-physics/blob/master/FrontEnd/CMU%20Article.nb): a beautiful, modern stylesheet. The required font, the CMU font, has to be installed separately.
- [Source Code Article stylesheet](./FrontEnd/Source%20Article.nb): a theme that mimics the built-in "source code" theme in Mathematica.
- [Modified default stylesheet](./FrontEnd/Default-Modified.nb): basically the default stylesheet of Mathematica, but with some modified shortcuts. The font of the input and code cell are changed from bold to regular.


### Pre-installed Packages
- FeynCalc and FeynArts.
- [Group Math](https://renatofonseca.net/groupmath): a package for group algebra.
- [DRalgo](https://github.com/DR-algo/DRalgo): dimension-reduction formalism to compute the effective potential at finite temperature.


### Private packages

#### PlotFunctions
##### `LogTicks` function
Use log-scale frame ticks in plots. Usage: inside any plot functions that allow for `FrameTicks` option, run `FrameTicks->{{LogTicks[min,max,step],True},{Other axes}}`, where the `min` and `max` is for the `Log10` value of the plotted variable.

The function code is from one of my collaborator, and it seems he got it somewhere else.

##### `CleanRegionPlot` function
See [this](https://mathematica.stackexchange.com/a/257045/86643) stackexchange answer.

## Installation

- To download, click the "download ZIP" button to the right -->

- To install everything:

  1. unzip this repository in a folder,

  2. Install CMU fonts in the folder "CMU fonts". Method depends on your operation system.

  3. open `install.m` in Mathematica,

  4. click the `Run Package` button to the top right. It may ask you some questions. If it's asking for permissions, allow it. If it's asking for whether you want some features of FeynCalc, answer it according to what you want.

  5. quit Mathematica and restart.
