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
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                        <td valign="middle" class="statText" width="99%">
                            <p><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                            <strong>When:</strong> Feb. 18th - April 5th, 2003<br />
                            <strong>Where:</strong> the University Park Hotel @ MIT in Cambridge, MA<br />
                            <strong>Total Purse:</strong> $100,000</p>
                            
                            <p><strong>Eligibility Information for the 2003 TopCoder Collegiate Challenge</strong><br />
                            <xsl:for-each select="/TC/HOME/CollegiateInfo/reasons/reason">
                                <xsl:value-of select="reason_text"/><br />
                                </xsl:for-each>
                                <xsl:if test="/TC/HOME/CollegiateInfo/showLink='true'"><br />
                                <a href="/TourneyReg?&amp;rd=4462&amp;cd=4462" class="statText"><font size="3">Sign up now</font></a>
                            </xsl:if>
                            </p>

                            <p><font color="#CC0000"><strong>200 TopCoder Members will win money!</strong></font><br />
                            <a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>Get more information</a><br />
                            <img src="/i/clear.gif" alt="" width="1" height="5" border="0" /></p>
                        </td>
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
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

<!-- Summary/Best/Worst Begins -->
                <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                    <tr>
                        <td valign="middle" width="184"><img src="/i/label_srm_summary.gif" alt="Last Match Summary" width="184" height="26" border="0" align="left"/></td>
                        <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    </tr>
                </table>

                <table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                    <tr>
                        <td valign="top" colspan="3" class="bodyText"><a class="bodyGeneric">
                            <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><strong>2003 TCCC Round 1 Int.</strong></a><br />
                            Saturday, February 22, 2003<br /><br />
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

<!-- Uncomment for invit02
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
  </TR> -->

                <tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
            </table>
<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                <tr><td valign="top" colspan="7"><img src="/i/label_coder_view.gif" alt="Coder's Point of View" width="148" height="26" border="0" /></td></tr>
                
                <tr>
                    <td valign="top" width="55" align="left" class="bodyText" rowspan="2"><img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br />
                        By&#160;Logan<br /><i>[TC]&#160;Member</i><br /></td>
                    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td valign="top" width="100%" align="left" class="bodyText" colspan="2">
                        <font size="2" color="#000000" face="tahoma, verdana"><strong>2003 TCCC Round 1 Int.</strong></font></td>
                </tr>

                <tr>
                    <td valign="top" class="bodyText" width="100%">
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=tccc03_int_prob</xsl:attribute><strong>Problem Set Analysis &amp; Opinion</strong></a><br />

                        <p>The most notable aspect of this round was the Level 2 problem, which was solved by only four coders.
            This lead to a lot of successful challenges by coders such as <b>John Dethridge</b>.  The
            The Level 1 and Level 3 problems had very high success rates among those that submitted the problems,
            but each had a rather low submission rate.</p>
                    </td>
                </tr>
            </table>
<!-- End of Point of View -->

            <hr width="100%" size="1" color="#43515E" />

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
<!--                <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?t=tournaments&amp;c=tccc03_sched" target="_parent" /> -->
                <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?&amp;t=tces&amp;c=index" />
                <area shape="poly" alt="SRM Match 136" coords="0,93, 107,93, 120,106, 238,106, 238,155, 19,155, 0,137" href="/?RoundId=4470&amp;t=schedule&amp;c=srm" />
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
            <a href="/?&amp;t=development&amp;c=bonus_contest_0303"><img src="/i/header_software_development.gif" alt="Software Development" width="244" height="20" border="0" /></a><br />
            <a href="/?&amp;t=development&amp;c=components"><img src="/i/tcs_royalties_announce.gif" alt="Royalty Payments" width="244" height="107" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="1" height="2" border="0" /><br />
            <a href="/?&amp;t=development&amp;c=bonus_contest_0303"><img src="/i/tcs_promo.gif" alt="Win $2000" width="244" height="109" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="1" height="2" border="0" /><br />
            <a href="/?&amp;t=development&amp;c=bonus_contest_0303"><img src="/i/header_contest_leaders.gif" alt="Contest Leaders" width="244" height="20" border="0" /></a><br />

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
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=155381">djFD</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">97.50</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">96.30</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                     <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=287614">srowen</a></td>
                    <td class="statText" align="center">2</td>
                   <td class="statText" align="right">94.84</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754">ThinMan</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">89.64</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=281975">argolite</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">84.05</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="6" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"></td>
                    <td class="statText"></td>
                    <td class="statText" align="right"><a class="statText" href="/?t=development&amp;c=bonus_contest_0303">View all</a></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
                    <td width="25%"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
                    <td width="30%"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
                    <td width="25%"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
                </tr>
            </table>

           <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
                <tr><td height="20" class="moduleTitle"><a href="?t=development&amp;c=comp_projects"><img src="/i/tcs_contest_promo_bottom.gif" alt="Win $2000" width="244" height="22" border="0" /></a></td></tr>
            </table>
 <!-- Bonus Contest Ends -->

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="6" border="0"/></td></tr>
            </table>

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
                <tr><td><a href="/stat?c=member_profile&amp;cr=308953"><img src="/i/codermonth_jan03.gif" alt="Coder of the Month" width="244" height="116" vspace="10" border="0" /></a></td></tr>
            </table>
<!-- Coder of the Month ends -->
        </td>
    </tr>
</table>

</xsl:template>
</xsl:stylesheet>
