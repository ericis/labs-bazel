.DEFAULT_GOAL:=install

all: install

.PHONY: install
install:
	@bazel build --define=VERBOSE_LOGS=1 //app1:app

.PHONY: run
run:
	@bazel run //app1:app

.PHONY: clean
clean:
	@rm -rf ./bazel-*
