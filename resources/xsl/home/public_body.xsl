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
  <xsl:import href="../includes/modules/srm_sponsor.xsl"/>
  <xsl:import href="../includes/modules/coder_of_month.xsl"/>
  <xsl:import href="../includes/modules/srm_best_worst.xsl"/>
  <xsl:import href="../includes/modules/coder_pov.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">

<!-- Left Column Begins -->
    <tr valign="top">
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/><br />
<!-- Do Not Delete This Line --><font size="1" color="#CCCCCC" face="tahoma">HiddenWord</font>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        
            <img src="/i/clear.gif" alt="" width="1" height="6" border="0" /><br />
        
<!-- Catalog Intro begins -->
            <table border="0" cellspacing="0" cellpadding="0">
                <tr><td colspan="3" height="60"><A href="http://software.topcoder.com/pages/s_learn.jsp" target="_top"><img src="/i/promos/catalog_intro/catalog_intro_title.gif" alt="Introducing the TopCoder Software Component Catalog" width="556" height="60" border="0" /></A></td></tr>
                <tr>
                    <td width="220" height="100"><A href="http://software.topcoder.com/pages/s_learn.jsp#personal" target="_top"><img src="/i/promos/catalog_intro/catalog_intro_personal.gif" alt="Personal" width="220" height="100" border="0" /></A></td>
                    <td width="126" height="100"><A href="http://software.topcoder.com/pages/s_learn.jsp" target="_top"><img src="/i/promos/catalog_intro/catalog_intro_icon.gif" alt="" width="126" height="100" border="0" /></A></td>
                    <td width="210" height="100"><A href="http://software.topcoder.com/pages/s_learn.jsp#professional" target="_top"><img src="/i/promos/catalog_intro/catalog_intro_professional.gif" alt="Professional" width="210" height="100" border="0" /></A></td>
                </tr>
                <tr><td colspan="3" height="20"><img src="/i/promos/catalog_intro/catalog_intro_nav.gif" alt="" width="556" height="20" border="0" usemap="#catalog_intro_map" /></td></tr>
            </table>

            <map name="catalog_intro_map">
                <area shape="rect" alt="Buy now" coords="334,0,396,18" href="http://software.topcoder.com/pages/s_subscriptions.jsp" target="_top" />
                <area shape="rect" alt="Browse catalog" coords="235,0,333,18" href="http://software.topcoder.com/pages/c_showroom.jsp" target="_top" />
                <area shape="rect" alt="Learn more" coords="158,0,234,18" href="http://software.topcoder.com/pages/s_learn.jsp" target="_top" />
            </map>
<!-- Catalog Intro ends -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />

<!-- Sun JavaOne promo begins
            <table border="0" cellspacing="0" cellpadding="0" background="/i/promos/javaone_2003/javaone_bkgd.gif" width="100%">
                <tr><td rowspan="3" width="138" height="89"><A href="/?t=sponsor&amp;c=javaone2003" target="_top"><img src="/i/promos/javaone_2003/promo_horz_logo.gif" alt="Sun's 2003 Worldwide Java Developer Conference" width="138" height="89" border="0" /></A></td></tr>
                <tr>
                    <td width="99%" height="25" valign="middle"><A href="/?t=sponsor&amp;c=javaone2003" target="_top"><img src="/i/promos/javaone_2003/javaone_coding_challenge.gif" alt="JavaOne Coding Challenge" width="231" height="20" border="0" /></A></td>
                    <td width="113" height="25" align="right" valign="bottom"><A href="/?t=sponsor&amp;c=javaone2003" target="_top"><img src="/i/promos/javaone_2003/powered_by_topcoder.gif" alt="Powered by TopCoder" width="113" height="16" border="0" /></A></td>
                </tr>
                <tr><td colspan="2" height="64" valign="middle"><A href="/?t=sponsor&amp;c=javaone2003" target="_top"><img src="/i/promos/javaone_2003/sun_2003_wjdc.gif" alt="Sun's 2003 Worldwide Java Developer Conference" width="381" height="52" border="0" /></A></td></tr>
            </table>
 Sun JavaOne promo ends

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br /> -->

<!-- Summary/Best/Worst Begins  -->
            <xsl:call-template name="srm_best_worst"/>
