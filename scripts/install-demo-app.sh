#!/usr/bin/env bash

set -euo pipefail

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade --install demo-apps argo/argocd-apps \
  --namespace argocd \
  --values helm/demo-apps-values.yaml

kubectl -n argocd get applications.argoproj.io
