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
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_semiroom2"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                        <td valign="middle" class="statText" width="99%">
                            <p><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                            <font size="3"><strong>The 2003 TopCoder Collegiate Challenge is going on right now! Experience the competition in real time by loading the 
                            <a class="statText" href="Javascript:arena()"><font size="3">tournament applet</font></a></strong></font><br />
                            <a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>Get more information</a><br />
                            <img src="/i/clear.gif" alt="" width="1" height="5" border="0" /></p>
                        </td>
                        <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_semiroom2"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                    </tr>
                </table>

<!-- TCCC03 Room 2 begins-->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 2 Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/room2_main.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">dmwright at his workstation during Round 2.</td></tr>
                        </table>
                                
                        <h2>dmright!</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Friday, April 4, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets">View current bracket</a></p>

                        <p>Consistently calm, <strong>dmwright</strong> showed why this is his 5th straight appearance at the onsite finals by outpacing 
                        his competitors in Round 2. Everyone started the round by opening the 200 pointer first. <strong>niteneb</strong> inched out 
                        <strong>dmwright</strong> with the first submission for 183.76 points&#151;<strong>dmwright</strong> came in right behind with 183.56 points.  
                        <strong>axch</strong> followed closely behind with 179.47 points, with <strong>mathewsb</strong> rounding off the 200 pointers with 174.94 points.</p>

                        <p>Everyone stayed with the ascending order and opened the 500 next.  <strong>dmwright</strong> was the first to submit this 
                        time, getting 364.04 points.  He immediately moved on to the 1050 pointer.  <strong>mathewsb</strong> picked up the pace and 
                        submitted next on the 500 for 336.93 points.  <strong>axch</strong> had the 7th submission of the round for 255.86 points.  
                        Before <strong>niteneb</strong> could turn in an answer for his 500, <strong>dmwright</strong> submitted his solution to the 1050 for 657.00.  
                        <strong>niteneb</strong> sent in the last 2 submissions of the round with 225.73 points on his 500 and 792.41 points on his 
                        1050.  With just a few seconds left in the coding phase, <strong>niteneb</strong> resubmitted his 1050 pointer, losing an 
                        additional 158.77 points.  The end of the coding phase saw the following scores:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1204.60</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">niteneb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1042.13</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">mathewsb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">511.87</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">axch</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">435.33</td>
                             </tr>
                        </table>		

                        <p>The Challenge Phase brought a bit more excitement this round, but no score increases.  <strong>mathewsb</strong> 
                        unsuccessfully challenged <strong>axch's</strong> 500 pointer, while <strong>dmwright</strong> unsuccessfully challenged <strong>niteneb's</strong> 1050 
                        pointer.  Both coders lost 50 points.</p>

                        <p>System tests broke the 1050 submissions of both <strong>dmwright</strong> and <strong>niteneb,</strong> and left all other submissions 
                        standing.  The final scores for Round 2 were as follows:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">497.60</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">niteneb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">461.87</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">mathewsb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">435.33</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">axch</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">409.49</td>
                             </tr>
                        </table>		

                        <p>Great job, <strong>dmwright!</strong>  May next round's competitors learn from your experience.</p>

                        <p>Up next:<br />
                        <strong>ante</strong><br />
                        <strong>bstanescu</strong><br />
                        <strong>sjelkjd</strong><br />
                        <strong>WhiteShadow</strong></p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Semifinal Room 2 Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_01.jpg');"><img src="/i/tournament/tccc03/room2_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_02.jpg');"><img src="/i/tournament/tccc03/room2_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_03.jpg');"><img src="/i/tournament/tccc03/room2_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_04.jpg');"><img src="/i/tournament/tccc03/room2_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_05.jpg');"><img src="/i/tournament/tccc03/room2_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/room2_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_06.jpg');"><img src="/i/tournament/tccc03/room2_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_07.jpg');"><img src="/i/tournament/tccc03/room2_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_08.jpg');"><img src="/i/tournament/tccc03/room2_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_09.jpg');"><img src="/i/tournament/tccc03/room2_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_10.jpg');"><img src="/i/tournament/tccc03/room2_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>            
            </table>
<!-- TCCC03 Room 2 ends -->            
            
