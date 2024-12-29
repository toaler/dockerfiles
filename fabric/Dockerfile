# Use an ARM-compatible base image
FROM golang:1.22-bullseye

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for Go
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

# Set working directory
WORKDIR /app

# Install Fabric from source for ARM64
RUN GOARCH=arm64 go install github.com/danielmiessler/fabric@latest

# Run setup during container build
RUN /go/bin/fabric --setup

# Set the entrypoint
ENTRYPOINT ["fabric"]
