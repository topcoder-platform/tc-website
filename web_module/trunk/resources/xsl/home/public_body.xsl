<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries2.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>
  <xsl:import href="../includes/modules/coder_week2.xsl"/>
  <xsl:import href="../includes/modules/top_10_coders2.xsl"/>
  <xsl:import href="../includes/modules/top_10_schools.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/editorials.xsl"/>
  <xsl:import href="../includes/modules/simple_search.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr><td valign="top" colspan="3"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

<!-- Left Column Begins -->
        <tr valign="top">
            <td width="170" bgcolor="#000000">

                <xsl:call-template name="global_left"/>

                <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="5" /><br />
<!-- Do Not Delete This Line --><font size="1" color="#000000" face="tahoma">HiddenWord</font>
            </td>

<!-- Left Column Ends -->

<!-- Gutter Begins -->
            <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td width="100%" align="center" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="4" border="0" /><br />
                <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_banner">
                    <tr valign="top">
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                        <td valign="middle" class="statText" width="99%">
                            <p><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                            <strong>When:</strong> Feb. 18th - April 5th, 2003<br />
                            <strong>Where:</strong> the University Park Hotel @ MIT in Cambridge, MA<br />
                            <strong>Total Purse:</strong> $100,000</p>
                            
                            <p><font color="#CC0000"><strong>200 TopCoder Members will win money!</strong></font><br />
                            <a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>Get more information</a><br />
                            <img src="/i/clear.gif" alt="" width="1" height="5" border="0" /></p>
                        </td>
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                    </tr>
                </table>

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
                            <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><strong>2003 TCCC Round 1 NE/SE</strong></a><br />
                            Tuesday, February 18, 2003<br /><br />
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

                    <tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="8" border="0" /></td></tr>
                </table>
<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                <tr><td valign="top" colspan="7"><img src="/i/label_coder_view.gif" alt="Coder's Point of View" width="148" height="26" border="0" /></td></tr>
                
                <tr>
                    <td valign="top" width="55" align="left" class="bodyText" rowspan="2"><img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br />
                        By&#160;lbackstrom<br /><i>[TC]&#160;Member</i><br /></td>
                    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td valign="top" width="100%" align="left" class="bodyText" colspan="2">
                        <font size="2" color="#000000" face="tahoma, verdana"><strong>2003 TCCC Round 1 NE/SE</strong></font></td>
                </tr>

                <tr>
                    <td valign="top" class="bodyText" width="100%">
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=tccc03_nese_prob</xsl:attribute><strong>Problem Set Analysis &amp; Opinion</strong></a><br />

                        <p>The first problem set of the collegiate challenge turned out to be a little bit trickier than previous first round
    problem sets have been, though still easier than the average division 1 problem set.  Only 191 people competed
    from the two regions, and of those only 113 ended up with positive points - 78 from the northeast, and 35 from the
    southeast.  dgarthur was able to complete all three of the problems in an impressive 35 minutes, and with 50 points
    from the challenge phase, he easily took first.  In second, 160 points behind, is insomnia, with 4 successful
    challenges.  Good luck to everyone in the next round! <a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=tccc03_nese_prob</xsl:attribute>Get the analysis</a></p>
                    </td>
                </tr>
            </table>
<!-- End of Point of View -->

            <hr width="100%" size="1px" color="43515E" />

<!-- Feature -->
            <table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                <tr>
                    <td valign="middle" width="40%" bgcolor="#FFFFFF" height="26"><img src="/i/label_feat.gif" alt="Weekly Feature" width="184" height="26" border="0" /></td>
                    <td width="60%" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                </tr>
                
                <tr>
                    <td valign="middle" bgcolor="#CCCCCC" align="center" height="15">
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>
                        Upcoming/Past Features
                        </a>
                    </td>
                    <td valign="middle" bgcolor="#CCCCCC" align="center"> <a class="bodyGeneric">
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>Want to write?</a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                <tr>
                    <td valign="top" width="55" align="left" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                        <!-- <IMG SRC="/i/f/feat_050102_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/> -->
                        <!-- <img src="/i/m/the_gigi_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/> --><br />
                        <a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="15"/></a></td>
                    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td valign="top" width="100%" align="left" class="bodyText"><br />
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_022003</xsl:attribute>
                        <strong>Component-Based Development: Why Hasn't the Vision Met Reality?</strong></a><br />
                        Wednesday, February 20, 2003<br />
                        
                        <p>By&#160;David Tanacea<br /><i>President of TopCoder Software</i></p>

                        <p>For years now, we in the software development industry have been extolling the virtues of component-based development (CBD). The 
                        benefits of object-oriented design and component-based development seem obvious: </p>

                        <ul>
                            <li>Reusing software saves money in the development phase of software projects, i.e., the more components you reuse, the less software 
                            you have to build. </li>
                            <li>The more applications in which you use a given component, the more valuable that component becomes.</li>
                            <li>Reusable components enable application developers to customize applications... <a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_022003</xsl:attribute>full&#160;story</a></li>
                        </ul>
                    </td>
                </tr>
            </table>
<!-- Feature ends -->

            <hr width="100%" size="1px" color="43515E" />

<!-- Coder of the Week Begins -->
   <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->

            <xsl:call-template name="tc_updates"/>

            <hr width="100%" size="1px" color="43515E" />

            <xsl:call-template name="arena"/>

            <hr width="100%" size="1px" color="43515E" />

