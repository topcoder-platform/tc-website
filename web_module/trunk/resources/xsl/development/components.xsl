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
        <td width="180">
            <xsl:call-template name="global_left"/>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td colspan="3"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
<!-- 
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="captionText" width="49%"><img src="/i/development/royalty_payments.gif" alt="Royalty Payments" width="276" height="49" border="0" /><br />
                        We're proud to announce our first round of royalty payments totaling $3500. The TopCoder members to the right 
                        developed the components that make up the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=600191" class="bodyText">Rules Engine Tool.</a> 
                        Inquire about <a href="?t=development&amp;c=comp_projects" class="bodyText">open projects</a> so you can earn royalties too.</td>
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
                                <td background="/i/steel_bluebv_bg.gif" class="bodyText" height="18">Developer&#160;</td>
                                <td width="1%" background="/i/steel_bluebv_bg.gif" class="bodyText" height="18" align="right">&#160;Total&#160;Royalties</td>
                                <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=265522" class="coderTextBlue"><strong>veredox</strong></a></td>
                                <td class="bodyText" height="15" align="right">$1,708.07&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=119676" class="coderTextBlue"><strong>Pops</strong></a></td>
                                <td class="bodyText" height="15" align="right">$1,111.17&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=271008" class="coderTextBlue"><strong>ilya</strong></a></td>
                                <td class="bodyText" height="15" align="right">$283.65&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=136367" class="coderTextYellow"><strong>timurz</strong></a></td>
                                <td class="bodyText" height="15" align="right">$133.19&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=260578" class="coderTextGreen"><strong>danno</strong></a></td>
                                <td class="bodyText" height="15" align="right">$74.00&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
 
                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=142986" class="coderTextGreen"><strong>dcros</strong></a></td>
                                <td class="bodyText" height="15" align="right">$55.50&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=150498" class="coderTextYellow"><strong>ThinMan</strong></a></td>
                                <td class="bodyText" height="15" align="right">$55.50&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=267275" class="coderTextYellow"><strong>magead7</strong></a></td>
                                <td class="bodyText" height="15" align="right">$49.33&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="bodyText" height="15"><a href="/stat?c=member_profile&amp;cr=128873" class="coderTextBlue"><strong>DEBEDb</strong></a></td>
                                <td class="bodyText" height="15" align="right">$29.60&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
                        </table>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                -->
                <tr><td height="10" colspan="5"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
            </table>

<!-- Featured Winner Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" width="100%" colspan="4"><strong><img src="/i/development/title_weekly_comp_winners.gif" alt="This Week's Component Project Winners" width="346" height="26" border="0" /></strong></td>
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
                            
                           <!-- <tr valign="top"><td class="bodyText" colspan="4">&#160;&#160;<strong>1st Place</strong></td></tr>-->

                            <tr valign="top"><td class="bodyText" colspan="4">&#160;&#160;<strong>Coder: <span class="bodyText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><strong>zimmy</strong></a></span></strong></td></tr>

                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                            <tr valign="top">
