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
    <xsl:template name="formatmmddyyyy">
        <xsl:param name="DATE"/>
        <xsl:if test='boolean($DATE)'>
            <xsl:value-of select="substring($DATE, 6,2)"/>.<xsl:value-of select="substring($DATE, 9,2)"/>.<xsl:value-of select="substring($DATE, 1,4)"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="urldate">
        <!--MM&#47;DD&#47;YYYY-->
        <xsl:param name="DATE"/>
        <xsl:if test='boolean($DATE)'>
            <xsl:value-of select="substring($DATE, 6,2)"/>%2e<xsl:value-of select="substring($DATE, 9,2)"/>%2e<xsl:value-of select="substring($DATE, 1,4)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/">

<html>
<head>
    <xsl:call-template name="Preload" />

 <title>TopCoder | Development</title>

    <xsl:call-template name="CSS" />

<style type="text/css">

#totalMoney {
    font: bold 130%;
    color: #FFF;
    }

</style>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">steelblue</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr valign="top">
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#001B35" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#001B35" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#001B35" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" background="/i/steel_darkblue_bg.gif" bgcolor="#001B35" width="100%">

                <tr><td colspan="7" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="1" border="0" /></td>
                    <td class="statText" colspan="9">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet 
                        dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit 
                        lobortis nisl ut aliquip ex ea commodo consequat.</p>
                    </td>
                        <td background="" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="7" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

                
<!-- Component Design Projects begin -->

                <tr>
                    <td background="" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="1" border="0" /></td>
                    <td class="statText" colspan="5"><a name="design"></a><h1 class="devSubhead">Component Design Project Status</h1></td>
                    <td background="" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="2" class="statText" align="center"><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="40%" class="statText">Design Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Initial<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Review<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Final<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Design<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
                </tr>

				<tr>
					<td><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
					<td background="" class="statText">Project Title</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
				</tr>                 
               

                <tr><td colspan="7" background=""><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>


<!-- Component Design Projects ends -->



<!-- Component Dev Projects begin -->


 				<tr>
                    <td background="" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="1" border="0" /></td>
                    <td class="statText" colspan="55"><a name="design"></a><h1 class="devSubhead">Component Development Project Status</h1></td>
                    <td background="" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="2" class="statText" align="center"><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="30%" class="statText">Development Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Initial<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Review<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Final<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Design<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="2" class="statText"><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
                </tr>

				<tr>
					<td><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
					<td background="" class="statText">Project Title</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td background="" class="statText" align="center">00.00.00</td>
					<td><img src="/i/clear.gif" alt="" width="2" height="18" border="0" /></td>
				</tr>                 
               

                <tr><td colspan="7" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>


            </table>
            
<!-- Component Dev Projects ends -->

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="15" border="0" /></td>
                </tr>    
    
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right"><xsl:with-param name="projects" select="."/></xsl:call-template>
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

