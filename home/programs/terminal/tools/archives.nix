{
    pkgs,
    ...
}:
{
    home.packages = with pkgs; [
        atool
        zip
        unzip
    ];
}
