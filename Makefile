.DEFAULT_GOAL := default

IMAGE ?= quay.io/d_rk/mini-saml-idp:latest

export DOCKER_CLI_EXPERIMENTAL=enabled

# Build the container image
.PHONY: build
build:
	@docker buildx create --use --name=multi-arch-builder --node=multi-arch-builder && \
	docker buildx build \
		--output "type=docker,push=false" \
		--tag $(IMAGE) \
		.

# Push the image to the remote registry
# make sure to login first:
# docker login quay.io
.PHONY: publish
publish:
	@docker buildx create --use --name=multi-arch-builder --node=multi-arch-builder && \
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		--output "type=image,push=true" \
		--tag $(IMAGE) \
		.
