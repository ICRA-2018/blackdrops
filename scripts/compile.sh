#!/bin/bash
cwd=$(pwd)

# configure paths
source ./scripts/paths.sh

# go to limbo directory
cd deps/limbo

# compile
./waf --libcmaes=${cwd}/install --nlopt=${cwd}/install --dart=${cwd}/install --robot_dart=${cwd}/install --exp blackdrops -j4

# go back to original directory
cd ../..

echo "Do not forget to source scripts/paths.sh to run an experiment"
