<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Foot"/>
  </xsl:template>
  <xsl:template name="Foot">

<!-- Footer Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- TopCoder Links Begins -->
    <tr><td width="100%" class="footer">
            <A class="footerLinks"><xsl:attribute name="HREF">/</xsl:attribute>Home</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=Static&amp;d1=about&amp;d2=index</xsl:attribute>About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?module=ReviewBoard&amp;ph=112</xsl:attribute>Review Boards</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contact Us</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=privacy</xsl:attribute>Privacy</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=terms</xsl:attribute>Terms</A></td></tr>
<!-- TopCoder Links Ends -->

<!-- Member Sites Begins -->
    <tr><td width="100%" class="footer">
            <A class="footerLinks"><xsl:attribute name="HREF">>/</xsl:attribute>Competition</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=index</xsl:attribute>Development</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/SoftwareHost"/></xsl:attribute>Software</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=tces_home</xsl:attribute>Employment Services</A>&#160;&#160;|&#160;&#160;
            <A class="footerLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=index</xsl:attribute>Marketing Services</A></td></tr>
<!-- Member Sites Ends -->

    <tr><td height="4" class="footerStripe"><img src="/i/corp/clear.gif" width="10" height="4" border="0"/></td></tr>

    <tr><td width="100%" class="copyright">Copyright &#169; 2001-2004, TopCoder, Inc. All rights reserved.</td></tr>
</table>    
<!-- Footer Include Ends -->

  </xsl:template>
</xsl:stylesheet>
