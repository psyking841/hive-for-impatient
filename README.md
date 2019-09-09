# Hive on Kubernetes

## Hive Docker image
Hive version: 2.3.5.1
The last digit is the version for this repo. The first three digits are hive version used.
Hive with Derby, with Ranger plugin

Ranger plugin is by default not installed, but it can be enabled by setting "$ENABLE_RANGER_HIVE_PLUGIN" environment variable to `true` (by default it is set to `false`).

```SHELL
docker build -t "psyking841/hive:latest" .
```