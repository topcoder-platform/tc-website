<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <xsl:template name="public_right_col">
  <xsl:param name="sectionName"></xsl:param>
  <xsl:param name="sectionSubname"></xsl:param>

<script type="text/javascript"><![CDATA[
function timer(last) {
  var d = document;
  var stuff = [['/i/tournament/tco03/promo_sm_revelation.gif', '/?t=tournaments&c=tco03_revelation'], ['/i/tournament/tco03/promo_sm_northface.gif', '/?t=tournaments&c=tco03_northface'], ['/i/tournament/tco03/promo_sm_artifact.gif', '/?t=tournaments&c=tco03_artifact']];
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

<xsl:choose>
    <xsl:when test="$sectionName='tco03'or$sectionName='statistics'">
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <img src="/i/tournament/tco03/promo_tco_header.gif" alt="2003 TopCoder Open Sponsors" width="170" height="62" border="0" /><br />

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <xsl:choose>
                <xsl:when test="$sectionSubname='intel'">

                </xsl:when>
                <xsl:otherwise>

            <A href="/?t=tournaments&amp;c=tco03_intel"><img src="/i/tournament/tco03/promo_sm_intel.gif" alt="Intel Developer Services" width="170" height="104" border="0" /></A><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

                </xsl:otherwise>
            </xsl:choose>

            <xsl:choose>
                <xsl:when test="$sectionSubname='nvidia'">

                </xsl:when>
                <xsl:otherwise>

            <A href="/?t=tournaments&amp;c=tco03_nvidia"><img src="/i/tournament/tco03/promo_sm_nvidia.gif" alt="NVIDIA" width="170" height="95" border="0" /></A><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

                </xsl:otherwise>
            </xsl:choose>

            <A href="" name="changerHref"><img src="" name="changerImg" width="170" height="84" border="0" /></A><br />

            <img alt="" width="1" height="10" src="/i/clear.gif" border="0"/><br />

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
