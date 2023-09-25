#!/bin/bash

set -e

GRAALVM_VERSION="17"
OS_VERSION="linux-x64"
INSTALL_DIR="/opt/graalvm"

wget https://download.oracle.com/graalvm/${GRAALVM_VERSION}/latest/graalvm-jdk-${GRAALVM_VERSION}_${OS_VERSION}_bin.tar.gz -O graalvm-jdk-${GRAALVM_VERSION}_${OS_VERSION}.tar.gz

mkdi ${INSTALL_DIR}
sudo tar -zxvf graalvm-jdk-${GRAALVM_VERSION}_${OS_VERSION}.tar.gz -C /opt
sudo mv /opt/graalvm-jdk*/* ${INSTALL_DIR}

echo "export JAVA_HOME=${INSTALL_DIR}" >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

rm graalvm-jdk-${GRAALVM_VERSION}_${OS_VERSION}.tar.gz

echo "GraalVM ${GRAALVM_VERSION}-${OS_VERSION} install success."