<!-- Summary/Best/Worst Ends -->

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

<!-- Coder Point of View Begins-->
            <xsl:call-template name="coder_pov"/>
<!-- Coder of Point of View Ends -->
 
<!-- Feature -->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Feature</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/?t=features&amp;c=index" class="bodyText"><strong>View All</strong></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="3" cellpadding="0" width="100%">
                <tr>
                    <td width="85" class="bodyText"  valign="top">
                        <!--<a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" vspace="5" /></a>-->
                        <img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" vspace="5" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=273217"><strong>schveiguy</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br/>
                        <img src="/i/clear.gif" alt="" width="85" height="1" border="0" />
                    </td>

                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

                    <td  width="99%" class="bodyText"  valign="top">
                        <p><a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_052703</xsl:attribute><font size="4"><strong>Threads and Atomicity</strong></font></a><br />
                        Tuesday, May 27, 2003</p>

                        <p>It has been quite a while since I was introduced to the concept of threads. Since then, I have learned many interesting 
                        features&#151;and headaches&#151;associated with them.  This article discusses probably the most important concept that you as a 
                        thread programmer need to know: atomicity.
                        <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_052703</xsl:attribute><strong>full&#160;story</strong></a></p>
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
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td valign="top" class="statText" width="244" bgcolor="#001935">

<!--SRM Sponsor Starts-->
            <xsl:call-template name="srm_sponsor"/>
<!--SRM Sponsor Ends-->

<!-- Coder of the Month Begins -->
            <xsl:call-template name="coder_of_month"/>
<!-- Coder of the Month ends -->

<!-- TCS Promo Begins -->
            <a href="?t=development&amp;c=index"><img src="/i/header_software_development.gif" alt="Software Development" width="244" height="20" border="0" /></a><br />
            <a href="/?t=development&amp;c=des_bonus_contest_2"><img src="/i/development/tcs_des_bonus2_promo.gif" alt="Component Design Contest 2: $6000 total prizes" border="0" width="244" height="113" /></a><br />

<!-- Bonus Contest-->
            <img src="/i/clear.gif" alt="" width="1" height="2" border="0" /><br />
            <a href="/?t=development&amp;c=des_bonus_contest_2"><img src="/i/header_contest_leaders.gif" alt="Contest Leaders" width="244" height="20" border="0" /></a><br />

            <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#001935">
                <tr valign="middle">
                	<td background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="1" height="1" border="0" /></td>
                    <td width="40%" class="statText" background="/i/steel_bluebv_bg.gif">Handle</td>
                    <td width="20%" class="statText" align="center" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Submissions</td>
                    <td width="39%" class="statText" align="right" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Avg. Score</td>
                </tr>
               
                <tr valign="top">
                	<td width="1"><img src="/i/clear.gif" width="1" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">98.75</td>
                </tr>
                
                <tr valign="top">
                	<td width="1"><img src="/i/clear.gif" width="1" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=304697">ozzie</a></td>
                    <td class="statText" align="center">1</td>
                    <td class="statText" align="right">90.83</td>
                </tr>
                
                 <tr valign="top">
                	<td width="1"><img src="/i/clear.gif" width="1" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907">WishingBone</a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="right">89.26</td>
                </tr>
                
                <tr valign="top">
                	<td width="1"><img src="/i/clear.gif" width="1" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278342">adic</a></td>
                    <td class="statText" align="center">2</td>
                    <td class="statText" align="right">89.16</td>
                </tr>
                
                <tr valign="top">
                	<td width="1"><img src="/i/clear.gif" width="1" height="1" border="0" /></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546">TangentZ</a></td>
                    <td class="statText" align="center">3</td>
                    <td class="statText" align="right">88.37</td>
                </tr>

                <tr valign="top">
                    <td width="25%" colspan="4"><img src="/i/clear.gif" width="1" height="3" border="0" /></td>
                </tr>
            </table>

           <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
                <tr><td height="20" class="moduleTitle"><a href="?t=development&amp;c=comp_projects"><img src="/i/tcs_contest_promo_bottom.gif" alt="Win $2000" width="244" height="22" border="0" /></a></td></tr>
            </table>
 <!-- Bonus Contest Ends-->

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="4" border="0" /></td></tr>
            </table>  

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
