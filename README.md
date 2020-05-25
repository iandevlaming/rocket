# rocket
Utilities for using a containerized build environment

# Setup
1. Install docker (https://docs.docker.com/engine/install/)
2. Define an environment variable `CODE_DIR` which contains the path to the development environment. This directory will be binary mounted with write permission
3. Users may also need to define a `GID` environment variable as ```$: GID=$(id -g)``` if it is not already defined
4. Source .rocketrc file in your .bashrc to get useful aliases for creating and working rocket: ```$: source <path/to/rocket>/.rocketrc```

# Usage
* `rocket_build` will build the image `rocket:<version tag>` from the provided docker file `Dockerfile`. This command must be run from the `rocket` directory
* `takeoff` will create a container `rocket` from the `rocket:<version tag>` image and drop the user into an interactive bash shell. 
* `land` will remove the `rocket` container along with any associated volumes

# Etc
* The primary features of the container are a minimal install of ubuntu:latest and the bazel buld tool
* There is no special reason for using a docker file over an image on docker hub other than frequent iteration on the base image
* Most commands are currently just aliases - future work should manage detached, persistently running containers, single command execution, and multiple rocket terminals for a single container instance. The build command should also handle build failure and cleanup
