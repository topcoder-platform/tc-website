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

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="top">
                    <td width="99%" class="bodyText">

            <div align="center"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=room1"><img src="/i/promos/tco_promo_big.gif" alt="2003 TopCoder Open sponsored by Intel&#174;" width="530" height="164" border="0" /></A></div>

                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tco03/reception/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">ZorbaTHut and Yarin enjoy the calm before the storm</td></tr>
                        </table>
            
            <h2>Opening Night Reception</h2>

            <p>by Matt Murphy (veredox), <em>TopCoder Staff</em><br />
            Wednesday, December 3, 2003</p>

            <p>Tonight, in a conference room filled with food, drink and plenty of tech related chatter, all eyes were on a few 16.  
            Each one of these coders will be vying for the title of grand champion tomorrow as the final rounds of the 2003 TopCoder Open sponsored by Intel&#174;
            commence.  With more than 1,000 competitors participating six rounds earlier, these contestants have already come a long way.  
            With $130,000 at stake, tensions should have been high when the coders came face to face.  But they weren't.</p>
 
            <p>The environment was fairly relaxing at the welcome reception.  Representatives from NVIDIA and Revelation Software 
            were on hand to mingle with the finalists and to assess the level of competition.  Introductions were made.  Tournament 
            stories were told.  Brainteasers were solved, and reinvented and solved again - warming up for the problems they will 
            face tomorrow morning. </p>
 
            <p>There are a lot of preparations to be made before the semi-finals begin.  After the reception, the competitors retired to 
            their rooms to recover from jetlag.  Hopefully, butterflies won't keep them from their much-needed rest. </p>
                    </td>
                </tr>
            </table>

            <p><br/></p>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/01.jpg');"><img src="/i/tournament/tco03/room1/01_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/02.jpg');"><img src="/i/tournament/tco03/room1/02_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/03.jpg');"><img src="/i/tournament/tco03/room1/03_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/04.jpg');"><img src="/i/tournament/tco03/room1/04_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/05.jpg');"><img src="/i/tournament/tco03/room1/05_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tco03/room1/01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/06.jpg');"><img src="/i/tournament/tco03/room1/06_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/07.jpg');"><img src="/i/tournament/tco03/room1/07_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/08.jpg');"><img src="/i/tournament/tco03/room1/08_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/09.jpg');"><img src="/i/tournament/tco03/room1/09_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room1/10.jpg');"><img src="/i/tournament/tco03/room1/10_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
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
