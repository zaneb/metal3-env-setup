# Metal³ testing setup with Ansible

A set of Ansible roles and playbooks to set up and run either the [Metal³
dev-env](https://github.com/metal3-io/metal3-dev-env) or the [OpenShift Metal³
dev-scripts](https://github.com/openshift-metal3/dev-scripts) on a fresh host.
Note: you should probably only run this against a user account you don't care
about.

## Setting up the host group

Edit the file `/etc/ansible/hosts` to contain the following sections:

```
[metal3_test]
<Hostname or IP address of test box>

[metal3_test:vars]
ansible_become_password=<sudo password>
```

## Running the OpenShift dev-scripts

After providing the required authentication data, run the following command to
set up the host and run dev-scripts:

```
ansible-playbook setup-openshift.yml
```

Once the cluster is up, to tear it down and recreate it with updated config
(from the file `roles/openshift-dev/files/config.sh`), run the following
command:

```
ansible-playbook bounce-openshift.yml
```

### Installation method

To change the installation method, pass e.g. `-e method=agent`. The available
methods are `agent` and `ipi`. The default is `ipi`.

For the `agent` method, the config file used is
`roles/openshift-dev/files/config.sh`.

### Authentication

To run the OpenShift dev-scripts, two additional files are needed:

* `roles/openshift-dev/files/ci_token` - should contain a token obtained from
  the [CI
console](https://console-openshift-console.apps.ci.l2s4.p1.openshiftapps.com/).
* `roles/openshift-dev/files/pull-secrets.json` - should contain the required
  pull secrets in JSON format. This file can look something like:

```
{
    "auths": {
        "cloud.openshift.com": {
            "auth": "...",
            "email": "<your_email>"
        },
        "quay.io": {
            "auth": "...",
            "email": "<your_email>"
        },
        "registry.connect.redhat.com": {
            "auth": "...",
            "email": "<your_email>"
        },
        "registry.redhat.io": {
            "auth": "...",
            "email": "<your_email>"
        }
    }
}
```

### Cluster-bot builds

The playbooks can be configured to use a release image from the cluster-bot
Slack bot (which can contain patches from multiple unmerged PRs). This
requires a token from the [cluster-bot CI
console](https://console.build01.ci.openshift.org/) in the file
`roles/openshift-dev/files/clusterbot-ci_token`.

To use the cluster-bot build in the namespace
`https://console.build01.ci.openshift.org/k8s/cluster/projects/ci-ln-<build-id>`,
pass the argument `-e clusterbot_build_id=<build-id>` to `ansible-playbook`.

### Helpful aliases

The following commands/aliases are installed automatically:

* `oc`: aliased to always use the correct kubeconfig file
* `bmo`: get the name of the current metal3 Pod
* `bmo-log`: display the BMO log
* `bmo-log-tail`: follow the BMO log live

## Running the Metal³ dev-env

Run the following command to set up the host and run metal3-dev-env:

```
ansible-playbook setup-metal3-dev.yml
```
