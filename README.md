# coreos-bootstrap

In order to effectively run ansible, the target machine needs to have a python interpreter. Coreos machines are minimal and do not ship with any version of python. To get around this limitation, the coreos hosts can be bootstrapped with a [toolbox](https://github.com/coreos/toolbox) with a working python install and educating ansible about using this alternative python interpreter.

# install

```
ansible-galaxy install defunctzombie.coreos-bootstrap
```

# Configure your project

Unlike a typical role, you need to configure Ansible to use an alternative python interpreter for coreos hosts. This can be done by adding a `coreos` group to your inventory file and setting the group's vars to use the new python interpreter. This way, you can use ansible to manage CoreOS and non-CoreOS hosts. Simply put every host that has CoreOS into the `coreos` inventory group and it will automatically use the specified python interpreter.
```
[coreos]
host-01
host-02

[coreos:vars]
ansible_python_interpreter: "/home/core/bin/python"
```

This will configure ansible to use the python interpreter at `$HOME/bin/python` which will be created by the coreos-bootstrap role.

## Example Playbook

Now you can simply add the following to your playbook file and include it in your `site.yml` so that it runs on all hosts in the coreos group.

```yaml
- hosts: coreos
  gather_facts: False
  roles:
    - defunctzombie.coreos-bootstrap
```

# License
MIT
