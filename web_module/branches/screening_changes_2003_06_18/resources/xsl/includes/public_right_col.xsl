<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <xsl:template name="public_right_col">
  <xsl:param name="sectionName"></xsl:param>

<xsl:choose>
    <xsl:when test="$sectionName='tourny'">
            <img alt="" width="1" height="10" src="/i/clear.gif" border="0"/><br/>
            
            <xsl:call-template name="calendar"/>
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <A href="http://corporate.topcoder.com/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=tourny_index"><img src="/i/promos/tco03/sponsor_tco03_rcol.gif" alt="Sponsor the TCO" width="170" height="226" border="0" /></A><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
    </xsl:when>

    <xsl:otherwise>
            <img alt="" width="1" height="10" src="/i/clear.gif" border="0"/><br/>
            
            <xsl:call-template name="calendar"/>
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <A href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><img src="/i/tces_sidebar.gif" alt="" width="170" height="95" border="0"/></A><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
    </xsl:otherwise>
</xsl:choose>

  </xsl:template>
</xsl:stylesheet>
