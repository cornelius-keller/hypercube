FROM quay.io/coreos/hyperkube:v1.3.4_coreos.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y wget && \
    wget -q -O- 'https://download.ceph.com/keys/release.asc' |  apt-key add - &&  \
    echo deb http://download.ceph.com/debian-jewel/ jessie  main |  tee /etc/apt/sources.list.d/ceph.list && \
    apt-get install -yy ceph-common  && \
    apt-get install -yy  module-init-tools && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

