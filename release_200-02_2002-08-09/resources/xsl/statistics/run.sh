for FILE in $(ls -1 *.xsl)
do
  echo $FILE
  java reports.cc2002.processXSL $FILE
done
