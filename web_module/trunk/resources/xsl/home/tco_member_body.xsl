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
  <xsl:import href="../includes/modules/top_scorers.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/modules/srm_sponsor.xsl"/>
  <xsl:import href="../includes/modules/coder_of_month.xsl"/>
  <xsl:import href="../includes/modules/srm_best_worst.xsl"/>
  <xsl:import href="../includes/modules/big_promo.xsl"/>
  <xsl:import href="../includes/modules/small_promos.xsl"/>
  <xsl:import href="../includes/modules/corp_promos.xsl"/>
  <xsl:import href="../includes/modules/coder_pov.xsl"/>
  <xsl:import href="../includes/modules/tcs_promo.xsl"/>
  <xsl:import href="../includes/modules/member_surveys.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="MemberBody">

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/><br />
<!-- Do Not Delete This Line --><font size="1" color="#FFFFFF" face="tahoma">HiddenWord</font>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">

            <img src="/i/clear.gif" width="10" height="10" border="0"/>

            <div align="center"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final"><img src="/i/promos/tco_promo_big.gif" alt="2003 TopCoder Open sponsored by Intel&#174;" width="530" height="148" border="0" /></A></div>

            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="top">
                    <td class="bodyText">

                        <div class="leadPhoto">
                            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final"><img src="/i/tournament/tco03/final/summary_home.jpg" alt="" width="200" height="250" class="photoFrameBig" /></A><br/>
                            <span class="leadPhotoCaption">tomek poses for the crowd.<br/><br/></span>
                        </div>

                        <h2>tomek comes out on top</h2>

                        <p>by Matt Murphy, <A href="/stat?c=member_profile&amp;cr=265522">veredox</A>, <em>TopCoder Staff</em><br />
                        Friday, December 5, 2003</p>

                        <p>Floats like a butterfly, codes in C. The crowd could not stop roaring as tomek, the new TopCoder Open Champion, bounced up to
                        receive his $50,000 check.</p>

                        <p>The sociable student from Poland made his first appearance in TopCoder competitions just 3 months before the start of the
                        tournament. His friends back home did not think he would be able to come to America and win this kind of money. "I told them I
                        was going to win," tomek said with a grin. <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final">Read the whole story</A><br/>
                        
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final_video">Video of tomek's win.</A>
                        </p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" width="10" height="10" border="0"/>

            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="top">
                    <td class="bodyText">

                        <div class="leadPhoto">
                            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final"><img src="/i/tournament/tco03/comp_final/summary_des_home.jpg" alt="" width="200" height="250" class="photoFrameBig" /></A><br/>
                            <span class="leadPhotoCaption">Pops: $10,000 richer and lovin' it<br/><br/></span>
                        </div>

                        <h2>Pops is tops!</h2>

                        <p>by <A href="/stat?c=member_profile&amp;cr=296145">srowen</A>, <em>TopCoder Member</em><br />
                        Friday, December 5, 2003</p>

                        <p>An elegant and competent design netted Pops victory today in TopCoder Software's first software design tournament. In a long competition that ended in
                        an intense onsite finish, his design narrowly edged out a capable design from kyky in the eyes of three reviewers (Ken_Vogel, valeriy and myself, srowen),
                        by a score of 92.24 to 86.65. </p>

                        <p>Pops (Tim Roberts) will return home to North Carolina tomorrow with first prize and a $10,000 check. Asked where the money would go, he just
                        said "the kids." Pops praised the competition: "It's nice to be able to measure yourself against other people."
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final">Read the whole story</A></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" width="10" height="10" border="0"/>

            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="top">
                    <td class="bodyText">

                        <div class="leadPhoto">
                            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final#dev"><img src="/i/tournament/tco03/comp_final/summary_dev_home.jpg" alt="" width="200" height="250" class="photoFrameBig" /></A><br/>
                            <span class="leadPhotoCaption">rnielsen beat the odds.<br/><br/></span>
                        </div>

                        <h2>rnielsen crowned development champ</h2>

                        <p>by <A href="/stat?c=member_profile&amp;cr=296145">srowen</A>, <em>TopCoder Member</em><br />
                        Friday, December 5, 2003</p>

                        <p>Today, rnielsen came out on top in the first TopCoder Software software development tournament, in what proved to be a treacherous
                        contest. His development solution scored 88.70 in the final onsite round, besting a competing submission from aksonov, which scored
                        66.06 due to a single, surprising issue.</p>

                        <p>rnielsen (Rob Nielsen) gets the thrill of victory and $10,000 to keep him company on the long trip back to Australia. "It's a good contest" he said.
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final#dev">Read the whole story</A></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

