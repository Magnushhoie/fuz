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
- Interactively searches files and filenames with preview
- Opens selected file/line at search result with less / vim / system app
- Markdown / code highlighting with bat
- Ignores hidden directories, .gitignore, binary and large files
- Sane defaults, search max depth, caps matches for very large files
- Memory mapping with ripgrep

## Installation

```bash
# 1. Download
git clone https://github.com/Magnushhoie/fuz/
cd fuz && chmod +x fuz

# 2. Add to your .zshrc or .bashrc
FUZ_PATH="$(realpath fuz)"
echo alias fuz="$FUZ_PATH" >> ~/.zshrc # Search filecontents, open with less
echo alias fuze=\"fuz --names --edit\" >> ~/.zshrc # Search filenames, open with vim

# 3. Optional: Point to specific directory (e.g. notes)
FUZ_DIR="$(realpath notes/)" # Favorite directory
echo alias fz=\"fuz --path $FUZ_DIR\" >> ~/.zshrc
echo alias fze=\"fuz --names --edit --path $FUZ_DIR\" >> ~/.zshrc
```

```bash
# Requirements (Pick one)
# 1. MacOS
brew install fzf rg bat 
# 2. Ubuntu
sudo apt-get install fzf ripgrep bat 
# 3. Conda
conda install -c conda-forge fzf ripgrep bat 

```

## Usage

```
Usage: fuz [-cdehmnos]
      -p path -c filename 
      -d num -m num -s filesize
      [filename or pattern]

Fuz interactively searches the current directory, and
opens selected file at search result with less / vim / system app.

Skips .gitignore, hidden, binary and large files.

Project homepage: https://github.com/Magnushhoie/fuz


Examples:
- Search file-contents from current directory, open with less:
    fuz

- Search filenames (-n) from current directory, edit (-e) with vim:
    fuz -n -e

- Search file bash.sh from path (-p) notes/
    fuz -p notes/ bash


Available options:
  -p, --path       Search path (default current)
  -n, --names      Search for filenames
  -e, --edit       Open with editor (vim) instead of less
  -o, --open       Open with system editor
  -c, --create     Create new file with vim
  -d, --max-depth  Max search depth (3)
  -m, --max-lines  Max line-matches per file (1000)
  -s, --max-size   Max file-size (50K)
  -h, --help       Print this help and exit
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
