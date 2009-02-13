<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../script.xsl"/>
<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
<HTML style="background:#000000; padding:0px; margin:0px;">
<HEAD>
<TITLE>TopCoder Time</TITLE>
<xsl:call-template name="CSS"/>
<META HTTP-EQUIV="REFRESH" CONTENT="15"/>
</HEAD>
<BODY style="background:#000000; padding:0px; margin:0px;">
<div style="color:#FFFFFF; background:#000000; padding:5px;" align="center">
Current time at the TopCoder corporate office:
<br /><br />
<b><xsl:value-of select="/TC/time"/></b>
</div>
</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>
