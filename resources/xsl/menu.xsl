<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="TopMenu">

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>
        <td class="topNav" nowrap="0"><A href="Javascript:arena()" class="topLink">Competition Applet</A></td> 
        <td class="topNav" nowrap="0">
            <xsl:choose>
                <xsl:when test="/TC/LoggedIn='true'">
                    <A class="topLink" target="_parent"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Update Profile</A>  
                </xsl:when>
                <xsl:otherwise>
                    <A class="topLink" target="_parent"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register</A>  
                </xsl:otherwise>
            </xsl:choose>
        </td>
        <td nowrap="0">
            <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="/TC/Task='tces'">topNavOn</xsl:when>
                <xsl:otherwise>topNav</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <A class="topLink" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>Employment Services</A>
        </td>
        <td class="topNav" nowrap="0"><A href="http://corporate.topcoder.com" class="topLink" target="_blank">Corporate Services</A></td>
        <td class="topNav" nowrap="0"><A href="http://software.topcoder.com" class="topLink" target="_blank">Software</A></td>
        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

  </xsl:template>
</xsl:stylesheet>
