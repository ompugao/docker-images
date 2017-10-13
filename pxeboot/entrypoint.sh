#!/bin/bash
#/pxe-pdhcp/pxe-pdhcp -l 0.0.0.0 -b 255.255.255.255 -t 10.3.147.232 -d pxelinux.0 &
service tftpd-hpa restart
exec "$@"

