<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="../includes/modules/scroll.xsl"/>  
  <xsl:import href="../includes/modules/rating.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>       
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
      <HEAD>
        <xsl:call-template name="Preload"/>
        <TITLE>TopCoder :: Affidavit</TITLE>
        <xsl:call-template name="CSS"/>      
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
<frameset rows="140,*" BGCOLOR="#CCCCCC" MARGINWIDTH="0" MARGINHEIGHT="0" leftmargin="0" topmargin="0" FRAMEBORDER="no" BORDER="0" FRAMESPACING="0">
  <frame src="/?t=affidavit&amp;c=body_top" name="body_top" marginheight="0" topmargin="0" leftmargin="0" MARGINWIDTH="0" scrolling="no" border="0" frameborder="No" framespacing="0" noresize=""/>  
    <frameset rows="400" cols="80%,20%" MARGINWIDTH="0" MARGINHEIGHT="0" leftmargin="0" topmargin="0" FRAMEBORDER="yes" BORDER="0" FRAMESPACING="0">
       <frame name="frame" marginheight="0" topmargin="0" leftmargin="0" MARGINWIDTH="0" scrolling="auto" border="0" frameborder="No" framespacing="0">  
         <xsl:attribute name="src">/?t=affidavit&amp;c=body&amp;ContestId=<xsl:value-of select="/TC/ContestId"/></xsl:attribute>
       </frame>
       <frame src="/?t=affidavit&amp;c=blank" marginheight="0" topmargin="0" leftmargin="0" MARGINWIDTH="0" scrolling="no" border="0" frameborder="No" framespacing="0"/>    
    </frameset>
</frameset>
<body BGCOLOR="#CCCCCC">
</body>
</html>
  </xsl:template>
</xsl:stylesheet>
