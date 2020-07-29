# wct-docker
Dockerized version of [NOAA's Weather and Climate Toolki](https://www.ncdc.noaa.gov/wct/index.php). But you need to have
an X client installed on your docker host.

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

```shell script
$ xhost -local:root
```
When done using, revoke root's permission to connect to X windows display.

# Resources
- [Using GUI's with Docker - ROS.org](http://wiki.ros.org/docker/Tutorials/GUI)
- [Running GUI apps with Docker - Fabio Rehm's Blog](http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/)
- [xhost command for docker GUI apps (Eclipse) - stackoverflow](https://stackoverflow.com/questions/43015536/xhost-command-for-docker-gui-apps-eclipse/43016704#43016704)