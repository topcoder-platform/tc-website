<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../script.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>TopCoder Sponsor Redirect</TITLE>
        <xsl:call-template name="Preload"/>
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <A href="Javascript:sponsorLink('/?&amp;t=sponsor&amp;c=link&amp;link=http://apps.citrix.com/CDN/Login.asp&amp;refer=srm')"><IMG src="/i/developer_network.gif" height="569" width="793"/></A>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
