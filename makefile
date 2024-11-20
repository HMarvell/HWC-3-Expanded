SHELL := /bin/bash

REGION := "us-east-1"

DOCKER_COMPOSE := docker -l error compose run
TF := $(DOCKER_COMPOSE) terraform

.PHONY: init
init:
	$(TF) init

.PHONY: lint
lint:
	$(TF) fmt -check -recursive

.PHONY: plan
plan:
	echo "Planning deployment"
	$(TF) plan -input=false

.PHONY: apply
apply:
	$(TF) apply -input=false