<!-- Summary/Best/Worst Begins
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td valign="middle" width="184"><img src="/i/label_srm_summary.gif" alt="Last Match Summary" width="192" height="30" border="0" align="left" /></td>
                        <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    </tr>
                </table>

                <table border="0" cellspacing="1" cellpadding="0" width="100%">
                    <tr>
                        <td valign="top" colspan="3" class="bodyText"><a class="bodyGeneric">
                            <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><strong>Single Round Match 140</strong></a><br />
                            Wednesday, March 26, 2003<br /><br />
                        </td>
                    </tr>

                    <tr>
                        <td valign="middle" align="center" bgcolor="#CCCCCC" width="33%" nowrap="nowrap" height="15">
                            <a class="bodyGeneric">
                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>Division Leaders</a>
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
                                <tr><td valign="middle" height="17" align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best / Worst Rating Change</td></tr>
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
 Summary/Best/Worst Ends -->


<!-- Coder Point of View Begins
            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
                <tr><td valign="top" colspan="3"><img src="/i/label_coders_pov.gif" alt="Coder's Point of View" width="154" height="30" border="0" /></td></tr>

                <tr valign="top">
                    <td width="55" class="bodyText">
                        <img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" vspace="5"/><br />
                        By&#160;<strong>Yarin</strong><br/>
                        <span class="smallText"><em>TopCoder Member</em></span></td>
                    <td width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p><strong>Single Round Match 140</strong><br />
                        <a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm140_prob</xsl:attribute><strong>Problem Set Analysis &amp; Opinion</strong></a></p>

                        <p>Another difficult Division-I hard problem made the competition miserable for everyone in Division-I. After the system 
                        testing phase, none of the 11 submissions were still standing. The other two problems had high acceptance rates, and 
                        very few successful challenges were delivered on those two. <b>radeye</b> became the top scorer in Divison-I thanks to two 
                        fast submissions and two successful challenges. Division-II had a well balanced problem set where several people got 
                        all three problems, and <b>fx4m</b> was the one to get them all fastest.</p>
                    </td>
                </tr>
            </table>
 End of Point of View -->

<!--            <hr width="100%" size="1px" color="43515E" />

 Feature
            <table border="0" cellspacing="1" cellpadding="0" width="100%">
                <tr>
                    <td valign="top" width="55" align="left" class="bodyText">
                        <a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" vspace="5" /></a></td>
                    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0" /></td>
                    <td valign="top" width="100%" align="left" class="bodyText">
                        <p><a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_031703</xsl:attribute>
                        <img src="/i/label_feature_title.gif" alt="Component-Based Development: TopCoder Style" width="400" height="30" border="0" /></a><br />
                        Monday, March 17, 2003</p>

                        <p>By&#160;<strong>srowen</strong><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>There is programming, and there is software development. You, dear TopCoder member, demonstrate weekly that you 
                        can solve well-stated programming puzzles quickly.</p>
                        
                        <p>Yet solutions to real-world problems require more: deciding *what* puzzles must be solved, describing them thoroughly, 
                        developing solutions that are open to change, and verifying those solutions: design, documentation and testing. 
                        Together with the actual programming, these make up the software development process...
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_031703</xsl:attribute>&gt;&#160;full&#160;story</a>
                        </p>
                    </td>
                </tr>
            </table>
 Feature ends -->

            <hr width="100%" size="1px" color="43515E" />

            <xsl:call-template name="tc_updates"/>

            <hr width="100%" size="1px" color="43515E" />

            <xsl:call-template name="arena"/>

            <hr width="100%" size="1px" color="43515E" />

<!-- TC special promo -->
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="Arial, Helvetica, Sans-serif"><strong>Sponsorships</strong></font><br />TopCoder offers sponsorship programs for the weekly
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>Single Round Matches</a> as well as for
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</a>. Read more about our
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</a>.<br /></td>
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="Arial, Helvetica, Sans-serif"><strong>Employment Services</strong></font><br />TopCoder works with companies to connect them with top-rated developers. Read more about our
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
              <!--   <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="javascript:void window.open('http://www.gentleware.com')" /> -->
               <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?&amp;t=tces&amp;c=index" /> 
                <area shape="poly" alt="SRM Match 139" coords="0,93, 107,93, 120,106, 238,106, 238,155, 19,155, 0,137" href="/?RoundId=4495&amp;t=schedule&amp;c=srm" />
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
            <a href="/?t=development&amp;c=bonus_contest_0303"><img src="/i/development/tcs_congrats_winner.gif" alt="Congratulations to pops, our $2000 Component Design Contest Winner" border="0" width="244" height="144" /></a><br />
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
