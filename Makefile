.PHONY: install
install:
	@./install.sh

.PHONY: sios
sios: SHELL:=/bin/bash
sios:
	@open -a Simulator

.PHONY: web
web: SHELL:=/bin/bash
web:
	@flutter channel beta
	@flutter upgrade
	@flutter config --enable-web

