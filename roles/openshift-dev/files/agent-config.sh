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

# Set a single config variable AGENT_E2E_TEST_SCENARIO to create a cluster for the different scenarios
# i.e. Single Node Openshift(SNO), Highly Available (HA) or Compact cluster.
# The only supported values for AGENT_E2E_TEST_SCENARIO are COMPACT_IPV4, COMPACT_IPV6, HA_IPV4, HA_IPV6, SNO_IPV4 and SNO_IPV6.
# When set, the code internally sets other low level details such as disk size, memory, number of masters and workers,
# cpu and ip stack.
export AGENT_E2E_TEST_SCENARIO=HA_IPV4

# Change VM resources for masters
export MASTER_MEMORY=16384
export MASTER_DISK=120

# Change VM resources for workers
export WORKER_MEMORY=8192
export WORKER_DISK=120

# Set whether static IPs will be used for all nodes or only Node0
#export AGENT_STATIC_IP_NODE0_ONLY="true"
