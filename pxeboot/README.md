# pxeboot server
## usage
``` 
sudo mount -r -t iso9660 -o loop path/to/ubuntu-14.04.3-server-amd64.iso /mnt/iso                                               
docker build -t ompugao/pxeboot .
docker run -it --net=host --cap-add=NET_ADMIN -p 68 -p 69 -v /mnt/iso/install/netboot:/netboot --rm ompugao/pxeboot 
```
