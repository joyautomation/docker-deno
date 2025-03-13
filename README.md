# Deno Development Container

A Docker container for Deno development with essential development tools pre-installed.

## Features

- Based on official `denoland/deno` image
- Includes development tools:
  - SSH client for git operations
  - GitHub CLI
  - curl for network requests
  - iputils-ping for network diagnostics
  - vim for text editing

## Docker Tags

The container is published with two tags:
- `latest`: Always points to the most recent version
- `x.y.z`: Specific Deno version (e.g., `1.40.2`)

## Automated Updates

This repository includes a GitHub Action that:
1. Checks for new Deno versions daily
2. Updates the container when a new version is detected
3. Publishes the new image to Docker Hub as `joyja/deno-dev`

## Usage

```bash
# Pull the latest version
docker pull joyja/deno-dev:latest

# Or pull a specific version
docker pull joyja/deno-dev:1.40.2

# Run the container
docker run -it --rm joyja/deno-dev:latest
```

## Development

To build the container locally:

```bash
docker build -t joyja/deno-dev:latest .
```
