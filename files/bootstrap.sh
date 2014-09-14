#/bin/bash

set -e

if [-e $HOME/.bootstrapped]; then
  exit 0
fi

mkdir -p $HOME/bin

cat > $HOME/.toolboxrc <<EOF
TOOLBOX_DOCKER_IMAGE=defunctzombie/toolbox
TOOLBOX_DOCKER_TAG=v1
EOF

cat > $HOME/bin/python <<EOF
#!/bin/bash
toolbox --bind=/home:/home --bind=/run/docker.sock:/run/docker.sock \$(basename \$0) "\$@"
EOF

chmod +x $HOME/bin/python
touch $HOME/.bootstrapped
