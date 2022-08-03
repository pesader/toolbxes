# Toolbxes

This repo contains custom container images, meant to be used with
[`toolbx`](https://github.com/containers/toolbox).

## My approach to containerization

Ever since I started daily driving Fedora Silverblue, an immutable variant of
Fedora Workstation, I had to move my development workflow inside containers.
Fedora Silverblue facilitates that a lot with ` toolbx`, a `podman` wrapper
that provides containers highly integrated with the host. You can think of
`toolbx` like one of those virtual environments for programming languages
(`virtualenv` for python, `nvm` for javascript, `rbenv` for ruby, etc) but for
your system packages.

At first I tried using one container for each project but that led to a lot of
redundancy, mostly due to my text editor and all of its plugin dependencies. On
online forums, it seemed that a popular approach to avoid such redundancy was
to use a single container for every package not installed on the host. Although
this would be more storage efficient, I think it defeats the purpose of
`toolbx`, which is to help developers better compartmentalize their
environemnt so as to avoid having a single point of failure.

After trying a few other approaches ("one container per programming language",
"one container per high level task, etc") I ended up sticking to what I found
to be a good middle ground: "one container per context". That means I have
separate environments for school (the `unicamp` image), for work (the `ic`
image), and so on.

## Credit

This was heavily inspired by the works of
[mikebarkmin](https://github.com/mikebarkmin/fedora-toolbox),
[returntrip](https://github.com/returntrip/mytoolboxes), and
[allisonkarlitskaya](https://github.com/allisonkarlitskaya/lisbox)
