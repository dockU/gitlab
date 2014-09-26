FROM dock0/service
MAINTAINER Jon Chen <bsd@voltaire.sh>

RUN pacman -Syu --needed --noconfirm --noprogressbar tar
ADD https://aur.archlinux.org/packages/gi/gitlab/gitlab.tar.gz /opt/gitlab.tar.gz
RUN tar -xf /opt/gitlab.tar.gz -C /opt/
WORKDIR /opt/gitlab
RUN /usr/bin/makepkg --syncdeps --noconfirm --needed --noprogressbar --install --asroot
WORKDIR /
RUN rm -rf /opt/gitlab /opt/gitlab.tar.gz
