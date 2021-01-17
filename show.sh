#!/usr/bin/env bash

env="${1:-test}"

minikube service html-${env} --url -n ${env}