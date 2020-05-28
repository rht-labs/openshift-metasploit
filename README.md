# Metasploit Framework For Red Hat OpenShift

## Overview
A docker container and (eventually) templates for deploying Metasploit Framework on OpenShift for use
with CI/CD/DevOps pipelines

## Build Container Locally
```
git clone https://github.com/rht-labs/openshift-metasploit.git
cd openshift-metasploit/metasploit-[redhat|centos]
docker build -t [tenant]/metasploit-[redhat|cento]:v0.1 ./
docker login
docker push [tenant]/metasploit-[redhat|cento]:v0.1
# CHANGE the [tenant] string within the pod.yml to the corresponding one and then create it:
oc create -f pod.yml
```
