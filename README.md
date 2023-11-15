# SEP-24 Reference UI

## Developing

We use `yarn` package manager.

`yarn` or `yarn install`

To start the app in development mode, which will watch for changes to files,
rebuild, and reload the site automatically, run the start script.

`yarn start`

## Building for production

Builds the app for production to the `build` folder.

`yarn build`

### Development

Use the `Dockerfile.dev` file for development:

1. **Build the Docker image**

   Replace `<name:tag>` with your preferred image name and tag.

   ```bash
   docker build -f Dockerfile.dev -t <name:tag> .

   ```

2. **Create and run the Docker container**

   Replace `[host_port]` with the port on your host machine that you want to map
   to the container's port, `[container_port]` with the port that your app is
   running on inside the Docker container, `[container_name]` with your
   preferred container name, and `[image_id/image_tag]` with the image name and
   tag you used in the previous step.

   ```bash
   docker run -d -it --rm -p [host_port]:[container_port] --name [container_name] [image_id/image_tag]
   ```

### Production

Use the `Dockerfile` file for development:

1. **Build the Docker image**

   Replace `<name:tag>` with your preferred image name and tag.

   ```bash
   docker build -f Dockerfile.prod -t <name:tag> .

   ```

2. **Create and run the Docker container**

   Replace `[host_port]` with the port on your host machine that you want to map
   to the container's port, `[container_port]` with the port that your app is
   running on inside the Docker container, `[container_name]` with your
   preferred container name, and `[image_id/image_tag]` with the image name and
   tag you used in the previous step.

   ```bash
   docker run -d -it --rm -p [host_port]:[container_port] --name [container_name] [image_id/image_tag]
   ```
