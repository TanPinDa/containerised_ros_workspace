# ROS/ROS2 Docker Playground

This repo is a simple vscode workspace that uses the dev-container extension to simplify setting up and testing of ROS/ROS2 packages.

## How to use
- Install the "Dev Containers" VS Code extension.
- Modify the ```build.args.ROS_DISTRO``` argument in ```.devcontainer/devcontainer.json```.
    ```json
        {
            "build": {
                "args": {
                    "ROS_DISTRO": "noetic",
                }
            }
        }
    ```
- Modify ```.devcontainer/install_dependencies.sh``` to add any additional apt dependencies or setup required.
- Reopen your project in a dev container.

### Note: 
To run anything that requires GUI display, you may need to run the following:
```bash
    xhost +local:root`
```