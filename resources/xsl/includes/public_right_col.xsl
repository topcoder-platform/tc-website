<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <xsl:template name="public_right_col">
  <xsl:param name="sectionName"></xsl:param>
  <xsl:param name="sectionSubname"></xsl:param>

<!--
<script type="text/javascript"><![CDATA[
function timer(last) {
  var d = document;
  var stuff = [['/i/tournament/tco03/promo_sm_revelation.gif', '/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_revelation'], ['/i/tournament/tco03/promo_sm_northface.gif', '/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_northface'], ['/i/tournament/tco03/promo_sm_artifact.gif', '/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_artifact']];
  curr = (last+1)%stuff.length;
  document.changerImg.src=stuff[curr][0];
  find('changerHref').href=stuff[curr][1];
  setTimeout("timer(curr)", 5000);
}
function find(n) {
  var s = document.anchors;
  for (var i=0; i<s.length; i++) {
    if (s[i].name==n) return s[i];
  }
}
]]></script>
-->

<xsl:choose>
    <xsl:when test="$sectionName='tco03'or$sectionName='statistics'">
            <IMG src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/i/downloads/tco03_guide.pdf"  target="_blank"><img src="/i/promos/tco_guide_promo_third.gif" alt="The TCO Guide" width="170" height="150" border="0" /></A><br/>

            <IMG src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <xsl:call-template name="calendar"/>

            <p><br/></p>
    </xsl:when>

    <xsl:otherwise>
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><img src="/i/es/animated_emp_promo.gif" alt="" width="170" height="119" border="0" /></A><br />

            <img alt="" width="1" height="10" src="/i/clear.gif" border="0"/><br />

            <xsl:choose>
                <xsl:when test="$sectionSubname='working_topcoder'">

                </xsl:when>
                <xsl:otherwise>

            <A href="/?t=about_tc&amp;c=jobs"><img src="/i/es/proj_manager_promo.gif" alt="" width="170" height="106" border="0" /></A><br />

            <img alt="" width="1" height="10" src="/i/clear.gif" border="0"/><br />

                </xsl:otherwise>
            </xsl:choose>

            <xsl:call-template name="calendar"/>

            <p><br/></p>
    </xsl:otherwise>
</xsl:choose>

  </xsl:template>
</xsl:stylesheet>
