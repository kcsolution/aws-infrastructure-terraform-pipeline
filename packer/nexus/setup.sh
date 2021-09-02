
#/bin/sh

echo "Instalando o Java"
yum remove java* -y
sudo yum install java-1.8.0-openjdk.x86_64 -y

echo "Instalando Nexus"
sleep 10
cd /opt
sudo wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
tar -zxvf nexus-3.0.2-02-unix.tar.gz
mv -f /opt/nexus-3.0.2-02 /opt/nexus
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus

#cd /etc/init.d
#sudo chkconfig --add nexus
#sudo chkconfig --levels 345 nexus on

mv -f /tmp/nexus.rc /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
su - nexus
sleep 10
service nexus restart

until $(curl --output /dev/null --silent --head --fail http://localhost:8081); do
    printf '.'
    sleep 2
done


echo "Upload Groovy Script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD --header "Content-Type: application/json" 'http://localhost:8081/service/rest/v1/script' -d @/tmp/repository.json

echo "Execute it"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD  --header "Content-Type: text/plain" 'http://localhost:8081/service/rest/v1/script/docker-repository/run'


