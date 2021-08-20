#!/bin/bash

# You can get this token from
# https://console-openshift-console.apps.ci.l2s4.p1.openshiftapps.com/ by
# clicking on your name in the top right corner and coping the login command
# (the token is part of the command)
# BEGIN CI TOKEN BLOCK
# END CI TOKEN BLOCK

#export OPENSHIFT_RELEASE_IMAGE="registry.svc.ci.openshift.org/ocp/release:4.7.0-0.nightly-2020-12-07-163758"
#export OPENSHIFT_RELEASE_TYPE="ci"

export IP_STACK=v4

# Uncomment to build a copy of ironic or inspector locally
#export IRONIC_IMAGE=https://github.com/openshift/ironic
#export IRONIC_INSPECTOR_IMAGE=https://github.com/openshift/ironic-inspector

export NUM_WORKERS=2
export NUM_EXTRA_WORKERS=1

# Uncomment to use a custom cluster-api-provider-baremetal image. The CAPBM
# image must be based on the openshift-origin version of the CAPBM from
# https://github.com/openshift/cluster-api-provider-baremetal
#export CAPBM_IMAGE_SOURCE="quay.io/openshift/origin-baremetal-machine-controllers:4.2"
#export CAPBM_IMAGE_SOURCE="quay.io/zaneb/metal3-cluster-api-provider-baremetal:downstream"

# Uncomment to use a local build of the machine-api-operator
#export USE_CUSTOM_MAO=true


# Live ISO testing config
#export BAREMETAL_OPERATOR_PATH=~/metal3-io/baremetal-operator

#export BAREMETAL_OPERATOR_LOCAL_IMAGE=https://github.com/zaneb/baremetal-operator
#export CLUSTER_BAREMETAL_OPERATOR_LOCAL_IMAGE=https://github.com/zaneb/cluster-baremetal-operator

#export IRONIC_MACHINE_OS_DOWNLOADER_LOCAL_IMAGE=https://github.com/openshift/ironic-rhcos-downloader
#export USE_RHCOS_LIVE_IMAGES=true
#export BMC_DRIVER=redfish-virtualmedia
#export KNI_INSTALL_FROM_GIT=true
