<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="TopMenu">

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td height="4" class="headStripe"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>

        <td nowrap="0">
            <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="/TC/Task!='tces'and/TC/Task!='development'and/TC/Task!='about_tc'and/TC/Task!='news_events'and/TC/Task!='contacts'">topNavOn</xsl:when>
                <xsl:otherwise>topNav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="topLink" target="_parent"><xsl:attribute name="HREF">/</xsl:attribute>Competition</A>
        </td>

        <td nowrap="0">
            <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="/TC/Task='development'">topNavOn</xsl:when>
                <xsl:otherwise>topNav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="topLink" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=development&amp;c=index</xsl:attribute>Development</A>
        </td>

        <td nowrap="0">
            <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="/TC/Task='tces'">topNavOn</xsl:when>
                <xsl:otherwise>topNav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="topLink" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>Job Listing</A>
        </td>

        <td class="topNav" nowrap="0"><A class="topLink"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/SoftwareHost"/></xsl:attribute>Software</A></td>

        <td class="topNav" nowrap="0"><A  class="topLink"><xsl:attribute name="href">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=tces_home</xsl:attribute>Employment Services</A></td>

        <td class="topNav" nowrap="0"><A  class="topLink"><xsl:attribute name="href">http://<xsl:value-of select="/TC/CorpHost"/>/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=index</xsl:attribute>Sponsorship</A></td>

        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>

  </xsl:template>
</xsl:stylesheet>
