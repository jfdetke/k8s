#!/usr/bin/env bash

##kubectl port-forward  my-release-grafana-bfb7c8cdf-2wkn9 3001:3000
#   want to move this to deploy and service, for now manual way:
kubectl port-forward  my-release-grafana-bfb7c8cdf-2wkn9 3001:3000 >> logfile 2>&1  &
