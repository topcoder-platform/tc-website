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
<tc-webtag:forumLink forumID="505713" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 228</span><br>Thursday, January 27, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The abnormal point values on the problems in this match tipped people off that it would be slightly bizarre, but division 1 coders were surprised to be greeted by an easy problem that was possibly harder than the medium problem (if it wasn't harder, it was at least trickier).  Especially because of the division 1 easy/division 2 medium problem, the challenge phase became very important, as some people bagged challenge after challenge by noticing other people's oversights.</p>
<p>In the end, the winner in Division 1 was the only coder to successfully solve all three problems, <b>John Dethridge</b>.  <b>tomek</b> was next with a failed easy submission and <b>jshute</b> was third without submitting the first problem.  In division 2, not one person solved the medium problem correctly.  <b>IvanRomanov</b> took the crown with solid submissions on the easy and hard problems, followed closely by <b>Pisky</b> who had a more interesting challenge phase.  Newcomer <b>MichaelN</b> rounded out the top 3 in division 2 with just slightly slower times on the easy and hard problems.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1768&amp;rd=6517" name="1768">ProfitCalculator</a></b>
</font>
<A href="Javascript:openProblemRating(1768)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505713" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      207 / 228 (90.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186 / 207 (89.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>irritate</b> for 249.38 points (1 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201.18 (for 186 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was pretty straightforward without being overly trivial - possibly the hardest part was just getting the data out of the strings.  In the end, all you had to do is add up the total price and total cost and return (totalPrice-totalCost)/totalPrice as a percentage, rounded down.  In order to dodge floating point precision errors, it was beneficial to try to use integers (you knew you got exactly two digits after the decimal place, so it was a matter of either taking out the decimal points or just multiplying the values by 100.  I preferred the former hack:</p>
<pre>
int totalPrice = 0, totalCost = 0;
for (int i=0; i&lt;items.length; i++)
{
   items[i] = items[i].replaceAll("\\.", "");   //eliminate '.' from the string!
   totalPrice += Integer.parseInt(items[i].substring(0, 5));
   totalCost += Integer.parseInt(items[i].substring(6));
}
return 100*(totalPrice-totalCost)/totalPrice;
</pre>
<p>Note that the format of the string is very specific, which makes it easy to extract the data.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2958&amp;rd=6517" name="2958">BikeRace</a></b>
</font>
<A href="Javascript:openProblemRating(2958)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505713" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      700
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 228 (7.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 18 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>null</b> for null points (NONE)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      375
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      82 / 180 (45.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      19 / 82 (23.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>athenachu71</b> for 249.15 points (22 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      185.95 (for 19 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This was the sort of tricky problem labeled "easy" that you expect to dread in later tournament rounds.  No one in division 2 successfully solved it, and only one blue coder in division 1 did.</p>
<p>In spite of its apparent trickiness, this wasn't conceptually too hard of a problem.  It was useful to do this problem in two waves.</p>
<p>First, you go through and figure out who is eliminated before they start - If you figure out who finishes the first lap first and when, you can check every starting time and anyone who starts after that is eliminated simultaneously at the time the first person finishes their first lap.</p>
<p>Once those are out of the way, you compare each pair of runners i and j, where i started before j.  If i runs slower than j, then j will eventually catch up, and i is eliminated no later than the point in time j catches up.  If i runs faster than j, then i will eventually lap j, and j is eliminated no later than the time when i laps j.</p>
<p>Finally, you want to just remember the earliest time that each biker was eliminated and sort the bikers' names primarily in order of elimination time and secondarily in alphabetical order of name.  Note that the elimination times may not be integers - you need to store them as doubles to consistently tell which elimination came first.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3516&amp;rd=6517" name="3516">DeadCode</a></b>
</font>
<A href="Javascript:openProblemRating(3516)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505713" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      64 / 228 (28.07%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 64 (9.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>IvanRomanov</b> for 599.07 points (22 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      499.54 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
In this problem, you had to determine how much of the given "code" was unreachable by a terminating code path.  My approach to this problem was simple; it just requires two distinct algorithms.</p>
<p>First you find out which parts of the code are reachable.  Some people just adapted their favorite shortest-path algorithm to do this (like Pisky), others used a depth-first search bounded when they hit a line they've already reached.</p>
<p>Next, you have to figure out what parts of the code are on terminating paths (i.e. - there is a path from them to a return statement).  This is a little more awkward, because you would have to trace backwards from the return statements, which don't point back at the statements that go to it.  One clever implementation of this part was RedSpikeyThing's, which used memoization to make it easy to search forward for a return statement starting anywhere.</p>
<p>Once you know which lines can be reached and which can terminate, you count how many either aren't reachable or can't terminate, and return the number.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3491&amp;rd=6517" name="3491">BagsOfGold</a></b>
</font>
<A href="Javascript:openProblemRating(3491)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505713" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      400
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      138 / 180 (76.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      108 / 138 (78.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dgarthur</b> for 396.60 points (2 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      337.38 (for 108 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is drenched in AI and game theory, but not so deep that it couldn't be done by someone who isn't familiar with such topics couldn't figure it out.  The hard thing to figure out is what exactly it means for both players to play optimally.  If you play optimally assuming that your opponent will also play optimally, then playing optimally is picking the path with the lowest potential loss, assuming that your opponent does the same.</p>
<p>The game consists of repeatedly taking either the last or the first bag of gold, so if you had the idea to figure out the optimal answer by trying every possible path of the game and figuring out which is best, you'll have to forget that when you remember that there are 2<sup>n</sup> possible game paths where n is up to 50.  The second difficult part of this problem was realizing that the loads of subproblems overlap, and the 2<sup>n</sup> possible game states are effectively reduced to n<sup>2</sup> possible game states.  While the actual scores at each overlapping game state may not be the same, the future strategy, which decides the next move, is.</p>
<pre>
   public int netGain(int[] bags)
   {
      int[][] memo = new int[bags.length][bags.length];
      for (int i=0; i&lt;bags.length; i++)
         for (int j=0; j&lt;bags.length; j++)
            memo[i][j] = -1;   //initialize the cheat sheet
      int first = 0, last = bags.length-1;   //this is where we are
      return best(memo, first, last, bags);
   }
   
   public int best(int[][] memo, int first, int last, int[] bags)
   {
      if (memo[first][last] != -1)   //use the memo if we've already solved this subproblem
         return memo[first][last];
      else if (first == last)   //basis case for one bag
         return bags[first];
      //take the best of:
      //   The first bag minus the best the other player can do on the rest
      //   The second bag minus the best the other player can do on the rest
      memo[first][last] = Math.max(bags[first]-best(memo, first+1, last, bags), bags[last]-best(memo, first, last-1, bags));
      return memo[first][last];
   }
</pre>
<p>A convenient way to take advantage of the overlapping subproblems is to memoize an answer into a 2-dimensional array where the indexes are the numbers of the first and last bags left.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3517&amp;rd=6517" name="3517">Loopy</a></b>
</font>
<A href="Javascript:openProblemRating(3517)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505713" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      12 / 180 (6.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 12 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jshute</b> for 548.55 points (31 mins 58 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      489.99 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is related to the DeadCode problem, and in fact, starts with basically doing the DeadCode problem, because you need to know which lines are on valid code paths.
</p>
<p>After that, you can just try every edge AB and treat A as the exit and B as the entrance.  You need to search backwards from A until you get back to B and count how many nodes are in valid code paths on the way back from A to B.  You also need to make sure that the only paths into the loop that aren't from inside the loop are to the start, and keep in mind that there's always an entry from outside the loop to line 0.
</p>
 
  
<div class="authorPhoto">
    <img src="/i/m/Kawigi_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="8416646" context="algorithm"/><br />
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
