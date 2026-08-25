#!/usr/bin/env bash
#create a new context for the given namespace and set it as the current context

NAMESPACE=$1

kubectl config set-context ${NAMESPACE} \
        --cluster=default \
        --user=default \
        --namespace=${NAMESPACE}

kubectl config use-context ${NAMESPACE}

kubectl config get-contexts 
