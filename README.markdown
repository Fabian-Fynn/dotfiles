# Dotfiles

## Installation

Clone repo to `~/.dotfiles`:

    git clone git@github.com:fabian-fynn/dotfiles.git ~/.dotfiles

Then install the dotfiles:

    rake

This rake task will not replace existing files, but it will replace existing symlinks.

The dotfiles will be symlinked, e.g. `~/.bash_profile` symlinked to `~/.dotfiles/bash_profile`.


## Vim

Install plugins from submodules:

    git submodule update --init


## tmux

Make it integrate with the OS X system clipboard:

    brew install reattach-to-user-namespace

## Credits

I started out with [henrik's dotfiles](https://github.com/henrik/dotfiles) and adjusted them to fit my needs.
Thanks [Henrik](https://github.com/henrik)

