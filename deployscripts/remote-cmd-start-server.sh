#!/bin/sh

source ~/.bash_profile

pushd /home/web/jboss-4.0.4.GA/bin

echo [Start Jboss]
./start.sh

popd
