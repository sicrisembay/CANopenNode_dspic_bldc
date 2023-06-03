## Getting started
This repository contains my hobby project on BLDC motor on a dsPIC33 microcontroller.  Development board used in this hobby project is Cerebot MC7 (obsoleted) from Digilent.

### Development Environment
This is my development setup in my house.
   * Hardware: Cerebot MC7 (Note: Board has built-in licensed debugger)
   * OS: Win10
   * IDE: MPLABX v5.45 (latest version of IDE does not support anymor licensed debugger)
   * Compiler: xc16 v1.70


## Installation

### 1 Install MPLABX

Follow the installation steps below.
```
tar -xvf MPLABX-v5.45-linux-installer.tar

chmod u+x MPLABX-v5.45-linux-installer.sh

sudo ./MPLABX-v5.45-linux-installer.sh
```
Run MPLAB X by typing "mplab_ide" in the command line terminal.
MPLAB X executable, "mplab_ide" is found in /usr/bin.


To uninstall MPLABX
```
cd /opt/microchip/mplabx/v5.45

sudo chmod u+x Uninstall_MPLAB_X_IDE_v5.45

sudo ./Uninstall_MPLAB_X_IDE_v5.45
```


### 2 Install XC16 compiler

Follow the installation steps below
```
chmod u+x xc16-v1.70-full-install-linux64-installer.run

sudo ./xc16-v1.70-full-install-linux64-installer.run
```


### 3 Install [python](https://www.python.org/)


### 4 Install kconfig lib

```
pip install kconfiglib
```
Add to environment path variable (python_install_path)/Lib/site-packages.

#### 4.1 Windows

4.1.1  Install windows-curses

```
pip install windows-curses
```

4.1.2  Install MinGW-w64 (msys64). Refer to [link](https://www.msys2.org/).  Add to environment path variable the (msys2_install_path)/usr/bin


4.1.3 In msys2, install the following
```
pacman -S make
pacman -S python
```

#### 4.2 Linux

4.2.1 Make the kconfig python scripts executable

```
cd ~/.local/lib/python3.8/site-packages
chmod u+x *.py
```

4.2.2 Add to path

```
export PATH=$PATH:~/.local/lib/python3.8/site-packages
```

or Add to .bashrc



## Build Steps

Clone this repository
```
git clone --recursive https://github.com/sicrisembay/CANopenNode_dspic_bldc.git
```

Generate the configuration file
```
cd CANopenNode_dspic_bldc
cd firmware
make defconfig
```

Using MPLABX IDE, open the project and build.


