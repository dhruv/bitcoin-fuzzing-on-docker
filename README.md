# bitcoin-fuzzing-on-mac

I use macOS for by Bitcoin Core development. I've found fuzzing to be hard to run on mac. This repo contains a simple set of scripts so you don't have to constantly fiddle with docker.

Steps:

* Build the docker image: `./build-image.sh`
* Export `$BITCOIN_REPO` and `$QA_ASSETS_REPO` in your shell and point them to the [bitcoin core](https://github.com/bitcoin/bitcoin) repository and the [qa-assets](https://github.com/bitcoin-core/qa-assets) repository locally.
* Run the docker container: `./run_container.sh`. You can now build and run in ubuntu. In that container, you'll find bitcoin core in `/bitcoin` and qa-assets in `/qa-assets`.

### Other useful commands

#### Configure to run an optimized fuzzer build
`CC=clang CXX=clang++ ./configure --enable-fuzz --with-sanitizers=address,fuzzer,undefined`

#### Run optimized fuzzer
`FUZZ=<fuzz_test_name> src/test/fuzz/fuzz /qa-assets/fuzz_seed_corpus/<fuzz_test_name>`

#### Configure to run an unoptimized fuzzer build with debug symbols
`CC=clang CXX=clang++ ./configure CXXFLAGS="-O0 -g" CFLAGS="-O0 -g" --enable-fuzz --with-sanitizers=ad    dress,fuzzer,undefined`

#### Run debug fuzzer with lldb
`FUZZ=<fuzz_test_name> lldb src/test/fuzz/fuzz`
`lldb> run /qa-assets/fuzz_seed_corpus/<fuzz_test_name>`

#### lldb breakpoint and counting
You can set a breakpoint in lldb using `br set -f <file> -l <line> -i <ignore_count>`
You can see how often that breakpoint is hit using `br l`

#### To build
Since `./run_container.sh` allocated 3 CPUs, `make -j 3` seems to work well.


