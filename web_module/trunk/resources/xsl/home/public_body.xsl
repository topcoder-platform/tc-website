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
  <xsl:import href="../includes/modules/top_5_states.xsl"/>
  <xsl:import href="../includes/modules/top_5_countries.xsl"/>
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

<!-- Left Column Begins -->
    <tr valign="top">
        <td width="170" bgcolor="#000000">
            <xsl:call-template name="global_left"/>
<!-- Do Not Delete This Line --><font size="1" color="#000000" face="tahoma">HiddenWord</font>
        </td>

<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" alt="" width="1" height="6" border="0" /><br />
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

<!-- TCCC03 Champion Summary begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
                <tr><td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Championship Summary</font></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/champ_main.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">dgarthur is the 2003 TopCoder Collegiate Challenge Champion</td></tr>
                        </table>
                                
                        <h2>dgarthur takes home the crown</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Saturday, April 5, 2003<br />
                        <a href="/index?t=tournaments&amp;c=tccc03_brackets" class="bodyText">View final bracket</a></p>

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

                        <p><strong>Yarin</strong> sent in the 7th submission of the round and added 760.04 points to his total. <A href="/index?t=tournaments&amp;c=tccc03_champ" class="bodyText"><strong>Read More</strong></A></p>
                    </td>
                </tr>
                <tr><td height="3"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
            </table>
<!-- TCCC03 Champion Summary ends -->

<!-- Summary/Best/Worst Begins  -->
            <table width="100%" border="0" cellspacing="0" cellpadding="3">                     
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 142</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><A HREF="/stat?&amp;c=last_match" class="bodyText"><strong>View Summary</strong></A></td>
                </tr>
            </table>
            
                <table border="0" cellspacing="0" cellpadding="3" width="100%">
                    <tr>
                        <td valign="top" colspan="3" class="bodyText">Tuesday, April 15, 2003</td>
                    </tr>
                    
                    <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>

                    <tr>
                        <td valign="middle" align="center" bgcolor="#093158" width="33%" nowrap="nowrap" height="15">
                            <a class="statTextBig">
                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>Division Leaders</a>
                        </td>
                        <td valign="middle" align="center" bgcolor="#093158" width="34%" nowrap="nowrap">
                            <a class="statTextBig">
                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>Problem Stats</a>
                        </td>
                        <td valign="middle" align="center" bgcolor="#093158" width="33%" nowrap="nowrap">
                            <a class="statTextBig">
                            <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>Results</a>
                        </td>
                    </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#001935">
                    <tr><td align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best / Worst Rating Change</td></tr>

                    <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">

                    <tr valign="middle">
                        <td width="20%" class="statTextBig" nowrap="nowrap">&#160;&#160;&#160;<xsl:value-of select="division"/></td>
                        <td width="10%" class="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</td>
                        <td width="35%" class="statText" nowrap="nowrap">
                            <A>
                            <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                            <xsl:attribute name="CLASS">bodyText</xsl:attribute>

                            <font>
                            <xsl:attribute name="color">
                                <xsl:call-template name="GetRatingColor">
                                    <xsl:with-param name="rating">
                                    <xsl:value-of select="rating"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:value-of select="handle"/>
                            </font>
                            </A>
                        </td>
                        <td width="15%" class="statText" align="center"><xsl:value-of select="change"/></td>
                        <td width="20%" class="statText" nowrap="nowrap"><xsl:value-of select="room_name"/></td>
                    </tr>

                    </xsl:for-each>
            </table>
<!-- Summary/Best/Worst Ends -->
                
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

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

<!--                        <img src="/i/m/lbackstrom_mug.jpg" alt="" width="55" height="61" border="0" vspace="5"/><br />
                        By&#160;<strong>lbackstrom</strong><br/>
                        <span class="smallText"><em>TopCoder Member</em></span> -->
                        
                        <img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" vspace="5" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=269554"><strong>Yarin</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span>
                        
                    </td>
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p><font size="4"><strong>Single Round Match 142</strong></font><br />
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm142_prob</xsl:attribute><font size="4"><strong>Problem Set Analysis &amp; Opinion</strong></font></a></p>

                        <p>The top two scorers in Division-I, <strong>Yarin</strong> and <strong>dgarthur</strong> were the same as in the recent TCCC final, but 
                        this time with <strong>Yarin</strong> as the winner. In third place came <strong>dary</strong> after a very impressive performance in only 
                        his second SRM! In Division-II, <strong>PJYelton</strong> took a comfortable win after delivering 5 successful challenges. The 
                        difficulty level of the problem set was very good, with a good distribution of scores and submits. 
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm142_prob</xsl:attribute><strong>full&#160;story</strong></a></p>
                    </td>
                </tr>
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>
 <!-- End of Point of View -->

<!--            <hr width="100%" size="1px" color="43515E" />  -->

