<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:import href="../script.xsl"/">
<xsl:template match="/">
<HTML>
<HEAD>
<TITLE>TopCoder Time</TITLE>
<xsl:call-template name="CSS"/>
</HEAD>
<BODY BGCOLOR="#000000" MARGINWIDTH="0" MARGINHEIGHT="0" LEFTMARGIN="0" TOPMARGIN="0">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
<TR>
<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<xsl:value-of select="/TC/time"/>
</TD>
</TR>                       
</TABLE>
</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>
