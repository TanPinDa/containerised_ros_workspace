# ROS/ROS2 Docker Playground

This repo is a simple vscode workspace that uses the dev-container extension to simplify setting up and testing of ROS/ROS2 packages.

## How to use

- Install the "Dev Containers" VS Code extension.
- Modify the `build.args.ROS_DISTRO` argument in `.devcontainer/devcontainer.json`.
  ```json
  {
    "build": {
      "args": {
        "ROS_DISTRO": "noetic"
      }
    }
  }
  ```
- This repo expects a `install-deps.sh` in your project to add any additional apt dependencies or setup required. Please refer to `workspace/non_ros_pkgs/sample-project` for an example.
- The `install-deps.sh` scripts found in workspace/non_ros_pkgs will be run first, followed by the scripts in `workspace/ros_ws`.
- Reopen your project in a dev container.

### Note:

To run anything that requires GUI display, you may need to run the following:

```bash
    xhost +local:root`
```
