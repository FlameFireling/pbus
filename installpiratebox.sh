sudo apt-get update
udo apt-get install minidlna
sudo apt-get -y install lighttpd
sudo /etc/init.d/lighttpd stop
sudo update-rc.d lighttpd remove
sudo apt-get -y install dnsmasq
sudo /etc/init.d/dnsmasq  stop
sudo update-rc.d dnsmasq remove
sudo apt-get -y  install hostapd
sudo /etc/init.d/hostapd  stop
sudo update-rc.d hostapd remove
sudo apt-get -y install iw  php-cli php-cgi
sudo rm /bin/sh
sudo ln /bin/bash /bin/sh
sudo chmod a+rx  /bin/sh
wget  http://downloads.piratebox.de/piratebox-ws_current.tar.gz
tar xzf piratebox-ws_current.tar.gz
cd piratebox
sudo mkdir -p  /opt
sudo cp -rv  piratebox /opt
cd /opt/piratebox
cp importantfiles/interfaces /etc/network/interfaces
sudo sed 's:DROOPY_USE_USER="no":DROOPY_USE_USER="yes":' -i  /opt/piratebox/conf/piratebox.conf
sudo ln -s /opt/piratebox/init.d/piratebox /etc/init.d/piratebox
sudo update-rc.d piratebox  defaults 
sudo /etc/init.d/piratebox start
sudo /opt/piratebox/bin/install_piratebox.sh /opt/piratebox/conf/piratebox.conf imageboard
sudo /opt/piratebox/bin/timesave.sh /opt/piratebox/conf/piratebox.conf install
sudo cp /etc/minidlna.conf /etc/minidlna.conf.bkp
sudo cp /opt/piratebox/src/linux.example.minidlna.conf /etc/minidlna.conf
sudo update-rc.d minidlna defaults
sudo service minidlna start

