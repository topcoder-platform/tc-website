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

<body>
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
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td colspan="3"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

<!-- Royalty Payments Begins -->
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="captionText" width="49%"><img src="/i/development/royalty_payments.gif" alt="Royalty Payments" width="276" height="49" border="0" /><br />
                        We're proud to announce our first round of royalty payments totaling $3500. The TopCoder members to the right 
                        developed the components that make up the <a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=600191" class="statText">Rules Engine Tool.</a> 
                        Inquire about <a href="?t=development&amp;c=comp_projects" class="statText">open projects</a> so you can earn royalties too.</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td width="49%">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr valign="middle">
                                <td width="10" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="2">Royalties Paid</td>
                                <td width="10" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr>
                                <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" height="18">Developer&#160;</td>
                                <td width="1%" background="/i/steel_bluebv_bg.gif" class="statText" height="18" align="right">&#160;Total&#160;Royalties</td>
                                <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=265522" class="coderTextBlue"><strong>veredox</strong></a></td>
                                <td class="statText" height="15" align="right">$1,708.07&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=119676" class="coderTextBlue"><strong>Pops</strong></a></td>
                                <td class="statText" height="15" align="right">$1,111.17&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=271008" class="coderTextBlue"><strong>ilya</strong></a></td>
                                <td class="statText" height="15" align="right">$283.65&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=136367" class="coderTextYellow"><strong>timurz</strong></a></td>
                                <td class="statText" height="15" align="right">$133.19&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=260578" class="coderTextGreen"><strong>danno</strong></a></td>
                                <td class="statText" height="15" align="right">$74.00&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
 
                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=142986" class="coderTextGreen"><strong>dcros</strong></a></td>
                                <td class="statText" height="15" align="right">$55.50&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=150498" class="coderTextYellow"><strong>ThinMan</strong></a></td>
                                <td class="statText" height="15" align="right">$55.50&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=267275" class="coderTextYellow"><strong>magead7</strong></a></td>
                                <td class="statText" height="15" align="right">$49.33&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=128873" class="coderTextBlue"><strong>DEBEDb</strong></a></td>
                                <td class="statText" height="15" align="right">$29.60&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
                        </table>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                <tr><td height="10" colspan="5"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
            </table>
<!-- Royalty Payments Ends -->

<!-- Featured Winner Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" width="100%" colspan="4"><strong><img src="/i/development/title_weekly_comp_winners.gif" alt="This Week's Component Project Winners" width="346" height="26" border="0" /></strong></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="4">&#160;&#160;Featured Winner</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td colspan="4">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                            <tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>Coder: </strong><span class="statText"><a href="/stat?c=member_profile&amp;cr=261822" class="coderTextGreen"><strong>bodrius</strong></a></span></td></tr>

                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                            <tr valign="top">
<!--                                <td class="statText" rowspan="5" width="55"><a href="/stat?c=member_profile&amp;cr=136305" class="coderTextGray"><img src="/i/m/KurtSteinkraus_small.jpg" alt="KurtSteinkraus" width="55" height="61" border="0" hspace="5" vspace="5" /></a></td>  -->
                                <td class="statText" rowspan="5" width="5"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                                <td class="statText" width="65%">Developer Level:</td>
                                <td class="statText" align="right" width="10%">I</td>
                                <td class="statText" width="25%"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Rating:</td>
                                <td class="statText" align="right">936</td>
                                <td class="statText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=261822" class="statText">[ ratings history ]</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Total Earnings for All Component Projects*:</td>
                                <td class="statText" align="right">$280.00</td>
                                <td class="statText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Review Board Score for this Project:</td>
                                <td class="statText" align="right">90.06</td>
                                <td class="statText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Total Submissions for this Project:</td>
                                <td class="statText" align="right">1</td>
                                <td class="statText"></td>
                            </tr>
                        </table>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="middle">
                    <td class="statText">
                        <p><strong>Lexical Analyzer</strong><br />
                        Parses a data source according to a specified set of rules. For more details, check out <a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=5703741" class="statText">Lexical Analyzer</a> on the TopCoder Software web site.</p>
                        
                        <p><strong>Review Board Comments</strong><br />
                        "Very comprehensive - I can tell a lot of thought and effort went into this one."
                        <a href="/stat?c=member_profile&amp;cr=260578" class="coderTextGreen">&#160;&#151;danno</a></p></td>
                </tr>
            </table>

    <!-- Featured Winner Ends -->

    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Design Winners</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="32%" height="18">&#160;&#160;Project Name</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="19%" height="18" align="center">&#160;Total&#160;Submissions&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="19" height="18">Winner&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=4312547" class="statText">API Version Compatibility</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=156618" class="coderTextBlue"><strong>Mckavity</strong></a></td>
                    <td class="statText" height="15" align="center">79.35</td>
                    <td class="statText" height="15" align="right">$210.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=5501523" class="statText">Generic Parser</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=287614" class="coderTextGreen"><strong>argolite</strong></a></td>
                    <td class="statText" height="15" align="center">86.11</td>
                    <td class="statText" height="15" align="right">$805.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=5703741" class="statText">Lexical Analyzer</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=261822" class="coderTextGreen"><strong>bodrius</strong></a></td>
                    <td class="statText" height="15" align="center">90.6</td>
                    <td class="statText" height="15" align="right">$280.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=3501804" class="statText">Magic Numbers</a></td>
                    <td class="statText" height="15" align="center">2</td>
                    <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=294463" class="coderTextGreen"><strong>theMADscientist</strong></a></td>
                    <td class="statText" height="15" align="center">85.05</td>
                    <td class="statText" height="15" align="right">$210.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=4228038" class="statText">Unit Converter</a></td>
                    <td class="statText" height="15" align="center">2</td>
                    <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=299180" class="coderTextGray"><strong>isv</strong></a></td>
                    <td class="statText" height="15" align="center">88.96</td>
                    <td class="statText" height="15" align="right">$1260.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="10" colspan="7"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
<!-- Design Winners Ends -->
                
<!-- Development Winners Begins -->
                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Development Winners</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="32%" height="18">&#160;&#160;Project Name</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="19%" height="18" align="center">&#160;Total&#160;Submissions&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="19" height="18">Winner&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=2804505" class="statText">Simple Cache</a></td>
                    <td class="statText" height="15" align="center">5</td>
                        <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=286907" class="coderTextRed"><strong>Wishingbone</strong></a></td>
                    <td class="statText" height="15" align="center">95.83</td>
                    <td class="statText" height="15" align="right">$336.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="10" colspan="7"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statTextSmall" height="18" colspan="5">&#160;&#160;* Total Earnings for all Component Projects (before royalties)<br />&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>
            </table>
<!-- Development Winners Ends -->

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>    
    
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
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

