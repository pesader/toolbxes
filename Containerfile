FROM registry.fedoraproject.org/fedora-toolbox:36

ENV VERSION=36 NAME=base

LABEL name = $NAME \
      version = $VERSION \
      description = "Base image for building other containers in this repo" \
      author = "Pedro Sader Azevedo <pedro.azevedo@students.ic.unicamp.br>" \
      source = "https://github.com/pesader/toolboxes"

# install missing  manpages
RUN sed -ie 's/\<nodocs\>//' /etc/dnf/dnf.conf
RUN dnf reinstall -y $(rpm -qa --queryformat '%{NAME}[:%{FILENAMES}]\n' | \
    grep ':/usr/share/man/' | cut -f1 -d:)

# upgrade and install base packages
COPY packages /
RUN dnf upgrade -y \
    && dnf install -y $(<packages) \
    && dnf clean all \
    && rm /packages
