<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/modules/rating.xsl"/>
    <xsl:import href="../includes/body_top.xsl" />
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/public_dev_right.xsl" />
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

                <xsl:variable name="design-phase" select="112" />
                <xsl:variable name="dev-phase" select="113" />
                <xsl:variable name="priceFormat" select="'$###,###,###.##'" />
<html>
<head>

    <xsl:call-template name="Preload" />

 <title>Recent Project Winners</title>

    <xsl:call-template name="CSS" />

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">components</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Components</xsl:with-param>
            </xsl:call-template>

            <img src="/i/clear.gif" alt="" width="240" height="10" border="0" />

            <br/>

    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="projectTitles">Design Winners</td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr valign="middle">
                    <td class="projectHeaders" width="27%">Project Name</td>
<!--
                    <td class="projectHeaders" width="17%" align="center">Total<br/>Submissions</td>
-->
                    <td class="projectHeaders" width="5%" align="right">Place</td>
                    <td class="projectHeaders" width="17%">Winner(s)</td>
                    <td class="projectHeaders" width="17%" align="center">Score</td>

                    <td class="projectHeaders" width="17%" align="right">Earnings</td>

                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/component_winners/winner">

                   <xsl:if test="./phase_id=$design-phase" >
                       <tr valign="middle">
                          <td class="projectCells">
                              <a>
                                  <xsl:attribute name="href">
                                      <xsl:value-of select="concat('http://software.topcoder.com/catalog/c_component.jsp?comp=', ./component_id)"/>
                                  </xsl:attribute><xsl:value-of select="./component_name"/>
                              </a>
                          </td>
                         <td class="projectCells" align="center"><xsl:value-of select="./place"/></td>
                         <td class="projectCells">
                            <a>
                                <xsl:attribute name="href">tc?module=MemberProfile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                                <xsl:attribute name="class"><xsl:call-template name="GetRatingClassDark"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template></xsl:attribute>
                                <xsl:value-of select="user_id"/>
                            </a>
                         </td>
                         <td class="projectCells" align="center"><xsl:value-of select="./score"/></td>
                         <td class="projectCells" align="right"><xsl:value-of select="format-number(./money, $priceFormat)"/></td>
                     </tr>
                   </xsl:if>
                </xsl:for-each>

            </table>

            <br/>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="projectTitles">Development Winners</td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr valign="middle">
                    <td class="projectHeaders" width="27%">Project Name</td>
                    <td class="projectHeaders" width="5%" align="right">Place</td>
                    <td class="projectHeaders" width="17%">Winner(s)</td>
                    <td class="projectHeaders" width="17%" align="center">Score</td>
                    <td class="projectHeaders" width="17%" align="right">Earnings</td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/component_winners/winner">

                   <xsl:if test="./phase_id=$dev-phase" >
                       <tr valign="middle">
                          <td class="projectCells">
                              <a>
                                  <xsl:attribute name="href">
                                      <xsl:value-of select="concat('http://software.topcoder.com/catalog/c_component.jsp?comp=', ./component_id)"/>
                                  </xsl:attribute><xsl:value-of select="./component_name"/>
                              </a>
                          </td>
                         <td class="projectCells" align="center"><xsl:value-of select="./place"/></td>
                         <td class="projectCells">
                             <a>
                                 <xsl:attribute name="href">tc?module=MemberProfile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                                 <xsl:attribute name="class"><xsl:call-template name="GetRatingClassDark"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template></xsl:attribute>
                                 <xsl:value-of select="user_id"/>
                             </a>
                         </td>
                         <td class="projectCells" align="center"><xsl:value-of select="./score"/></td>
                         <td class="projectCells" align="right"><xsl:value-of select="format-number(./money, $priceFormat)"/></td>
                     </tr>
                   </xsl:if>
                </xsl:for-each>


            </table>
<!-- Development Winners Ends -->

        <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

