<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <!-- <xsl:import href="../includes/modules/module_login.xsl"/> -->   
  <xsl:template name="public_right_col">
  <IMG ALT="" WIDTH="1" HEIGHT="3" SRC="/i/clear.gif" BORDER="0"/><BR/>
  <xsl:call-template name="calendar"/>
  <A HREF="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><IMG SRC="/i/tces_sidebar.gif" ALT="" WIDTH="171" HEIGHT="95" VSPACE="5" BORDER="0"/></A> 
  <A HREF="/?&amp;t=tces&amp;c=index"><IMG SRC="/i/tces_quote_sm.gif" ALT="" WIDTH="170" HEIGHT="200" BORDER="0"/></A>
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
