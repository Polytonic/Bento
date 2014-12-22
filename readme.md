# [Periwinkle](https://github.com/Polytonic/Periwinkle)
[![OSX Version](http://img.shields.io/badge/OSX-Yosemite-brightgreen.svg?style=flat-square)](https://www.apple.com/osx/)

## Summary
Periwinkle is a collection of scripts and configuration files to setup an OSX computer for development, loosely based on [thoughtbot/laptop](https://github.com/thoughtbot/laptop) and [other dotfiles](http://dotfiles.github.io/). The script can safely run multiple times, where subsequent runs will upgrade existing packages and fix broken links.

## Getting Started
Periwinkle requires [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) or the [Xcode Command Line Tools](https://developer.apple.com/library/ios/technotes/tn2339/_index.html). Once `git` is available, clone this repository and run the bootstrapping script.

```bash
git clone https://github.com/Polytonic/Periwinkle.git
cd Periwinkle && source bootstrap.sh
```

To update, simply run `bash bootstrap.sh` or `./bootstrap.sh`.

## Documentation
Periwinkle is configured to use the [fish](http://fishshell.com/) shell. On first run, you should be prompted for your git credentials. Sublime Text is the editor of choice. Don't forget to install a terminal theme! At some point I'll add OSX defaults configuration and figure out how to automate ST3 package installation ...

## License
>The MIT License (MIT)

>Copyright (c) 2014 Kevin Fung

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
