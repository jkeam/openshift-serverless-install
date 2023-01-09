#!/bin/bash

poll_for_serving_creation() {
  while true; do
    OUTPUT=$(oc get knativeserving.operator.knative.dev/knative-serving -n knative-serving --template='{{range .status.conditions}}{{printf "%s=%s\n" .type .status}}{{end}}' | grep 'Ready')
    if [[ "$OUTPUT" == "Ready=True" ]];
    then
      break
    else
      sleep 10
      OUTPUT=$(oc get knativeserving.operator.knative.dev/knative-serving -n knative-serving --template='{{range .status.conditions}}{{printf "%s=%s\n" .type .status}}{{end}}' | grep 'Ready')
    fi
  done
}

poll_for_eventing_creation() {
  while true; do
    OUTPUT=$(oc get knativeeventing.operator.knative.dev/knative-eventing -n knative-eventing --template='{{range .status.conditions}}{{printf "%s=%s\n" .type .status}}{{end}}' | grep 'Ready')
    if [[ "$OUTPUT" == "Ready=True" ]];
    then
      break
    else
      sleep 10
      OUTPUT=$(oc get knativeeventing.operator.knative.dev/knative-eventing -n knative-eventing --template='{{range .status.conditions}}{{printf "%s=%s\n" .type .status}}{{end}}' | grep 'Ready')
    fi
  done
}

poll_for_operator_creation() {
  while true; do
    OUTPUT=$(oc get csv -n openshift-serverless -o json | jq '[.items[0].status.phase][0]')
    if [[ "$OUTPUT" == "\"Succeeded\"" ]];
    then
      break
    else
      sleep 10
      OUTPUT=$(oc get csv -n openshift-serverless -o json | jq '[.items[0].status.phase][0]')
    fi
  done
}

echo 'installing operator...'
oc create -f ./operator.yaml
poll_for_operator_creation

echo 'installing serving...'
oc create -f ./serving.yaml
poll_for_serving_creation

echo 'installing eventing...'
oc apply -f ./eventing.yaml
poll_for_eventing_creation
