#!/bin/env bash
YUM_REPO="/etc/yum.repos.d/CentOS-Base.repo"
# shellcheck disable=SC2002
cat "/home/vagrant/yum_update" | sudo tee "$YUM_REPO"

