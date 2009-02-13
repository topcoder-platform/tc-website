
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
                        <div align="center"><img src="/i/development/header_des_bonus_contest2.gif" alt="TopCoder Software Component Design Bonus Contest 2" width="554" height="150" border="0" /></div>
                    </td>
                </tr>
            </table>

<!-- Comment out until final winner is known -->
            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">

                        <p><strong>With an average score of 91.21 points on 6 submissions, TangentZ beat out the rest of the TopCoder competition to take the top spot... and the $3000 bonus.  In addition to the bonus, TangentZ earned $1,004.50 in component winnings during the contest.</strong></p>
                        <p><strong>Coming in second, isv also submitted 6 submissions with his top 5 averaging 90.68 points.  isv's bonus was $2,000, which is on top of his $1,065 in component design earnings during the contest.</strong></p>
                        <p><strong>srowen came in third with an average score of 89.16 points for 5 submissions.  The $1,000 bonus adds to his $412 in component design earnings during the contest.</strong></p>

                        <p>These are the projects and scores for the top three winners:</p>

                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td background="/i/steel_bluebv_bg.gif" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td background="/i/steel_bluebv_bg.gif" width="175" class="statText">TangentZ</td>
                                <td background="/i/steel_bluebv_bg.gif" width="175" class="statText">isv</td>
                                <td background="/i/steel_bluebv_bg.gif" width="175" class="statText">srowen</td>
                                <td background="/i/steel_bluebv_bg.gif" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220216" target="_blank">Test Values - 89.08</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7263251" target="_blank">Chart Data Structure - 93.78</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220261" target="_blank">Number Translation - 98.75</a></td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220290" target="_blank">Data Validation - 88.88</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=5800426" target="_blank">JNDI Context Utility - 91.50</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7289752" target="_blank">Complex Number - 92.18</a></td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=5800878" target="_blank">Standard Class - 94.09</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=500004" target="_blank">Config Manager - 89.52</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7323105" target="_blank">Asynchronous Wrapper - 85.77</a></td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7311989" target="_blank">Priority Queue - 92.18</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7311989" target="_blank">Priority Queue - 89.75</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7323082" target="_blank">Generic Event Manager - 91.74</a></td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                            <tr valign="top">
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7263800" target="_blank">Thread Pool - 91.81</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7339417" target="_blank">Synchronous Wrapper - 88.85</a></td>
                                <td class="statText"><a class="statText" href="http://software.topcoder.com/catalog/c_component.jsp?comp=7339417" target="_blank">Synchronous Wrapper - 77.35</a></td>
                                <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="4" height="1" border="0" /></td>
                            </tr>

                         </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <p>Thank you to everyone who submitted entries for our second Component Design Contest.</p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3">

                <tr>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Qualifying Members</h1></td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a>(5 or more submissions)</td>
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
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546"><strong>TangentZ</strong></a></td>
                    <td class="statText" align="center">6</td>
                    <td class="statText" align="center">91.21</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180"><strong>isv</strong></a></td>
                    <td class="statText" align="center">6</td>
                    <td class="statText" align="center">90.68</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">89.16</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278342"><strong>adic</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">87.96</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">87.85</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150498"><strong>ThinMan</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">85.34</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">82.24</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">81.70</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754"><strong>Ken Vogel</strong></a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="center">81.40</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

               <tr>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"></td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Non-Qualifying Members</h1></td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a>(less than 5 submissions)</td>
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
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=289864"><strong>FTolToaster</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">95.34</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=273217"><strong>schveiguy</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">89.79</td>
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
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=297450"><strong>kestleloot</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">82.40</td>
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
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279551"><strong>scamp</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">79.60</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                  <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294570"><strong>Saxophonist</strong></a></td>
                    <td class="statText" align="center">4</td>
                    <td class="statText" align="center">78.05</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                 <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=289824"><strong>MPhk</strong></a></td>
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
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976"><strong>giginim</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">74.21</td>
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
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=271159"><strong>Shiro</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">69.72</td>
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" width="4" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904"><strong>mishagam</strong></a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="center">69.43</td>
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