<!--                        <td class="bodyText" rowspan="5" width="55"><a href="/stat?c=member_profile&amp;cr=264803" class="coderTextRed"><img src="/i/m/mishagam_big.jpg" alt="None" width="62" height="70" border="0" hspace="5" vspace="5" /></a></td>-->
                                <td class="bodyText" rowspan="5" width="5"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                                <td class="bodyText" width="65%">Developer Level:</td>
                                <td class="bodyText" align="right" width="10%">II</td>
                                <td class="bodyText" width="25%"></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Rating:</td>
                                <td class="bodyText" align="right">1373</td>
                                <td class="bodyText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=264803" class="bodyText">[ ratings history ]</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Total Earnings for All Component Projects*:</td>
                                <td class="bodyText" align="right">$72.00</td>
                                <td class="bodyText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Review Board Score for this Project:</td>
                                <td class="bodyText" align="right">95.22</td>
                                <td class="bodyText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Total Submissions for this Project:</td>
                                <td class="bodyText" align="right">2</td>
                                <td class="bodyText"></td>
                            </tr>
                            
                            
                            
                           <!--
                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
                            
                            <tr valign="top"><td class="bodyText" colspan="4">&#160;&#160;<strong>2nd Place</strong></td></tr>

                            <tr valign="top"><td class="bodyText" colspan="4">&#160;&#160;<strong>Coder: <span class="bodyText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294570">Saxophonist</a></span></strong></td></tr>

                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                            <tr valign="top">
                                <td class="bodyText" rowspan="5" width="55"><a href="/stat?c=member_profile&amp;cr=296145" class="coderTextYellow"><img src="/i/m/srowen_small.jpg" alt="srowen" width="55" height="61" border="0" hspace="5" vspace="5" /></a></td>
                                <td class="bodyText" rowspan="5" width="5"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                                <td class="bodyText" width="65%">Designer Level:</td>
                                <td class="bodyText" align="right" width="10%">I</td>
                                <td class="bodyText" width="25%"></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Rating:</td>
                                <td class="bodyText" align="right">1349</td>
                                <td class="bodyText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=294570" class="bodyText">[ ratings history ]</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Total Earnings for All Component Projects*:</td>
                                <td class="bodyText" align="right">$420.00</td>
                                <td class="bodyText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Review Board Score for this Project:</td>
                                <td class="bodyText" align="right">82.03</td>
                                <td class="bodyText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="bodyText">Total Submissions for this Project:</td>
                                <td class="bodyText" align="right">2</td>
                                <td class="bodyText"></td>
                            </tr>-->
                            
                        </table>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="middle">
                    <td class="bodyText">
                        <p><strong>Data Validation</strong><br />
                        Analyzes objects to verify the content meets defined rules.  Check out <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220290" target="parent" class="bodyText">Data Validation</a> on the TopCoder Software web site.</p>


                        
                        <p><strong>Review Board Comments</strong><br />
                        "All classes are implemented properly.  Good implementation ..."
                        <a href="/stat?c=member_profile&amp;cr=278342" class="coderTextYellow">&#160;&#151;adic</a></p></td>
                </tr>
            </table>

    <!-- Featured Winner Ends -->

    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Design Winners</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="25%" height="18">&#160;&#160;Project Name</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="15%" height="18" align="center">&#160;Total&#160;Submissions&#160;&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="30%" height="18">Winner(s)&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="14%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;<a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7338647" class="bodyText" target="parent">Bar Graph</a></td>
                    <td class="bodyText" height="15" align="center">1</td>
                    <td class="bodyText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261390"><strong>Sharakan</strong></a></td>
                    <td class="bodyText" height="15" align="center">89.25</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;<a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5711016" class="bodyText" target="parent">SQL Parser</a></td>
                    <td class="bodyText" height="15" align="center">2</td>
                    <td class="bodyText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a></td>
                    <td class="bodyText" height="15" align="center">83.70</td>
                    <td class="bodyText" height="15" align="right">$634.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;</td>
                    <td class="bodyText" height="15" align="center">&#160;</td>
                    <td class="bodyText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="bodyText" height="15" align="center">83.64</td>
                    <td class="bodyText" height="15" align="right">$1,209.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;<a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7361823" class="bodyText" target="parent">Type Safe Enum</a></td>
                    <td class="bodyText" height="15" align="center">2</td>
                    <td class="bodyText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="bodyText" height="15" align="center">88.80</td>
                    <td class="bodyText" height="15" align="right">$4,601.60&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;</td>
                    <td class="bodyText" height="15" align="center">&#160;</td>
                    <td class="bodyText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261390"><strong>Sharakan</strong></a></td>
                    <td class="bodyText" height="15" align="center">81.35</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Development Winners</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="25%" height="18">&#160;&#160;Project Name</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="15%" height="18" align="center">&#160;Total&#160;Submissions&#160;&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="30%" height="18">Winner(s)&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="bodyText" width="14%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;<a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220290" class="bodyText" target="parent">Data Validation</a></td>
                    <td class="bodyText" height="15" align="center">3</td>
                    <td class="bodyText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><strong>zimmy</strong></a></td>
                    <td class="bodyText" height="15" align="center">95.22</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;</td>
                    <td class="bodyText" height="15" align="center"></td>
                    <td class="bodyText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288429"><strong>jfjiang</strong></a></td>
                    <td class="bodyText" height="15" align="center">90.44</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;</td>
                    <td class="bodyText" height="15" align="center"></td>
                    <td class="bodyText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=343613"><strong>phark4evr</strong></a></td>
                    <td class="bodyText" height="15" align="center">80.70</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;<a href="http://software.topcoder.com/catalog/c_component.jsp?comp=2810520" class="bodyText" target="parent">Encryption</a></td>
                    <td class="bodyText" height="15" align="center">2</td>
                    <td class="bodyText" height="15"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=153089"><strong>preben</strong></a></td>
                    <td class="bodyText" height="15" align="center">90.74</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;</td>
                    <td class="bodyText" height="15" align="center"></td>
                    <td class="bodyText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786"><strong>Yi_Zhang</strong></a></td>
                    <td class="bodyText" height="15" align="center">86.69</td>
                    <td class="bodyText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;<a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7297246" class="bodyText" target="parent">Phonetic Spell Check</a></td>
                    <td class="bodyText" height="15" align="center">2</td>
                    <td class="bodyText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=301504"><strong>opi</strong></a></td>
                    <td class="bodyText" height="15" align="center">98.96</td>
                    <td class="bodyText" height="15" align="right">$144.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="bodyText" height="15">&#160;&#160;</td>
                    <td class="bodyText" height="15" align="center"></td>
                    <td class="bodyText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><strong>zimmy</strong></a></td>
                    <td class="bodyText" height="15" align="center">92.53</td>
                    <td class="bodyText" height="15" align="right">$72.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>



               
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="20" border="0" /></td></tr>
            </table>
<!-- Development Winners Ends -->
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

