# syntax=docker/dockerfile:1

FROM docker.io/library/ubuntu:noble

ENV R_VERSION="4.5.1"
ENV R_HOME="/usr/local/lib/R"
ENV TZ="Etc/UTC"

COPY scripts/install_R_source_edit.sh /rocker_scripts/install_R_source.sh
RUN /rocker_scripts/install_R_source.sh

ENV CRAN="https://p3m.dev/cran/__linux__/noble/latest"
ENV LANG=en_US.UTF-8


COPY scripts/bin/ /rocker_scripts/bin/

COPY scripts/setup_R.sh /rocker_scripts/setup_R.sh
RUN <<EOF
if grep -q "1000" /etc/passwd; then
    userdel --remove "$(id -un 1000)";
fi
/rocker_scripts/setup_R.sh
EOF

COPY scripts/install_tidyverse.sh /rocker_scripts/install_tidyverse.sh
RUN /rocker_scripts/install_tidyverse.sh

ENV S6_VERSION="v2.1.0.2"
ENV RSTUDIO_VERSION="2025.05.1+513"
ENV DEFAULT_USER="rstudio"

COPY scripts/install_rstudio.sh /rocker_scripts/install_rstudio.sh
COPY scripts/install_s6init.sh /rocker_scripts/install_s6init.sh
COPY scripts/default_user.sh /rocker_scripts/default_user.sh
COPY scripts/init_set_env.sh /rocker_scripts/init_set_env.sh
COPY scripts/init_userconf.sh /rocker_scripts/init_userconf.sh
COPY scripts/pam-helper.sh /rocker_scripts/pam-helper.sh
RUN /rocker_scripts/install_rstudio.sh

EXPOSE 8787
CMD ["/init"]

COPY scripts/install_pandoc.sh /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_pandoc.sh

COPY scripts/install_quarto.sh /rocker_scripts/install_quarto.sh
RUN /rocker_scripts/install_quarto.sh

ENV CTAN_REPO="https://mirror.ctan.org/systems/texlive/tlnet"
ENV PATH="$PATH:/usr/local/texlive/bin/linux"

COPY scripts/install_verse.sh /rocker_scripts/install_verse.sh
COPY scripts/install_texlive_edit.sh /rocker_scripts/install_texlive.sh
RUN /rocker_scripts/install_verse.sh

ENV CCTU_VERSION="0.8.8"
COPY scripts/install_cctu.sh /rocker_scripts/install_cctu.sh


RUN /rocker_scripts/install_cctu.sh

COPY scripts /rocker_scripts
