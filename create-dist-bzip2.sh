#!/bin/bash

: ${TAR:=$(which tar)}

EXTRA_DIST="AUTHORS"
COMPLETION_WIDGETS="_eselect _gcc-config _genlop _gentoolkit _gentoo_packages _layman _portage _portage_utils"

snapshot_date="$(date +%Y%m%d)"
snapshot_dir="zsh-completion-${snapshot_date}"

if [[ -d ${snapshot_dir} ]]; then
	rm -rf ${snapshot_dir}
	mkdir ${snapshot_dir}
else
	mkdir ${snapshot_dir}
fi

for i in ${EXTRA_DIST}; do
	cp ${i} ${snapshot_dir}
done
for i in ${COMPLETION_WIDGETS}; do
	cp ${i} ${snapshot_dir}
done

${TAR} -jcf ${snapshot_dir}.tar.bz2 ${snapshot_dir}
