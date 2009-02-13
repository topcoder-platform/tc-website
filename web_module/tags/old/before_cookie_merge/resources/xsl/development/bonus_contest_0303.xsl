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

 <title>Component Design Contest for TopCoder Software Development</title>

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
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">contests</xsl:with-param>
                <xsl:with-param name="level3">bonus_contest_0303</xsl:with-param>
            </xsl:call-template>
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
            <xsl:with-param name="title">&#160;Contests</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <div align="center"><img src="/i/development/bonusContestGraphic.gif" alt="TopCoder Software Development Bonus Contest" width="470" height="59" border="0" /></div>
                        
                        <p><strong>With an average score of 93.09 on 5 submissions, Pops beat out 40 other TopCoder members to take the top spot... and the $2000 bonus.</strong></p>

                        <p>In addition, Pops has earned $1120 for his winning designs, as well as royalty payments. These are the projects for which Pops submitted winning design solutions:</p>
                        
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="5" width="300" class="formFrame">
                            <tr valign="middle">
                                <td background="/i/graybv_bg.gif" class="StatTextLarge">Project</td>
                                <td background="/i/graybv_bg.gif" class="StatTextLarge" align="center">Submissions</td>
                                <td background="/i/graybv_bg.gif" class="StatTextLarge" align="center">Score</td>
                            </tr>
                
                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6508770" target="_blank">Bag Collection</a></td>
                                <td class="formTextOdd" align="center">3</td>
                                <td class="formTextOdd" align="center">95.14</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=3304122" target="_blank">Chat Server</a></td>
                                <td class="formTextEven" align="center">1</td>
                                <td class="formTextEven" align="center">95.00</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6402357" target="_blank">Class Discovery</a></td>
                                <td class="formTextOdd" align="center">1</td>
                                <td class="formTextOdd" align="center">93.77</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=4201389" target="_blank">Heartbeat</a></td>
                                <td class="formTextEven" align="center">1</td>
                                <td class="formTextEven" align="center">85.39</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=3300871" target="_blank">URL Loader</a></td>
                                <td class="formTextOdd" align="center">2</td>
                                <td class="formTextOdd" align="center">96.13</td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <p>Thank you to everyone who submitted entries for our February/March Component Design Contest.</p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3" width="300" class="formFrame">

                <tr>
                    <td class="statTextLarge" colspan="3" bgcolor="#999999"><a name="design"></a><font size="3">Qualifying Contest Entries</font></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Average Score</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279551">scamp</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">96.86</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">96.57</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278595">seaniswise</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">95.42</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">93.09</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">89.91</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299706">cruizza</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">89.82</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=271978">rusi</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">88.97</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=289824">MPhk</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">88.46</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754">Ken Vogel</a></td>
                    <td class="formTextOdd" align="center">4</td>
                    <td class="formTextOdd" align="center">88.04</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150498">ThinMan</a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">87.90</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304697">ozzie</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formTextOdd" align="center">87.87</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261822">bodrius</a></td>
                    <td class="formTextEven" align="center">4</td>
                    <td class="formTextEven" align="center">87.77</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">85.77</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=153434">bokbok</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">85.63</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=294463">theMADscientist</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">85.05</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=273100">wf</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">84.87</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278342">adic</a></td>
                    <td class="formTextOdd" align="center">4</td>
                    <td class="formTextOdd" align="center">83.78</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=155381">djFD</a></td>
                    <td class="formTextEven" align="center">3</td>
                    <td class="formTextEven" align="center">83.78</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=281975">keithnigh</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">82.55</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=280167">ttsuchi</a></td>
                    <td class="formTextEven" align="center">7</td>
                    <td class="formTextEven" align="center">82.04</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=265522">veredox</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">81.90</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297731">TheCois</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">81.33</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=287614">argolite</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formTextOdd" align="center">81.07</td>
                </tr>
                
                 <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=156618">mckavity</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">79.35</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976">giginim</a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">78.58</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=155357">alexaukf</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">77.57</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=157174">preetham</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formTextOdd" align="center">76.86</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294570">Saxophonist</a></td>
                    <td class="formTextEven" align="center">3</td>
                    <td class="formTextEven" align="center">74.97</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=136305">HuskerFan</a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">73.51</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=252022">AleaActaEst</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">72.75</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=271917">slowjoe</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">72.72</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=280393">lAZer</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">72.46</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=272311">yellow_gecko</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">72.44</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=289864">FTolToaster</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">70.18</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=300664">ahoenig</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">69.35</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=295413">alienisty</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">67.29</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=263386">TemporarilyBlue</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">67.21</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=260172">ddwsdl</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">66.90</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=343287">kameshjayaram</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">65.70</td>
                </tr>
                
                 <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=296226">CDummy</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">63.26</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=261909">RedSpectra</a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">60.71</td>
                </tr>
                
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><strong>Contest Requirements</strong><br />
                        Just submit designs that pass screening for a minimum of four Component Design Projects whose initial submission dates are between February 1, 2003 
                        and March 31, 2003. To pass screening, a design submission must score in the top 5 for that component and meet the minimum requirements of the 
                        screening scorecard.  All submissions that pass screening will be entered into the contest. The design submission with the highest review board score 
                        greater than or equal to 75 will be declared the component design winner for that project.</p>

 <!--                        <p>Get started today... There are plenty of <a href="index?t=development&amp;c=comp_projects">available projects</a> for you to choose from.</p> -->

                        <p>Not sure what to submit? See our <a href="index?t=development&amp;c=tcs_sample_docs">sample design solution</a> for ideas.</p>
                        
                        <p>What is the screening process? Read our <a href="index?t=development&amp;c=comp_meth">methodology</a> to find out.</p>
                        
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
                        
                        <p>Read the full <a href="/?t=&amp;c=terms">Terms and Conditions</a></p>
                        
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

