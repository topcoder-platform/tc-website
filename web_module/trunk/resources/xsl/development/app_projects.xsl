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

 <title>TopCoder | Development</title>

    <xsl:call-template name="CSS" />      

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
            <xsl:with-param name="title">&#160;Application Development</xsl:with-param>
            </xsl:call-template>
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="3" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="3" ><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                    <td class="statText" colspan="6">There are also <a class="statText" href="/index?t=development&amp;c=comp_projects">Component Projects</a> available.</td>
                    <td width="3" ><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="3" ><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                    <td class="statText" colspan="6"><h1 class="devSubhead">Open Application Projects</h1></td>
                    <td width="3" ><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="3"><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                    <td width="1" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
                    <td width="32%" background="/i/steel_bluebv_bg.gif" class="statText" nowrap="nowrap">Project</td>
                    <td width="19%" background="/i/steel_bluebv_bg.gif" class="statText" align="center" nowrap="nowrap">Winning Designer</td>
                    <td width="19%" background="/i/steel_bluebv_bg.gif" class="statText" align="center" nowrap="nowrap">Second Place</td>
                    <td width="15%" background="/i/steel_bluebv_bg.gif" class="statText" align="center" nowrap="nowrap">Specification Due</td>
                    <td width="15%" background="/i/steel_bluebv_bg.gif" class="statText" align="center" nowrap="nowrap">Design Due</td>
                    <td width="3" ><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td width="3"><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                    <td width="1" ><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
                    <td class="statText"><a class="statText" href="/index?t=development&amp;c=online_review&amp;t=app">Online Review</a></td>
                    <td class="statText" align="center">$1,500.00</td>
                    <td class="statText" align="center">$225.00</td>
                    <td class="statText" align="center">03.05.2003</td>
                    <td class="statText" align="center">03.10.2003</td>
                    <td width="3" ><img src="/i/clear.gif" width="3" height="1" alt="" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td height="10"><img src="/i/clear.gif" alt="" width="10" height="300" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" valign="top"><img src="/i/clear.gif" width="244" height="1" alt="" border="0" /><br/>
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

