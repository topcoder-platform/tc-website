<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../script.xsl"/>
<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
<HTML>
<HEAD>
<TITLE>TopCoder Time</TITLE>
<xsl:call-template name="CSS"/>
<META HTTP-EQUIV="REFRESH" CONTENT="15"/>
</HEAD>
<BODY BGCOLOR="#000000" MARGINWIDTH="0" MARGINHEIGHT="0" LEFTMARGIN="0" TOPMARGIN="0">
<CENTER>
<TABLE BORDER="0" HEIGHT="85%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
<TR>
<TD BGCOLOR="#000000" HEIGHT="50%" VALIGN="middle" COLSPAN="3" CLASS="statText" ALIGN="center">
Current time at the TopCoder corporate office:
</TD>
</TR>                       
<TR>
<TD BGCOLOR="#000000" HEIGHT="35%" VALIGN="top" COLSPAN="3" CLASS="statText" ALIGN="center">
<font size="3"><b><xsl:value-of select="/TC/time"/></b></font>
</TD>
</TR>                       
</TABLE>
</CENTER>
</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>
