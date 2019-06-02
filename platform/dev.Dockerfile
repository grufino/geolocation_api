FROM elixir:1.8.1

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools mysql-client nodejs

# Add user
RUN useradd --home /app --shell /bin/bash --user-group --groups root default
RUN mkdir -p /app

# Copy application and switch user/workdir
COPY --chown=default:default . /app/geolocation_api
RUN chown -R default:default /app
USER default
WORKDIR /app/geolocation_api

# Install Phoenix
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# Install dependencies
RUN mix deps.get

# Expose port
EXPOSE 4000

CMD ["elixir", "-S", "mix", "phx.server"]