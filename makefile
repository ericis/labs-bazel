.DEFAULT_GOAL:=install

all: install

.PHONY: install
install:
	@yarn bazel --version
