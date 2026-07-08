#!/usr/bin/env bash

set -euo pipefail

kind create cluster --config kind/cluster.yaml
kubectl cluster-info --context kind-traefik-lab
