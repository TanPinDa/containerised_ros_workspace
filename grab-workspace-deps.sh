#!/bin/sh

## Iterate recursively through /workspace/non_ros_pkgs and run all files that match "install-deps.sh"
find /workspace/non_ros_pkgs -name "install-deps.sh" -exec sh {} \;

## Iterate recursively through /workspace/ros_ws and run all files that match "install-deps.sh"
find /workspace/ros_ws -name "install-deps.sh" -exec sh {} \;