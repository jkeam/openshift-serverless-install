#!/bin/bash

CLUSTER_NAME=$(oc get -o jsonpath='{.status.apiServerURL}{"\n"}' infrastructure cluster | sed 's/https\:\/\/api\.//g' | sed 's/\:6443//g')
oc create -f ./app/ocp_route/app.yaml
oc process -f ./app/ocp_route/app-route.yaml -p CLUSTER_NAME="${CLUSTER_NAME}" | oc create -n knative-serving-ingress -f -

# to remove:
# oc delete routes/serverless-example-route -n knative-serving-ingress
# oc delete ksvc event-delivery -n serverless-example
# oc delete project serverless-example
