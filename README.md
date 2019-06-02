# GeolocationApi

- Api responsible for exposing geolocation data through a RESTful endpoint, based on the ip address of the geolocation, passed as argument in the request, only endpoint available: ```/api/geolocation/:ip_address```

# Setup for development

- All you need to get it up and running in development environment is the command ```docker-compose up``` and also run the migration contained in the project with ```mix ecto.migrate```, of course if you want to see data you will need to populate the table, which can be done through the Geolocation_handler library.
- It was chosen not to include the command to run the migration in the build setup to give more flexibility in case you are using an already migrated or even corrupted/snapshot database (which I think is a good idea specially for production environments because migrations are risky stuff and should be used explicitly when needed).
- Easiest way to run unit tests is enter the container after it's up and run ```mix test``` from within.

# Current deploy method via Heroku

- docker build -t registry.heroku.com/geolocation-api-findhotel/web -f platform/Dockerfile .
- docker push registry.heroku.com/geolocation-api-findhotel/web
- heroku container:release -a geolocation-api-findhotel web

# Additional Steps to become production ready:

- Configure CI/CD
- Better environment separation and configuration for prod/dev differences.
- Process to run migrations in production environment (can be through remote-console or release tasks)
- Terraform to provision infrastrucure automatically always in the same way with dynamic configuration
- Other network configuration such as DNS, possibly load balance, blue/green deploys, docker image tagging and versioning, git releases, etc...
