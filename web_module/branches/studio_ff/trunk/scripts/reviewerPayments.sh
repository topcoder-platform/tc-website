#!/bin/sh

java -cp "../build/classes;../../dist/artifacts/shared-SNAPSHOT.jar;../../artifacts/log4j-1.2.13.jar" com.topcoder.web.common.model.DefaultPriceComponent $@
