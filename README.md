# VIM IDE deployment

## What is this?

My attempt to have VIM as my main Integrated Development Enviroment.

## Motivation

After having VSCode consume 15Gb of RAM for working with a C++ project, I had to find a more lightweight alternative.
I need control of my tools to have control ver the quality of my work as a professional software developer.

**Advantages**
- Open-source.
- Battle tested.
- Highly customizable.
- Well documented.
- Amazing community.
- I already use in a day to day basis.
- Lightweight.

**Disadvantages**
- Difficult to learn at first.
- No magic, you get what you put on it.
- Requires understanding the whole development process.

## Instalation

First you need neovim installed.
This can be achieved several ways, using the default packet manager of your distribution, snap or pip.
I prefer to go to the github repository and download the appimage.

The one liner to install the latest stable drop:

```
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
    chmod u+x nvim.appimage && \
    sudo mv nvim.appimage /usr/bin/vim`
```

The next step is to clone this repository at `$HOME/.config/nvim`:

```
git clone https://github.com/jairomer/neovim-config.git $HOME/.config/nvim && \
    cd $HOME/.config/nvim && \
    git submodule update --init --recursive
```

Then, you might want to install the YouCompleteMe to have autocompletion on several programming languages:

`cd $HOME/.config/nvim && python3 -m pip install --user --upgrade pynvim && python bundle/YouCompleteMe/install.py`

There are several ways of installing this plugin that can be checked out at the [README of YouCompleteMe](https://github.com/ycm-core/YouCompleteMe/tree/ed423e8a1d2a5842a126d33b824ad3b65f85f3ba#readme).


## C++ Autocomplete and linting

It is needed to configure each C++ project in order for autocomplete to work with c++17 and beyond.
YouCompleteMe uses clangd as backend for the implementation of the language server.
This means that if further flags are needed, they must be explictly defined on a custom `.ycm_extra_conf.py` such as the following:

```python
import os
import os.path
import fnmatch
import logging
import ycm_core
import re


def getIncludesUnder(father):
    return [str("-I"+x[0]) for x in os.walk(father)]

def Settings( **kwargs ):
  BASE_FLAGS = [
          '-Wall',
          '-Wextra',
          '-Werror',
          '-Wno-long-long',
          '-Wno-variadic-macros',
          '-fexceptions',
          '-ferror-limit=10000',
          '-DNDEBUG',
          '-std=c++20',
          '-xc++',
          '-I/usr/lib/',
          '-I/usr/include/',
          ]
  BASE_FLAGS += getIncludesUnder(os.getcwd()+"/src")
  BASE_FLAGS += getIncludesUnder(os.getcwd()+"/3pp")
  return {
    'flags': BASE_FLAGS,
  }
```

### Semantic completion and static analysis

Install and configure the latest versions for libclang and clang-tidy for your current distribution.
