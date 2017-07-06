#!/bin/sh

yum -y install yum-utils epel-release
yum -y install python-pip
yum repolist
yum -y install python-prettytable
cat > /etc/profile.d/ceph.sh <<EOF
#!/bin/sh

PYTHONPATH=/usr/local/lib64/python2.7/site-packages/:/usr/local/lib64/:/usr/local/lib/python2.7/site-packages/
LD_LIBRARY_PATH=/usr/local/lib64
EOF
