<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="../includes/modules/scroll.xsl"/>  
  <xsl:import href="../includes/modules/rating.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/> 
  <xsl:import href="affidavit_body.xsl"/>      
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
      <HEAD>
        <xsl:call-template name="Preload"/>
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
<frameset rows="110,*,110" MARGINWIDTH="4" MARGINHEIGHT="0" leftmargin="4" topmargin="0" FRAMEBORDER="no" BORDER="0" FRAMESPACING="0">
  <frame src="/?t=statistics&amp;c=affidavit_top" name="affidavit_top" marginheight="0" topmargin="0" leftmargin="0" MARGINWIDTH="0" scrolling="no" border="0" frameborder="No" framespacing="0" noresize=""/>  
    <frameset cols="170,*" frameborder="NO" rows="*" MARGINWIDTH="0" MARGINHEIGHT="0" topmargin="0" leftmargin="0" FRAMESPACING="0" BORDER="0"> 
      <frame src="/?t=statistics&amp;c=affidavit_left" name="affidavit_left" marginheight="0" topmargin="0" marginwidth="0" leftmargin="0" scrolling="no" border="0" frameborder="No" framespacing="0"/>    
      <frame src="/?t=statistics&amp;c=affidavit_body" name="affidavit_body" marginheight="0" topmargin="0" marginwidth="0" leftmargin="0" scrolling="auto" border="0" frameborder="No" framespacing="0"/>
    </frameset>
  <frame src="/?t=statistics&amp;c=affidavit_foot" name="Foot" marginheight="0" topmargin="0" marginwidth="0" leftmargin="0" scrolling="no" border="0" frameborder="No" framespacing="0"/> 
</frameset>

<body BGCOLOR="#CCCCCC">
</body>
</html>
  </xsl:template>
</xsl:stylesheet>
