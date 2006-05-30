<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
<HTML>
<HEAD>
<TITLE>Member Photo</TITLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF" MARGINWIDTH="0" MARGINHEIGHT="0" LEFTMARGIN="0" TOPMARGIN="0">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
<TR>
<TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<IMG ALT="TCMember" WIDTH="433" HEIGHT="288" BORDER="0"> 
 <xsl:attribute name="SRC">/i/2002tccc/<xsl:value-of select="/TC/img"/>.jpg</xsl:attribute>
</IMG>
</TD>
</TR>                       
</TABLE>
</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>
