<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="spons_report_pulldown">
<DIV ALIGN="right"><BR/>
<form name="selectform"><select name="tournaments" size="1" class="dropdown" onchange="goTo(this)">
<OPTION value="SELECTED"> Reporting Tabs: </OPTION>
<OPTION value="spons_report_gen">&#160;General</OPTION>
<OPTION value="spons_report_stud">&#160;Student</OPTION>
<OPTION value="spons_report_prof">&#160;Professional</OPTION>
</select></form></DIV>
</xsl:template>
</xsl:stylesheet>
