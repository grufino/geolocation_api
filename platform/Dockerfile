####################################
# Step 1. Build geolocation_api
####################################
FROM elixir:1.8.1 as builder

# Install dependencies
RUN apt update -q && apt install -yq \
  git make build-essential \
  && rm -rf /var/lib/apt/lists/*

# Copy source files
RUN mkdir /app
RUN mkdir /app/export
COPY ./ /app/geolocation_api

# Set the workdir
WORKDIR /app/geolocation_api

# Get dependencies and release
ENV MIX_ENV=prod
ENV REPLACE_OS_VARS=true
RUN mix do local.hex --force, local.rebar --force
RUN mix deps.get
RUN mix phx.digest
RUN mix release

# Extract release to /app/export
RUN RELEASE_DIR=`ls -d /app/geolocation_api/_build/prod/rel/geolocation_api/releases/*/` && \
  tar -xf "$RELEASE_DIR/geolocation_api.tar.gz" -C /app/export

####################################
# Step 3. Create a lighter weight geolocation_api Image (FINAL IMAGE)
####################################
FROM debian:stretch-slim

# Build arguments
ARG GIT_REVISION=""
ENV GIT_REVISION ${GIT_REVISION}
ENV RELEASE_TAG ${GIT_REVISION}

# Install dependencies
RUN apt update -q && apt install -yq \
  openssl locales ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Configure locale
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment  && chmod 644 /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && chmod 644 /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf && chmod 644 /etc/locale.conf
RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV REPLACE_OS_VARS=true

# Create default user
RUN groupadd default -g 9001 && useradd -M default -u 9001 -g default -d /app

# Create app directory and copy geolocation_api release
RUN mkdir -p /app/geolocation_api && chown -R default:default /app
COPY --from=builder --chown=default:default /app/export /app/geolocation_api

# Copy the start script
COPY --chown=default:default ./platform/scripts/geolocation_api.start /app/geolocation_api.start
RUN chmod +x /app/geolocation_api.start

# Run as default and expose 4001
USER default
EXPOSE 4001
CMD ["/app/geolocation_api.start"]