<!-- Feature -->
            <table width="100%" border="0" cellspacing="0" cellpadding="3">                     
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Feature</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/?t=features&amp;c=index" class="bodyText"><strong>View All</strong></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr>
                    <td valign="top" width="55" align="left" class="bodyText">
                        <a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" vspace="5" /></a></td>
                    
                    <td valign="top" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                    
                    <td valign="top" width="100%" align="left" class="bodyText">
                        <p><a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_040803</xsl:attribute><font size="4"><strong>TopCoder Competitions vs. The Real World</strong></font></a><br />
                        Tuesday, April 8, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=303718"><strong>nicomp</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>Reality Television has become extremely popular. TV networks combine groups of 'average' people, place them under 
                        modest duress, and film the proceedings. Of course the stress of surviving on a jungle island or selecting a beau from 
                        50 attractive strangers pales in comparison to cranking out the 1000 point problem in the last 15 minutes of an SRM.
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_040803</xsl:attribute><strong>full&#160;story</strong></a></p>
                    </td>
                </tr>

                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>
<!-- Feature ends -->

<!-- Press Room Highlights Include -->
            <xsl:call-template name="tc_updates"/>

<!-- Java Web Start Include -->
            <xsl:call-template name="arena"/>

<!-- TC special promo -->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="top">
                    <td class="statTextLarge" bgcolor="#999999" width="49%"><font size="3">Sponsorships</font></td>
                    <td class="statTextLarge" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                    <td class="statTextLarge" bgcolor="#999999" width="49%"><font size="3">Employment Services</font></td>
                </tr>
                    
                <tr valign="top">
                    <td width="50%" align="left" class="bodyText">
                        TopCoder offers sponsorship programs for the weekly <a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>Single Round Matches</a> 
                        as well as for <a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</a>. Read 
                        more about our <a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</a>.<br />
                    </td>

                    <td class="statTextLarge" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>

                    <td width="50%" align="left" class="bodyText">
                        TopCoder works with companies to connect them with top-rated developers. Read more about our <a class="bodyText">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>employment services</a>.<br />
                    </td>
                </tr>

                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>
        </td>
  <!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td valign="top" class="statText" width="244" bgcolor="#001935">

<!--SRM Sponsor Starts-->
            <img src="/i/es/srmanimation_home.gif" alt="" width="244" height="142" border="0" usemap="#srmanimation_home" /><br />
            <map name="srmanimation_home">
            <!-- <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="javascript:void window.open('http://www.gentleware.com')" />  --> 
            <area shape="poly" alt="TCES" coords="238,24, 238,106, 120,106, 107,93, 0,93, 0,24" href="/?&amp;t=tces&amp;c=index" />
            <area shape="poly" alt="SRM Match 143" coords="0,93, 107,93, 120,106, 238,106, 238,155, 19,155, 0,137" href="/?RoundId=4515&amp;t=schedule&amp;c=srm" />
            </map>
<!--SRM Sponsor Ends-->

<!-- Coder of the Month Begins -->
            <a href="/stat?c=member_profile&amp;cr=285916"><img src="/i/codermonth_mar03.gif" alt="Coder of the Month" width="244" height="119" border="0" /></a><br />
<!-- Coder of the Month ends -->

<!-- TCES Quote Begins
            <map name="tcesMap">
            <area shape="rect" alt="" coords="33,89,159,104" href="/?t=schedule&amp;c=index"></area>
            <area shape="rect" alt="" coords="3,3,239,23" href="/?t=tces&amp;c=index"></area>
            </map>
            <img src="/i/tces_quote.gif" width="244" height="138" alt="Only rated members can apply for TCES jobs" border="0" usemap="#tcesMap" />
 TCES Quote Ends -->

<!-- TCS Promo Begins -->
            <a href="?t=development&amp;c=index"><img src="/i/header_software_development.gif" alt="Software Development" width="244" height="20" border="0" /></a><br />
            <a href="/?t=development&amp;c=des_bonus_contest_2"><img src="/i/development/tcs_des_bonus2_promo.gif" alt="Component Design Contest 2: $6000 total prizes" border="0" width="244" height="113" /></a><br />
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

            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#001935">
                <tr valign="top"><td height="17" class="moduleTitle" bgcolor="#093158"><img src="/i/module_labels_comp_leaders.gif" alt="Competition Leaders" width="244" height="20" border="0" /></td></tr>
                <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
            </table>

            <xsl:call-template name="top_10_coders" />
            <xsl:call-template name="top_10_schools" />
<!--             <xsl:call-template name="top_5_states" />  -->
            <xsl:call-template name="top_5_countries" />

<!-- Statistics Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
                <tr><td colspan="3" bgcolor="#093158"><img src="/i/label_quick_stats_home.gif" alt="Statistics" width="244" height="20" border="0" /></td></tr>
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
        </td>
    </tr>
</table>

  </xsl:template>
</xsl:stylesheet>
