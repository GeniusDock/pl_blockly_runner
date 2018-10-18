#!/bin/bash

docker run --privileged --name dind -d docker:17-dind

docker run -it -v /tmp:/tmp --link dind:localhost --name corso --privileged --rm -p 3001:3001 aguspina/prolog-blockly:latest
