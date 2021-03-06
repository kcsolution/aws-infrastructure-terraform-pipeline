#/bin/sh

sudo yum --disablerepo=hashicorp ...  
sudo yum-config-manager --disable hashicorp     
sudo  yum-config-manager --save --setopt=hashicorp.skip_if_unavailable=true

sudo yum update -y
echo "Install Telegraf"
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.0-1.x86_64.rpm -O /tmp/telegraf.rpm
yum localinstall -y /tmp/telegraf.rpm
rm /tmp/telegraf.rpm
chkconfig telegraf on
usermod -aG docker telegraf
mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf
service telegraf start




