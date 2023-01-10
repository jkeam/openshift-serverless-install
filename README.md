# OpenShift Serverless Install

This repository will help automate your install and uninstall.

## Operator

### Automated Install

```shell
./install.sh
```

### Automated Uninstall

```shell
./uninstall.sh
```

## Manual Steps

Rather than write it out here, peek at the `install.sh` and `uninstall.sh`
scripts to see what they are doing.

## Example Application

To install a sample application make sure your `oc` client is logged in and has
permissions to do things like creating a namespace.  The script below will
create a `serverless-example` namespace and install a Knative Service
and publicly expose a route.

To install the example application, run the following:

```shell
./deploy-app.sh
```
