#!/usr/bin/env bash

set -euo pipefail

if [[ -z $1 ]]; then
  >&2 echo "No istio root directory provided"
  exit 63
fi

root_dir="$1"
install_dir="$root_dir/install/kubernetes"
if command -v realpath >/dev/null 2>&1; then
  root_dir=$(realpath "$root_dir")
  install_dir=$(realpath "$install_dir")
fi

read -p "Installing auto-injector from $root_dir, continue? [Y/n] " confirm
if [[ -z "$confirm" ]] || [[ "$confirm" =~ y|Y ]]; then
  echo "Proceeding.."
else
  echo "Aborting.."
  exit 63
fi

pushd "$root_dir" >/dev/null

cd $install_dir

./webhook-create-signed-cert.sh \
    --service istio-sidecar-injector \
    --namespace istio-system \
    --secret sidecar-injector-certs

kubectl apply -f istio-sidecar-injector-configmap-release.yaml

cat istio-sidecar-injector.yaml | \
     ./webhook-patch-ca-bundle.sh > \
     istio-sidecar-injector-with-ca-bundle.yaml

kubectl apply -f istio-sidecar-injector-with-ca-bundle.yaml

popd >/dev/null

echo "Done."
