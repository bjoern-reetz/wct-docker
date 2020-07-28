# wct-docker
Dockerized version of [NOAA's Weather and Climate Toolki](https://www.ncdc.noaa.gov/wct/index.php).

# Usage
```shell script
$ xhost local:root
```
This permits the root user on the local machine to connect to X windows display.
```shell script
$ docker run --net=host -e DISPLAY -v $(pwd):/mydata bjoernreetz/wct
```
This runs a container with the following options:
- `--net=host`: host networking, the container is not launched with an isolated network stack. Instead, all networking interfaces of the host are directly accessible inside the container.
- `-e DISPLAY`: pass through the DISPLAY environment variable from the host into the container. This tells GUI programs where to send their output.
- `-v $(pwd):/mydata`: map the current working directory on the host to the /mydata folder inside the container.
