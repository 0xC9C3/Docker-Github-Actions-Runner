# Docker GitHub Actions Runner (Docker-GAR)

This is a Docker image for to easily self-host GitHub actions runners.

Hourly builds are available on [Docker Hub](https://hub.docker.com/r/0xc9c3/github_actions_runner).

## Usage

The configuration is only generated once. If you want to delete the configuration your have to delete your .runner file.

### Docker

```bash
docker run -d \
  --name github_actions_runner \
  -e REPOSITORY_URL=https://github.com/0xC9C3/Docker-Github-Actions-Runner \
  -e REPOSITORY_TOKEN=get_your_token_in_your_project_settings \
  -e RUNNER_NAME=your_runner_name \
  -v ./config:/runner/config \
  0xc9c3/github_actions_runner:latest
```

### Docker Compose

```yaml
version: "3.8"

services:
  github_actions_runner:
    image: 0xc9c3/github_actions_runner:latest
    container_name: github_actions_runner
    environment:
      - REPOSITORY_URL=https://github.com/0xC9C3/Docker-Github-Actions-Runner
      - REPOSITORY_TOKEN=get_your_token_in_your_project_settings
      - RUNNER_NAME=your_runner_name
    volumes:
      - ./config:/runner/config
```