<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="CSS">
      <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
  </xsl:template>


  <xsl:template name="DateTime">
<SCRIPT type="text/javascript"><![CDATA[
var months=new Array(13);
months[1]="January";
months[2]="February";
months[3]="March";
months[4]="April";
months[5]="May";
months[6]="June";
months[7]="July";
months[8]="August";
months[9]="September";
months[10]="October";
months[11]="November";
months[12]="December";
var time=new Date();
var lmonth=months[time.getMonth() + 1];
var date=time.getDate();
var year=time.getYear();
if (year < 2000)
year = year + 1900;
document.write(" " + lmonth + " ");
document.write(date + ", " + year + " ");
]]></SCRIPT>
  </xsl:template>


  <xsl:template name="Preload">
    <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
  </xsl:template>
</xsl:stylesheet>
