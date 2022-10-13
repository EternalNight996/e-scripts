## The Build Openvpn Server on docker

#### Suggested Firewall Control
[BT](https://www.bt.cn/new/index.html) Control Server; Can easy control your firewalld in|out of port and docker;
Run under command
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```

#### Build openvpn on docker
```
# The first account like `eternal`; will out to /data/openvpn/conf/eternal.ovpn
# Take `eternal.ovpn` put your under folder on `oepnvpn client` config
git clone https://github.com/EternalNight996/Scripts.git
cd Scripts/docker_openvpn
sudo chmod +x *.sh
sudo bash build.sh
```

#### Create new account
```
# Create like `eternal` then config out to /data/openvpn/conf/eternal.ovpn
sudo bash create_user.sh
```
#### Delete account
```
sudo bash delete_user.sh
```

#### Client link of donwload
[IOS](https://apps.apple.com/us/app/openvpn-connect/id590379981): click me download
[Android](https://rawapk.com/openvpn-for-android-apk-download/): click me download
[Windows_x32](https://swupdate.openvpn.org/community/releases/OpenVPN-2.5.7-I602-x86.msi): click me download
[Windows_x64](https://swupdate.openvpn.org/community/releases/OpenVPN-2.5.7-I602-amd64.msi): click me download
[Mac](https://swupdate.openvpn.net/downloads/connect/openvpn-connect-3.3.6.4368_signed.dmg): click me download
[ubuntu](): ``` sudo apt install openvpn```
[centos](): ``` sudo yum install openvpn```
`if you cannot download app on china, you can contact me through under info;`
QQ: 2472674814
Email: EternalNightYeah2@yeah.net

#### Important!
- if you on aliyun.com or tencentclound.com, please checkout port whether open or goto here: https://zhujicankao.com/66728.html

- if build on [BT](https://www.bt.cn/new/index.html), you need to open port of firewalld on [BT](https://www.bt.cn/new/index.html);

- if you only use docker on ubuntu, you can config [ufw](https://www.bilibili.com/read/cv13051394);

- if you only use docker on centos, you can config [firewalld](https://www.cnblogs.com/kaiji541-/p/10461308.html);

- The openvpn protocol suggest you select `udp` at china, because has big strong firewall on china;