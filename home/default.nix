{ pkgs, ... }: 
let
  selectProject = pkgs.writeScriptBin "selectProject" (builtins.readFile ../scripts/zsh/selectProject.zsh);
  quicknote = pkgs.writeScriptBin "quicknote" (builtins.readFile ../scripts/zsh/quicknote.zsh);
in {
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  home.username = "jgero";
  home.homeDirectory = "/home/jgero";
  xdg.enable = true;

  home.packages = with pkgs; [
    bitwarden
    signal-desktop
    firefox
    thunderbird
    libreoffice
    gimp
    element-desktop

    xclip
    fzf
    ripgrep
    tree

    selectProject
    quicknote
  ];

  imports = [
    ./git.nix
    ./gnome.nix
    ./kitty.nix
    ./task.nix
    ./tmux.nix
    ./zsh.nix
  ];
}