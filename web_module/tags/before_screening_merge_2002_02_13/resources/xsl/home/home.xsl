<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top2.xsl"/>
  <xsl:import href="../script.xsl"/>  
  <xsl:import href="member_body.xsl"/>
  <xsl:import href="public_body.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="Preload"/>      
        <title>TopCoder Home</title>
        <xsl:call-template name="CSS"/>      
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
        <xsl:call-template name="Top"/>
        <xsl:choose>
          <xsl:when test="/TC/LoggedIn='true'">
            <xsl:call-template name="MemberBody"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PublicBody"/>
          </xsl:otherwise>
        </xsl:choose>
    <!-- Footer Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#666666" width="160"><img src="/i/clear.gif" width="160" height="1" border="0"/></td>
      <td bgcolor="#666666" width="10"><img src="/i/footer_top_angle.gif" width="10" height="10" border="0"/></td>
        <td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#666666">
  <tr>
    <td colspan="2" height="15" background="/i/footer_graphic_tile.gif" align="left"><img src="/i/footer_graphic.gif" width="710" height="16" border="0"/></td>
  </tr>
  <tr>
    <td width="20" valign="top" bgcolor="#43515E" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" width="20" height="1" border="0"/></td>
    <td width="100%" valign="top" align="left" bgcolor="#43515E" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" width="1" height="5" border="0"/><br/>
      <span class="smallFoot">
        <a class="smallFoot" target="_parent">
          <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>
          register
        </a>&#160;&#160;|&#160;&#160;
        <a class="smallFoot" target="_parent">
          <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>
          about [TC]
        </a>&#160;&#160;|&#160;&#160;
        <a class="smallFoot" target="_parent">
          <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>
          contacts
        </a>&#160;&#160;|&#160;&#160;
        <a class="smallFoot" target="_parent">
          <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>
          privacy
        </a>&#160;&#160;|&#160;&#160;
        <a class="smallFoot" target="_parent">
          <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>
          terms
        </a>&#160;&#160;|&#160;&#160;
        <a class="smallFoot" target="_parent">
          <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>
          [TC] home
        </a>
      </span><br/><br/>
      <span class="smallFoot">Copyright &#169; 2003, TopCoder, Inc. All rights reserved.</span>
      <br/><br/><br/>
    </td>
  </tr>
</table>    
    <!-- Footer Include Ends -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
