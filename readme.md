# [Periwinkle](https://github.com/Polytonic/Periwinkle)
![Screenshot](http://i.imgur.com/Ca3v00Z.png)

## Summary
Periwinkle is a collection of scripts and configuration files to setup an OSX computer for development, loosely based on [thoughtbot/laptop](https://github.com/thoughtbot/laptop) and [other dotfiles](http://dotfiles.github.io/). The script can safely run multiple times, where subsequent runs will upgrade existing packages and fix broken links.

## Getting Started
Periwinkle requires [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) or the [Xcode Command Line Tools](https://developer.apple.com/library/ios/technotes/tn2339/_index.html). Once `git` is available, clone this repository and run the bootstrapping script.

```bash
xcode-select --install
git clone https://github.com/Polytonic/Periwinkle.git
cd Periwinkle && caffeinate -s zsh bootstrap.sh
```

To update, run `./bootstrap.sh` as needed.
