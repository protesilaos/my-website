---
title: "Introducing the Tempus Themes"
subtitle: "WCAG AA compliance plus a tool to build on demand"
excerpt: "The Tempus themes are used with terminal emulators and Vim. Their goal is to achieve an inclusive colour contrast of 4.50:1"
date: 2017-11-19
permalink: /codelog/tempus-themes-intro/
---
*Tempus* is a collection of themes for Vim and terminal emulators that are compliant *at the very least* with the WCAG AA accessibility standard for colour contrast (which stands for a contrast ratio of 4.50:1).

Each theme consists of a 16-colour palette that corresponds to the basic values provided by all modern terminal emulators, namely: black, red, green, yellow, blue, magenta, cyan, white, bright black, bright red, bright green, bright yellow, bright blue, bright magenta, bright cyan, bright white.

Unlike my other project on the same issue, [Prot16](https://protesilaos.com/schemes), Tempus themes come in either a dark or a light variant. That means that the desired colour contrast is only met by combining any of the foreground values against one of two backgrounds.

The current collection features four dark themes—where dark values are primarily used as the backdrop—and one light (the light theme—`totus`—is WCAG AAA compliant or else has a contrast ratio of 7.00:1).

Tempus themes are interoperable. They are meant to work as a one-to-one replacement to each other within the same contrast ratio boundary. This is due to their inherent colour qualities as well as their shared schema for mapping colours to objects of the code syntax. Put concretely:

- **Same contrast.** Every Tempus theme with a WCAG AA rating can 100% substitute all themes with the same rating (will also be true for the WCAG AAA standard once more themes within that category are available).
- **Same structure.** The shared colour mapping means that a code *constant* will always be blue while a *string* will always be a bright blue regardless of which specific Tempus theme is used (and so on for all constructs).

For the time being, the colour mapping specs are implemented in Vim. The plan is to develop templates for other popular applications, such as Atom and Emacs.

Below are some screenshots as well as additional information on how to get your copy.

## Screenshots

Tempus Totus (WCAG AAA)
![tempus_totus sample](https://raw.githubusercontent.com/protesilaos/tempus-themes/master/screenshots/tempus_totus.png)

Tempus Spring (WCAG AA)
![tempus_spring sample](https://raw.githubusercontent.com/protesilaos/tempus-themes/master/screenshots/tempus_spring.png)

Tempus Summer (WCAG AA)
![tempus_summer sample](https://raw.githubusercontent.com/protesilaos/tempus-themes/master/screenshots/tempus_summer.png)

Tempus Autumn (WCAG AA)
![tempus_autumn sample](https://raw.githubusercontent.com/protesilaos/tempus-themes/master/screenshots/tempus_autumn.png)

Tempus Winter (WCAG AA)
![tempus_winter sample](https://raw.githubusercontent.com/protesilaos/tempus-themes/master/screenshots/tempus_winter.png)

## Distribution of the Tempus Themes

You can find the files on Github: [Tempus Themes](https://github.com/protesilaos/tempus-themes)

Each directory therein contains files specific to the application it references. For example, the `urxvt` folder includes an `.Xresources` file for each item in the Tempus collection.

Instructions on how to use these files are documented in the `README.md` which is included in each directory.

Specialised repositories are also available:

- [Tempus Themes Urxvt](https://github.com/protesilaos/tempus-themes-urxvt)
- [Tempus Themes Vim](https://github.com/protesilaos/tempus-themes-vim)
- [Tempus Themes Xfce4-terminal](https://github.com/protesilaos/tempus-themes-xfce4-terminal)
- [Tempus Themes Xterm](https://github.com/protesilaos/tempus-themes-xterm)

### Vim plugin

For Vim, Tempus themes can be installed using a plugin manager. With [vim-plug](https://github.com/junegunn/vim-plug):

```vim
" Include the following reference
Plug 'protesilaos/tempus-themes-vim'
```

Use the plugin manager's commands to install and update the codebase. Then either run `:colorscheme tempus_{scheme-name}` or include a `colorscheme tempus_{scheme-name}` in your `.vimrc`. Example with *Tempus winter*:

```vim
" Temporary switch
:colorscheme tempus_winter

" Permanent switch in .vimrc
colorscheme tempus_winter
```

## Tempus Themes Generator

At the core of the project is a tool to build themes on demand: the [Tempus Themes Generator](https://github.com/protesilaos/tempus-themes-generator). It accepts data files with the colour values, parses them through templates to deliver the desired result (using the terminal's standard output). The generator's script is written in Bash.

## Contributing

You are most welcome to contribute a template for developing ports of the Tempus collection.

## License

GNU General Public License Version 3.
