#!/bin/env bash

ROOT_USER_HOME="/root"
ROOT_SSH="$ROOT_USER_HOME/.ssh"
ROOT_AUTHORIZED_KEYS="$ROOT_SSH/authorized_keys"
VAGRANT_USER_HOME="/home/vagrant"
VAGRANT_SSH="$VAGRANT_USER_HOME/.ssh"
VAGRANT_AUTHORIZED_KEYS="$VAGRANT_SSH/authorized_keys"


cat "$VAGRANT_USER_HOME/ansible_id_rsa.pub" >> "$ROOT_AUTHORIZED_KEYS"
chmod 644 "$ROOT_AUTHORIZED_KEYS"

cat "$VAGRANT_USER_HOME/ansible_id_rsa.pub" >> "$VAGRANT_AUTHORIZED_KEYS"
chmod 644 "$VAGRANT_AUTHORIZED_KEYS"
chown -R vagrant:vagrant "$VAGRANT_SSH"
