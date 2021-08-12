#!/usr/bin/env bash

# This two values should match with terraform.tfvars
REGION="eu-central-1"
CLUSTER_NAME="tf-eks"

HELM_RELEASE_NAME="cluster-autoscaler"

function autoscaler {
  if ! command -v helm &> /dev/null; then
		echo "helm: command not found"
		exit
  fi

  if ! helm list -A | grep -q ${HELM_RELEASE_NAME}; then
    helm repo add autoscaler https://kubernetes.github.io/autoscaler
    helm repo update
    helm install ${HELM_RELEASE_NAME} autoscaler/cluster-autoscaler \
    --namespace kube-system \
    --set autoDiscovery.clusterName=${CLUSTER_NAME} \
    --set awsRegion=${REGION}
  else
    echo "${HELM_RELEASE_NAME} release already installed"
  fi
}

autoscaler
