#!/bin/env bash
VAGRANT_USER_HOME="/home/vagrant"
VAGRANT_SSH="$VAGRANT_USER_HOME/.ssh"
VAGRANT_AUTHORIZED_KEYS="$VAGRANT_SSH/authorized_keys"

cat "$VAGRANT_USER_HOME/ansible_id_rsa.pub" >> "$VAGRANT_AUTHORIZED_KEYS"
chmod 644 "$VAGRANT_AUTHORIZED_KEYS"
chown -R vagrant:vagrant "$VAGRANT_SSH"
