COMPOSE_FILE = docker-compose.yml
ENV_FILE = .env.example

include $(ENV_FILE)

ifeq (, $(shell which docker-compose))
	DOCKER_COMPOSE_CMD=docker compose
else
	DOCKER_COMPOSE_CMD=docker-compose
endif

all: start

start: build
	$(DOCKER_COMPOSE_CMD) --env-file $(ENV_FILE) -f $(COMPOSE_FILE) up

stop:
	$(DOCKER_COMPOSE_CMD) --env-file $(ENV_FILE) -f $(COMPOSE_FILE) down

logs:
	$(DOCKER_COMPOSE_CMD) --env-file $(ENV_FILE) -f $(COMPOSE_FILE) logs -f

build:
	mkdir -p $(DB_PATH)
	$(DOCKER_COMPOSE_CMD) --env-file $(ENV_FILE) -f $(COMPOSE_FILE) build

shell:
	docker exec -it $(service) ash || docker exec -it $(service) bash

.PHONY: all start stop logs clean build shell