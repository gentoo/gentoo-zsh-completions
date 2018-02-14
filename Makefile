
DESTDIR =
EPREFIX =

completionsdir ?= ${EPREFIX}/usr/share/zsh/site-functions
completions = $(wildcard src/_*)

POSTINST_SED = sed -i -e "s|@GENTOO_PORTAGE_EPREFIX@|${EPREFIX}|g"

all:
	@echo Nothing to compile.

install:
	install -d "$(DESTDIR)$(completionsdir)"
	install -m0644 $(completions) "$(DESTDIR)$(completionsdir)"
	$(POSTINST_SED) $(addprefix "$(DESTDIR)$(completionsdir)"/,$(notdir $(completions)))

