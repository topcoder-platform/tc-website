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
  <xsl:import href="../includes/modules/tcs_promo.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">

<!-- Left Column Begins -->
    <tr valign="top">
        <td width="180">
            <xsl:call-template name="global_left"/><br />
<!-- Do Not Delete This Line --><font size="1" color="#FFFFFF" face="tahoma">HiddenWord</font>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />
        
<!-- Catalog Intro begins -->
            <table border="0" cellspacing="0" cellpadding="0">
                <tr><td height="42" align="center"><A href="/?t=tournaments&amp;c=tco03_overview" target="_top"><img src="/i/promos/tco03/tco_home_big_a.gif" alt="Save the date!" width="494" height="42" border="0" /></A></td></tr>
                <tr><td height="119" align="center"><A href="/?t=tournaments&amp;c=tco03_overview" target="_top"><img src="/i/promos/tco03/tco_home_big_b.gif" alt="2003 TopCoder Open" width="494" height="119" border="0" /></A></td></tr>
                <tr><td height="64" align="center"><A href="/?t=tournaments&amp;c=tco03_overview" target="_top"><img src="/i/promos/tco03/tco_home_big_c.gif" alt="Qualification rounds start online October 7th" width="494" height="64" border="0" /></A></td></tr>
            </table>
<!-- Catalog Intro ends -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />

<!-- Small Promos begin -->
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="42" align="center"><A href="#" target="_top"><img src="/i/promos/sweden_small.gif" alt="Swedish TopCoder members can earn cash" width="263" height="86" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="64" align="center"><A href="http://software.topcoder.com/pages/s_learn.jsp" target="_top"><img src="/i/promos/tcs_catalog_small.gif" alt="TopCoder Software Component Catalog available" width="263" height="86" border="0" /></A></td>
                </tr>
            </table>
<!-- Small Promos end -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />
        
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
        <td valign="top" class="statText" width="244">
        
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

<!--SRM Sponsor Starts-->
            <xsl:call-template name="srm_sponsor"/>
<!--SRM Sponsor Ends-->

<!-- Coder of the Month Begins -->
            <xsl:call-template name="coder_of_month"/>
<!-- Coder of the Month Ends -->

<!-- TCS Promo Begins -->
            <xsl:call-template name="tcs_promo"/>
<!-- TCS Promo Ends-->
        
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

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
