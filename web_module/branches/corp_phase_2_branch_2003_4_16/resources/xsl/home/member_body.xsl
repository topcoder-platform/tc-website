<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/my_stats.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/simple_search.xsl"/>
  <!-- <xsl:import href="../includes/modules/editorials.xsl"/> -->
  <!-- <xsl:import href="../includes/modules/top_room_wins.xsl"/> -->
  <xsl:import href="../includes/modules/top_scorers.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="MemberBody">

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr><td width="1" colspan="5"><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>

    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#000000">

            <xsl:call-template name="global_left"/>

        <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="5" /><br />
<!-- Do Not Delete This Line --><font size="1" color="#000000" face="tahoma">HiddenWord</font>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td width="100%" align="center"><img src="/i/clear.gif" alt="" width="1" height="4" border="0" /><br />
                <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_banner">
                    <tr valign="top">
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_champ"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                        <td valign="middle" class="statText" width="99%">
                            <p><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                            <font size="3"><strong>Congratulations to dgarthur, the 2003 Sun Microsystems and TopCoder Collegiate Challenge Champion!</strong></font><br />
                            <a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_champ</xsl:attribute>Get more information</a><br />
                            <img src="/i/clear.gif" alt="" width="1" height="5" border="0" /></p>
                        </td>
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_champ"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                    </tr>
                </table>

