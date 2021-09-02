#!/bin/bash

echo "Atualizando Linux"
# sudo yum --disablerepo=hashicorp ...  
# sudo yum-config-manager --disable hashicorp     
# sudo  yum-config-manager --save --setopt=hashicorp.skip_if_unavailable=true


echo "Instalando o Java"
yum remove -y java
yum install -y java-1.8.0-openjdk
sleep 10 

echo "Install Jenkins stable release"

# wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
# rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
# yum upgrade -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum upgrade -y
sudo yum install epel-release java-11-openjdk-devel
sudo amazon-linux-extras install epel -y
sudo yum install -y jenkins
sudo systemctl daemon-reload
#sudo systemctl start jenkins


sleep 10

echo "Install Telegraf"
sudo wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.0-1.x86_64.rpm -O /tmp/telegraf.rpm
sudo yum localinstall -y /tmp/telegraf.rpm
sudo rm -f /tmp/telegraf.rpm
sudo chkconfig telegraf on
sudo mv -f /tmp/telegraf.conf /etc/telegraf/telegraf.conf
sudo service telegraf start

sleep 10

echo "Install git"
 yum install -y git

sleep 10
# echo "Setup SSH key"
sudo mkdir /var/lib/jenkins/.ssh
sudo touch /var/lib/jenkins/.ssh/known_hosts
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo chmod 700 /var/lib/jenkins/.ssh
sudo mv /tmp/id_rsa /var/lib/jenkins/.ssh/id_rsa
sudo chmod 600 /var/lib/jenkins/.ssh/id_rsa

echo "Configure Jenkins"
sudo mkdir -p /var/lib/jenkins/init.groovy.d
sudo mv -f /tmp/basic-security.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy
sudo mv -f /tmp/disable-cli.groovy /var/lib/jenkins/init.groovy.d/disable-cli.groovy
sudo mv -f /tmp/csrf-protection.groovy /var/lib/jenkins/init.groovy.d/csrf-protection.groovy
sudo mv -f /tmp/disable-jnlp.groovy /var/lib/jenkins/init.groovy.d/disable-jnlp.groovy
sudo mv -f /tmp/jenkins.install.UpgradeWizard.state /var/lib/jenkins/jenkins.install.UpgradeWizard.state
sudo mv -f /tmp/node-agent.groovy /var/lib/jenkins/init.groovy.d/node-agent.groovy
sudo chown -R jenkins:jenkins /var/lib/jenkins/jenkins.install.UpgradeWizard.state
sudo mv /tmp/jenkins /etc/sysconfig/jenkins
sudo chmod +x /tmp/install-plugins.sh
sudo bash /tmp/install-plugins.sh
sudo systemctl start jenkins


