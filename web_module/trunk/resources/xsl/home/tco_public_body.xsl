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
  <xsl:import href="../includes/modules/small_promos.xsl"/>
  <xsl:import href="../includes/modules/corp_promos.xsl"/>
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
                        was going to win," tomek said with a grin. <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final">Read the whole story</A></p>
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

            <p><br/></p>

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

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><td height="17" bgcolor="#838383"><img src="/i/module_labels_comp_leaders.gif" alt="Competition Leaders" width="244" height="20" border="0" /></td></tr>
            </table>
            <img src="/i/clear.gif" width="1" height="1" border="0" />

            <xsl:call-template name="top_10_coders" />
            <img src="/i/clear.gif" width="1" height="1" border="0" />

            <xsl:call-template name="top_10_schools" />
            <img src="/i/clear.gif" width="1" height="1" border="0" />

            <xsl:call-template name="top_5_countries" />
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0" />

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