<!-- My Stats Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="4" valign="top" bgcolor="#FFFFFF" align="right"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>

                <tr>
                    <td valign="top" bgcolor="#FFFFFF" width="11" align="right"><img src="/i/steelblue_top_left1.gif" alt="" width="90" height="26" border="0"/></td>
                    <td valign="top" width="75" align="left" bgcolor="#FFFFFF"><img src="/i/steelblue_top_left2.gif" alt="" width="75" height="26" border="0"/></td>
                    <td valign="middle" bgcolor="#FFFFFF" width="100%"><img src="/i/label_my_stats_big.gif" alt="My Stats" width="92" height="26" border="0"/></td>
                    <td valign="top" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"/></td>
                </tr>
            </table>

            <xsl:choose>
            <xsl:when test="count(/TC/HOME/CoderData/Data)='0'">

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="statText" valign="top" height="50">You must compete to view this information.</td>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                </tr>
            </table>

            </xsl:when>
            <xsl:otherwise>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr><td colspan="5" class="statText"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

                <tr>
                    <td class="statText" rowspan="8" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td class="statText" rowspan="8" valign="top">

            <xsl:choose>
            <xsl:when test="/TC/HOME/CoderData/Data/has_image='1'">

                        <img width="126" height="140" align="left" border="0"><xsl:attribute name="SRC"><xsl:value-of select="/TC/HOME/CoderData/Data/image_path"/></xsl:attribute></img>

          </xsl:when>
          <xsl:otherwise>

                        <a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><img src="/i/m/nophoto_submit.gif" width="126" height="140" align="left" border="0"/></a>

          </xsl:otherwise>
          </xsl:choose>

                        <img src="/i/clear.gif" alt="" width="4" height="1" border="0"/>
                    </td>

                    <td class="statText" colspan="2">

          <xsl:if test="/TC/HOME/CoderData/Data/quote!=''">
          "<xsl:value-of select="/TC/HOME/CoderData/Data/quote"/>"
          </xsl:if>

                    </td>
                    <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>

                <tr>
                    <td class="statText">Member Since:</td>
                    <td background="/i/steel_darkblue_bg.gif" class="statText" align="right" nowrap=""><xsl:value-of select="/TC/HOME/CoderData/Data/member_since_date"/></td>
                    <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr>
                    <td class="statText">Volatility Factor:</td>
                    <td class="statText" align="right"><xsl:value-of select="/TC/HOME/CoderData/Data/vol"/></td>
                    <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr>
                    <td class="statText">Average Points per Contest:</td>
                    <td class="statText" align="right"><xsl:value-of select="format-number(/TC/HOME/CoderData/Data/avg_final_points, '0.00')"/></td>
                    <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr>
                    <td class="statText">Maximum Rating:</td>
                    <td class="statText" align="right"><xsl:value-of select="/TC/HOME/CoderData/Data/highest_rating"/></td>
                    <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

            <xsl:choose>
            <xsl:when test="/TC/HasImage='true'">

                <tr><td colspan="3"><a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> RE-SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Click here to resend your photo</a></td></tr>

            </xsl:when>
            <xsl:otherwise>

                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="24" border="0"/></td></tr>

            </xsl:otherwise>
            </xsl:choose>

                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
            </table>

            </xsl:otherwise>
            </xsl:choose>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td colspan="2" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" vspace="1"/><br />
                        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
                            <tr>
                                <td background="/i/steel_gray_bg3.gif" colspan="5" class="statText" height="18" valign="bottom">
                                    <img src="/i/clear.gif" alt="" width="4" height="1" border="0"/>
                                    <a class="statText">
                                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                                    <img src="/i/my_profile.gif" alt="" width="59" height="14" border="0"/>
                                    </a>
                                    <a class="statText">
                                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                                    <img src="/i/my_rating.gif" alt="" width="96" height="14" border="0"/>
                                    </a>
                                    <a class="statText">
                                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                                    <img src="/i/my_earning.gif" alt="" width="111" height="14" border="0"/>
                                    </a>
                                </td>
                            </tr>

                            <tr><td background="/i/steel_darkblue_bg.gif" colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

                            <tr>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="15%" height="14">Ranking</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="15%">Rating</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="30%">Earnings</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="40%"># of Competitions</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                            </tr>

                            <tr><td background="/i/steel_darkblue_bg.gif" colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>

                            <tr>

                            <xsl:choose>
                            <xsl:when test="/TC/Ranking>0">

                                <td class="statText" valign="middle" align="right" height="13"><xsl:value-of select="/TC/Ranking"/>&#160;&#160;</td>

                            </xsl:when>
                            <xsl:otherwise>

                                <td class="statText" valign="middle" align="right" height="13">Not Ranked&#160;&#160;</td>

                            </xsl:otherwise>
                            </xsl:choose>

                                <td class="statText" valign="middle" align="right"><xsl:value-of select="/TC/Rating"/>&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right">$<xsl:value-of select="format-number(/TC/HOME/Coder/TotalEarnings, '0.00')"/>&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="/TC/HOME/Coder/NumCompetitions"/>&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                            </tr>

                            <tr><td  colspan="5" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" class="smallText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                        </table>

                        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
                            <tr><td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

                        <xsl:if test="count(/TC/HOME/Last3Comps/RoomResult)!='0'">

                            <tr><td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td background="/i/steel_gray_bg3.gif" colspan="16" class="smallFoot" height="16" valign="middle">&#160;Statistics from your Last <xsl:value-of select="count(/TC/HOME/Last3Comps/RoomResult)"/> Matches (click the <img src="/i/coders_icon_onclear.gif" alt="" width="10" height="10" hspace="2" border="0"/> icon to view problem information).</td></tr>

                            <tr><td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

                            <tr>
                                <td background="/i/steel_bluebv_bg.gif" valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" height="28">Coder</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Coding<br />Phase</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;+&#160;</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Challenge<br />Phase</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;+&#160;</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Testing<br />Phase</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;=&#160;</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Final<br />Points</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Adv.</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Old<br />Rating</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;+&#160;</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Rating<br />Change</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;=&#160;</td>
                                <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">New<br />Rating</td>
                                <td background="/i/steel_bluebv_bg.gif" valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                            </tr>

                            <tr><td background="/i/steel_darkblue_bg.gif" colspan="16"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>

                        <xsl:for-each select="/TC/HOME/Last3Comps/RoomResult">

                            <tr>

                        <xsl:choose><xsl:when test="/TC/LoggedIn='true'">

                                <td background="/i/steel_darkblue_bg.gif" valign="middle" width="10">
                                    <a>

                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;rd=<xsl:value-of select="RoundId"/>&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>

                                    <img src="/i/coders_icon.gif" alt="" width="10" height="10" hspace="2" border="0"/>
                                    </a>
                                </td>
                                <td background="/i/steel_darkblue_bg.gif" class="statText" align="left">
                                    <a>

                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                        <xsl:attribute name="CLASS">statText</xsl:attribute>

                                    <font>

                        <xsl:attribute name="color">
                        <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>

                        </xsl:attribute>
                        <xsl:value-of select="Handle"/>

                                    </font>
                                    </a>
                                </td>

                        </xsl:when>
                        <xsl:otherwise>

                                <td><img src="/i/coders_icon.gif" alt="" width="10" height="10" hspace="4" border="0"/></td>
                                <td>

                        <xsl:attribute name="CLASS">statText</xsl:attribute>

                                    <font>

                        <xsl:attribute name="color">
                        <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>

                        </xsl:attribute>

                                    <b>

                        <xsl:value-of select="Handle"/></b>

                                    </font>
                                </td>

                        </xsl:otherwise></xsl:choose>

                                <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(CodingPoints, '0.00')"/></td>
                                <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(ChallengePoints, '0.00')"/></td>
                                <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(TestPoints, '0.00')"/></td>
                                <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(FinalPoints, '0.00')"/></td>
                                <td class="statText" valign="middle" align="right">

                        <xsl:choose>
                        <xsl:when test="Advanced='Y'">

                                    Yes

                        </xsl:when>
                        <xsl:otherwise>

                                    No

                        </xsl:otherwise>
                        </xsl:choose>

                                </td>
                                <td class="statText" valign="middle" align="right">

                        <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PreRoundRating, '0')"/></xsl:with-param></xsl:call-template>

                                </td>
                                <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(RatingDifference, '0.00')"/></td>
                                <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                <td class="statText" valign="middle" align="right">

                        <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PostRoundRating, '0')"/></xsl:with-param></xsl:call-template>

                                </td>
                                <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                            </tr>

                            <tr><td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>

                        </xsl:for-each>

                            <tr><td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>

                            <tr><td background="/i/steel_blue_bg.gif" class="statText" colspan="16"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td class="statText" colspan="16"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                        </xsl:if>

                        </table>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr><td colspan="4" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

                <tr>
                    <td valign="top" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
                    <td valign="top" width="14"><img src="/i/clear.gif" alt="" width="14" height="8" border="0"/></td>
                    <td valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                </tr>
            </table>
