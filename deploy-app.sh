#!/bin/bash

CLUSTER_NAME=$(oc get -o jsonpath='{.status.apiServerURL}{"\n"}' infrastructure cluster | sed 's/https\:\/\/api\.//g' | sed 's/\:6443//g')
oc create -f ./app/app.yaml
oc process -f ./app/app-route.yaml -p CLUSTER_NAME="${CLUSTER_NAME}" | oc create -n knative-serving-ingress -f -
