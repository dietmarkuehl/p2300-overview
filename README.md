# P2300 Overview

This repo is to support the [P2300](http://wg21.link/p2300) Overview presentation. It contains the relevant slides and some example code.

Also see Eric Niebler's [P2300 hello world](https://godbolt.org/z/b8bWYMbqW) example.

## Example Code

The example code just wraps a few [libevent](https://libevent.org/) functions into senders, creates a context from [libevent](https://libevent.org/)'s `event_base` and then sets up a timer causing a message to be written on regular intervals. The program terminates when some input is entered. The program, thus, demonstrates how to asynchronously wait and read input.

## Building

The example code uses the reference implementation [stdexec](https://github.com/NVIDIA/stdexec) for the `std::execution` framework and [libevent](https://libevent.org/) to demonstrate given a sender/receiver interface to an existing asynchronous library. Assuming a recent C++ compiler (e.g. [`clang`](http://llvm.org) or [`gcc`](http://gcc.gnu.org), make, [wget](https://www.gnu.org/software/wget/) and [cmake](https://cmake.org/) are available on the path, building and running the code should be as as easy as

    make
    ./build/overview
