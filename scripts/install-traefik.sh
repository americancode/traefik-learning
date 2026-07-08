#!/usr/bin/env bash

set -euo pipefail

kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.5.1/standard-install.yaml

kubectl wait --for=condition=Established crd/gatewayclasses.gateway.networking.k8s.io --timeout=180s
kubectl wait --for=condition=Established crd/gateways.gateway.networking.k8s.io --timeout=180s
kubectl wait --for=condition=Established crd/httproutes.gateway.networking.k8s.io --timeout=180s

helm repo add traefik https://traefik.github.io/charts
helm repo update

helm upgrade --install traefik traefik/traefik \
  --namespace traefik \
  --create-namespace \
  --values helm/traefik-values.yaml

kubectl -n traefik rollout status deployment/traefik --timeout=180s
