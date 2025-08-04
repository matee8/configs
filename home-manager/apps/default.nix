{
    lib,
    ...
}:
{
    imports = [
        ./console/git.nix
        ./console/zsh.nix
        ./console/tmux.nix
        ./console/neovim.nix

        ./desktop/foot.nix
        ./desktop/river.nix
        ./desktop/yambar.nix
        ./desktop/librewolf.nix
        ./desktop/other.nix
    ];

    options = {
        custom.home-manager = {
            console.enable = lib.mkEnableOption "enable console configuration";
            desktop.enable = lib.mkEnableOption "enable desktop configuration";
        };
    };

    config = {
        custom.home-manager.console.enable = lib.mkDefault true;
        custom.home-manager.desktop.enable = lib.mkDefault true;
    };
}
