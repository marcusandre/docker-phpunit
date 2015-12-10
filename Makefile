
TAG ?= "reizwerk/phpunit"
DOCKER ?= docker

build:
	$(DOCKER) build -t $(TAG) .

run:
	$(DOCKER) run --rm -it $(TAG)

.PHONY: build run
