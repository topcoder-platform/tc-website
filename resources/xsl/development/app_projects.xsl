<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />
  <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/public_dev_right.xsl" />
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />

 <title>Open Application Projects for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">applications</xsl:with-param>
                <xsl:with-param name="level3">app_projects</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="1"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Applications</xsl:with-param>
            </xsl:call-template>

            <img src="/i/clear.gif" alt="" width="240" height="10" border="0" />

            <p>There are also <A href="/index?t=development&amp;c=comp_projects">Component Projects</A> available.</p>

            <table border="0" cellspacing="0" cellpadding="5" width="100%">
                <tr valign="middle"><td bgcolor="#999999" class="statText" colspan="4"><font size="3"><strong>Open Application Design Projects</strong></font></td></tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" nowrap="nowrap">Project</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center" nowrap="nowrap">Winning Designer</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center" nowrap="nowrap">Second Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center" nowrap="nowrap">Inquire By</td>
                </tr>

                <!--
                <tr valign="top">
                    <td align="center" colspan="4" class="formTextOdd">No New Projects Available</td>
                </tr>
                -->


                <tr valign="top">
                    <td class="formTextOdd" colspan="4"><a href="?&amp;t=development&amp;c=single_sign_on_v10_des">Single Sign-On (SSO)</a></td>
                 </tr>
                <tr valign="top">
                    <td class="formTextOdd">&#160;&#160;&#160;&#160;Security Server</td>
                    <td class="formTextOdd" align="center">$3,306</td>
                    <td class="formTextOdd" align="center">$1,005</td>
                    <td class="formTextOdd" align="center">closed</td>
                </tr>

                <tr valign="top">
                    <td class="formTextOdd">&#160;&#160;&#160;&#160;Application Authentication</td>
                    <td class="formTextOdd" align="center">$2,826</td>
                    <td class="formTextOdd" align="center">$855</td>
                    <td class="formTextOdd" align="center">closed</td>
                </tr>

		<tr valign="top">
                    <td class="formTextOdd"><a href="?&amp;t=development&amp;c=online_gift_card_v10_des">Online Gift Card Sales</a></td>
                    <td class="formTextOdd" align="center">$810</td>
                    <td class="formTextOdd" align="center">$225</td>
                    <td class="formTextOdd" align="center">12.03.03</td>
                </tr>

                <tr valign="top">
                    <td class="formTextOdd"><a href="?&amp;t=development&amp;c=email_tool_enhancements">Email Tool Enhancements</a></td>
                    <td class="formTextOdd" align="center">$1,290</td>
                    <td class="formTextOdd" align="center">$420</td>
                    <td class="formTextOdd" align="center">closed</td>
                </tr>

             </table>

            <br/>

            <table border="0" cellspacing="0" cellpadding="5" width="100%">
                <tr valign="middle"><td bgcolor="#999999" class="statText" colspan="4"><font size="3"><strong>Open Application Development Projects</strong></font></td></tr>



                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" nowrap="nowrap">Project</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center" nowrap="nowrap">Winning Developer</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center" nowrap="nowrap">Second Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center" nowrap="nowrap">Inquire By</td>
                </tr>

                <!--
                <tr valign="top">
                    <td align="center" colspan="4" class="formTextOdd">No New Projects Available</td>
                </tr>
                -->
                <tr valign="top">
                    <td class="formTextOdd"><a href="?&amp;t=development&amp;c=admin_tool_enhancements_dev">Admin Tool Enhancements</a></td>
                    <td class="formTextOdd" align="center">$2,200</td>
                    <td class="formTextOdd" align="center">$665</td>
                    <td class="formTextOdd" align="center">closed</td>
                </tr>


                <!--
                <tr valign="top">
                    <td class="bodyText"><a href="?&amp;t=development&amp;c=online_review_dev-bl">Online Review Business Logic</a></td>
                    <td class="bodyText" align="center">$2,400</td>
                    <td class="bodyText" align="center">$900</td>
                    <td class="bodyText" align="center">5.27.2003</td>
                </tr>

                <tr valign="top">
                    <td class="bodyText"><a href="?&amp;t=development&amp;c=online_review_dev-pl">Online Review Persistence Layer</a></td>
                    <td class="bodyText" align="center">$2,400</td>
                    <td class="bodyText" align="center">$900</td>
                    <td class="bodyText" align="center">5.27.2003</td>
                </tr>
                -->

            </table>

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

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>

