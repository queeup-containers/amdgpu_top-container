
# [amdgpu_top](https://github.com/Umio-Yasuno/amdgpu_top) in a container

## Tags

- `latest`: latest amdgpu_top on top of scratch image
  - `0.11.2-r0`: you can choose specific version of amdgpu_top

## Use

```bash
docker run \
    --rm \
    --interactive \
    --tty \
    --device /dev/dri \
    ghcr.io/queeup-containers/amdgpu_top-container:latest
```

## Build

```bash
docker build -t amdgpu_top-container --file Containerfile .
```
