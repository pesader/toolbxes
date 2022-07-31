# Base

This image is used as a base for all other containers in this repo.
It pulls from the latest Fedora release and does four things:

- Speeds up `dnf` downloads
- Configures `dnf` to install manpages when available
- Reinstalls system packages that should have manpages
- Installs a few packages that I'd like to have on every container

The common packages are my text editor (`nvim`) and its dependencies (`g++`,
`nodejs`, `ctags`, etc) as well as a few essential CLI tools (`zoxide`,
`direnv`, `bat`, `gh`, etc).

