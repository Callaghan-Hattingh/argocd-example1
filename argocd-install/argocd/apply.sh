#!/bin/bash

# Update the dependencies for the Helm chart
echo "Updating Helm chart dependencies..."
helm dependency update

# Create the 'argocd' namespace if it doesn't exist, using a dry run to generate the YAML, and then apply it
echo "Ensuring the 'argocd' namespace exists..."
kubectl create namespace argocd --dry-run=client --output=yaml | kubectl apply -f -

# Deploy Argo CD using Helm, including CRDs, within the 'argocd' namespace
echo "Deploying Argo CD to the 'argocd' namespace..."
#helm template argocd . --include-crds --namespace argocd | kubectl apply -n argocd -f -
helm install argocd . \
    --namespace=argocd \
    --create-namespace


