#!/bin/bash

oc create -f ./app/app.yaml

# to remove:
# oc delete ksvc event-delivery -n serverless-example
# oc delete project serverless-example