<!-- My Stats Ends -->

<img src="/i/clear.gif" alt="" width="1" height="1" border="0"/><br />

<!-- TCCC03 Championship begins-->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><font size="3"><strong>Championship Summary</strong></font></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/champ_main.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">dgarthur poses for the cameras after winning the 2003 Collegiate Challenge</td></tr>
                        </table>
                                
                        <h2>dgarthur takes home the crown</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Saturday, April 5, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets" class="bodyText">View current bracket</a></p>

                        <p>In a final round that saw 11 out of a possible 12 submissions, it was <strong>dgarthur</strong> who posted the highest 
                        score and walked away $50,000 richer as the Champion.</p>

                        <p>The contest started off with <strong>Yarin, </strong><strong>dgarthur</strong> and <strong>sjelkjd</strong> all opening the 250-point problem and 
                        <strong>dmwright</strong> opting to go with the 450.  <strong>Yarin</strong> took the early lead with a quick submission of the 250-pointer 
                        for 237.49 points.  He then moved on to the 450.  <strong>sjelkjd</strong> was in next with his submission to the 250, 
                        getting 213.97 points.  <strong>dgarthur</strong> brought in the lowest score on the 250 with his submission for 
                        202.96 points.  He and <strong>sjelkjd</strong> both moved on to the 450.  Even before <strong>dmwright</strong> could log his first 
                        submission, <strong>Yarin</strong> sent in his second, adding 385.26 points from his 450.  <strong>dmwright</strong> finally sent in 
                        his first submission for 303.43 points on the 450.  He moved on to the 950, leaving the 250 for last.  
                        <strong>dgarthur</strong> made up some ground by receiving 381.34 points for his 450-point submission, and moved 
                        to the 950.</p>

                        <p><strong>Yarin</strong> sent in the 7th submission of the round and added 760.04 points to his total.  In an impressive 
                        move, <strong>dgarthur</strong> submitted his 950-point solution for 863.41 points and pulled ahead of <strong>Yarin</strong> by 65 
                        points.  <strong>dmwright</strong> logged his 2nd submission for 709.86 points on the 950, then went to work on the 
                        250.  <strong>sjelkjd</strong> sent in his only other submission, getting 232.11 points on the 450.  <strong>dmwright</strong> sent in 
                        the 2nd highest 250-point submission for 231.85 points.  At the end of the Coding Phase, the point 
                        totals stood as follows:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dgarthur</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1447.71</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Yarin</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1382.79</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1245.14</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">sjelkjd</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">446.08</td>
                             </tr>
                        </table>		

                        <p><strong>sjelkjd</strong> offered the only action of the Challenge Phase by unsuccessfully challenging all 3 950-point 
                        submissions and <strong>Yarin's</strong> 450-point submission.  System tests proved that challenging any of the other 
                        competitor's submissions was in vain, as all submissions passed.  The final scores looked quite similar 
                        to those at the end of the Coding Phase:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dgarthur</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1447.71</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Yarin</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1382.79</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1245.14</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">sjelkjd</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">246.08</td>
                             </tr>
                        </table>		

                        <p><strong>dgarthur</strong> was all smiles during the media hour, and rightfully so.  He performed perfectly through 
                        two onsite rounds and beat six very worthy competitors in two days.  Congratulations to dgarthur and 
                        the 15 other semi-finalists for a great weekend of coding!</p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><font size="3"><strong>Championship Photos</strong></font></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_01.jpg');"><img src="/i/tournament/tccc03/champ_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_02.jpg');"><img src="/i/tournament/tccc03/champ_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_03.jpg');"><img src="/i/tournament/tccc03/champ_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_04.jpg');"><img src="/i/tournament/tccc03/champ_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_05.jpg');"><img src="/i/tournament/tccc03/champ_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_06.jpg');"><img src="/i/tournament/tccc03/champ_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_07.jpg');"><img src="/i/tournament/tccc03/champ_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_08.jpg');"><img src="/i/tournament/tccc03/champ_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_09.jpg');"><img src="/i/tournament/tccc03/champ_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_10.jpg');"><img src="/i/tournament/tccc03/champ_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/champ_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_11.jpg');"><img src="/i/tournament/tccc03/champ_11_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_12.jpg');"><img src="/i/tournament/tccc03/champ_12_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_13.jpg');"><img src="/i/tournament/tccc03/champ_13_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_14.jpg');"><img src="/i/tournament/tccc03/champ_14_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_15.jpg');"><img src="/i/tournament/tccc03/champ_15_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>            

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_16.jpg');"><img src="/i/tournament/tccc03/champ_16_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_17.jpg');"><img src="/i/tournament/tccc03/champ_17_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_18.jpg');"><img src="/i/tournament/tccc03/champ_18_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/champ_19.jpg');"><img src="/i/tournament/tccc03/champ_19_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>

                <tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>
