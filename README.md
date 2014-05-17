Clarch
======

Clives Arch Linux installation

Usage:
1. If you are using configuration files from an existing linux installation, clone this repo to the existing system, if not skip to step 3
2. Open backup-config-files.sh and edit the list config files that you wish to copy to another installation.
3. If you arent using your own config file on an existing install, you can alternatively edit the files already in ./dotfiles/ as required. For example, in .Xresources set desired fonts and terminal colors etc.
4. Open clarch-install.sh and modify package lists and script variables as required, there is a core applications list (firmware, desktop interface etc), a base applications list (urxvt, alsa, chromium etc), a developer applications list (python modules, R language etc) as well a list for packages in the Arch User Repoistory (automated AUR doesnt quite work just yet).
5. After a fresh Arch Linux install, clone this repo, cd into the root dir and run clarch-install.sh
