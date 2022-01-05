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
