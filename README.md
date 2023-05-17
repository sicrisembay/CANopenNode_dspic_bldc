## Getting started
This repository contains my hobby project on BLDC motor on a dsPIC33 microcontroller.  Development board used in this hobby project is Cerebot MC7 (obsoleted) from Digilent.

### Development Environment
This is my development setup in my house.
   * Hardware: Cerebot MC7 (Note: Board has built-in licensed debugger)
   * OS: Win10
   * IDE: MPLABX v6.05
   * Compiler: xc16 v2.10


## Installation

1.  Install MPLABX
2.  Install XC16 compiler
3.  Install [python](https://www.python.org/)
4.  Install kconfig lib
```
pip install kconfiglib
```
Add to environment path variable (python_install_path)/Lib/site-packages.

5.  Install windows-curses
```
pip install windows-curses
```
6.  Install MinGW-w64 (msys64). Refer to [link](https://www.msys2.org/).  Add to environment path variable the (msys2_install_path)/usr/bin

7. In msys2, install the following
```
$ pacman -S make
$ pacman -S python
```

