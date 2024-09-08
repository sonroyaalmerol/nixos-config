<!-- markdownlint-disable -->
<h1 align="center">
    <a name="top" title="nixos-config">
        nixos-config
    </a>
</h1>
<div align="center">
    <sup>
        <a href="https://nixos.org"><img src="https://avatars.githubusercontent.com/u/487568?s=200&v=4"></a>
    </sup>
        <br/>
        <sub>
            <a href="https://nixos.org/manual/nix/stable/language/index.html" target="_blank">
            <img alt="Built With Nix" src="https://img.shields.io/static/v1?logoColor=d8dee9&label=Built%20With&labelColor=5e81ac&message=Nix&color=d8dee9&style=for-the-badge">
            </a>
            <a href="https://nixos.wiki/wiki/Flakes" target="_blank">
            <img alt="Nix Flakes Ready" src="https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Nix%20Flakes&labelColor=5e81ac&message=Ready&color=d8dee9&style=for-the-badge">
            </a>
            <a href="https://github.com/nix-community/home-manager" target="_blank">
            <img alt="Uses" src="https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Uses&labelColor=5e81ac&message=Home Manager&color=d8dee9&style=for-the-badge">
            </a>
        </sub>
    </div>
</div>

<div align="center">
    Dotfiles for my personal <a href="https://hyprland.org">Hyprland</a> setup on <a href="https://nixos.org">NixOS</a>.
</div>
<!-- markdownlint-restore -->

## Setup

- OS: [NixOS](https://nixos.org)
- Window manager: [Hyprland](https://hyprland.org)
- Status bar: [Waybar](https://github.com/Alexays/Waybar)
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty)
- Shell: `Zsh` with plugins managed through [antidote](https://github.com/mattmc3/antidote)
- Current theme: [Rosé Pine](https://rosepinetheme.com)
- Font: [Recursive](https://www.recursive.design)
- Editor: [Neovim](https://neovim.io) with NvChad. Configuration can be found [here](https://github.com/sonroyaalmerol/nvchad-personal-config)

## Gallery

|             Desktop              |
| :------------------------------: |
| ![desktop](./assets/desktop.png) |

|           Terminal + Tmux            |
| :----------------------------------: |
| ![terminals](assets/./terminals.png) |

|             Neovim             |
| :----------------------------: |
| ![neovim](./assets/neovim.png) |

|             VSCode             |
| :----------------------------: |
| ![vscode](./assets/vscode.png) |

## Organization of the modules

![directory-structure](./assets/directory_structure.png)

## Installation

### Requirements

- NixOS 23.11 or Home-manager
- Patience
- Knowledge
- Disk space

### NixOS installation

Use `sudo just bs` or:

```sh
sudo nixos-rebuild switch --flake '.#<host>'
```

### Home-manager installation

Use `just hs` or:

```sh
home-manager switch --flake '.#<user>@<host>'
```
