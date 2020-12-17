#!/bin/bash
source appd.env
kubectl create namespace appdynamics
kubectl create -f cluster-agent-operator.yaml
sleep 30
kubectl -n appdynamics create secret generic cluster-agent-secret --from-literal=controller-key=$KEY --from-literal=api-user=$APIUSER
kubectl create -f cluster-agent-instrumentation.yaml
sleep 30
kubectl create -f infraviz.yaml

