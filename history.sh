#!/usr/bin/env bash

env="${1:-test}"

helm -n ${env} history html-${env}