#!/bin/sh

: ${TAR:=$(which tar)}

EXTRA_DIST="AUTHORS"
COMPLETION_WIDGETS="_eselect _gcc-config _genlop _gentoolkit _gentoo_packages _layman _portage _portage_utils"

${TAR} -jcf zsh-completion-$(date +%Y%m%d).tar.bz2 ${COMPLETION_WIDGETS} ${EXTRA_DIST}
