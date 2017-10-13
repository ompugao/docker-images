# pxeboot server
## usage
``` 
sudo mount -r -t iso9660 -o loop path/to/ubuntu-14.04.3-server-amd64.iso /mnt/iso                                               
docker build -t ompugao/pxeboot .
docker run -it --net=host --cap-add=NET_ADMIN -p 68 -p 69 -v /mnt/iso/install/netboot:/netboot --rm ompugao/pxeboot 
```
## references
PXE ブートで Ubuntu をインストールする : あかぎメモ
http://blog.akagi.jp/archives/3391.html

Proxy DHCP サーバで PXE ブート - daily dayflower
http://d.hatena.ne.jp/dayflower/20090810/1249875581

Proxy DHCPを使ったディスクレスブート環境構築 — command not found:
http://d.zinrai.info/blog/html/2013/10/24/debian_wheezy_dnsmasq_proxy_dhcp.html
