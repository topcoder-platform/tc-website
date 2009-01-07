<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="spons_tourny_pulldown">
<DIV ALIGN="right"><BR/>
<form name="selectform"><select name="tournaments" size="1" class="dropdown" onchange="goTo(this)">
<OPTION value="SELECTED"> Tournament Packages: </OPTION>
<OPTION value="spons_tourny_web">&#160;Web Site</OPTION>
<OPTION value="spons_tourny_applet">&#160;TC Arena Applet</OPTION>
<OPTION value="spons_tourny_email">&#160;Email</OPTION>
<OPTION value="spons_tourny_marketing">&#160;Tournament Marketing</OPTION>
<OPTION value="spons_tourny_onsite">&#160;Onsite Arena</OPTION>
<OPTION value="spons_tourny_pr">&#160;Public Relations</OPTION>
</select></form></DIV>
</xsl:template>
</xsl:stylesheet>
