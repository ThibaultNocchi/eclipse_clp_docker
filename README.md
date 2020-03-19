# eclipse_clp_docker
Dockerfile to make and use the Eclipse CLP interpreter with `rlwrap` tool.

## Build the Docker image
In the directory where you downloaded the Dockerfile:
```bash
docker build . -t eclipse_prolog
```
This should build a ready to use `eclipse_prolog`.

## Usage
If you wish to mount some code in the Docker container, go into your code directory then launch the Docker image:
```bash
docker run --rm -it -v $(pwd):/code eclipse_prolog
```
It will mount your current active directory to the `/code` directory in the container and put you into a shell in `/code`.  
Then just use `eclipse` to start the interpreter and you will be able to use the UP and DOWN arrows to navigate history thanks to `rlwrap`.
