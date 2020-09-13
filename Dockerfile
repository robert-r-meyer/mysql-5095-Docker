from fedora:31
MAINTAINER Robert Meyer halbreck.technical.solutions@gmail.com

RUN yum clean all \
    && yum update -y \
    && yum upgrade -y \
    && yum install wget -y \

    && wget https://downloads.mysql.com/archives/get/p/23/file/MySQL-server-5.0.95-1.glibc23.x86_64.rpm \
      -O mysql.rpm \

    && wget https://downloads.mysql.com/archives/get/p/23/file/MySQL-shared-5.0.95-1.glibc23.x86_64.rpm \
      -O shared.rpm \

    && wget https://downloads.mysql.com/archives/get/p/23/file/MySQL-devel-5.0.95-1.glibc23.x86_64.rpm \
      -O devel.rpm \

    && wget https://downloads.mysql.com/archives/get/p/23/file/MySQL-client-5.0.95-1.glibc23.x86_64.rpm \
      -O client.rpm \

    && yum -y --nogpgcheck localinstall client.rpm devel.rpm mysql.rpm shared.rpm \

    && rm *.rpm \
    && rm -rf /var/cache/yum
