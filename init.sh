#!/usr/bin/env bash

minikube start --kubernetes-version=v1.16.10
helm repo add fluxcd https://charts.fluxcd.io

kubectl create ns fluxcd
helm upgrade -i flux fluxcd/flux --wait --namespace fluxcd --set git.url=git@github.com:kkakolgit/helm-operator-get-started

kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/crds.yaml
helm upgrade -i helm-operator fluxcd/helm-operator --wait --namespace fluxcd --set git.ssh.secretName=flux-git-deploy --set helm.versions=v3


