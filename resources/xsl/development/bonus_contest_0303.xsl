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

 <title>TopCoder &#160;|&#160; Development</title>

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
        <td width="4"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
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
                    <td height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="5" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <div align="center">
                            <p><img src="/i/development/bonusContestGraphic.gif" alt="TopCoder Software Development Bonus Contest" width="555" height="84" border="0" /></p>
                        </div></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <strong>As a TopCoder member you can earn cash, royalties, recognition... AND a $2,000 cash bonus!</strong>

                        <p>The TopCoder member with the highest average Architecture Review Board score for design submissions 
                        during February and March will win a $2,000** cash bonus on top of the regular payment and royalties for each winning design solution.
                        </p>
                        
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Qualifying Contest Entries*</h1></td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="50%" class="statText">Handle</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Submissions</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Average Score</td>
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=155381">djFD</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">97.50</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">96.30</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=287614">srowen</a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">94.84</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754">ThinMan</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">89.64</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=281975">argolite</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">84.05</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=136305">Ken Vogel</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">83.94</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=297731">keithnigh</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">82.55</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=157174">HuskerFan</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">82.48</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=277356">TheCois</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">81.33</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260172">aksonov</a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">80.49</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=263386">Preetham</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">79.62</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263386">Darrell_L_77</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">67.21</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=343287">ddwsdl</a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">66.90</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=343287">kameshjayaram</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">65.70</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=343287">FTolToaster</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">65.06</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=343287">cdummy</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">63.26</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>



                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3">* There are still outstanding entries being screened. All qualifying entries will be posted as they become available.</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><strong>It's easy to enter</strong><br />
<!--
                        Just submit designs that pass screening for a minimum of four Component Projects whose initial submission dates are 
                        between February 1, 2003 and March 31, 2003. You will be entered automatically. No need to fill out any 
                        forms or notify us.
-->                        
                        <br/>
                        Just submit designs that pass screening for a minimum of four Component Design Projects whose initial submission dates are between February 1, 2003 and March 31, 2003. To pass screening, a design submission must score in the top 5 for that component and meet the minimum requirements of the screening scorecard.  All submissions that pass screening will be entered into the contest. The design submission with the highest review board score greater than or equal to 75 will be declared the component design winner for that project.   
                        </p>

                        <p>Get started today... There are plenty of <a class="statText" href="index?t=development&amp;c=comp_projects">available projects</a> for you to choose from.</p>

                        <p>Not sure what to submit? See our <a class="statText" href="index?t=development&amp;c=tcs_sample_docs">sample design solution</a> for ideas.</p>
                        
                        <p>What is the screening process? Read our <a class="statText" href="index?t=development&amp;c=comp_meth">methodology</a> to find out.</p>
                        
                        <p>&#160;</p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><strong>Design and Development Terms</strong><br />
                        By indicating your interest in designing or developing a component for TopCoder, you represent to TopCoder the following:</p>

                        <ol>
                            <li>You are a rated TopCoder member</li>
                            <li>You are at least 18 years of age</li>
                            <li>You are either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee, or 
                            have a lawfully issued work authorization card permitting unrestricted employment, or (iv) a non-U.S. citizen working in your 
                            country of residence.</li>
                        </ol>
                        
                        <p>Read the full <a class="statText" href="/?t=&amp;c=terms">Terms and Conditions</a></p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><br /></p>
                        
                        <p>** Some members may be subject to applicable taxes.</p>
                        
                        <p><br /></p>
                    </td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
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
        <td width="1"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
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

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

