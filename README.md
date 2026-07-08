# Traefik Learning

This repo creates a local kind cluster named `traefik-lab`, exposes Traefik to the host on ports `8080` and `8443`, applies the upstream Gateway API CRDs, installs Traefik as both the default Ingress controller and a Gateway API controller, installs Argo CD, and lets Argo CD deploy a demo app from a Helm chart.

## Flow

1. `./scripts/kind-delete-all.sh`
2. `./scripts/kind-create.sh`
3. `./scripts/install-traefik.sh`
4. `./scripts/install-argocd.sh`
5. `./scripts/install-demo-app.sh`

## Endpoints

- Argo CD: `http://argocd.127.0.0.1.nip.io:8080`
- Demo app: `http://podinfo.127.0.0.1.nip.io:8080`
