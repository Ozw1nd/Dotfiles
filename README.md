This is a collection of my dotfiles for different applications designed to be deployed with [Stow](https://www.gnu.org/software/stow/)

Currently covered applications
--------

### Terminal
* **[Kitty](https://github.com/kovidgoyal/kitty)** (terminal emulator)
* **[Z Shell](https://www.zsh.org/)** (Unix shell)
* **[Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh)** (prompt theme engine)
* **[Fzf](https://github.com/junegunn/fzf)** (command-line fuzzy finder)

Installation
--------

### Terminal Setup
> [!IMPORTANT]
> On first start, [.zshrc](/.zshrc) will install:
>    * [Zinit](https://github.com/zdharma-continuum/zinit) (Zsh plugin manager)
>    * [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh) (prompt theme engine)
>    * [Bat Catppucin theme](https://github.com/catppuccin/bat)
>    * Zsh plugins: [Zsh Completions](https://github.com/zsh-users/zsh-completions), [Fzf Tab](https://github.com/Aloxaf/fzf-tab), [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [Fast Syntax Highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting), [Fast Syntax Highlighting Catppuccin theme](https://github.com/catppuccin/zsh-fsh), [Sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo), [Command not found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found)

* Install dependencies:
    * Kittty
    * zsh
    * git
    * wget
    * curl
    * bat
    * fzf
    * zoxide
* Change default chell: `sudo chsh -s /bin/zsh`
* Either copy [kitty](kitty/), [fzf](fzf/) and [oh-my-posh](oh-my-posh/) folders to ~/.config/ by hand, or use [Stow](https://www.gnu.org/software/stow/)
    * `cp -r .config/kitty .config/fzf .config/oh-my-posh ~/`
* Place [.zshrc](/.zshrc) ih your home folder
    * `cp .zshrc ~/`
* Restart kitty
