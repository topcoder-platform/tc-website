# Ratings calculation tool

## Configuration
configuration is stored in `conf/com/topcoder/dde/RatingQubits.xml` and the following values should be updated:

- `ConnectionURL` - should be updated to point to oltp database
- 



## Compilation

Make sure your JAVA_HOME points to JDK 1.7 home directory and ANT_HOME points to ant 1.9.15 home directory. Then run the following

`java -Dhttps.protocols=TLSv1.2 -cp %ANT_HOME%/lib/ant-launcher.jar org.apache.tools.ant.launch.Launcher compile -f build_tcs.xml`

running ant manually is needed to allow it to download dependencies using https/ssl from maven repository and github

## Running

Update database configuration, move to `scripts/dde/` directory and run `runRatings.sh` script

NOTE: if running on Windows, edit the $SEPARATOR variable in runRatings.sh and set it to `;` instead of `:`

