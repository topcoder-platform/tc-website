<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Foot"/>
  </xsl:template>
  <xsl:template name="Foot">

<!-- Footer Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#666666">
    <tr>
        <td height="15" background="/i/footer_graphic_tile.gif" align="left"><img src="/i/footer_graphic.gif" width="710" height="16" border="0"/></td>
    </tr>

    <tr valign="top">
        <td width="100%" align="center" bgcolor="#43515E"><img src="/i/clear.gif" width="1" height="5" border="0"/><br/>
            <div class="smallFoot">
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>Home</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contact Us</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=privacy</xsl:attribute>Privacy</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=terms</xsl:attribute>Terms</A><br /><br />

            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>Competition</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Development</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=tces&amp;c=index</xsl:attribute>Job Listings</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="href">http://<xsl:value-of select="/TC/SoftwareHost"/></xsl:attribute>Software</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="href">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=tces_home</xsl:attribute>Employment Services</A>&#160;&#160;|&#160;&#160;
            <A class="smallFoot" target="_parent"><xsl:attribute name="href">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=index</xsl:attribute>Sponsorship</A><br/><br/>

            Copyright &#169; 2001-2003, TopCoder, Inc. All rights reserved.
            </div>
            <br/><br/>
        </td>
    </tr>
</table>    
<!-- Footer Include Ends -->

  </xsl:template>
</xsl:stylesheet>
