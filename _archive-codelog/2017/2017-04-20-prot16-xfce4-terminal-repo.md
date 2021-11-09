---
title: "Prot16 themes for XFCE4 Terminal"
subtitle: "Pleasant colours for the command line"
excerpt: "Information about the port of Prot16 to the XFCE4 terminal emulator. Includes installation and usage instructions."
date: 2017-04-20
permalink: /codelog/prot16-xfce4-terminal/
---
XFCE4 is my favourite desktop environment on Arch Linux. Its default terminal emulator—the XFCE4 Terminal—is a fine piece of software that I use all the time. So here is a minor contribution to the project: a port of my collection of [colour schemes](https://protesilaos.com/schemes/) (aka "Prot16").

## Installation

### 1. With git

Enter the following command in your terminal:

```shell
git clone git@github.com:protesilaos/prot16-xfce4-terminal.git ~/.local/share/xfce4/terminal/colorschemes --depth 1
```

### 2. Manually

Download the [latest release](https://github.com/protesilaos/prot16-xfce4-terminal/releases/tag/v0.1.0) and extract the contents into the following directory (create the folders if necessary).

```
~/.local/share/xfce4/terminal/colorschemes
```

Pro tip: you can establish the full path from the command line. Just run `mkdir -p ~/.local/share/xfce4/terminal/colorschemes`
{:.info}

## Usage

Open the XFCE4 Terminal, navigate to `Preferences` > `Colours`. The themes should be available in the `Presets` section.

## License

GNU General Public Licence Version 3

## Contributing

You can contribute to the [project's git repository](https://github.com/protesilaos/prot16-xfce4-terminal). Suggestions should concern the *implimentation* of the colour schemes, not the colour values themselves.
