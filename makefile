.DEFAULT_GOAL:=install

all: install

.PHONY: install
install:
	@bazel build //src/node/console-basic:show_custom_var
	@cat ./bazel-bin/src/node/console-basic/custom_var

.PHONY: run-node-console-basic
run-node-console-basic:
	@bazel run //src/node/console-basic:show_custom_var

.PHONY: clean
clean:
	@rm -rf ./bazel-*
