<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Magnushhoie/fuz">
  </a>
  <h1 align="center">
<picture>
  <img alt="Image Alt Text"  src="https://github.com/Magnushhoie/fuz/blob/main/img/logo.png?raw=true" width="250"/
</picture>
         ></h1>
  <p align="center">
    Fuz is a blazingly fast text, file and folder search tool. Personally used daily for over 6 years for managing notes
  </p>
</p>

</p>
<p align="center">
<a href="https://asciinema.org/a/663578" target="_blank">
<img src="https://github.com/Magnushhoie/fuz/blob/main/img/fuz_static.jpg?raw=true" width="500"/>
</a>
</p>

Why use Fuz?
- Point to any path containing text, files or folders
- Fuz instantly and interactively returns search matches (see above)
- Supports markdown and code highlighting
- File contents are memory mapped for faster results
- Cleverly ignores large binary files and hidden directories
- Search Github repository code, Obsidian notes or code-snippets in the terminal in seconds

## Installation and usage

Step 1: Install requirements (see below)

Step 2: Download and install Fuz
```bash
git clone https://github.com/Magnushhoie/fuz/
cd fuz && chmod +x fuz
./fuz --setup
```

Step 3: Search any path. Use Ctrl + F to toggle search mode.
```bash
fuz
fuz --path .
```

## Requirements (pick one option)

A) MacOS, with brew (https://brew.sh/)
```bash
brew install fzf rg bat
```

B) Any system, with conda (https://conda.io/docs/user-guide/install/)
```bash
conda install -c conda-forge fzf ripgrep bat
```

C) Linux / Ubuntu (requires sudo):
```bash
# Install FZF from Github
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install remaining, symlink batcat to bat
sudo apt-get install ripgrep bat
mkdir -p ~/.local/bin

# Alternatively:
sudo ln -s /usr/bin/batcat usr/local/bin/bat
```

- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)

## Documentation

```
USAGE:
  fuz [options] <FILENAME and/or SEARCH-TERMS>

Fuz interactively fuzzy searches a directory and
opens selected files at search result.

Use --edit to list files and edit in vim,
or --open for system default app

Project homepage: https://github.com/Magnushhoie/fuz


EXAMPLES:
- Search text from default path
    fuz

- Search specific path
    fuz --path DIRECTORY

- Search filenames to edit with vim:
    fuz --edit

- Open matches with system default text editor
    fuz --open

KEY BINDINGS:
  CTRL+O             Open in vim
  CTRL+L             View with less
  CTRL+J             MOVE down
  CTRL+K             MOVE up

ALTERNATIVE TERMINAL EDITOR:
# add to .bashrc/.zshrc (currently supports neovim, macvim or vim):
export FUZ_EDITOR=nvim

OPTIONS:
  --setup            Set fuz default search directory in .zsh/.bashrc
  -p, --path         Directory to search
  -o, --open         Open search directory or file with system default application
  -e, --edit         Open file with vim editor (instead of 'less'), enables --names option
  -n, --names        Only show filenames
  -c, --create       Create new file in search directory: --create <FILENAME>
  -d, --max-depth    Max search depth (5)
  -m, --max-lines    Max lines read per file (50000)
  -s, --max-size     Max file-size to search (1M)
  -f, --fuzzy-search Enable fuzzy instead of exact search
  --sorttime         Sort chronologically, files by date modified, preserve line order (single threaded, slow)
  --vimsearch        Search lines and open in vim
  --dir              Print and open search directory
  -h, --help         Print this help and exit
```

## Search your Apple Notes (MacOSX)

```bash
# Exports Apple Notes to text in ~/_macosx_notes
osascript -l JavaScript macosx_notes2txt.AppleScript

# Setup alias to point to the directory in .bashrc/.zshrc
# Then use 'nfz' to fuz the ~/_macosx_notes directory
echo 'alias nfz="fuz -p ~/_macosx_notes"' >> ~/.zshrc
echo 'alias nfze="fuz -e -p ~/_macosx_notes"' >> ~/.zshrc
```

## Compatibility
Compatible with bash 3.2+ and zsh 5.9+. Tested on Ubuntu 21.04 and MacOS Monterey/Mojave/Big Sur.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Magnushhoie/fuz.svg?style=for-the-badge
[contributors-url]: https://github.com/Magnushhoie/fuz/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Magnushhoie/fuz.svg?style=for-the-badge
[forks-url]: https://github.com/Magnushhoie/fuz/network/members
[stars-shield]: https://img.shields.io/github/stars/Magnushhoie/fuz.svg?style=for-the-badge
[stars-url]: https://github.com/Magnushhoie/fuz/stargazers
[issues-shield]: https://img.shields.io/github/issues/Magnushhoie/fuz.svg?style=for-the-badge
[issues-url]: https://github.com/Magnushhoie/fuz/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/Magnushhoie/fuz/blob/master/LICENSE.txt
