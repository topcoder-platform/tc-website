<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">    
  <xsl:import href="../script.xsl"/> 
  <xsl:import href="india.xsl"/> 
  <xsl:import href="canada.xsl"/> 
  <xsl:import href="aus_uk.xsl"/> 
  <xsl:import href="us.xsl"/> 
  <xsl:import href="tourney.xsl"/> 
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>TopCoder :: Affidavit</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">


<xsl:choose>
  <xsl:when test="/TC/Affidavit/Tourney='true'">
    <xsl:call-template name="Tourney"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:choose>
      <xsl:when test="/TC/Affidavit/HomeCountry='India'">
        <xsl:call-template name="India"/>
      </xsl:when>
      <xsl:when test="/TC/Affidavit/HomeCountry='Canada'">
        <xsl:call-template name="Canada"/>
      </xsl:when>
      <xsl:when test="/TC/Affidavit/HomeCountry='Australia' or /TC/Affidavit/HomeCountry='United Kingdom'">
        <xsl:call-template name="Aus_UK"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="US"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:otherwise>
</xsl:choose>
	
</BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
