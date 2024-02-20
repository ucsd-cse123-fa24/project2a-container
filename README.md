# PA2a Container Build (and Run) Instructions

## Step 1. Clone the git repo by using either of the commands below:

***Windows: You need to run this from an Ubuntu shell in WSL, not from Powershell***

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/ucsd-cse123-wi24/project2a-container.git

# Or, clone and update submodules after clone
git clone https://github.com/ucsd-cse123-wi24/project2a-container.git
git submodule update --init --recursive
```

## Step 2: Build and run the Docker container

### Linux and macOS M1/M2

```bash
# Create a volume for your docker container so your project directory will live when your container dies
docker volume create cse123pa2_data
# Build the docker container for the project
docker build -t cse123pa2 --target linux .
# Run the docker container for the project. Run this each time you work on the project.
# You should be able to attach to the running container in VSCode after this is executed.
docker run -d --rm --privileged -it --name pa2 -v /lib/modules:/lib/modules -v cse123pa2_data:/project-base -t cse123pa2
# You can now clone the github repo into your proejct from inside the bash shell

# To open a shell inside the running container, in each terminal run the following:
docker exec -it pa2 bash
```

### Windows (WSL Ubuntu shell)

Ubuntu Shell:
```bash
# Create a volume for your docker container so your project directory will live when your container dies
docker volume create cse123pa2_data
# Build the docker container for the project (this will take ~30mins to build the new kernel)
docker build -t cse123pa2 --target windows .
# Run the docker container for the project. Run this each time you work on the project.
# You should be able to attach to the running container in VSCode after this is executed 
docker run -d --rm --privileged -it --name pa2 -v cse123pa2_data:/project-base -t cse123pa2
# Copy the new kernel out of the docker image into WSL
docker cp pa2:/wsl-kernel/vmlinux /tmp/vmlinux
```

Powershell:
```bash
# Switch to your windows home directory
cd ~
# Copy the kernel image out of WSL into your Windows home directory
wsl cp /tmp/vmlinux cse123pa2-kernel
# Launch notepad to edit your wsl config file
notepad .wslconfig
```
In your .wslconfig write the following text in notepad and save it:
```
[wsl]
kernel=C:\\Users\\YourUserName\\cse123pa2-kernel
```

```bash
# To open a shell inside the running container, in each terminal run the following:
docker exec -it pa2 bash
```

#(DO NOT RUN THIS) docker buildx build --push --platform linux/amd64 --tag ghcr.io/ucsd-cse123-fa23/pa2a:windows --target windows .

https://unix.stackexchange.com/questions/594470/wsl-2-does-not-have-lib-modules
https://askubuntu.com/questions/1455659/no-kernel-modules-showing-in-lib-modules-in-wsl

# Get kernel file for windows
#(DO NOT RUN THIS) docker create --name kernel123 ghcr.io/ucsd-cse123-wi24/pa2a:windows && docker cp kernel123:/wsl-kernel/arch/x86/boot/bzImage C:\cse123pa2akernel & docker rm kernel123