<!-- Small Promos begins -->
            <xsl:call-template name="small_promos"/>
<!-- Small Promos ends -->

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />
        
<!-- Corporate Promos begins -->
            <xsl:call-template name="corp_promos"/>
<!-- Corporate Promos ends -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />
        
<!-- My Stats Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="180"><img src="/i/header_my_stats.gif" alt="My Stats" width="180" height="26" border="0" /></td>
                    <td width="99%"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"/></td>
                </tr>
            </table>

            <xsl:choose>
            <xsl:when test="count(/TC/HOME/CoderData/Data)='0'">

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr><td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="statText" valign="top" height="50">You must compete to view this information.</td>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                </tr>
            </table>

            </xsl:when>
            <xsl:otherwise>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr><td colspan="5" class="statText"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

                <tr>
                    <td class="statText" rowspan="8" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td class="statText" rowspan="8" valign="top">

            <xsl:choose>
            <xsl:when test="/TC/HOME/CoderData/Data/has_image='1'">

                        <img width="126" height="140" align="left" border="0"><xsl:attribute name="SRC"><xsl:value-of select="/TC/HOME/CoderData/Data/image_path"/></xsl:attribute></img>

          </xsl:when>
          <xsl:otherwise>

                        <a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/>%20|%20[%20<xsl:value-of select="/TC/Handle"/>%20]%20|%20<xsl:value-of select="/TC/UserId"/>%20SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT</xsl:attribute><img src="/i/m/nophoto_submit.gif" width="126" height="140" align="left" border="0"/></a>

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
                    <td class="statText" align="right" nowrap=""><xsl:value-of select="/TC/HOME/CoderData/Data/member_since_date"/></td>
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

                <tr><td colspan="3"><a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/>%20|%20[%20<xsl:value-of select="/TC/Handle"/>%20]%20|%20<xsl:value-of select="/TC/UserId"/>%20RE-SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Click here to resend your photo</a></td></tr>

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

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td colspan="2" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" vspace="1"/><br />
                        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
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

                            <tr><td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

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
                                     <xsl:choose>
                                         <xsl:when test="count(/TC/HOME/Coder/Coder)!='0'">
                                             <td class="statText" valign="middle" align="right">$<xsl:value-of select="format-number(/TC/HOME/Coder/Coder/total_earnings, '0.00')"/>&#160;&#160;</td>
                                             <td class="statText" valign="middle" align="right"><xsl:value-of select="/TC/HOME/Coder/Coder/num_competitions"/>&#160;&#160;</td>
                                         </xsl:when>
                                         <xsl:otherwise>
                                             <td class="statText" valign="middle" align="right">$0.00&#160;&#160;</td>
                                             <td class="statText" valign="middle" align="right">0&#160;&#160;</td>
                                         </xsl:otherwise>
                                     </xsl:choose>
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

                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;rd=<xsl:value-of select="roundid"/>&amp;cr=<xsl:value-of select="coderid"/></xsl:attribute>

                                        <img src="/i/coders_icon.gif" alt="" width="10" height="10" hspace="2" border="0"/>
                                        </a>
                                    </td>
                                    <td background="/i/steel_darkblue_bg.gif" class="statText" align="left">
                                        <a>
                                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coderid"/></xsl:attribute>
                                                <xsl:attribute name="CLASS">
                                                  <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="postroundrating"/></xsl:with-param></xsl:call-template>
                                                </xsl:attribute>
                                            <xsl:value-of select="handle"/>
                                        </a>
                                    </td>

                            </xsl:when>
                            <xsl:otherwise>

                                    <td><img src="/i/coders_icon.gif" alt="" width="10" height="10" hspace="4" border="0"/></td>
                                    <td>
                                    <xsl:attribute name="CLASS">
                                    <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="postroundrating"/></xsl:with-param></xsl:call-template>
                                    </xsl:attribute>
                                    <xsl:value-of select="handle"/>
                                    </td>

                            </xsl:otherwise></xsl:choose>

                                    <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(codingpoints, '0.00')"/></td>
                                    <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                    <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(challengepoints, '0.00')"/></td>
                                    <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                    <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(testpoints, '0.00')"/></td>
                                    <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                    <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(finalpoints, '0.00')"/></td>
                                    <td class="statText" valign="middle" align="right">

                            <xsl:choose>
                            <xsl:when test="advanced='Y'">
                                        Yes
                            </xsl:when>
                            <xsl:otherwise>
                                        No
                            </xsl:otherwise>
                            </xsl:choose>

                                    </td>
                                    <td class="statText" valign="middle" align="right">

                            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(preroundrating, '0')"/></xsl:with-param></xsl:call-template>

                                    </td>
                                    <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                    <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(ratingdifference, '0.00')"/></td>
                                    <td class="statText" valign="middle" align="right">&#160;&#160;</td>
                                    <td class="statText" valign="middle" align="right">

                            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(postroundrating, '0')"/></xsl:with-param></xsl:call-template>

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

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0"/><br />

