#!/usr/bin/env bash

set -euo pipefail

clusters="$(kind get clusters)"

if [[ -z "${clusters}" ]]; then
  echo "No kind clusters found."
  exit 0
fi

while IFS= read -r cluster; do
  [[ -n "${cluster}" ]] || continue
  echo "Deleting kind cluster: ${cluster}"
  kind delete cluster --name "${cluster}"
done <<< "${clusters}"
