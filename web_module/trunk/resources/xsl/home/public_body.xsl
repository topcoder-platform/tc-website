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
  <xsl:import href="../includes/modules/big_promo.xsl"/>
  <xsl:import href="../includes/modules/small_promo.xsl"/>
  <xsl:import href="../includes/modules/feature_home.xsl"/>
  <xsl:import href="../includes/modules/tcs_promo.xsl"/>
  <xsl:import href="../includes/modules/right_promo.xsl"/>
  <xsl:import href="../includes/modules/member_surveys.xsl"/>
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
        
<!-- Big Promo begins -->
            <xsl:call-template name="big_promo"/>
<!-- Big Promo ends -->

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />

            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="42" align="center"><a href="/tc?module=static&amp;d1=crpf&amp;d2=index"  target="_top"><img src="/i/promos/crpf_promo_third.gif" alt="crpf starts november 11" width="170" height="120" border="0"/></a></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="42" align="center"><a href="/pl/?&amp;module=static&amp;d1=google&amp;d2=google_overview"  target="_blank"><img src="/i/promos/google_promo_third.gif" alt="google registration starts oct 1" width="170" height="120" border="0"/></a></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="42" align="center"><img src="/i/promos/cio_promo_third.gif" alt="what do you think of your cio?" width="170" height="120" border="0" usemap="#cio_promo_map"/></td>
                </tr>
            </table>

            <map name="cio_promo_map">
                <area shape="rect" alt="Read the results" coords="5,83,89,98" href="http://www.cio.com/archive/091503/staffsurvey.html" target="_blank" />
                <area shape="rect" alt="Create your own poll" coords="5,99,110,115" href="mailto:marketing@topcoder.com?subject=Send me information about creating polls for IT professionals" target="_top" />
            </map>

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />
        
<!-- Summary/Best/Worst Begins  -->
            <xsl:call-template name="srm_best_worst"/>
<!-- Summary/Best/Worst Ends -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />

<!-- Coder Point of View Begins-->
            <xsl:call-template name="coder_pov"/>
<!-- Coder of Point of View Ends -->
 
<!-- Feature -->
            <xsl:call-template name="feature_home"/>
<!-- Feature ends -->

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />

<!-- Press Room Highlights Begins -->
            <xsl:call-template name="tc_updates"/>
<!-- Press Room Highlights Ends -->

<!-- Java Web Start Begins -->
            <xsl:call-template name="arena"/>
<!-- Java Web Start Ends -->

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
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br />

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

<!-- Member Surveys begins -->
            <xsl:call-template name="member_surveys"/>
<!-- Member Surveys ends -->
        
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
                <tr><td><img src="/i/clear.gif" alt="" width="1" height="15" border="0"/></td></tr>
            </table>
<!-- Statistics Ends -->

        </td>
<!-- Right Column Ends -->

    </tr>
</table>

  </xsl:template>
</xsl:stylesheet>
