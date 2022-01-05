# nix-cuda-docker-repro

## build program

```sh
nix-build -A program
```

## run program

```sh
./result/bin/cuda-program
```

on nixos you need to run it like this:
```
LD_LIBRARY_PATH=/run/opengl-driver/lib ./result/bin/cuda-program
```


## build docker-image

```sh
nix-build -A dockerImage
```

## load docker-image

```sh
docker load -i result
```

## run docker-image

```sh
docker run --rm --gpus all cuda-docker-image
```

this is what currently breaks!
```
$ docker run --rm --gpus all cuda-docker-image
docker: Error response from daemon: OCI runtime create failed: container_linux.go:380: starting container process caused: process_linux.go:545: container init caused: Running hook #0:: error running hook: exit status 1, stdout: , stderr: nvidia-container-cli: ldcache error: process /nix/store/dhj23pp1sld19shjslkzw3y9pr3qpi61-glibc-2.33-59-bin/bin/ldconfig failed with error code: 1: unknown.
```
