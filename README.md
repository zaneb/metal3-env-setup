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

## Running the Metal³ dev-env

Run the following command to set up the host and run metal3-dev-env:

```
ansible-playbook setup-metal3-dev.yml
```
