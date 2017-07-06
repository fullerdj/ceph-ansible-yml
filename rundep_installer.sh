#!/bin/sh

yum -y install yum-utils epel-release
yum -y install python-pip
yum repolist
yum -y install python-prettytable

yum -y install fuse-libs libaio leveldb hdparm parted-0:3.1-28.el7.x86_64 nss-0:3.21.3-2.el7_3.x86_64 gdisk-0:0.8.6-5.el7.x86_64 nspr-0:4.11.0-1.el7_2.x86_64 gperftools-libs-0:2.4-5.el7.x86_64 initscripts-0:9.49.37-1.el7_3.1.x86_64 python-flask-1:0.10.1-4.el7.noarch boost-system-0:1.53.0-26.el7.x86_64 xfsprogs cryptsetup-0:1.7.2-1.el7.x86_64 boost-thread-0:1.53.0-26.el7.x86_64 chkconfig-0:1.7.2-1.el7_3.1.x86_64 keyutils-libs-0:1.5.8-3.el7.x86_64 libgcc-0:4.8.5-11.el7.x86_64 python-requests-0:2.6.0-1.el7_1.noarch parted-0:3.1-28.el7.i686 python-0:2.7.5-48.el7.x86_64 libstdc++-0:4.8.5-11.el7.x86_64 libuuid-0:2.23.2-33.el7_3.2.x86_64

cp /usr/local/etc/init.d/ceph /etc/init.d/ceph

cat > /etc/environment <<EOF
#!/bin/sh

PYTHONPATH=/usr/local/lib64/python2.7/site-packages/:/usr/local/lib64/:/usr/local/lib/python2.7/site-packages/
LD_LIBRARY_PATH=/usr/local/lib64
EOF
