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

            <div align="center"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_finals"><img src="/i/promos/tco_promo_big.gif" alt="2003 TopCoder Open sponsored by Intel&#174;" width="530" height="164" border="0" /></A></div>

            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="top">
                    <td class="bodyText">

                        <div class="leadPhoto">
                            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final"><img src="/i/clear.gif" alt="" width="200" height="250" class="photoFrameBig" /></A><br/>
                            <span class="leadPhotoCaption">Photo caption.<br/><br/></span>
                        </div>
            
                        <h2>Headline Coding Finals</h2>

                        <p>by <A href="/stat?c=member_profile&amp;cr=159052">lbackstrom</A>, <em>TopCoder Member</em><br />
                        Friday, December 5, 2003</p> 

                        <p>In what was by far the most exciting match of the day, tjq edged out three members with little targets next to their
                        names and advanced to the finals.  Perhaps the 25 hour flight from Hong Kong allowed him to study up on his algorithms
                        while his competition was out partying.  Or maybe his lower rating is just due to the network latency from the states to
                        the other side of the world.  Whatever the reason, tjq was dominant in the room with the highest average rating. 
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final">View the whole story</A></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" width="10" height="10" border="0"/>

            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="top">
                    <td class="bodyText">

                        <div class="leadPhoto">
                            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final"><img src="/i/clear.gif" alt="" width="200" height="250" class="photoFrameBig" /></A><br/>
                            <span class="leadPhotoCaption">Photo caption.<br/><br/></span>
                        </div>
            
                        <h2>Headline Component Design Finals</h2>

                        <p>by <A href="/stat?c=member_profile&amp;cr=296145">srowen</A>, <em>TopCoder Member</em><br />
                        Friday, December 5, 2003</p> 

                        <p>In what was by far the most exciting match of the day, tjq edged out three members with little targets next to their
                        names and advanced to the finals.  Perhaps the 25 hour flight from Hong Kong allowed him to study up on his algorithms
                        while his competition was out partying.  Or maybe his lower rating is just due to the network latency from the states to
                        the other side of the world.  Whatever the reason, tjq was dominant in the room with the highest average rating. 
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final">View the whole story</A></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" width="10" height="10" border="0"/>

            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="top">
                    <td class="bodyText">

                        <div class="leadPhoto">
                            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final#dev"><img src="/i/clear.gif" alt="" width="200" height="250" class="photoFrameBig" /></A><br/>
                            <span class="leadPhotoCaption">Photo caption.<br/><br/></span>
                        </div>
            
                        <h2>Headline Component Development Finals</h2>

                        <p>by <A href="/stat?c=member_profile&amp;cr=296145">srowen</A>, <em>TopCoder Member</em><br />
                        Friday, December 5, 2003</p> 

                        <p>In what was by far the most exciting match of the day, tjq edged out three members with little targets next to their
                        names and advanced to the finals.  Perhaps the 25 hour flight from Hong Kong allowed him to study up on his algorithms
                        while his competition was out partying.  Or maybe his lower rating is just due to the network latency from the states to
                        the other side of the world.  Whatever the reason, tjq was dominant in the room with the highest average rating. 
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=comp_final#dev">View the whole story</A></p>
                    </td>
                </tr>
            </table>

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
