# Set the base image tag
ARG BASE_IMAGE_TAG=3.18.4
ARG FINAL_IMAGE_TAG=stable-slim

# Build stage
FROM --platform=$BUILDPLATFORM alpine:${BASE_IMAGE_TAG} AS build

# Set user to root
USER root

# Install dependencies
RUN apk update && \
    apk add \
        curl \
        unzip \
        upx

# Download and extract Android SDK platform tools
RUN curl -LO "https://dl.google.com/android/repository/platform-tools-latest-linux.zip" && \
    unzip platform-tools-latest-linux.zip -d /tmp/android-sdk && \
    rm platform-tools-latest-linux.zip

# Compress the adb binary
WORKDIR /tmp/android-sdk/platform-tools
RUN upx --best --lzma adb

# Final image
FROM debian:${FINAL_IMAGE_TAG}

# Copy adb binary from build stage
COPY --from=build /tmp/android-sdk/platform-tools /android-tools

# Set the entrypoint
ENTRYPOINT [ "/android-tools/adb" ]