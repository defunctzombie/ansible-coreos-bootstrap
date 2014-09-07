# coreos-bootstrap

In order to effectively run ansible, the target machine needs to have a python interpreter. Coreos machines are minimal and do not ship with any version of python. To get around this limitation, the coreos hosts can be bootstrapped with a [toolbox](https://github.com/coreos/toolbox) with a working python install and educating ansible about using this alternative python interpreter.

# install

```
ansible-galaxy -i defunctzombie.coreos-bootstrap
```

# configure your project

Unlike a typical role, you need to configure ansible to use an alternative python interpreter for the coreos hosts. This is done by adding a `group_vars/all.yml` file to your project with the following content.

```
# group_vars/all.yml
ansible_python_interpreter: "/home/core/bin/python"
```

This will educate ansible to use the python interpreter at `$HOME/bin/python` which will be created by the coreos-bootstrap role.

## example playbook

Now you can simply add the following to your playbook file and include it in your `site.yml` so that it runs on all hosts.

```yaml
- hosts: all
  gather_facts: False
  roles:
    - defunctzombie.coreos-bootstrap
```

# License
MIT
