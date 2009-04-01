<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="spons_srm_pulldown">
<DIV ALIGN="right"><BR/>
<form name="selectform"><select name="tournaments" size="1" class="dropdown" onchange="goTo(this)">
<OPTION value="SELECTED"> SRM Packages: </OPTION>
<OPTION value="spons_srm_web">&#160;Web Site</OPTION>
<OPTION value="spons_srm_applet">&#160;TC Arena Applet</OPTION>
<OPTION value="spons_srm_email">&#160;Email</OPTION>
</select></form></DIV>
</xsl:template>
</xsl:stylesheet>
