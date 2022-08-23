#!/bin/bash

source ~/.bash_profile

pushd /home/web/web

echo "Deploying tc-website"
ant -f build_tc.xml expand

popd
