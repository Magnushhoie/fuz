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

  <h1 align="center">fuz</h3>

  <p align="center">
    Terminal-based, file fuzzy finder for ultra-fast text search. Integrated with vim
  </p>
</p>

</p>
<p align="center">
<img src="img/image.jpg" alt="Logo" width="700">
</p>

Features:
- Interactively find files by name or content
- Opens at selected file/line with less, vim or system default application
- Ignores hidden directories, .gitignore, non-text and large files
- File preview at line-match, syntax highlighting w/ bat
- Sane defaults, skip very large files/lines, search max depth
- Memory mapping with ripgrep

## Installation

```bash
# Download
git clone https://github.com/Magnushhoie/fuz/
cd fuz
chmod +x fuz

# Add to .bashrc / .zshrc
NOTESDIR=$(realpath notes/)
echo "alias fuz=\"$(realpath fuz)\"" >> ~/.zshrc # Fuzzy search
echo "alias fz=\"fuz -p $NOTESDIR\"" >> ~/.zshrc # Search notes/ directory
echo "alias fze=\"fuz -n -e -p $NOTESDIR\"" >> ~/.zshrc # Search filenames in notes/ open in vim
```

```bash
# Requirements

# MacOS
brew install fzf rg bat

# Ubuntu
sudo apt-get install fzf ripgrep bat

# Conda
conda install -c conda-forge fzf ripgrep bat
```

## Usage

```
Usage: fuz [-h] [-e] [-n] [-v]
      -d DEPTH -m MAXLINES -p PATH
      [filename]

Interactively search files, open with vim/less
Project homepage: https://github.com/Magnushhoie/fuz


Examples:
- Search file-contents from current directory, open with less:
    fuz

- Search filenames (-n) from current directory, edit (-e) with vim:
    fuz -n -e

- Search file bash.sh from path (-p) notes/
    fuz -p notes/ bash


Available options:
  -h, --help      Print this help and exit
  -d, --depth     Max search depth
  -e, --edit      Open with editor (vim) instead of less
  -n, --names     Search for filenames
  -m, --maxlines  Maximum linematches read per file
  -p, --path      Search path
```

## Read more
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)

## Compatibility
Compatible with bash 3.2+ and zsh 5.9+. Tested on MacOS Mojave/Big Sur and Ubuntu 21.04.

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