<!-- TCCC03 Championship ends -->            
            
<!-- Summary/Best/Worst Begins
                <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                    <tr>
                        <td valign="middle" width="184"><img src="/i/label_srm_summary.gif" alt="Last Match Summary" width="184" height="26" border="0" align="left"/></td>
                        <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    </tr>
                </table>

                <table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                    <tr>
                        <td valign="top" colspan="3" class="bodyText"><a class="bodyGeneric">
                             <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><strong>Single Round Match 140</strong></a><br />
                            Wednesday, March 26, 2003<br /><br />
                        </td>
                    </tr>

                    <tr>
                        <td valign="middle" align="center" bgcolor="#CCCCCC" width="33%" nowrap="nowrap" height="15">
                            <a class="bodyGeneric">
                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>Div. Leaders</a>
                        </td>
                        <td valign="middle" align="center" bgcolor="#CCCCCC" width="34%" nowrap="nowrap">
                            <a class="bodyGeneric">
                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>Problem Stats</a>
                        </td>
                        <td valign="middle" align="center" bgcolor="#CCCCCC" width="33%" nowrap="nowrap">
                            <a class="bodyGeneric">
                            <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>Results</a>
                        </td>
                    </tr>
                </table>

                <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                    <tr>
                        <td valign="middle" class="statText" width="100%">
                            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#001935">
                                <tr><td valign="middle" height="17" align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</td></tr>
                                <tr><td colspan="5" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td></tr>

                                <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">

                                <tr>
                                    <td height="14" valign="middle" width="20%" class="statTextBig" nowrap="nowrap">&#160;&#160;&#160;<xsl:value-of select="division"/></td>
                                    <td valign="middle" width="10%" class="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</td>
                                    <td valign="middle" width="35%" class="statText" nowrap="nowrap">&#160;&#160;
                                        <a>
                                        <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                                        <xsl:attribute name="CLASS">bodyText</xsl:attribute>

                                        <font>

                                        <xsl:attribute name="color">
                                            <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                                        </xsl:attribute>

                                        <xsl:value-of select="handle"/>

                                        </font></a>
                                    </td>
                                    <td valign="middle" width="15%" class="statText" align="center"><xsl:value-of select="change"/></td>
                                    <td valign="middle" width="20%" class="statText" nowrap="nowrap">&#160;<xsl:value-of select="room_name"/></td>
                                </tr>

                                </xsl:for-each>

                                <tr><td colspan="5" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="6" border="0" /></td></tr>
                            </table>
                        </td>
                    </tr>

  <TR>
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><br />
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=invit02_champ</xsl:attribute><B>G'day Mate!</B></A><br />
by MaryBeth Biondi, <I>TopCoder Staff</I><br />

