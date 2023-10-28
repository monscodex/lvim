# My LunarVim Config

This is a port of my old neovim configuration to LunarVim.

LunarVim takes care of the essential functionality and leverages you the weight of maintaining core functionality breaking when installing or updating plugins.

## Install

### 1. Neovim

I compile neovim from source instead of depending on each distro's version, dependencies and update cycle.

This way I have a more stable and cross-device consistent experience.

Compiling neovim is surprisingly easy and convenient, [try it out!](https://github.com/neovim/neovim/wiki/Building-Neovim)

### 2. LunarVim

LunarVim has a [complete and convenient guide](https://www.lunarvim.org/docs/installation).

LunarVim makes their own install script; run it and accept the installation of all of their optional dependencies.

## Philosophy
My IDE is not a playground, it's a curated set of needed functionalities.

I hate the feeling of being lost in my editor with so many plugins I don't know how to use. This is what this configuration takes care about.

## Configuration

Look at my [plugins]('./lua/user/general/plugins.lua') and you'll find the application of my philosophy.

Look at the [plugins' configuration]('./lua/user/plugin-config/') and you'll find I'm mostly customizing LunarVim's default functionality the way I like it.

## Thanks
Special thanks to [ChristianChiarulli](https://github.com/ChristianChiarulli/) for his work!

Have a good day,
monscodex
