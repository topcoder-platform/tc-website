<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>  
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/stats_intro.xsl"/>  
    <xsl:import href="../includes/global_left.xsl"/> 
    <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

    <xsl:call-template name="Preload"/>      

<title>Application Documentation for TopCoder Software Development</title>

    <xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<BODY>

<!-- Header Begins -->
    <xsl:call-template name="Top"/>
<!-- Header Begins -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">applications</xsl:with-param>
                <xsl:with-param name="level3">app_sample_docs</xsl:with-param>
            </xsl:call-template>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15" valign="top"><img src="/i/clear.gif" width="15" height="5" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%" valign="top">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">development</xsl:with-param>
                <xsl:with-param name="title">&#160;Application Documentation</xsl:with-param>
            </xsl:call-template>
                
            <img src="/i/clear.gif" alt="" width="240" height="20" border="0"/><br />
                            
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle"><td bgcolor="#999999" class="registerNav" colspan="3"><font size="3">Application Documentation</font></td></tr>
                                
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="49%" height="18">Description</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="5" height="18"><img src="/i/clear.gif" alt="" height="1" width="5" border="0" /></td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="59%" height="18">Modified&#160;&#160;&#160;&#160;&#160; Download File</td>
                </tr>
                                
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>Design Deliverables</strong><br />
                        This document provides an overview of the design process including the deliverables required of a complete submission and the responsibilities of a winning designer.  The Application Design Review Board will not review submissions that do not meet the screening requirements.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">07.15.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Application_Design_Deliverables.pdf" class="bodyText">Application Design Deliverables.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Application_Design_Specification.rtf" class="bodyText">Application Design Specification.rtf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                            
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                     <td class="bodyText" height="15" valign="top"><strong>Screening and Review Scorecards</strong><br />
                        The screening and review scorecards are completed by the Application Design Review Boards to score 
                        application submissions.  All members who submit a design or development solution will receive the 
                        populated scorecards from the review boards.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">08.28.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/App_Design_Screening_Scorecard.rtf" class="bodyText">Design Screening Scorecard.rtf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">08.28.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/App_Design_Review_Scorecard.rtf" class="bodyText">Design Review Scorecard.rtf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">08.28.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/App_Design_Review_Overall.rtf" class="bodyText">Design Review Overall Scorecard.rtf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">08.26.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/App_Dev_Review_Scorecard.dot" class="bodyText">Development Review Scorecard.dot</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                            
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" height="15" valign="top"><strong>Development Deliverables</strong><br />
                        This document provides an overview of the development process including the deliverables required for
                        submission. The Application Development Review Board will not review submissions that do not meet the screening requirements.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">05.20.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Developer_Application_Deliverables.pdf" class="bodyText">Development Deliverables.pdf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
            </table>

            <p>For more information about Application deliverables see the <a href="/?&amp;t=development&amp;c=app_meth" class="bodyText">TopCoder Application Methodology.</a></p><br />
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer begins -->
    <xsl:call-template name="Foot" />
<!-- Footer ends -->

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>
