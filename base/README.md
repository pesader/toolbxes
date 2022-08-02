# Base

This image is used as a base for all other containers in this repo.
It pulls from the latest Fedora release and does five things:

1. Speeds up `dnf` downloads
2. Configures `dnf` to install manpages when available
3. Reinstalls system packages that should have manpages
4. Installs cheat.sh using its wonky curl-based install script
5. Installs a few packages that I'd like to have on every container

The common packages are my text editor (`nvim`) and its dependencies (`g++`,
`nodejs`, `ctags`, etc) as well as a few essential CLI tools (`zoxide`,
`direnv`, `bat`, `gh`, etc).

