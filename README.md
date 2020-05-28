# Metasploit Framework For Red Hat OpenShift

## Overview
A docker container and (eventually) templates for deploying Metasploit Framework on OpenShift for use
with CI/CD/DevOps pipelines

## Build Container Locally
```
git clone https://github.com/rht-labs/openshift-metasploit.git
cd openshift-metasploit/metasploit-[redhat|centos]
docker build -t openshift3/metasploit-[redhat|cento]:v0.1 ./
```
