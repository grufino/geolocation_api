# GeolocationApi

# Additional Steps to become production ready:

- Configure CI/CD
- Better environment separation and configuration for prod/dev differences.
- Dynamic environment variable storing/resolving with some secret environment storage (like AWS secret manager), retrieval and validation with some config provider like ConfigTuples
- Process to run migrations in production environment (can be through remote-console or release tasks)
- Other network configuration such as DNS, possibly load balance, blue/green deploys, docker image tagging and versioning, etc...
