<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="spons_demo_pulldown">
<DIV ALIGN="right"><BR/>
<form name="selectform"><select name="tournaments" size="1" class="dropdown" onchange="goTo(this)">
<OPTION value="SELECTED"> View Charts: </OPTION>
<OPTION value="general_charts">&#160;General</OPTION>
<OPTION value="professional_charts">&#160;Professional</OPTION>
<OPTION value="student_charts">&#160;Student</OPTION>
</select></form></DIV>
</xsl:template>
</xsl:stylesheet>