<!-- Getting Started Arena Begins -->
            <xsl:call-template name="arena"/>
<!-- Getting Started Arena Ends -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />
        
<!-- Press Room Highlights Begins -->
            <xsl:call-template name="tc_updates"/>
<!-- Press Room Highlights Ends -->

            <p><br/></p>

        </td>
  <!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td valign="top" class="statText" width="244">

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

<!--SRM Sponsor Starts-->
            <xsl:call-template name="srm_sponsor"/>
<!--SRM Sponsor Ends-->

<!-- Coder of the Month Begins -->
            <xsl:call-template name="coder_of_month"/>
<!-- Coder of the Month Ends -->

<!-- Member Surveys begins -->
            <xsl:call-template name="member_surveys"/>
<!-- Member Surveys ends -->

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><td height="17" bgcolor="#838383"><img src="/i/module_labels_comp_leaders.gif" alt="Competition Leaders" width="244" height="20" border="0" /></td></tr>
                <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
                <tr>
                    <td>

            <xsl:choose>
                <xsl:when test="number(/TC/Rating)&lt;1200">
                    <xsl:call-template name="top_scorers"><xsl:with-param name="division">2</xsl:with-param></xsl:call-template>
                </xsl:when>

                <xsl:otherwise>
                    <xsl:call-template name="top_scorers"><xsl:with-param name="division">1</xsl:with-param></xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>

                    </td>
                </tr>
            </table>

            <xsl:call-template name="top_10_coders" />
            <img src="/i/clear.gif" width="1" height="1" border="0" />

            <xsl:call-template name="top_10_schools" />
            <img src="/i/clear.gif" width="1" height="1" border="0" />

            <xsl:call-template name="top_5_countries" />
            <img src="/i/clear.gif" width="1" height="10" border="0" />

<!-- Statistics Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#EEEEEE">
                <tr><td bgcolor="#838383"><img src="/i/label_quick_stats_home.gif" alt="Statistics" width="244" height="20" border="0" /></td></tr>
                <tr>
                    <td><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /><br/>
                        <table border="0" cellspacing="5" cellpadding="0" width="100%">
                            <tr><td class="bodyText">Select a Statistic from the menu below.</td></tr>
                            <xsl:call-template name="quick_stats_pulldown"/>
                        </table></td>
                </tr>
            </table>
            <img src="/i/home_right_bottom.gif" width="244" height="20" border="0" />
<!-- Statistics Ends -->
            <p><br/></p>
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

</xsl:template>
</xsl:stylesheet>