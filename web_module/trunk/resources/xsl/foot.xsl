<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Foot"/>
  </xsl:template>
  <xsl:template name="Foot">

<!-- Footer Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgcolor="#666666" width="160"><img src="/i/clear.gif" width="160" height="1" border="0"/></td>
        <td bgcolor="#CCCCCC" width="10"><img src="/i/footer_top_angle.gif" width="10" height="10" border="0"/></td>
        <td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#666666">
    <tr>
        <td colspan="2" height="15" background="/i/footer_graphic_tile.gif" align="left"><img src="/i/footer_graphic.gif" width="710" height="16" border="0"/></td>
    </tr>

    <tr valign="top">
        <td width="20" bgcolor="#43515E"><img src="/i/clear.gif" width="20" height="1" border="0"/></td>
        <td width="100%" align="center" bgcolor="#43515E"><img src="/i/clear.gif" width="1" height="5" border="0"/><br/>
            <div class="smallFoot">
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>Home</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>Privacy</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>Terms</A><br /><br />
            Copyright &#169; 2000-2003, TopCoder, Inc. All rights reserved.
            </div>
            <br/><br/>
        </td>
    </tr>
</table>    
<!-- Footer Include Ends -->

  </xsl:template>
</xsl:stylesheet>
