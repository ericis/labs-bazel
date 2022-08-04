.DEFAULT_GOAL:=install

all: install

.PHONY: install
install:
	@bazel build --define=VERBOSE_LOGS=1 //src/node/console-basic:app

.PHONY: run
run:
	@bazel run //src/node/console-basic:app

.PHONY: clean
clean:
	@rm -rf ./bazel-*
