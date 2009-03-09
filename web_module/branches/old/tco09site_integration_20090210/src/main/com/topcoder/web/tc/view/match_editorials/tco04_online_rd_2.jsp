<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
	</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505681" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Open <br> Online Round 2</span><BR/>September 14, 2004
<br><br>

<span class="bigTitle">Summary</span> 

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
   <A href="Javascript:openProblemRating(1119)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
   <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505681" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
   <A href="Javascript:openProblemRating(2364)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
      <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505681" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
   <A href="Javascript:openProblemRating(2236)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
      <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505681" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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

<div class="authorPhoto">
    <img src="/i/m/schveiguy_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>

