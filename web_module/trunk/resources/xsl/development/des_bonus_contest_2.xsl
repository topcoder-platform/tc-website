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

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#001B35">
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
            <xsl:with-param name="image1">steelblue</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <div align="center"><img src="/i/development/header_des_bonus_contest2.gif" alt="TopCoder Software Component Design Bonus Contest 2" width="554" height="107" border="0" /></div>
                    </td>
                </tr>
            </table>

<!-- Comment out until final winner is known
            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <div align="center"><img src="/i/development/bonusContestGraphic.gif" alt="TopCoder Software Development Bonus Contest" width="470" height="59" border="0" /></div>
                        
                        <p><strong>With an average score of 93.09 on 5 submissions, Pops beat out 40 other TopCoder members to take the top spot... and the $2000 bonus.</strong></p>

                        <p>In addition, Pops has earned $1120 for his winning designs, as well as royalty payments. These are the projects for which Pops submitted winning design solutions:</p>
                        
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td background="/i/steel_bluebv_bg.gif" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td background="/i/steel_bluebv_bg.gif" width="150" class="statText">Project</td>
                                <td background="/i/steel_bluebv_bg.gif" width="80" class="statText" align="center">Submissions</td>
                                <td background="/i/steel_bluebv_bg.gif" width="80" class="statText" align="center">Score</td>
                                <td background="/i/steel_bluebv_bg.gif" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>
                
                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/pages/c_component.jsp?comp=6508770" target="_blank">Bag Collection</a></td>
                                <td class="statText" align="center">3</td>
                                <td class="statText" align="center">95.14</td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/pages/c_component.jsp?comp=3304122" target="_blank">Chat Server</a></td>
                                <td class="statText" align="center">1</td>
                                <td class="statText" align="center">95.00</td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <p>Thank you to everyone who submitted entries for our February/March Component Design Contest. Stay tuned for our next Bonus Contest coming up soon!</p>
                    </td>
                </tr>
            </table> -->

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3">

                <tr>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Qualifying Contest Entries</h1></td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="150" class="statText">Handle</td>
                    <td background="/i/steel_bluebv_bg.gif" width="80" class="statText" align="center">Submissions</td>
                    <td background="/i/steel_bluebv_bg.gif" width="80" class="statText" align="center">Average Score</td>
                    <td background="/i/steel_bluebv_bg.gif" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">98.75</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180"><strong>isv</strong></a></td>
                    <td class="statText" align="center">3</td>
                    <td class="statText" align="center">91.60</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">90.83</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                  <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546"><strong>TangentZ</strong></a></td>
                    <td class="statText" align="center">4</td>
                    <td class="statText" align="center">89.80</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
 
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278342"><strong>adic</strong></a></td>
                    <td class="statText" align="center">3</td>
                    <td class="statText" align="center">89.69</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                               
                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907"><strong>WishingBone</strong></a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">89.26</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><strong>Tomson</strong></a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">86.77</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a></td>
                    <td class="statText" align="center">3</td>
                    <td class="statText" align="center">84.42</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294570"><strong>Saxophonist</strong></a></td>
                    <td class="statText" align="center">3</td>
                    <td class="statText" align="center">83.58</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">80.96</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                  <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=279471"><strong>haha</strong></a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">80.58</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                                
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=302729"><strong>kislookhin</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">80.49</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289824"><strong>MPhk</strong></a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">77.70</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297731"><strong>TheCois</strong></a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">76.33</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">73.28</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=280167"><strong>ttsuchi</strong></a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="center">71.81</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=292290"><strong>CagedRat</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">64.75</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=300150"><strong>Mikhail_T</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">57.80</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr>
                    <td colspan="5"><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /></td>
                </tr>
                
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                    
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <strong><ul>
                            <li>You must submit at least five designs that pass our screening process to qualify.</li>
                            <li>Winning design submissions for each component project still qualify for regular payment and royalties.</li>
                            <li>First place will receive $3,000.</li>
                            <li>Second place will receive $2,000.</li>
                            <li>Third place will receive $1,000.</li>
                        </ul>
                        
                        <p>Get started today... There are plenty of <a class="statText" href="index?t=development&amp;c=comp_projects">available projects</a> for you to choose from.</p></strong>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><font size="3"><strong>Contest Requirements</strong></font><br />
                        Submit a minimum of five designs that pass screening for TopCoder Component Design Projects whose initial submission 
                        dates are between April 10, 2003 and June 25, 2003. To pass screening, a design submission must score in the top 5 for 
                        that component and meet the minimum requirements of the screening scorecard. All submissions that pass screening will 
                        be entered into the contest. <strong>Only your 5 highest-scoring submissions count towards your average score. </strong>
                        The TopCoder members with the 3 highest average scores will be declared the first, second and third place winners, 
                        respectively.</p>

                        <p>Not sure what to submit? See our <a class="statText" href="index?t=development&amp;c=tcs_sample_docs">sample design solution</a> for ideas.</p>
                        
                        <p>What is the screening process? Read our <a class="statText" href="index?t=development&amp;c=comp_meth">methodology</a> to find out.</p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><font size="3"><strong>Design and Development Terms</strong></font><br />
                        By indicating your interest in designing or developing a component for TopCoder, you represent to TopCoder the following:</p>

                        <ol>
                            <li>You are a rated TopCoder member</li>
                            <li>You are at least 18 years of age</li>
                            <li>You are either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee, or 
                            have a lawfully issued work authorization card permitting unrestricted employment, or (iv) a non-U.S. citizen working in your 
                            country of residence.</li>
                        </ol>
                        
                        <p>TopCoder reserves the right to change the Contest Requirements, Design and Development Terms, and Component 
                        Methodology at any time. For more information read the full <a class="statText" href="/?t=&amp;c=terms">Terms and Conditions</a></p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><br /></p>
                        
                        <p>** Some members may be subject to applicable taxes.</p>
                        
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" bgcolor="#001B35">
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

