# git clone後の初回のgit submoduleの設定を行う
P:=$(shell find . -type d -name '.git' -prune -o -depth 1 -type d -print | sed 's/\.\///g')

all:
	@echo "Do 'make setup' to setup git submodule for Xcode Plugins"

.PHONY: setup init update
setup: init update
init: $(foreach f, $P, git-submodule-init-$(f))
update: $(foreach f, $P, git-submodule-update-$(f))

git-submodule-init-%: %
	@git submodule init $<
git-submodule-update-%: %
	@git submodule update $<
