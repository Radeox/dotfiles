{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    aichat
    ansible
    cargo
    cmake
    gcc
    git
    git-extras
    github-copilot-cli
    gnumake
    mariadb.client
    mongodb-tools
    nodejs_22
    php84
    tree-sitter
  ];
}
