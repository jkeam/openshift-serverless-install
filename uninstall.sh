#!/bin/bash

echo 'deleting serving...'
oc delete knativeservings.operator.knative.dev knative-serving -n knative-serving
oc delete namespace knative-serving

echo 'deleting eventing...'
oc delete knativeeventings.operator.knative.dev knative-eventing -n knative-eventing
oc delete namespace knative-eventing

echo 'have not automated deleting operators yet, see this script to see how to do it manually...'
# oc get subscription jaeger -n openshift-operators -o yaml | grep currentCSV
# oc delete subscription jaeger -n openshift-operators
# oc delete clusterserviceversion jaeger-operator.v1.8.2 -n openshift-operators
