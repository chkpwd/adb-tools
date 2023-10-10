# adb-tools

A Dockerized environment for Android's ADB (Android Debug Bridge). This repository provides a lightweight and optimized Docker image for running ADB commands.

## Features

- **Lightweight**: Uses a multi-stage build.
- **Compact**: Only includes ``adb`` binary!
- **Optimized**: Compresses the `adb` binary for faster execution.
- **Easy to Use**: Run ADB commands without the need for local installation.

## Getting Started

### Prerequisites

- Docker installed on your machine.

### Running with Docker

To run a command using the Docker image:
```
docker run -it --rm ghcr.io/chkpwd/adb-tools:latest [YOUR_ADB_COMMAND]
```
For example:
```
- docker run -it --rm ghcr.io/chkpwd/adb-tools:latest version
```
### Override the entrypoint

If you wish to override the default entrypoint:
```
docker run -it --rm --entrypoint bash ghcr.io/chkpwd/adb-tools:latest
```
#### Building the Image Locally

1. Clone the repository:
```
git clone https://github.com/chkpwd/adb-tools.git
cd adb-tools
docker build -t adb-tools .
```
2. Run ADB commands using the Docker container:
```
docker run --rm adb-tools [YOUR_ADB_COMMAND]
```
## Contributing

Feel free to open issues or pull requests if you have suggestions or improvements.
