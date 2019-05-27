# may/22/2019 21:24:57 by RouterOS 6.44.3
# software id = 4NYQ-HTJS
#
# model = RouterBOARD 952Ui-5ac2nD
# serial number = 6B3506A69E11
/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan2 ] disabled=no mode=ap-bridge ssid=EEDC-Mikrotik \
    wireless-protocol=802.11
/interface list
add name=WAN
add name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk mode=\
    dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=cisco123 \
    wpa2-pre-shared-key=cisco123
add authentication-types=wpa2-psk eap-methods="" management-protection=\
    allowed mode=dynamic-keys name=vithieya supplicant-identity="" \
    wpa2-pre-shared-key=123456789
add authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    management-protection=allowed name=Manuwu supplicant-identity=""
/interface wireless
set [ find default-name=wlan1 ] disabled=no mode=ap-bridge security-profile=\
    Manuwu ssid=MANUWU wireless-protocol=802.11
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/ip pool
add name=dhcp_pool0 ranges=172.16.1.2-172.16.1.254
add name=dhcp ranges=192.168.88.10-192.168.88.254
add name=dhcp_pool2 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=no interface=bridge1 name=dhcp1
/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
add bridge=bridge1 interface=ether5
add bridge=bridge1 interface=wlan2
add bridge=bridge1 interface=wlan1
/interface list member
add interface=ether1 list=WAN
add interface=bridge1 list=LAN
/ip address
add address=192.168.20.1/24 interface=bridge1 network=192.168.20.0
add address=192.168.10.2/24 interface=ether1 network=192.168.10.0
/ip dhcp-client
add dhcp-options=hostname,clientid interface=ether1
/ip dhcp-server network
add address=192.168.20.0/24 dns-server=8.8.8.8 gateway=192.168.20.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=WAN
/ip route
add distance=1 gateway=192.168.10.1
/system clock
set time-zone-name=Europe/Madrid
/system identity
set name=EEDC-Mikrotik
/tool romon
set enabled=yes
