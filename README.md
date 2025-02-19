# Re-reproduce project of MPC-D-CBF: Dynamic Control Barrier Function-based Model Predictive Control to Safety-Critical Obstacle-Avoidance of Mobile Robot

Re-reproduce of MPC-D-CBF with tuning and new environments (indoor and pedestrain)

![demo](./mpc_d_cbf.gif)

Reproduce procedure please refer to
https://github.com/jianzhuozhuTHU/MPC-D-CBF/issues/1
\
pseudo_odom node has been included in this project.

In addition, you may need
```
sudo apt-get install ros-noetic-velodyne-*  
sudo apt-get install ros-noetic-jackal-control  
sudo apt-get install ros-noetic-jackal-description  
pip install casadi  
```


# Origin project:
Github: https://github.com/jianzhuozhuTHU/MPC-D-CBF  \
arXiv: https://arxiv.org/abs/2209.08539  \
bilibili: https: https://www.bilibili.com/video/BV1fN4y1N7pD/?vd_source=e11d8557ce1350ea4930d15280abb7e2  \
YouTube: https://youtu.be/U3X6vqKTxRw

# See also
https://github.com/zm-3171/MPC-D-CBF

# Run this repo
1. build with
    ```bash
    catkin build
    ```
2. for dynamic environment
   1. run simulation
        ```bash
        bash run_simulation.sh
        ```
   2. run local planner (in another terminal)
        ```bash
        source devel/setup.bash
        roslaunch local_planner local_planner.launch
        ``` 
3. for indoor envionment
   1. run simulation
        ```bash
        bash run_simulation.sh benchmark
        ```
   2. run local planner (in another terminal)
        ```bash
        source devel/setup.bash
        roslaunch local_planner local_planner.launch
        ``` 

# Fixed issues
+ inf or nan exists in `get_ellipse_array` of `ellipse.hpp`, use sanity check to avoid this.

# Known issues
+ if the car is very close to the obstacle, corresponding point cloud may suddenly disappear (this may because the sanity check above)