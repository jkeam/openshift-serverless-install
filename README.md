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

There are two ways to install an example application,
one using the default Knative Ingress (easier) and
one where we disable this Knative Ingress and instead
use an OpenShift Route (a bit more yaml).  The former
is easier but the latter allows you to manage routes
for these serverless application in the same way you
are managing all other routes, including non-serverless applications.

### Knative Ingress

```shell
./deploy-app-with-knative-route.sh
```

### OpenShift Route

```shell
./deploy-app-with-ocp-route.sh
```

## Docs

1. [OpenShift Serverless](https://docs.openshift.com/serverless/1.29/about/about-serverless.html)
