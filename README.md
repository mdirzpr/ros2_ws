# ros2_ws
ROS2 Workspace Template

## Setup

First, clone this repository.

```
git clone https://github.com/mdirzpr/ros2_ws.git
```
Then, build the Docker image.

```
docker compose build
```

Start a container.

```
docker compose run ros2_jazzy
```

## Test
In order to test ROS2, you can run the cpp-demo-nodes (talker and listener) in the terminal. Open a terminal and run the following command:

```
ros2 run demo_nodes_cpp talker
```

After that, open another terminal and start another container using the same command. Once the container has started, run the following command in the terminal:

```
ros2 run demo_nodes_cpp listener
```

## Developer and maintainer:
- [Mahdi Rezapour](mahdi.rezapour@smartfactory.de)
