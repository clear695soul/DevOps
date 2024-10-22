#! /bin/bash
update-ca-certificates -v
echo "192.168.56.41 mario.ru" >> /etc/hosts
sudo cp /home/vagrant/domain.crt /usr/local/share/ca-certificates/domain.crt
sudo chmod 644 /usr/local/share/ca-certificates/domain.crt
