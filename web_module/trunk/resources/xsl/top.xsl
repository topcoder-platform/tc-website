<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="menu.xsl"/>
  <xsl:import href="includes/modules/rating.xsl"/>
  <xsl:import href="script.xsl"/>
  <!-- <xsl:import href="../includes/modules/rating.xsl"/> -->
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Top"/>
  </xsl:template>
  <xsl:template name="Top">
  <xsl:param name="sectionName"></xsl:param>
  <xsl:param name="level1"></xsl:param>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="homeTopBar">
			<span class="time">Current Member Count</span>
			&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/> - 
			<span class="time"><xsl:call-template name="DateTime"/></span>&#160;
			<a href="Javascript:tcTime()" class="statText"><strong>[Get Time]</strong></a>
		</td>
        <td class="homeTopBar" width="100%" align="right">
            <xsl:choose>
                <xsl:when test="/TC/LoggedIn='true'">
                    <strong>Hello, </strong><span class="smallText">&#160;
                    <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                    <xsl:attribute name="class"><xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="/TC/Rating"/></xsl:with-param></xsl:call-template></xsl:attribute>
                    <xsl:value-of select="/TC/Handle"/>
                    </A></span>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?&amp;module=Logout</xsl:attribute>Logout</A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Update Profile</A>
                </xsl:when>
                <xsl:otherwise>
                    <A class="loginLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?&amp;module=Login</xsl:attribute>Login</A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register</A>
                </xsl:otherwise>
            </xsl:choose>
            &#160;&#160;|&#160;&#160;<A class="loginLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>Home</A>
        </td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="homeLogo">
          <A>
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="$level1='development'">
			<a href="/"><img src="/i/logo.gif" border="0"/></a>
                            </xsl:when>
                            <xsl:otherwise>
			<a href="/"><img src="/i/logo_r.gif" border="0"/></a>
                            </xsl:otherwise>
			</xsl:choose>
          </A>
        </td>
    </tr>
</table>

    <xsl:call-template name="TopMenu"/>

  </xsl:template>
</xsl:stylesheet>
