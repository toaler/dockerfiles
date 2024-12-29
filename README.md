
# Fabric Docker Instance

A Dockerized setup for [Fabric](https://github.com/danielmiessler/fabric), a tool designed for efficient AI-driven workflows. This setup ensures that Fabric is containerized and easily managed, with configurations stored externally.

---

## Features

- Run Fabric in a Docker container.
- External configuration for flexibility.
- Easy setup for building and runtime.
- Supports all Fabric patterns.

---

## Prerequisites

- Docker installed on your system.
- An OpenAI API key (if using OpenAI models).
- Fabric configuration directory: `~/.config/fabric/`.

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/toaler/dockerfiles
cd dockerifles/fabric
```

### 2. Build the Docker Image

```bash
docker build -t fabric-instance:latest .
```

### 3. Configure Fabric

Run the setup process to configure Fabric, including default models, vendors, and patterns:

```bash
docker run -it --rm -v ~/.config/fabric/:/root/.config/fabric/ fabric-instance:latest --setup
```

During the setup, provide the necessary details like:
- Default AI vendor (e.g., OpenAI).
- Default model (e.g., GPT-4).
- Model context length (optional).

### 4. Verify Patterns

List all available patterns to confirm setup:

```bash
docker run -it --rm -v ~/.config/fabric/:/root/.config/fabric/ fabric-instance:latest -l
```

---

## Usage

### Run a Pattern

To execute a specific pattern (e.g., `summarize`):

```bash
docker run -i --rm -v ~/.config/fabric/:/root/.config/fabric/ fabric-instance:latest -sp summarize
```

### Provide Input Dynamically

You can pass input to Fabric patterns using a pipe:

```bash
echo "Tell me a story about hanging at the beach and having the best day ever." | \
docker run -i --rm -v ~/.config/fabric/:/root/.config/fabric/ fabric-instance:latest -sp summarize
```

### Add or Update Patterns

1. Add pattern files to `~/.config/fabric/patterns/` on your host system.
2. Update patterns in the container:
   ```bash
   docker run -it --rm -v ~/.config/fabric/:/root/.config/fabric/ fabric-instance:latest -U
   ```

---

## Advanced Configuration

### Mounting External Files

To bind mount additional configuration files or directories:
```bash
docker run -it --rm -v ~/.config/fabric/:/root/.config/fabric/ -v /path/to/your/file:/app/file \
fabric-instance:latest -sp summarize
```

### Debugging

To enable verbose mode:
```bash
docker run -it --rm -v ~/.config/fabric/:/root/.config/fabric/ fabric-instance:latest -v
```

---

## Development

If you want to modify or extend the Dockerfile:

1. Make changes to the `Dockerfile` in this repository.
2. Rebuild the image:
   ```bash
   docker build -t fabric-instance:latest .
   ```

---

## Notes

- Ensure the `~/.config/fabric/` directory is properly configured on your host system before running Fabric.
- Update the OpenAI API key or other credentials as needed in your environment.
