[![Build Status](https://travis-ci.org/doug65536/starve-check.svg)](https://travis-ci.org/doug65536/starve-check)

# starve-check

Detect CPU starvation

Code is 100% standard C++11, nothing system specific
whatsoever. If you find something non-portable, that
is a bug, please
[file an issue](https://github.com/doug65536/starve-check/issues).

## Pre-built .deb packages

I'm experimenting with automating cross compilation, try the
[.deb packages in the Releases section](https://github.com/doug65536/starve-check/releases).

## Building

I've provided a few ways to build this

1. Build with cmake.
2. Simple method (described below)
3. Build using all available cross-compilation toolchains.

### Simple method
There's a bunch of fancy build stuff, but really,
if you throw `*.cpp` from the root at a C++11 compiler,
it will work. The code uses threads, and unfortunately,
compilers may require you to pass flags, such as
`-std=c++11` and `-pthread`.


### Fancy method

Run some of the provided shell scripts:

```
./detect_toolchains
./buildall
```

This will attempt to build with all available compiler
versions and targets.

All successful builds will produce a deb file package
in the `out/` directory.

#### Simple example with gcc
```
g++ -o starve-check -pthread -std=c++11 *.cpp
```

#### Nicer example with cmake
```
mkdir build
cd build
cmake ..
make && make package
```

*I normally keep the build directory outside the source
directory, but in this case, it really does not matter.*
