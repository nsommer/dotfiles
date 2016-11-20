# dotfiles and setup instructions for OS X
This repository contains my dotfiles as well as instructions on how to set up and install everything for development on a new OS X.

**NOTE: This guide is highly optimized for my personal needs. If you want to reuse it, make sure to change the *name* and the *email* in `git/.gitconfig`.**

## Table of Contents
- [Setup](#setup)
    - [Generate SSH keys](#generate-ssh-keys)
    - [Copying the dotfiles](#copying-the-dotfiles)
    - [Installing homebrew](#installing-homebrew)
    - [Installing newer ruby](#installing-newer-ruby)
    - [Installing common gems](#installing-common-gems)
        - [Development Tip: Project-specific-gems](#development-tip-project-specific-gems)
    - [Installing common tools and libraries](#installing-common-tools-and-libraries)
    - [Installing VirtualBox](#installing-virtualbox)
    - [Installing Vagrant](#installing-vagrant)
    - [Installing Sublimetext](#installing-sublimetext)
    - [Enable developer perspective in Safari](#enable-developer-perspective-in-safari)
- [License](#license)

## Setup
The following sections provide a step by step guide for the setup process.

### Generate SSH keys
Generate SSH keys and add them to my GitHub account as described in the [GitHub guide](https://help.github.com/articles/generating-ssh-keys/).

### Copying the dotfiles
Copy the dotfiles into the home directory.

```shell
git clone https://github.com/nsommer/dotfiles.git
cp dotfiles/git/.gitconfig ~/.gitconfig
cp dotfiles/git/.gitignore_global ~/.gitignore_global
cp dotfiles/shell/.bash_profile ~/.bash_profile
```

### Installing homebrew
[brew](http://brew.sh) is the open source package manager for OS X. Before installing and running brew, the OS X command line developer tools have to be installed.

```shell
xcode-select --install
```

After that, brew can be installed.

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Installing newer ruby
The OS X command line tools contain a version of ruby that works for most of the things of course, however it is - as many software from the command line tools - quite outdated (ruby v2.0 in Yosemite).

First, [rbenv](https://github.com/sstephenson/rbenv) will be installed to manage ruby versions easily. I prefer rbenv over rvm because rbenv is really simple and doesn't modifiy lots of things in its environment as rvm does. To install rbenv, brew will be used.

```shell
brew update
brew install rbenv ruby-build

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

Now rbenv should be ready to use, so I'll just install an up-to-date version of ruby and set it as the global ruby version (at the time of writing this is 2.2.2).

```shell
rbenv install 2.2.2
rbenv global 2.2.2
rbenv rehash
```

### Installing common gems
I'll install a few gems that I use globally on a regular basis.

```shell
sudo gem install bundler sass
rbenv rehash
```

#### Development Tip: Project specific gems
Installing gems with project specific versions should not be installed globally. For that, any project specific gems should be documented in a [Gemfile](http://bundler.io/gemfile.html) and installed with bundler into a project specific location. E.g.:

```shell
cd my-project/
bundle install --path vendor/bundle
bundle exec bin-of-project-specific-gem
```

### Installing common tools and libraries
The following list of tools and libraries are installed via brew because I need them on a regular basis.

```shell
brew update
brew install sqlite3 node maven pwgen
```

### Enable developer perspective in Safari
Go to `Safari -> Preferences -> Extended` and enable `Show "Developer" in the menu bar.`.

## License
Mit license rocks.
