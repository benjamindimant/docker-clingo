#!/bin/bash
if [ ! -z "$1" ]
then
  docker run -it --rm -v $(pwd):/tmp clingo:latest clingo -n 2 "/tmp/$1"
else
  docker run -it --rm clingo:latest bash
fi

