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

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="top">
                    <td width="99%" class="bodyText"><img src="/i/clear.gif" width="500" height="15" border="0"/></td> 
               </tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">

            <div align="center"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_finals"><img src="/i/promos/tco_promo_big.gif" alt="2003 TopCoder Open sponsored by Intel&#174;" width="530" height="164" border="0" /></A></div>

                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tco03/room4/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">tjq's victory sinks in.</td></tr>
                        </table>
            
            <h2>tjq surprises everyone by striking three bullseyes</h2>

            <p>by Lars Backstrom, (lbackstrom)<em>TopCoder Member</em><br />
            
            Thursday, December 4, 2003</p>
<p>
In what was by far the most exciting match of the day, tjq edged out three members with little targets next to their
names and advanced to the finals.  Perhaps the 25 hour flight from Hong Kong allowed him to study up on his algorithms
while his competition was out partying.  Or maybe his lower rating is just due to the network latency from the states to
the other side of the world.  Whatever the reason, tjq was dominant in the room with the highest average rating.
</p>

<p>
At the start, all four coders went for the easy problem - which was probably the easiest problem of the semifinals.
TopCoder legend, NGBronson, submitted it first, in a little under five minutes for 243.09/250 points.  Fast fingers Zorba
was in next, only 14 seconds behind.  snewman, the only coder to use C#, submitted next for 233.89 points.  tjq was just
getting up to speed on this problem, and submitted after 9:38 for 225.34 points.
</p>

<p>
No one chose the strategy pioneered by dmwright, and vindicated by bstanescu in round 1.  So, at the 10 minute mark, the
gap between first and last was a mere 17.75 points.  After another 15 minutes or so of silence, NG managed to work out
all the bugs of the medium graph problem, and submitted it for 366.66 points.  tjq submitted his medium three and a half
minutes later, but since he got a later start, his score was only 0.04 less than NG's.  The race was far from over
though, and Zorba submitted in another minute, while snewman kept it close, submitting just seconds after Zorba.
</p>

<p>
At the half hour mark, all three coders had submitted the easy and mediums.  NGBronson maintained his lead, with 609.75
points, while tjq was a close second, with 591.96.  ZorbaTHut and snewman were both still within a single challenge, with
562.61 and 569.90 points, respectively.
</p>

<p>
With forty-five minutes to go, it looked certain that the scores were far from final, as coders started in on a tricky
1050.  tjq shocked everyone, submitting his problem in 8:14, for 970.98 points, then sat back and smirked at the other
coders.  For the next 15 minutes, the room was silent except for intermittent whispering by spectators, and furious
scribbling by coders.
</p>

<p>
snewman, with his perfect reputation on the line (the GCJ notwithstanding), submitted the hard next, for 702.73 points.
Not long after that, tjq stopped smirking, and got back to work, uncovering a bug in his medium submission, costing him
187 points.  But, he wasn't the only one having trouble.  snewman found something wrong with his 1050, and resubmitted it,
costing him over 200 points, and putting him far behind tjq.  After a little over an hour, ZorbaTHut checked in his hard
problem, for 568.72 points.  After questioning the admins, tjq realized that his medium wasn't the only flawed
submission, and resubmitted his hard.  With two resubmissions, it looked like the victory was out of reach for tjq, but
his hard resubmission led him to a challenge case that gave him 100 points in the challenge phase.  The last action of
the round was a submission of the hard by NGBronson, which meant that every coder submitted every problem.
</p> 

<p>
At the end of the coding phase, ZorbaTHut was winning with 1131.33, NGBronson had 1106.15, snewman had 1067.15, and tjq
was way behind, with 856.92.
</p>

<p>
Up to this point, the challenge phases have been about as exciting as simulation problems, but the resubmissions and the
quantity of submissions foretold an exciting phase.  tjq came out strong, with successful challenges of ZorbaTHut and
NGBronson in the first minute - using the same case he failed on.  But the 100 points didn't look like it was gonna be
enough, since snewman's hard problem was still standing, and tjq was still over 100 points behind.  snewman helped out a
little bit, breaking his streak and failing a challenge of tjq.  But, that was all the action in the challenge phase, and
most people were still skeptical that tjq could pull off the come back.  At the end of the challenge phase, snewman held
first with 1017.54, while tjq was in second with 956.92.
</p>

<p>
Everyone gathered 'round the scoreboard and waited with baited breath as systests were run.  First, the results of the
250 came up, showing that NGBronson failed, while the other coders all passed.  Next, the hourglasses spun, and a big red
X appeared next to tjq's name, indicating that, despite the resubmission, his 500 still had some problems.  However, the
loss wasn't that great, since the resubmission had given him a low score.  Finally, after what seemed an eternity,
hourglasses appeared for the hard problem... and snewman went down, giving tjq the incredible come from behind victory.
</p>

<p>
After the contest, tjq commented that his first 1050 was correct, aside from a small formatting bug, making his victory
even more impressive.  He then went on to state matter of factly that "it was very exciting."
</p>

                    </td>
                </tr>
            </table>

            <p><br/></p>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/01.jpg');"><img src="/i/tournament/tco03/room4/01_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/02.jpg');"><img src="/i/tournament/tco03/room4/02_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/03.jpg');"><img src="/i/tournament/tco03/room4/03_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/04.jpg');"><img src="/i/tournament/tco03/room4/04_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/05.jpg');"><img src="/i/tournament/tco03/room4/05_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tco03/room4/01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/06.jpg');"><img src="/i/tournament/tco03/room4/06_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/07.jpg');"><img src="/i/tournament/tco03/room4/07_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/08.jpg');"><img src="/i/tournament/tco03/room4/08_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/09.jpg');"><img src="/i/tournament/tco03/room4/09_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/10.jpg');"><img src="/i/tournament/tco03/room4/10_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
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