<!-- TC special promo -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="tahoma, verdana"><strong>Sponsorships</strong></font><br />TopCoder offers sponsorship programs for the weekly
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>Single Round Matches</a> as well as for
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</a>. Read more about our
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</a>.<br /></td>
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="tahoma, verdana"><strong>Employment Services</strong></font><br />TopCoder works with companies to connect them with top-rated developers. Read more about our
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>employment services</a>.<br /></td>
                </tr>
                
                <tr><td colspan="5"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>
        </td>
  <!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td valign="top" class="statText" width="244"><img src="/i/clear.gif" alt="" width="244" height="1" border="0" /><br />

<!--SRM Sponsor Starts-->
            <img usemap="#srmanimation_home" src="/i/es/srmanimation_home.gif" alt="" width="244" height="160" border="0" /><br />
            <map name="srmanimation_home">
                <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?t=tournaments&amp;c=tccc03_sched" target="_parent" />
<!--                <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?&amp;t=tces&amp;c=index" /> -->
                <area shape="poly" alt="SRM Match 135" coords="0,93, 107,93, 120,106, 238,106, 238,155, 19,155, 0,137" href="/?RoundId=4470&amp;t=schedule&amp;c=srm" />
            </map>
<!--SRM Sponsor Ends-->

<!-- TCES Quote Begins -->
            <map name="tcesMap">
            <area shape="rect" alt="" coords="33,89,159,104" href="/?t=schedule&amp;c=index"></area>
            <area shape="rect" alt="" coords="3,3,239,23" href="/?t=tces&amp;c=index"></area>
            </map>
            <img src="/i/tces_quote.gif" width="244" height="138" alt="Only rated members can apply for TCES jobs" border="0" usemap="#tcesMap" />
<!-- TCES Quote Ends -->

<!-- Software Promo Begins
            <a href="/?&amp;t=development&amp;c=bonus_contest_0303"><img src="/i/tcs_board.gif" alt="TCS" width="244" height="156" vspace="1" border="0" /></a>
Software Promo Ends -->

<!-- TCS Contest Begins -->
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
                <tr><td height="20" class="moduleTitle"><a href="/?t=development&amp;c=bonus_contest_0303"><img src="/i/tcs_contest_promo_top.gif" alt="Win $2000" width="244" height="153" border="0" /></a></td></tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#001935">
                <tr valign="middle">
                    <td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0" /></td>
                    <td width="39%" class="statTextBig" background="/i/steel_bluebv_bg.gif">Handle</td>
                    <td width="20%" class="statTextBig" align="center" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Submissions</td>
                    <td width="39%" class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Avg. Score</td>
                    <td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=155381">djFD</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">97.50</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">96.30</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                     <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=287614">argolite</a></td>
                    <td class="statText" align="center">1</td>
                   <td class="statText" align="right">84.05</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=154754">Ken Vogel</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">83.94</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=281975">keithnigh</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">82.55</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
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
 <!-- Bonus Contest Ends -->

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="6" border="0" /></td></tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#001935">
                <tr valign="top"><td height="17" class="moduleTitle" bgcolor="#333333"><img src="/i/module_labels_10_coders.gif" alt="Competition Leaders" width="244" height="20" border="0" /></td></tr>
                <tr><td><img src="/i/clear.gif" width="1" height="3" border="0" /></td></tr>
            </table>

<xsl:call-template name="top_10_schools"/>
<xsl:call-template name="top_10_coders"/>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="20" height="4" border="0" /></td>
                    <td></td>
                    <td></td>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="10" height="4" border="0" /></td>
                </tr>

                <tr><td align="center" class="statTextBig" colspan="4">More Leaders</td></tr>

                <tr>
                    <td></td>
                    <td align="left" class="statText">Coders</td>
                    <td align="right"><a href="/stat?c=coder_ratings" class="statText">view all</a></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td align="left" class="statText">Schools</td>
                    <td align="right"><a href="/stat?c=school_avg_rating" class="statText">view all</a></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td align="left" class="statText">States</td>
                    <td align="right"><a href="/stat?c=state_avg_rating" class="statText">view all</a></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td align="left" class="statText">Countries</td>
                    <td align="right"><a href="/stat?c=country_avg_rating" class="statText">view all</a></td>
                    <td></td>
                </tr>

                <tr>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="20" height="10" border="0" /></td>
                    <td></td>
                    <td></td>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="10" height="10" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="20" height="10" border="0" /></td>
                    <td></td>
                    <td></td>
                    <td align="left" class="statText"><img src="/i/clear.gif" width="10" height="10" border="0" /></td>
                </tr>
            </table>

<!-- Statistics Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr><td colspan="3" bgcolor="#333333"><img src="/i/label_quick_stats_home.gif" alt="Statistics" width="244" height="20" border="0" /></td></tr>
                <tr>
                    <td rowspan="5"><img src="/i/clear.gif" width="6" height="1" border="0" /></td>
                    <td><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td>
                    <td rowspan="5"><img src="/i/clear.gif" width="6" height="1" border="0" /></td>
                </tr>
                <tr><td class="statText">Select a Statistic from the menu below.</td></tr>
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
                <tr><td class="quickstatText" valign="top">

                <xsl:call-template name="quick_stats_pulldown"/>

                    </td>
                </tr>
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
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