<P>
...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournaments&amp;c=invit02_champ</xsl:attribute>read&#160;more</A>
</P>
    </TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>

                <tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
            </table>
 Summary/Best/Worst Ends -->


<!-- Coder Point of View Begins-->

             <table width="100%" border="0" cellspacing="0" cellpadding="3">                     
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Coders Point of View</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>View All</strong></a></td>
                </tr>
            </table>
            
             <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="top">
                    <td width="55" class="bodyText">
                        <img src="/i/m/lbackstrom_mug.jpg" alt="" width="55" height="61" border="0" vspace="5"/><br />
                        By&#160;<strong>lbackstrom</strong><br/>
                        <span class="smallText"><em>TopCoder Member</em></span></td>
                    <td width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p><font size="4"><strong>Single Round Match 141</strong></font><br />
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm141_prob</xsl:attribute><font size="4"><strong>Problem Set Analysis &amp; Opinion</strong></font></a></p>

                        <p>SnapDragon brought his A game to this match, beating everyone by over 200 points. 
						Most people were able to get the first two problems, but dynamic programming is 
						always a little tricky, and after solving the first two problems, few people had 
						time to finish the third. sjelkjd also showed why he made it to the CC finals, 
						taking second overall, helped largely by his 4 successful challenges. Over in 
						Division 2, first timer dary also won by over 200 points, with three fast 
						submissions, and a challenge.
						<a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm141_prob</xsl:attribute><strong>full&#160;story</strong></a></p>
                    </td>
                </tr>
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>
 <!-- End of Point of View -->

<!-- Java Web Start Include -->
            <xsl:call-template name="arena"/>

            <p><br /></p>
        </td>
  <!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td class="statText" width="244"><img src="/i/clear.gif" alt="" width="244" height="1" border="0"/><br />

<!--SRM Sponsor Starts-->
            <img usemap="#srmanimation_home" src="/i/es/srmanimation_home.gif" alt="" width="244" height="160" border="0" /><br />
            <map name="srmanimation_home">
              <!--   <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="javascript:void window.open('http://www.gentleware.com')" /> -->
               <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?&amp;t=tces&amp;c=index" /> 
                <area shape="poly" alt="SRM Match 139" coords="0,93, 107,93, 120,106, 238,106, 238,155, 19,155, 0,137" href="/?RoundId=4500&amp;t=schedule&amp;c=srm" />
            </map>
<!--SRM Sponsor Ends-->


<!-- TCES Quote Begins
            <map name="tcesMap">
            <area shape="rect" alt="" coords="33,89,159,104" href="/?t=schedule&amp;c=index"></area>
            <area shape="rect" alt="" coords="3,3,239,23" href="/?t=tces&amp;c=index"></area>
            </map>
            <img src="/i/tces_quote.gif" width="244" height="138" alt="Only rated members can apply for TCES jobs" border="0" usemap="#tcesMap" />
 TCES Quote Ends -->

