.PHONY: default help test \
install install-lib

CMD := mclauncher-sh

DESTDIR ?= /
PREFIX ?= /usr
INSTALL_LIB ?= $(PREFIX)/lib/bash
INSTALL_BIN ?= $(PREFIX)/bin
INSTALL_MAN ?= $(PREFIX)/share/man/man1
FINALLIZE = ln -s $(DEFAULT) mclauncher-sh

default: help

help:
	@echo 'Makefile rules:'
	@echo ''
	# @echo 'test Run all tests'
	@echo 'install Install $(CMD)'
	@echo '  Submodules to select from:'
	@echo '    * install-dialog Dialog-based UI under bash'
	@echo '    * install-cmdline Runs from command Line arguments.'
	@echo '    * install-lib Only installs the library.'
	@echo 'uninstall Uninstall $(CMD)'
	@echo 'clean Remove build/test files'
	@echo ''
	@echo 'This script supports DESTDIR for installation.'
	
# test: NO TEST PROVIDED

install: install-dialog install-cmdline 
# install-zenity
	DEFAULT ?= mclauncher-dialog
	cd $(INSTALL_BIN)
	$(FINALLIZE)

install-dialog: install-lib
	DEFAULT ?= mclauncher-dialog
	install -m 0755 bin/mclauncher-dialog $(DESTDIR)/$(INSTALL_BIN)/mclauncher-dialog
	$(FINALLIZE)
	
install-cmdline: install-lib
	DEFAULT ?= mclauncher-cmdline
	install -m 0755 bin/mclauncher-cmdline $(DESTDIR)/$(INSTALL_BIN)/mclauncher-cmdline
	$(FINALLIZE)

install-lib: $(INSTALL_LIB)
	install -m 0755 lib $(DESTDIR)/$(INSTALL_LIB)
	
uninstall:
	rm -rf $(INSTALL_BIN)/mclauncher-{cmdline,dialog}
	rm -rf $(INSTALL_LIB)/mclauncher.sh