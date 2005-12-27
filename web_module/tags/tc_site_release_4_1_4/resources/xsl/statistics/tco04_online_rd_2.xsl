<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>TCO04 Online Round 2 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#FFFFFF">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO04 Online Round 2 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">September 14, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

   <h2>Match summary</h2> 

   <p> 
   Round two seemed very tricky for most coders, dispite the low
   point values for the easy and hard problems.  In fact, 9 red
   coders were eliminated, 6 of them scoring 0 points or less.  Most
   people believed that the low scored easy and hard were undervalued.
   It's often difficult to determine the value for greedy problems because
   you don't know how fast a coder can prove to his- or herself that the
   greedy algorithm works.  A tough but mostly standard level 2 problem
   was the only salvation for a few coders who were fooled by the greedy
   problems.
   </p> 

   <p>
   <b>haha</b> was the star of this round, scoring slightly less than
   <b>SnapDragon</b> in points, but taking the lead with two challenges.
   Heavyweights <b>radeye</b>, <b>snewman</b> and <b>tomek</b> rounded out
   the top 5.  Incidently, <b>Rustyoldman</b> was the only coder ranked
   below yellow who made the cut, but he changed colors in the process.
   </p>

   <p>
   <H1> 
       The Problems 
   </H1>
   </p> 

   <font size="+2"> 
       <b><a href="/stat?c=problem_statement&amp;pm=1119&amp;rd=5879" name="1119">SchoolAssembly</a></b> 
   </font> 
   <A href="Javascript:openProblemRating(1119)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
   Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Value</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         200 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Submission Rate</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         154 / 184 (83.70%) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Success Rate</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         88 / 154 (57.14%) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>High Score</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         <b>indigo9</b> for 198.52 points (2 mins 27 secs) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Average Score</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         165.25 (for 88 correct submissions) 
          </td> 
      </tr> 
   </table></blockquote> 

   <p>
   Usually easy problems don't make you think much, but this one
   was an exception.  Here we are looking for the maximum number
   of bags we have to buy.  Clearly we can't use brute force to
   find the worst case,  as there are way too many combinations.
   In one bag alone, there are 10,626 possible combinations of
   colors.  Figuring this out for thousands of bags would be
   undoable in the allotted time.
   </p>

   <p>
   However, for this problem, we are only interested in the very
   worst possibility.  To solve it, imagine we have 5 buckets, each
   representing a color.  We'll add beans to buckets one bean at a time.
   When the bucket has <i>quantity</i> beans in it, it is emptied, and the
   number of sets is incremented by one.  Each bucket represents beans of
   a certain color that aren't part of a set.  To maximize the beans
   placed into buckets, we want to fill each bucket with <i>quantity</i>-1
   beans.  At that point, no matter what color bean is next, a set is
   formed.  After the set is formed, the bucket is emptied.  To ensure the
   worst case, the next <i>quantity</i>-1 beans should go into the empty
   bucket.  Any other color, and another set is formed early.
   </p>

   <p>
   This greedy algorithm should be enough to code a solution which
   runs fast enough.  However, there is a constant time solution
   which uses the fact that the last state of the buckets is that
   4 of them are full of <i>quantity</i>-1 beans.  Therefore, the final number
   of beans required is:<br/>
   <pre>quantity * children + (quantity-1) * 4</pre>
   </p>

   <p>
   In all cases, we need to round up this to a multiple of 20,
   since even if we need only one bean, we need to buy a whole
   bag.  Therefore, the final formula is:<br/>
   <pre>(quantity * children + (quantity - 1) * 4 + 19) / 20</pre>
   </p>

   <font size="+2"> 
       <b><a href="/stat?c=problem_statement&amp;pm=2364&amp;rd=5879" name="2364">LinePlotter</a></b> 
   </font> 
   <A href="Javascript:openProblemRating(2364)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
   Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Value</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         600 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Submission Rate</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         74 / 184 (40.22%) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Success Rate</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         64 / 74 (86.49%) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>High Score</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Yarin</b> for 543.99 points (9 mins 18 secs) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Average Score</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         365.74 (for 64 correct submissions) 
          </td> 
      </tr> 
   </table></blockquote> 

   <p>
   Many knowlegable coders will recognize this as the infamous
   traveling salesman problem.  Many people know that this problem
   is NP-complete, but with the number of locations limited to 15,
   a O(2<sup>n</sup>) solution will run in time.
   </p>

   <p>
   The first thing to note is that the time to move the pen is not
   the cartesian distance, but rather the maximum of the x and y
   distances.  This is because both motors can run simultaneously.
   </p>

   <p>
   To solve the graph problem, We'll use recursion with
   memoization of 2<sup>n</sup> * n states.  Part of the state
   will be a bitmask representing which lines have been drawn, and
   the other part will be which line endpoint the pen is located
   at.  The recursive function will return the minimum time needed
   to draw the rest of the lines.
   </p>

   <p>
   For each run of the recursive problem, we try drawing each
   undrawn line starting from either endpoint.  The new state is
   that the pen is on the other side of the line just drawn, and
   the bitmask has a bit added for the line just drawn.  We add on
   the time it takes to move the pen to the endpoint, and then to
   move the pen (while drawing) to the other endpoint.  By
   memoizing on the state, we can reduce the runtime to
   O(2<sup>n</sup> * n).
   </p>


   <font size="+2"> 
       <b><a href="/stat?c=problem_statement&amp;pm=2236&amp;rd=5879" name="2236">MLBRecord</a></b> 
   </font> 
   <A href="Javascript:openProblemRating(2236)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
   Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Value</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         900 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Submission Rate</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         46 / 184 (25.00%) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Success Rate</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         16 / 46 (34.78%) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>High Score</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         <b>haha</b> for 637.39 points (20 mins 3 secs) 
          </td> 
      </tr> 
      <tr> 
          <td class="bodyText" style="background: #eee;"> 
         <b>Average Score</b> 
          </td> 
          <td class="bodyText" style="background: #eee;"> 
         465.11 (for 16 correct submissions) 
          </td> 
      </tr> 
   </table></blockquote> 

   <p>
   It's that time of the year again!  Baseball is one of America's
   greatest games, and the race for the playoffs is generally very
   tense.  In this problem, we are trying to see if we can stop
   the worrying, and see if our team is out or in.
   </p>

   <p>
   This problem seems at first like it could be solved with
   maximum flow, but in the end, it turns out to have a very easy
   greedy solution.  You perform two checks on the team.  If it
   wins all its remaining games, is it still forced out of the
   playoffs, and if it loses all its remaining games, is it still
   in the playoffs.
   </p>

   <p>
   One of the other issues is to make sure the wins acheived in
   the rest of the season are consistent with the number of games
   played.  We know that each team will play <i>gamesLeft</i>
   games.  Each game is played by two teams, so the number of
   games left to be played by all the teams are <i>gamesLeft</i> *
   <i>numTeams</i> / 2.  The constraints guarantee that this is a whole
   number.  As it turns out, because of the way the constraints
   are, we don't have to keep track of which team plays who.  We
   just assign wins to whichever team we want.  All we have to do
   is to make sure no team gets more than <i>gamesLeft</i> wins
   added to their record, and that the total number of wins added
   equals <i>gamesLeft</i> * <i>numTeams</i> / 2.
   </p>

   <p>
   So keeping this in mind, to answer the first question, we
   assign <i>gamesLeft</i> wins to the team in question.  Then we
   want to assign wins to the other teams, trying to keep our team
   from being eliminated.  If there is no possible way to do this,
   the team is eliminated.  To keep the team at the same rank, we
   first can assign <i>gamesLeft</i> wins to all the teams that
   rank higher than it.  If there are any games left, we should
   first assign wins to teams lower than it, but only enough to
   make those teams tie the target team.  If we still have wins
   left to assign, we must assign those wins to the tied teams,
   but here, it is important to assign wins to teams which have
   more games left to play, as we can use up more wins on those
   teams without changing the rank.  If all this is done
   correctly, and the team still isn't in the top N ranking teams,
   it has been eliminated.
   </p>

   <p>
   A similar procedure is followed for the question of clinching.
   However, this procedure is a little simpler.  We want to see if
   it is possible for a team to not make it into the playoffs.  We
   still have the same constraints on the total wins assigned.
   Assigning wins to higher ranking teams doesn't help, since
   those teams cannot push our team out, so we assign wins to
   teams who are lower ranking until they have enough wins to just
   tie our team.  We choose the team to assign the wins to based
   on how close it is to our team's record.  The closer ones are
   chosen first because they use up fewer wins to tie our team.
   At the end, if the set of tied teams is not all in the
   playoffs, then the team cannot clinch.  If our team and all the
   teams tied with it are in the playoffs, then the team has
   clinched.
   </p>


                        <p>
                        <img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=273217"><strong>schveiguy</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
