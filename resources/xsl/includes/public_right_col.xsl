<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <!-- <xsl:import href="../includes/modules/module_login.xsl"/> -->   
  <xsl:template name="public_right_col">
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                     <xsl:call-template name="my_stats"/>
                     <xsl:call-template name="calendar"/>
                  </xsl:when>                  
                  <xsl:otherwise>
                     <!-- <xsl:call-template name="module_login"/>
                     <xsl:call-template name="practice_room"/> -->
                     <xsl:call-template name="calendar"/>
                  </xsl:otherwise>
                </xsl:choose> 
  </xsl:template>
</xsl:stylesheet>
