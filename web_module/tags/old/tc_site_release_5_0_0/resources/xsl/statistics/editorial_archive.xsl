<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="Preload"/>
        <title>Statistics, Editorials, Match Results and Member Profiles at TopCoder</title>
        <xsl:call-template name="CSS"/>

        <meta http-equiv="Refresh" content="5; URL=/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" />
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body>
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
            </xsl:call-template>

            <div style="padding: 15px;">
            <p>This page has moved.  You will be redirected to the Match Editorials Archive in just a moment.
            <br /><br />
            Click <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">here</A> to get to the page manually.
            </p>
            </div>

                        <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>
            <!--
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">statistics</xsl:with-param>
            </xsl:call-template>
            -->
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>
  </xsl:template>
</xsl:stylesheet>