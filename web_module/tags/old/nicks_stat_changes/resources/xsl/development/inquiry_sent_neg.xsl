<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
    <xsl:import href="../includes/global_left.xsl"/> 
    <xsl:import href="../includes/dev/public_dev_right.xsl"/>   
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

<title>Inquire about the <xsl:value-of select="/TC/DEVELOPMENT/Project"/> project at TopCoder Software Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top" />

<table width="100%" xborder="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="8" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">development</xsl:with-param>
                <xsl:with-param name="title">&#160;Inquiry</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="10" width="100%"><img src="/i/clear.gif" width="10" height="10" alt="" border="0" /><br />
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p><strong>Thank you, <xsl:value-of select="/TC/DEVELOPMENT/handle"/>, for your inquiry.</strong></p>
                        
                        <p>Unfortunately, you are not yet a rated TopCoder member. You can get rated by participating in our Coding Competitions. Please check the current schedule for details regarding upcoming matches. To view other components and discuss component ideas with other members, visit <a href="http://software.topcoder.com">TopCoder Software</a>. Your TopCoder handle and password will give you access to post questions or comments on the <a href="http://software.topcoder.com/forum/c_active_collab.jsp">Customer Forums</a>.</p>
                        
                        <p>If you have any problems please contact <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a></p>

                        <p><br /></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer begins -->
        <xsl:call-template name="Foot" />
<!-- Footer ends -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

