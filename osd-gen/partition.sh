#!/bin/sh

set -x

yum -y install lvm2

parted -s /dev/sdc mklabel gpt
for i in `seq 1 4`
do
  parted -s /dev/sdc mkpart $i $(((i - 1) * 25))% $((i * 25))%
  parted -s /dev/sdc set $i lvm on
  sleep 1
  pvcreate /dev/sdc$i
  pvscan
  vgcreate osd$i /dev/sdc$i
  vgscan
  lvcreate --name osd${i}-journal -l 10%FREE osd$i
  lvcreate --name osd${i}-data -l 100%FREE osd$i
  lvscan
done
