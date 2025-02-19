#!/bin/sh

# set environment variable to add velodyne for Jackal
export JACKAL_LASER_3D=1
# add secondary laser
# fixed this problem at src/jackal_description/urdf/, line 129
export JACKAL_LASER_3D_TOPIC="velodyne_points"

# add source, we are now using catkin tools
source devel/setup.bash 

# run simulation
# check the number of input arguments
if [ $# -eq 0 ]; then
    # no input arguments, just run the orginal simulation
    roslaunch scene dynamic.launch
elif [ $# -eq 1 ] && [ "$1" = "benchmark" ]; then
    echo "\n\n ===================== benchmarking with success case, notice: make sure that the starting point and end point are set correctly =================== \n\n"
    # one input argument and it equals "benchmark", run with success example
    roslaunch pedsim_simulator jackal_ped_world.launch 
elif [ $# -eq 2 ] && [ "$1" = "benchmark" ] && [ "$2" = "success" ]; then
    echo "\n\n ===================== benchmarking with success case, notice: make sure that the starting point and end point are set correctly =================== \n\n"
    roslaunch pedsim_simulator jackal_ped_world.launch path:=2
elif [ $# -eq 2 ] && [ "$1" = "benchmark" ] && [ "$2" = "fail" ]; then
    echo "\n\n ===================== benchmarking with fail case, notice: make sure that the starting point and end point are set correctly =================== \n\n"
    roslaunch pedsim_simulator jackal_ped_world.launch path:=3
else
    # Either more than 1 input argument, or the first argument is not "body"
    echo "Error: Invalid input. Usage:"
    echo "  - No arguments: roslaunch simulation with default settings"
    echo "  - One argument 'benchmark': roslaunch pedsim_simulator jackal_ped_world.launch"
fi
