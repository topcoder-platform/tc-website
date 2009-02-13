<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top2.xsl"/>
  <xsl:import href="../script.xsl"/>  
  <xsl:import href="member_body.xsl"/>
  <xsl:import href="public_body.xsl"/>
    <xsl:import href="../foot.xsl" />
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

<!-- Footer Begins -->
        <xsl:call-template name="Foot" /> 
<!-- Footer Endss -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>
