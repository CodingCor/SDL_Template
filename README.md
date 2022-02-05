# SDL2_Template

Uses *Ninja* to build the Project
Only the Libraries for dynamic Builds are proviced

## Linux Build

Build the Project using the **compile.sh** script:

> compile.sh

or for the Relase Build:

> compile.sh Release

These command Builds into either build/Debug or build/Release.

## Windows Build

- **MingW64** has to be installed.
- **MingW64** has to be set in PATH
- **Ninja** has to be set in PATH
- all .dll Files need to be copied to the Build Directory.

Build with **CMAKE** with following command: 

> cmake -G Ninka -S . -B build/Debug 

or for a Release Build:

> cmake -G Ninja -S . -B build/Release -DCMAKE_BUILD_TYPE=Relase



