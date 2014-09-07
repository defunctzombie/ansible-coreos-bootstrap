#/bin/bash

set -e

if [-e $HOME/.bootstrapped]; then
  exit 0
fi

mkdir -p $HOME/bin

cat > $HOME/.toolboxrc <<EOF
TOOLBOX_DOCKER_IMAGE=ubuntu
TOOLBOX_DOCKER_TAG=14.04
EOF

cat > $HOME/bin/python <<EOF
#!/bin/bash
toolbox --bind=/home:/home --bind=/run/docker.sock:/run/docker.sock python "\$@"
EOF

chmod +x $HOME/bin/python

toolbox apt-get update
toolbox apt-get install -y docker.io python python-pip
toolbox pip install docker-py

touch $HOME/.bootstrapped
