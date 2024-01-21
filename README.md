# wsl-perf

Welcome to the `wsl-perf` repository! This repository provides a Debian package (`deb`) that enables the use of the `perf` command on Windows Subsystem for Linux (WSL). The package is specifically designed for WSL 2 and is intended for performance analysis tasks in Linux environments.

## Tested Environment

Please note that this package has been tested only on Ubuntu 23.10 on WSL 2. While it may work on other distributions or versions, its functionality is not guaranteed outside this environment.

## Installation

To install the `perf` package, use the following steps:

1. Open your WSL terminal.
2. Set your WSL kernel version as a variable. This command extracts the major and minor version number from the kernel version:
   ```
   VERSION=$(uname -r | cut -d. -f1,2)
   ```
3. Use `wget` to download the package:
   ```
   wget https://github.com/buty4649/wsl-perf/releases/download/v$VERSION/perf-$VERSION-microsoft-standard-WSL2.deb
   ```
4. Install the package using:
   ```
   sudo dpkg -i perf-$VERSION-microsoft-standard-WSL2.deb
   ```
5. Once installed, `perf` is ready to be used by simply typing `perf` in the terminal.

## Usage

Here are some basic commands to get started with `perf`:

- List all available events: `perf list`
- Record performance data: `perf record -e [event] -p [pid]`
- Report the recorded data: `perf report`

Refer to the `perf` documentation for more detailed instructions.

## License

This project is licensed under the [MIT License](LICENSE.md).

