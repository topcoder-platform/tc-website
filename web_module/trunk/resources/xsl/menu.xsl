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
                <xsl:when test="/TC/Task='home'">topNavOn</xsl:when>
                <xsl:otherwise>topNav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="topLink" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=home&amp;c=public_home</xsl:attribute>Competition</A>
        </td>

        <td nowrap="0">
            <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="/TC/Task='development'">topNavOn</xsl:when>
                <xsl:otherwise>topNav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="topLink" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Development</A>
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

        <td class="topNav" nowrap="0"><A href="http://software.topcoder.com" class="topLink">Software</A></td>

        <td class="topNav" nowrap="0"><A href="http://corporate.topcoder.com/?module=Static&amp;d1=corp&amp;d2=tces_home" class="topLink">Employment Services</A></td>

        <td class="topNav" nowrap="0"><A href="http://corporate.topcoder.com/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=index" class="topLink">Sponsorship</A></td>

        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>

  </xsl:template>
</xsl:stylesheet>
