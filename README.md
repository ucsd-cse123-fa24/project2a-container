# PA2a Container build

Ensure you have docker installed first

Clone by using either of the below commands:
```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/ucsd-cse123-wi24/project2a-container.git
# Update submodules after clone
git clone https://github.com/ucsd-cse123-wi24/project2a-container.git
git submodule update --init --recursive
```

# Multiarch (Linux and macOS M1/M2)

docker volume create cse123pa2_data

docker build -t cse123pa2 --target linux .

docker run --rm --privileged -it -v /lib/modules:/lib/modules -t cse123pa2

# Windows build (You need to run this from a WSL shell, not from Powershell)

docker volume create cse123pa2_data

docker build -t cse123pa2 --target windows .

docker run -d -it -t cse123pa2

#(DO NOT RUN THIS) docker buildx build --push --platform linux/amd64 --tag ghcr.io/ucsd-cse123-fa23/pa2a:windows --target windows .

https://unix.stackexchange.com/questions/594470/wsl-2-does-not-have-lib-modules
https://askubuntu.com/questions/1455659/no-kernel-modules-showing-in-lib-modules-in-wsl

# Get kernel file for windows
#(DO NOT RUN THIS) docker create --name kernel123 ghcr.io/ucsd-cse123-wi24/pa2a:windows && docker cp kernel123:/wsl-kernel/arch/x86/boot/bzImage C:\cse123pa2akernel & docker rm kernel123

