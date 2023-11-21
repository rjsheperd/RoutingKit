# Use the latest Debian image as the base
FROM debian:bullseye

# Install the latest version of make, g++, and other build essentials
RUN apt-get update && \
    apt-get install -y build-essential zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy the local project files into the container
WORKDIR /usr/RoutingKit

# Copy source files
COPY src src
COPY include include

# Copy build scripts
COPY generate_make_file generate_make_file
COPY Makefile Makefile

# Build
RUN make
