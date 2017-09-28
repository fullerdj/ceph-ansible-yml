#!/bin/sh

set -x

OSD_DIR=$(mount | grep sdc1 |cut -f3 -d' ')
OSD_NUM=$(echo $OSD_DIR |cut -f2 -d'-')

pkill ceph-osd
cd $OSD_DIR
tar --xattrs -zxvf $HOME/1G-corpus.tgz
mv current/meta /tmp
rm -rf current
mv tmp/cbt/mnt/osd-device-0-data/current .
rm -rf current/meta
mv /tmp/meta current/
chown -R ceph $OSD_DIR
/usr/bin/ceph-osd -f --cluster ceph --id $OSD_NUM --setuser ceph --setgroup ceph
