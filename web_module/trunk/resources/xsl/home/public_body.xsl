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
                            <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><strong>TCCC 03 Regional Finals</strong></a><br />
                            Wednesday, March 12, 2003<br /><br />
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
                    <td valign="top" width="55" align="left" class="bodyText" rowspan="2"><img src="/i/m/brett1479_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br />
                        By&#160;brett1479<br/><i>[TC]&#160;Member</i><br /></td>
                    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td valign="top" width="100%" align="left" class="bodyText" colspan="2">
                        <font size="2" color="#000000" face="arial, verdana"><strong>TCCC 03 Regional Finals</strong></font></td>
                </tr>

                <tr>
                    <td valign="top" class="bodyText" width="100%">
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=tccc03_regfinal_prob</xsl:attribute><strong>Problem Set Analysis &amp; Opinion</strong></a><br />

                        <p>This round of the Collegiate Championship was clearly a notch more difficult than all previous rounds. bstanescu, 
                        the only competitor to sucessfully complete the hard problem, received the highest score for the round. Along with 
                        the the challenging hard, coders were faced with an incredibly tricky medium problem. The 550 caught many competitors 
                        by surprise with its unusual style. The easy problem, a relatively simple dynamic programming exercise, would have 
                        been a medium had it been a normal SRM. If this round is any indication of the future, competitors will need to be 
                        in top form to score above 1000 in the upcoming rounds.</p>
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
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_031703</xsl:attribute>
                        <strong>Component-Based Development: TopCoder Style</strong></a><br />
                        Monday, March 17, 2003<br />

                        <p>By&#160;srowen<br /><i>TopCoder Member</i></p>
                        
                        <p>There is programming, and there is software development. You, dear TopCoder member, demonstrate weekly that you 
                        can solve well-stated programming puzzles quickly.</p>
						<p>Yet solutions to real-world problems require more: deciding *what* puzzles must be solved, describing them thoroughly, 
						developing solutions that are open to change, and verifying those solutions: design, documentation and testing. 
						Together with the actual programming, these make up the software development process...
						<a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_031703</xsl:attribute>full&#160;story</a>
                    	</p>
                    </td>
                </tr>
            </table>
<!-- Feature ends -->

            <hr width="100%" size="1px" color="43515E" />

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
               <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="javascript:void window.open('http://www.gentleware.com')" />
<!--                 <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?&amp;t=tces&amp;c=index" /> -->
                <area shape="poly" alt="SRM Match 139" coords="0,93, 107,93, 120,106, 238,106, 238,155, 19,155, 0,137" href="/?RoundId=4485&amp;t=schedule&amp;c=srm" />
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
            <a href="/index?t=development&amp;c=online_review&amp;t=app"><img src="/i/development/tcs_new_app_project.gif" alt="New Application Project" width="244" height="107" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="1" height="2" border="0" /><br />
            <a href="/?&amp;t=development&amp;c=components"><img src="/i/development/tcs_royalties_2.gif" alt="Royalty Payments" width="244" height="50" border="0" /></a><br />
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
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="right">96.57</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>
                
                
                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278595">seaniswise</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">95.42</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>
                
                
                 <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">93.77</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>
                

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261822">bodrius</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">90.60</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                     <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="statText" align="center">4</td>
                   <td class="statText" align="right">90.42</td>
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

                <tr><td align="center" class="statText" colspan="4">More Leaders</td></tr>

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
                <tr><td><a href="/stat?c=member_profile&amp;cr=310056"><img src="/i/codermonth_feb03.gif" alt="Coder of the Month" width="244" height="149" vspace="10" border="0" /></a></td></tr>
            </table>
<!-- Coder of the Month ends -->
        </td>
    </tr>
</table>

  </xsl:template>
</xsl:stylesheet>
