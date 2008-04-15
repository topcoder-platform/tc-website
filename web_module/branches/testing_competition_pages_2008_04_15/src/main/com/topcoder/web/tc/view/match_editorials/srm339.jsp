<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
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
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
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
    <A href="/stat?c=round_overview&er=5&rd=10663">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506229" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 339</span><br>Wednesday, February 14, 2007
<br><br>

<h2>Match summary</h2> 

<p>
Almost 1000 contestants from all around the world, with 6 targets among them, celebrated Valentine’s Day by taking part in this SRM. In Division 1 the match started off silently, as coders were greeted by a long (and less friendly than usual) easy problem. As time passed, however, solutions did start to roll in. Coders then moved on to an easy medium that barely slowed them down -- but the hard was another story. Even though a great number of contestants compiled and tested their solutions, only 9 of them were able to pass the examples and submit. In an impressive performance, <tc-webtag:handle coderId="19849563" context="algorithm"/> was on top of the pack almost from start to finish and amazed those in  attendance with an incredible score on the 1000, going into the challenge phase with a commanding lead over the second place<tc-webtag:handle coderId="7462740" context="algorithm"/>. The thorough examples on all the problems led to a relatively dull challenge phase, but 
<tc-webtag:handle coderId="19929536" context="algorithm"/> managed to pull in second place with the help of three successful challenges. As the dust settled, the top 3 remained unchanged, with two yellows, <tc-webtag:handle coderId="22285847" context="algorithm"/> and <tc-webtag:handle coderId="21766879" context="algorithm"/> rounding up the top five. All in all, 7 coders were able to solve all tasks.
<br />
<br />
It was not an easy night in Division II either. Most coders were able to submit the easy very quickly but were stumbled by the medium. The challenge phase was quite eventful and a lot of easy submissions were brought down. In the end it turned out that newcomers dominated this division and the win went to <tc-webtag:handle coderId="22672946" context="algorithm"/>, followed by <tc-webtag:handle coderId="22663468" context="algorithm"/> and <tc-webtag:handle coderId="22667828" context="algorithm"/>. Five coders managed to solve all three questions correctly.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7421&amp;rd=10663" name="7421">BettingStrategy</a></b>
</font>
<A href="Javascript:openProblemRating(7421)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506229" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      468 / 489 (95.71%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      269 / 468 (57.48%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>power_lh</b> for 249.48 points (1 mins 18 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217.77 (for 269 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem asked for nothing more than just implementing the algorithm described in the statement. This is actually known as the <a href="http://en.wikipedia.org/wiki/Martingale_system">Martingale system</a>. First of all, the value of the bet for the following round should be kept in a variable. Then you have to loop through all rounds, one at a time. For each round, you need to compare the value of the bet to the current sum and see if it is possible to bet this round. If not (the value of the bet is larger), then stop and return the current sum. This was the step that some coders omitted and that led to a bunch of challenges. Otherwise, check the corresponding character from the input string <b>outcome</b>. If it is a ‘W’, denoting a winning round, add the value of the variable to the current sum, and then reset it to 1. Otherwise the ‘L’ character is encountered, so you should subtract the value of the current bet from the sum. Finally, we return the sum after all rounds are played. See <tc-webtag:handle coderId="22663468" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263707&rd=10663&pm=7421&cr=22663468">solution</a> for a nice implementation.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7420&amp;rd=10663" name="7420">BusTrip</a></b> </font> <A href="Javascript:openProblemRating(7420)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506229" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      85 / 489 (17.38%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      53 / 85 (62.35%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>fhoward</b> for 369.73 points (18 mins 16 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.11 (for 53 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      295 / 410 (71.95%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      242 / 295 (82.03%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 229.47 points (8 mins 39 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      141.50 (for 242 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem asked to simulate little Billy’s strange method of traveling by bus. However, the implementation was anything but easy and required a lot of work and attention from the contestants and the average score received was low.
<br /><br />

The first step in solving the problem is parsing the input and keeping each of the bus routes in a list. Then, the question boils down to the following subproblem: given a station A, where Billy is in at the current moment in time, find the next  time a bus passes through this station. To handle this, loop through all buses that pass through station A, and for each bus figure out the next time it arrives at A. This can be done by simulating the bus route and stopping when it reaches A at a moment greater than the current time. See <tc-webtag:handle coderId="7446789" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263675&rd=10663&pm=7420&cr=7446789">nice implementation</a> as an example. As an alternative, you can use some simple arithmetic: if the first time a bus passes through station A is t0, then the bus passes through A at all times t equal to t0 modulo P, where P is the time it takes the bus to perform one whole cycle (that is, t % P must be t0), like in <tc-webtag:handle coderId="7390467" context="algorithm"/>’s <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=7390467">solution</a>.
<br />
<br />

I find it somehow easier to use the concept of states here. At any point in his trip, little Billy’s state s is determined by the location he is in, v, and the current time, t. From each state there is a single follow-up state. There are two cases to consider, depending on the number of buses leaving location v at time t. If there are no such buses, the follow-up state is (v, t+1). Otherwise, you need to consider only the bus that appears first in the input, and the follow-up state will be (u, t + abs(v-u)), assuming the station following v on the bus route is u. Now you have to simply work your way through this state space and stop either when the location is 0 or the time exceeds the limit given in the statement. You need to return the value of the time in the former case, and -1 in the latter. The <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263674&rd=10663&pm=7420&cr=19849563">fastest submission</a> by <tc-webtag:handle coderId="19849563" context="algorithm"/> follows this approach.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7423&amp;rd=10663" name="7423">OnTime</a></b> </font> <A href="Javascript:openProblemRating(7423)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506229" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      42 / 489 (8.59%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 42 (52.38%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>TOXA</b> for 881.28 points (10 mins 43 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      607.61 (for 22 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This was a nice dynamic programming exercise for Division II coders. If you need a start with this very important technique see <tc-webtag:handle coderId="7305703" context="algorithm"/>’s <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=dynProg">tutorial</a>.
<br /><br />

The first step in all dynamic programming problems is to define a state space. This is usually the toughest part of a DP solution, but practice makes it much easier and reveals many similarities between problems. In this case, as in BusTrip, a state is defined by the station where Billy is, and the current time. We need to find the minimum cost of reaching each state. Then let best[t][v] be the minimum cost of being in station v at the moment of time t. There are two alternatives to consider: either Billy has been waiting for at least one minute, in which case the cost will be best[t-1][v] (since the cost best[t-1][v] is optimal for being at station v at time t-1 and there is no point to consider a way to be in that state with a higher cost), or he has just arrived there in a bus coming from a station u. Assuming the time it takes the bus to travel from u to v is t0, and the cost of the ticket for this bus is c, this alternative’s cost will be best[t-t0][u] + c, since at time t-t0 Billy was in station u (with an optimal cost!) and then took the bus with a cost c. Of course, we have to loop through all buses that arrive at station v at time t, and then pick the alternative with the minimum cost. After deciding on the recurrence we still need to identify the initial conditions. Billy starts at station 0 at time 0, so we initialize best[0][0] to 0 and best[0][s] to a very large value (signifying infinity, impossibility) for all other stations s. Notice that to calculate the optimal cost of being in a station at some moment of time, we need the optimal costs of being in all stations at previous times so we can fill up the table best in increasing order of times. See <tc-webtag:handle coderId="7381890" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263703&rd=10663&pm=7423&cr=7381890">solution</a> for an implementation of the DP solution, or, for a memoised version, check this <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22673365">solution</a> by <tc-webtag:handle coderId="22673365" context="algorithm"/>.
<br />
<br />

As a sidenote, this approach can be made to run in the time complexity O(T*N + B), with B denoting the number of buses, by keeping a hashtable containing for each state a list of the buses that arrive there. You can also sort the buses in increasing order of arrival times, using either a comparison sort, yielding the time complexity O(T*N + B log B), or a linear sort (like radix sort, and keeping the time complexity as in the hashtable version). A <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263705&rd=10663&pm=7423&cr=15089132">solution</a> that used the idea of sorting the buses was submitted by <tc-webtag:handle coderId="15089132" context="algorithm"/>.
<br />
<br />

There was also a way out for coders who were unfamiliar with dynamic programming as well. The number of buses was rather small, and a decent backtracking solution would be able to solve the task within the time limit. See <tc-webtag:handle coderId="22663468" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rd=10663&rm=263707&cr=22663468&pm=7423">solution</a> for such an example.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7422&amp;rd=10663" name="7422">TestBettingStrategy</a></b>
</font>
<A href="Javascript:openProblemRating(7422)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506229" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      251 / 410 (61.22%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205 / 251 (81.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Spieler</b> for 430.79 points (6 mins 3 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      330.81 (for 205 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Making up for the tougher easy this medium was an easy task for Division I coders. It required basic knowledge of probability theory and dynamic programming or memoisation.
  <br />
  <br />
 The thing to note here is that before playing one round, the player’s state is influenced by the sum he currently has, the remaining number of rounds, and the value of the bet for the round -- which, as described in the problem statement, is a power of 2. That being said, let pwin[s][r][b] be the probability that the player reaches his goal if he currently has s dollars, there are r rounds left and the stake is 2<sup>b</sup> (corresponding to losing the last b rounds). The solution to the problem would then be pwin[<b>initSum</b>][<b>rounds</b>][0]. If s is greater or equal to <b>goalSum</b>, this probability is 1 (the player has already reached his goal); if the current stake is greater than the sum s, or there are no rounds left, it is 0.
<br /><br />
Otherwise, the player will play this round, and there are two possible outcomes. If he wins the bet with probability p, then the next state will be described by the sum s + 2<sup>b</sup>, r-1 rounds left, and the stake 1, so b = 0. If he loses the bet, with probability 1-p, his sum decreases to s - 2<sup>b</sup>, there are r-1 rounds left and the value of the stake is doubled, so b is incremented. In other words the recurrence is given by: 

<br /><br />
  pwin[s][r][b] = p * pwin[s + 2<sup>b</sup>][r-1][0] + (1 – p) * pwin[s - 2<sup>b</sup>][r-1][b+1] 
<br /><br />

  This recurrence can easily be implemented with a memoised function, as in <tc-webtag:handle coderId="15878380" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263677&rd=10663&pm=7422&cr=15878380">solution</a>. Try to implement an iterative dynamic programming solution if you haven’t already, as an exercise, or see <tc-webtag:handle coderId="16056363" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263683&rd=10663&pm=7422&cr=16056363">solution</a> for an example.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6539&amp;rd=10663" name="6539">RPSTournament</a></b> </font> <A href="Javascript:openProblemRating(6539)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506229" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 410 (2.68%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 11 (81.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 942.31 points (7 mins 6 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      585.41 (for 9 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This was a tough problem and required not only figuring out the correct algorithm but an efficient implementation as well.
<br /><br />

After getting familiar with the question, it sounds like a greedy approach will work, since intuitively it would be better if lower seeded players were eliminated as soon as possible. However, as some contestants have noticed, none of the greedy approaches were enough by themselves and would end up failing some of the examples.
<br />
<br />

Let’s start by noting that if one player can defeat a player, any other lower-seeded player can defeat him. Derived from this is the observation that if a player can win the tournament than any other lower-seeded player can win it as well. To see this, imagine the whole evolution of the tournament in a tree structure, with the leaves being the players taking part in the competition and the internal nodes signifying matches played during the course of the tournament. Now consider the paths to the final round (that is, the root of the tree) of two players seeded u and v, with v < u, in a tournament won by u. These are nothing more than paths from the two leaves to the root in this tree. Now swap u and v on these paths – in other words let v meet the opponents u met in the tournament, and vice-versa. Obviously, since u could win all matches in its path, v can win them as well if only the opponents remained the same. The only round in which the opponent could be different is where these two paths meet. Let this round be denoted by m. The matter of concern is that v would get a stronger opponent in m due to the positioning of u in its previous path. Now, if u is not eliminated earlier than v in its new path, but is eliminated in the same round as v, which we'll call round r -- and remember u is weaker than v, so if the player met in round r can defeat v then it can also defeat u -- the rest of this path from r to m would remain the same. Otherwise, u is eliminated earlier by a player that v could defeat, and the player that would reach round r is defeatable by v. If this player can be eliminated at some point from r to m, the path remains the same from that point on. Ultimately, the opponent v would get in round m is either the same opponent as before or a player that it could defeat. In either case, v can progress to the next round and continue its way to winning the championship.
<br />
<br />

The first version of our solution could be to loop through all players in decreasing order of their seed and check if they can win the tournament. When we find a player that is able to do so, we stop and return his seed. The problem with this approach is that it would be too slow for a large number of players. However, using what was proven above, we realize that we can use binary search instead of the linear loop.
<br /><br />

The need to design an algorithm to check if a player with seed u can win comes directly from the above. For this part, a greedy algorithm can be succesfully employed. One such algorithm generates the tournament tree in a top-down manner. First decide on an opponent for u to meet in the final: let this opponent be the lower seeded player, v, that u can defeat. Now move on to the semifinal round and decide the two opponents u and v should get, which are the strongest two, other than u and v, that u and v can defeat. Proceed in a similar manner for all the rounds, all the way to the first round. If at some point it is impossible to find an opponent for a player, you can conclude that u can’t win the tournament. The reason to choose the strongest opponent for a player is that the tree generated in this way is more relaxed, and easier to fill up later. A more rigorous explanation comes from the observation proved above.
<br />
<br />

However, a naive implementation of the above algorithm would have the time complexity of O(N<sup>2</sup>), which would be too slow for larger test cases. One can use advanced data structures like segment trees, interval trees (explained by <tc-webtag:handle coderId="8357090" context="algorithm"/> <a href="http://www.topcoder.com/tc?module=Static&d1=match_editorials&d2=srm310">here</a>, in the write-up for the problem FloatingMedian), balanced binary trees (check <tc-webtag:handle coderId="21766879" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263677&rd=10663&pm=6539&cr=21766879">solution</a>) or even a modified version of the union-find data structure, using only path compression (like in <tc-webtag:handle coderId="7462740" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=coder_room_stats&rd=10663&cr=19929536">solution</a>), to achieve a complexity of O(N log N). It is possible to implement the algorithm in a linear complexity. For this, note that for a list of players, sorted in increasing order of their seeds, the opponents for the current round can be assigned in an increasing order of seeds as well. The C++ implementation is given below:
<br /><br />

<pre>
bool canWinLinear(int seed) {
    // initialize all elements of used to false here
    int P = 0;
    lst[P++] = seed;
    used[seed] = true;
    for (int i = 0; i &lt; rounds; ++i, P &lt;&lt;= 1) {
        int pos = 0, opponent = 1;
        for (int j = 0; j &lt; P; ++j) {
            // strongest[i] = the strongest opponent that i could beat
            <b>opponent = max(opponent, strongest[lst[j]]);</b>
            while (opponent < N && used[opponent]) opponent++;
            if (opponent >= N) return false;
            newLst[pos++] = opponent;
            used[opponent] = true;
        }
        // merge the lists lst and newLst and copy to lst here
    }
    return true;
} 
</pre>

The bolded line is crucial in maintaining the linear complexity. The variable <b>opponent</b> will iterate only through the values of the opponents chosen for the list of players, and through some of the values of the players already in the list, so through at most 2*P values. Also considering the merge operation, each iteration of the first loop will take a number of operations proportional to the length of the list, P, so by summing for all log N iterations, we get a total number of operations proportional with N, and thus a linear complexity. The total complexity of the solution, including the outter binary search, will be O(N log N). This approach can be seen in <tc-webtag:handle coderId="15600311" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263693&rd=10663&pm=6539&cr=15600311">solution</a>. Other approaches, which use the clustering of the players, were employed by <tc-webtag:handle coderId="19929536" context="algorithm"/> (<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263692&rd=10663&pm=6539&cr=7462740">here</a>) and <tc-webtag:handle coderId="19849563" context="algorithm"/> (<a href="http://www.topcoder.com/stat?c=problem_solution&rd=10663&rm=263674&cr=19849563&pm=6539">here</a>). At it’s heart, <tc-webtag:handle coderId="19929536" context="algorithm"/>’s solution is very similar to what was described here.
</p>

<div class="authorPhoto">
    <img src="/i/m/_efer__big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
