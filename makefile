DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init:
	${TF} init

.PHONY: lint
lint:
	${TF} lint

.PHONY: plan
plan:
	${TF} plan -input=false

.PHONY: apply
apply:
	${TF} apply --auto-approve -input=false