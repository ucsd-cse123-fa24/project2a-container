# PA2a Container build

Clone by using either of the below commands:
```bash
# Clone with submodules
git clone --recurse-submodules <url>
# Update submodules after clone
git clone <url>
git submodule update --init --recursive
```

## MacOS
docker run --rm --privileged -it -v /lib/modules:/lib/modules alpine modprobe openvswitch
docker run --rm --privileged -it -v /lib/modules:/lib/modules alpine lsmod | grep openvswitch

## Windows
https://unix.stackexchange.com/questions/594470/wsl-2-does-not-have-lib-modules
https://askubuntu.com/questions/1455659/no-kernel-modules-showing-in-lib-modules-in-wsl

# Multiarch build (Linux and macOS M1/M2)
docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag ghcr.io/ucsd-cse123-fa23/pa2a:latest -f Dockerfile .

# Windows build
docker build -t ghcr.io/ucsd-cse123-fa23/pa2a:windows -f Dockerfile.windows .
docker buildx build --push --platform linux/amd64 --tag ghcr.io/ucsd-cse123-fa23/pa2a:windows -f Dockerfile.windows .

# Get kernel file for windows
docker create --name kernel123 ghcr.io/ucsd-cse123-fa23/pa2a:windows && docker cp kernel123:/wsl-kernel/arch/x86/boot/bzImage C:\cse123pa2akernel1 & docker rm kernel123
