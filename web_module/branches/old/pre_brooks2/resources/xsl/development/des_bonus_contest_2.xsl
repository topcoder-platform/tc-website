
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

 <title>Component Design Bonus Contest 2 for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">contests</xsl:with-param>
                <xsl:with-param name="level3">des_bonus_contest_2</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
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
                    <td class="bodyText">
                        <div align="center"><br /><img src="/i/development/header_des_bonus_contest2.gif" alt="TopCoder Software Component Design Bonus Contest 2" width="554" height="150" border="0" /></div>

<!-- Comment out until final winner is known -->
                        <p>With an average score of 91.21 points on 6 submissions, <strong>TangentZ</strong> beat out the rest of the TopCoder competition to take 
                        the top spot... and the $3000 bonus.  In addition to the bonus, <strong>TangentZ</strong> earned $1,004.50 in component winnings during the contest.</p>
                        
                        <p>Coming in second, <strong>isv</strong> also submitted 6 submissions with his top 5 averaging 90.68 points. <strong>isv's</strong> bonus was $2,000, 
                        which is on top of his $1,065 in component design earnings during the contest.</p>
                        
                        <p><strong>srowen</strong> came in third with an average score of 89.16 points for 5 submissions.  The $1,000 bonus adds to his $412 
                        in component design earnings during the contest.</p><br/>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="5" width="100%" class="formFrame">
                            <tr valign="middle"><td class="statTextLarge" colspan="3" bgcolor="#999999"><font size="3">Projects and scores for the top three winners</font></td></tr>

                            <tr valign="middle">
                                <td background="/i/graybv_bg.gif" width="33%" class="statTextLarge">TangentZ</td>
                                <td background="/i/graybv_bg.gif" width="33%" class="statTextLarge">isv</td>
                                <td background="/i/graybv_bg.gif" width="33%" class="statTextLarge">srowen</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220216" target="_blank">Test Values - 89.08</a></td>
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7263251" target="_blank">Chart Data Structure - 93.78</a></td>
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220261" target="_blank">Number Translation - 98.75</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220290" target="_blank">Data Validation - 88.88</a></td>
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5800426" target="_blank">JNDI Context Utility - 91.50</a></td>
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7289752" target="_blank">Complex Number - 92.18</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5800878" target="_blank">Standard Class - 94.09</a></td>
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=500004" target="_blank">Config Manager - 89.52</a></td>
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7323105" target="_blank">Asynchronous Wrapper - 85.77</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7311989" target="_blank">Priority Queue - 92.18</a></td>
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7311989" target="_blank">Priority Queue - 89.75</a></td>
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7323082" target="_blank">Generic Event Manager - 91.74</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7263800" target="_blank">Thread Pool - 91.81</a></td>
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7339417" target="_blank">Synchronous Wrapper - 88.85</a></td>
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7339417" target="_blank">Synchronous Wrapper - 77.35</a></td>
                            </tr>
                        </table>

                        <table border="0" cellspacing="0" cellpadding="5" width="100%">
                            <tr valign="top"><td class="bodyText" colspan="3">Thank you to everyone who submitted entries for our second Component Design Contest.</td></tr>
                        </table>
                        
                        <p><br/></p>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3" width="300" class="formFrame">
                <tr>
                    <td class="statTextLarge" colspan="3" bgcolor="#999999"><a name="design"></a><strong><font size="3">Qualifying Members</font><br />(5 or more submissions)</strong></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width="33%" class="statTextLarge">Handle</td>
                    <td background="/i/graybv_bg.gif" width="33%" class="statTextLarge" align="center">Submissions</td>
                    <td background="/i/graybv_bg.gif" width="33%" class="statTextLarge" align="center">Average Score</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546"><strong>TangentZ</strong></a></td>
                    <td class="formTextOdd" align="center">6</td>
                    <td class="formTextOdd" align="center">91.21</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180"><strong>isv</strong></a></td>
                    <td class="formTextEven" align="center">6</td>
                    <td class="formTextEven" align="center">90.68</td>
                </tr>

                 <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">89.16</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278342"><strong>adic</strong></a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">87.96</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">87.85</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150498"><strong>ThinMan</strong></a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">85.34</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">82.24</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">81.70</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754"><strong>Ken Vogel</strong></a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">81.40</td>
                </tr>
                        </table>
                        
                        <br/>

                        <table border="0" cellspacing="0" cellpadding="3" width="300" class="formFrame">
                <tr>
                    <td class="statTextLarge" colspan="3" bgcolor="#999999"><a name="design"></a><strong><font size="3">Non-Qualifying Members</font><br />(less than 5 submissions)</strong></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Average Score</td>
                </tr>


                 <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=289864"><strong>FTolToaster</strong></a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">95.34</td>
                </tr>


                 <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=273217"><strong>schveiguy</strong></a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">89.79</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907"><strong>WishingBone</strong></a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">89.26</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><strong>Tomson</strong></a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">86.77</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=297450"><strong>kestleloot</strong></a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">82.40</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">80.96</td>
                </tr>

                  <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=279471"><strong>haha</strong></a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">80.58</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=302729"><strong>kislookhin</strong></a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">80.49</td>
                </tr>

                 <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279551"><strong>scamp</strong></a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">79.60</td>
                </tr>

                  <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294570"><strong>Saxophonist</strong></a></td>
                    <td class="formTextEven" align="center">4</td>
                    <td class="formTextEven" align="center">78.05</td>
                </tr>

                 <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=289824"><strong>MPhk</strong></a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">77.70</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297731"><strong>TheCois</strong></a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">76.33</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976"><strong>giginim</strong></a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">74.21</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=280167"><strong>ttsuchi</strong></a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">71.81</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=271159"><strong>Shiro</strong></a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">69.72</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904"><strong>mishagam</strong></a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">69.43</td>
                </tr>

                 <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=292290"><strong>CagedRat</strong></a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">64.75</td>
                </tr>

                 <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=300150"><strong>Mikhail_T</strong></a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">57.80</td>
                </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <p><br /></p>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">

                        <hr width="100%" noshade="noshade" color="#666666" />

                        <strong><ul>
                            <li>You must submit at least five designs that pass our screening process to qualify.</li>
                            <li>Winning design submissions for each component project still qualify for regular payment and royalties.</li>
                            <li>First place will receive $3,000.</li>
                            <li>Second place will receive $2,000.</li>
                            <li>Third place will receive $1,000.</li>
                        </ul>

                        <p>Get started today... There are plenty of <a href="index?t=development&amp;c=comp_projects">available projects</a> for you to choose from.</p></strong>

                        <hr width="100%" noshade="noshade" color="#666666" />

                        <p><font size="3"><strong>Contest Requirements</strong></font><br />
                        Submit a minimum of five designs that pass screening for TopCoder Component Design Projects whose initial submission
                        dates are between April 10, 2003 and June 25, 2003. To pass screening, a design submission must score in the top 5 for
                        that component and meet the minimum requirements of the screening scorecard. All submissions that pass screening will
                        be entered into the contest. <strong>Only your 5 highest-scoring submissions count towards your average score. </strong>
                        The TopCoder members with the 3 highest average scores will be declared the first, second and third place winners,
                        respectively.</p>

                        <p>Not sure what to submit? See our <a href="index?t=development&amp;c=tcs_sample_docs">sample design solution</a> for ideas.</p>

                        <p>What is the screening process? Read our <a href="index?t=development&amp;c=comp_meth">methodology</a> to find out.</p>

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
                        Methodology at any time. For more information read the full <a href="/?t=&amp;c=terms">Terms and Conditions</a></p>

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

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

