<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <!-- <xsl:import href="../includes/modules/module_login.xsl"/> -->   
  <xsl:template name="public_right_col">
  <img alt="" width="1" height="3" src="/i/clear.gif" border="0"/><br/>
  <xsl:call-template name="calendar"/>
  <a href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><img src="/i/tces_sidebar.gif" alt="" width="171" height="95" vspace="5" border="0"/></a> 

<map name="tcesMapSm">
	<area shape="rect" alt="" coords="88,84,161,98" href="/?t=schedule&amp;c=index"></area>
	<area shape="rect" alt="" coords="10,96,63,110" href="/?t=tces&amp;c=index"></area>
	<area shape="rect" alt="" coords="1,3,169,23" href="/?t=tces&amp;c=index"></area>
</map>
<img src="/i/tces_quote_sm.gif" width="170" height="159" border="0" alt="Only rated members can apply for jobs" usemap="#tcesMapSm" />

                <!-- <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                     <xsl:call-template name="my_stats"/>
                     <xsl:call-template name="calendar"/>
                  </xsl:when>                  
                  <xsl:otherwise>
                     <xsl:call-template name="module_login"/>
                     
                     <xsl:call-template name="calendar"/>
                  </xsl:otherwise>
                </xsl:choose>  -->
  </xsl:template>
</xsl:stylesheet>
