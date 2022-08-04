# Toolbxes

This repo contains custom container images, meant to be used with
[`toolbx`](https://github.com/containers/toolbox).

## Usage

You can create new containers from the images built in this repository with:

```bash
toolbox create --image ghcr.io/pesader/toolbxes:${container_name} ${container_name}
```

## Adapting to your own needs

Although I don't believe my container images to be useful to anyone besides
myself, I do think the automated setup to build them via GitHub Actions might
be (especially for other Fedora Silverblue users). If you want to adapt this
repo to your own needs, here's the step-by-step:

1. Fork this repo.
2. List in `base/packages` all packages you want present in every container.
   Since the containers are based on Fedora, you must choose packages that are
   available on `dnf`.
3. Rename the folders (except `base`, `.github`, and `.git`) to the names of
   the containers you want to build. Feel free to also remove or add more
   folders as you see fit.
4. Edit the `packages` file on each folder to include the packages specific to
   each container. You may also alter the `Containerfile` in each folder to
   further customize the container images.
5. Replace every occurence of `ghcr.io/pesader/toolbxes:base` with
   `ghcr.io/${your_github_username}/toolbxes:base`, so the build processes use
   your base image instead of mine.
6. Pull your images with `podman pull ghcr.io/${your_github_username}/toolbxes:${container_name}` or create toolbxes directly with
   `toolbox create --image ghcr.io/${your_github_username}/toolbxes:${container_name} ${container_name}`


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