<!-- TCS Promo Begins -->
            <img src="/i/clear.gif" alt="" width="1" height="2" border="0" /><br />
            <a href="?t=development&amp;c=index"><img src="/i/header_software_development.gif" alt="Software Development" width="244" height="20" border="0" /></a><br />

            <a href="/?t=development&amp;c=des_bonus_contest_2"><img src="/i/development/tcs_des_bonus2_promo.gif" alt="Component Design Contest 2: $6000 total prizes" border="0" width="244" height="133" /></a><br />
<!-- Comment out until contest is under way
            <img src="/i/clear.gif" alt="" width="1" height="2" border="0" /><br />
            <a href="/?t=development&amp;c=bonus_contest_0303"><img src="/i/header_contest_leaders.gif" alt="Contest Leaders" width="244" height="20" border="0" /></a><br />

            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#001935">
                <tr valign="middle">
                    <td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0" /></td>
                    <td width="39%" class="statText" background="/i/steel_bluebv_bg.gif">Handle</td>
                    <td width="20%" class="statText" align="center" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Submissions</td>
                    <td width="39%" class="statText" align="right" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Avg. Score</td>
                    <td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0" /></td>
                </tr>
                
                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="right">93.09</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="right">89.91</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>
                
                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754">Ken Vogel</a></td>
                    <td class="statText" align="center">4</td>
                    <td class="statText" align="right">88.04</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>
                
                
                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150498">ThinMan</a></td>
                    <td class="statText" align="center">5</td>
                    <td class="statText" align="right">87.90</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>
                
                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261822">bodrius</a></td>
                    <td class="statText" align="center">4</td>
                    <td class="statText" align="right">87.77</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="6" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                    <td class="statText"></td>
                    <td class="statText"></td>
                    <td class="statText" align="right"><a class="statText" href="/?t=development&amp;c=bonus_contest_0303">View all</a></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="10" border="0" /></td>
                    <td width="25%"><img src="/i/clear.gif" width="1" height="10" border="0" /></td>
                    <td width="30%"><img src="/i/clear.gif" width="1" height="10" border="0" /></td>
                    <td width="25%"><img src="/i/clear.gif" width="1" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="10" border="0" /></td>
                </tr>
            </table>

           <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
                <tr><td height="20" class="moduleTitle"><a href="?t=development&amp;c=comp_projects"><img src="/i/tcs_contest_promo_bottom.gif" alt="Win $2000" width="244" height="22" border="0" /></a></td></tr>
            </table>
 Bonus Contest Ends

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="6" border="0" /></td></tr>
            </table>  -->

            <table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top" bgcolor="#001935">
                <tr><td height="17" class="moduleTitle" bgcolor="#333333"><img src="/i/module_labels_10_coders.gif" alt="Competition Leaders" width="244" height="20" border="0"/></td></tr>
                <tr><td><img src="/i/clear.gif" width="1" height="3" border="0"/></td></tr>
            </table>

      <xsl:choose>
        <xsl:when test="number(/TC/Rating)&lt;1200">
          <xsl:call-template name="top_scorers"><xsl:with-param name="division">2</xsl:with-param></xsl:call-template>
        </xsl:when>

        <xsl:otherwise>

        <xsl:call-template name="top_scorers"><xsl:with-param name="division">1</xsl:with-param></xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="20" height="10" border="0"/></td>
                    <td></td>
                    <td></td>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
                </tr>
            </table>

<!-- Statistics Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr><td colspan="3" bgcolor="#333333"><img src="/i/label_quick_stats_home.gif" alt="Statistics" width="244" height="20" border="0" /></td></tr>
                <tr>
                    <td rowspan="5"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
                    <td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
                    <td rowspan="5"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
                </tr>
                <tr><td class="statText">Select a Statistic from the menu below.</td></tr>
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>
                <tr><td class="quickstatText" valign="top">

                <xsl:call-template name="quick_stats_pulldown"/>

                    </td>
                </tr>
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>
            </table>
<!-- Statistics Ends -->

<!-- Coder of the Month Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td><a href="/stat?c=member_profile&amp;cr=285916"><img src="/i/codermonth_mar03.gif" alt="Coder of the Month" width="244" height="149" vspace="10" border="0" /></a></td></tr>
            </table>
<!-- Coder of the Month ends -->
        </td>
    </tr>
</table>

</xsl:template>
</xsl:stylesheet>
