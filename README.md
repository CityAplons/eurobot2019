roboflesh - robot firmware for eurobot competition
==================================================

Setup enviroment section
========================

In order to use this repository, the user shall install the following
resources and utilities.

## Install toolchain prerequisities

Some of the requirements for installing and using this software are:
- Update the system
- Installation git
- Installation autoreconf & libusb
- Installation cmake
- Installation gtk

## Install toolchain

### Installation compiler and debbuger

#### ARM developer

The GNU Embedded Toolchain for ARM is a ready-to-use, open source suite of
tools for C, C++ and Assembly programming targeting ARM Cortex-M and Cortex-R
family of processors.

The PPA we want in this case is from the GCC ARM Embedded Maintainer’s
team.

```
sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa
sudo apt-get update
sudo apt-get install gcc-arm-embedded
```
#### Debugger

### Only for Ubuntu/Debian version below 18.04

Bare metal GNU debugger for embedded ARM chips using Cortex-M0/M0+/M3/M4,
Cortex-R4/R5/R7 and Cortex-A* processors. GDB is a source-level debugger,
capable of breaking programs at any specific line, displaying variable values,
and determining where errors occurred.

```
sudo apt-get install gdb-arm-none-eabi
```

If it installs correctly, doing autocomplete in the terminal like so:

```
arm-none (press tab twice)
```

You should see something similar like:

```
arm-none-eabi-addr2line   arm-none-eabi-gcc-ar      arm-none-eabi-nm
arm-none-eabi-ar          arm-none-eabi-gcc-nm      arm-none-eabi-objcopy
arm-none-eabi-as          arm-none-eabi-gcc-ranlib  arm-none-eabi-objdump
arm-none-eabi-c++         arm-none-eabi-gcov        arm-none-eabi-ranlib
arm-none-eabi-c++filt     arm-none-eabi-gcov-dump   arm-none-eabi-readelf
arm-none-eabi-cpp         arm-none-eabi-gcov-tool   arm-none-eabi-size
arm-none-eabi-elfedit     arm-none-eabi-gdb         arm-none-eabi-strings
arm-none-eabi-g++         arm-none-eabi-gprof       arm-none-eabi-strip
arm-none-eabi-gcc         arm-none-eabi-ld
arm-none-eabi-gcc-7.3.1   arm-none-eabi-ld.bfd
```

### Installation st-link

Stlink package is the software for the ST-Link programmer that works with many
ST boards. On the discovery boards, the programmer is embedded at the
top. You just need to make sure you plug in your mini-USB cable into the
center-most port that is labeled ST-Link.

First, clone the repository st-link.

```
git clone https://github.com/texane/stlink.git
```

Everything can be built from the top of directory.
To install st-link you will need:
+ libusb-1.0-0
+ libusb-1.0-0-dev
+ cmake


```
cd stlink
make release
cd build/Release
sudo make install
sudo ldconfig
```
