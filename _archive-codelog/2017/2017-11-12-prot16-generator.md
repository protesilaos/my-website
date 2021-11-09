---
title: "Introducing the Prot16 Generator"
subtitle: "Get colour schemes on demand"
excerpt: "The Prot16 Generator is a bash script that outputs Prot16 themes for a variety of apps and terminal emulators."
date: 2017-11-12
permalink: /codelog/prot16-generator-intro/
---
Today I published the initial version of the [Prot16 Generator](https://github.com/protesilaos/prot16-generator). This is a tool that produces ports of the [Prot16 colour schemes](https://protesilaos.com/schemes/) for a variety of applications. The program is released as free software under the terms of the GNU General Public License Version 3.

## How to get started

The project's [README](https://github.com/protesilaos/prot16-generator/blob/master/README.md) offers extensive documentation on how to set it up and start using it. It also provides a series of examples on how to implement a theme for each of the available templates.

## What changes

The Prot16 Generator *replaces* the [Prot16 Builder](https://github.com/protesilaos/prot16-builder). The latter is an `npm` tool and, thus, has a dependency on `nodejs`. Whereas the Prot16 Generator will work out of the box in any Bash shell environment, which practically covers all GNU/Linux distros, most likely macOS, and maybe the Windows Subsystem for Linux (though I have not used Windows in years, so I cannot confirm this).

## Next steps

My plan is to develop more templates, which will serve as the foundation for porting the Prot16 schemes to other applications. Check the generator's repo for updates. Changes will be documented in the [CHANGELOG](https://github.com/protesilaos/prot16-generator/blob/master/CHANGELOG.md). 

## Ramifications

The creation of this tool opened up a unique opportunity to review the [Prot16](https://github.com/protesilaos/prot16) main repo as well as the related repositories. As of now, the repo has been cleaned up so that it would include only the files that can currently be outputted by the Prot16 Generator. Eventually though, the plan is to cover use cases that were previously on offer, and to furnish new ones.

## Your help is much appreciated

Virtually every aspect of this project can be improved further. I am open to any suggestions you may have or pull requests you might make.

## Like what you see?

Great! Consider [donating via paypal](https://www.paypal.me/protesilaos).
