# labs-bazel

Testing bazel features...

See [Bazel issue #3519 for more details](https://github.com/bazelbuild/rules_nodejs/issues/3519).

- Errors documented in "src/node/console-basic/BUILD.bazel"
- After failing to use `nodejs_binary` with Yarn Plug'n'Play (PnP) and seeing that `nodejs_test` might have support for passing the necessary `--require=...` argument to tell Node to use Yarn's "./pnp.cjs" file and after reading about the make variable expansion, there were attempts to define a custom `genrule` to define a custom variable that supported using `ctx.expand_location(...)` to expand the `Label` path and then pass that variable into the `nodjs_binary` `templated_args` argument. However, the complexity was confounding; referencing many, many Bazel guides, API references and StackOverflow questions.
- Chicken, meet egg: NodeJS is required in order to install Bazel using the NPM packages. However, Bazel can install specific versions of Node and Yarn for the project. Yarn can also "pin" project-specific versions using `yarn set version ...`. Bazelisk and Bazel both support version pinning too with ".bazeliskrc" and ".bazelversion" respectively. As a result, you will see files attempting to explore the options and provide some level of developer tooling flexibility; but, the versioning results in a LOT of duplication.
- "makefile" was created to simplify Bazel developer task execution, but using GNU `make` on Windows requires WSL with Linux (not Windows) or an emulated BASH environment like [Git BASH with `make`](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058#make), [cygwin with `make`](https://cygwin.com/cgi-bin2/package-cat.cgi?file=x86_64%2Fmake%2Fmake-4.3-1&grep=make) or other. However, [Bazel recommends not using an emulated BASH environment on Windows](https://bazel.build/docs/windows#running-bazel-shells).

... this basic test with modern tools was a complete failure. It involved an excessive amount of time "figuring out" Bazel and running into platform-specific and tool-specific problems that should "just work" out of the box. Hoping for a fix from someone smarter at Bazel coding than me!
