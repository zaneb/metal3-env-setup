#!/bin/bash

# You can get this token from https://console-openshift-console.apps.ci.l2s4.p1.openshiftapps.com/ by
# clicking on your name in the top right corner and copying the login
# command (the token is part of the command)
# BEGIN CI TOKEN BLOCK
set +x
export CI_TOKEN=''
set -x
# END CI TOKEN BLOCK

# Select a different release stream from which to pull the latest image, if the
# image name is not specified
#export OPENSHIFT_RELEASE_STREAM=4.8

# Select a different release type from which to pull the latest image,
# e.g ci, nightly or ga
# if using ga then set OPENSHIFT_VERSION to the required version.
#export OPENSHIFT_RELEASE_TYPE=nightly

# Test using a cluster-bot build
# You can get the token from https://console.build01.ci.openshift.org/ by
# clicking on your name in the top right corner and copying the login
# command (the token is part of the command)
# BEGIN CLUSTERBOT OVERRIDE BLOCK
# END CLUSTERBOT OVERRIDE BLOCK

# IP stack for the cluster.  The default is "v6".  You may also set "v4", or
# "v4v6" for dual stack.
export IP_STACK=v4

# Network type
export NETWORK_TYPE="OpenShiftSDN"

# Indicate number of masters to deploy
#export NUM_MASTERS=3

# Indicate number of workers to deploy
export NUM_WORKERS=0

# Change VM resources for masters
export MASTER_MEMORY=16384
export MASTER_DISK=120

# Change VM resources for workers
export WORKER_MEMORY=16384
export WORKER_DISK=120

# To use a local checkout of the fleeting repo, instead of fetching the remote
# main branch
#export FLEETING_PATH=~/go/src/github.com/openshift-agent-team/fleeting

# When set, the changes associated to the specified pull request (for the fleeting repo)
# are fetched, instead of using the main branch
#export FLEETING_PR=12

# Set whether static IPs will be used for all nodes or only Node0
#export FLEETING_STATIC_IP_NODE0_ONLY="true"
