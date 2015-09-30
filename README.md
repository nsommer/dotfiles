# dotfiles and setup instructions for a fresh OS X
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

## Generate SSH keys
Generate SSH keys and add them to my GitHub account as described in the [GitHub guide](https://help.github.com/articles/generating-ssh-keys/).

## Copying the dotfiles
Copy the dotfiles into the home directory.

```shell
git clone <URL>
cp dotfiles/git/.gitconfig ~/.gitconfig
cp dotfiles/git/.gitignore_global ~/.gitignore_global
cp dotfiles/shell/.bash_profile ~/.bash_profile
```

## Installing homebrew
[brew](http://brew.sh) is the open source package manager for OS X. Before installing and running brew, the OS X command line developer tools have to be installed.

```shell
xcode-select --install
```

After that, brew can be installed.

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Installing newer ruby
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

## Installing common gems
I'll install a few gems that I use globally on a regular basis.

```shell
sudo gem install bundler sass
rbenv rehash
```

### Development Tip: Project specific gems
Installing gems with project specific versions should not be installed globally. For that, any project specific gems should be documented in a [Gemfile](http://bundler.io/gemfile.html) and installed with bundler into a project specific location. E.g.:

```shell
cd my-project/
bundle install --path vendor/bundle
bundle exec bin-of-project-specific-gem
```

## Installing common tools and libraries
The following list of tools and libraries are installed via brew because I need them on a regular basis.

```shell
brew update
brew install ffmpeg imagemagick mysql node maven pwgen irssi
```

## Installing VirtualBox
[Download](https://www.virtualbox.org/wiki/Downloads) VirtualBox and install it.

## Installing Vagrant
[Download](https://www.vagrantup.com/downloads.html) Vagrant and install it.

## Installing Sublimetext
Go to the [download page](http://www.sublimetext.com/2),download Sublime Text 2 and install it.

Then install [package control](https://packagecontrol.io), the package manager for installing Sublime Text packages:

Click `View -> Show console` in Sublime Text and paste the following into it:

```python
import urllib2,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')
```

Then install the `EditorConfig` and the `Sass` plugins by pressing `Command-Shift-P`, typing *Install package*, pressing enter and then searching for the packages to install.

Install the [Spacegray theme](http://kkga.github.io/spacegray/) the same way.

Type `Command+,` to open the user preferences and paste the contents of [`Preferences.sublime-settings`](/Preferences.sublime-settings) into it.

## Enable developer perspective in Safari
Go to `Safari -> Preferences -> Extended` and enable `Show "Developer" in the menu bar.`.

## License
Mit license rocks.
