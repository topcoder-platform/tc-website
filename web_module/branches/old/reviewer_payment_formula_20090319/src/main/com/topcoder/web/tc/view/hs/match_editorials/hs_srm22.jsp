<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10074&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506044" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 22</span><br>Monday, December 4, 2006
<br><br>

<h2>Match summary</h2>

The relatively simple easy and medium helped the match start with a blast. Within 20 minutes, most of the coders submitted the first two problems and moved on to the hard. The 1,000 proved challenging, however, as there were only two submissions, and only one of them passed the system tests. The challenge phase had some problems, with a challenge uncovering a bug in the reference solution. Most of the solutions got challenged, and rejudging was done.
In the end, <tc-webtag:handle coderId="14886245" context="hs_algorithm"/> got a close win with 885.76, though he was the only person to get all problems correct. He was followed closely by <tc-webtag:handle coderId="22652330" context="hs_algorithm"/> with 874.63, who managed to put up an impressive performance in the challenge phase.

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7262&amp;rd=10074" name="7262">FibonacciSequence</a></b>
</font>

<A href="Javascript:openProblemRating(7262)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506044" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

188 / 194 (96.91%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

167 / 188 (88.83%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>Zuza</b> for 249.68 points (1 mins 1 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

225.92 (for 167 correct submissions)

</td>

</tr>

</table></blockquote>


The problem asked for counting the number of Fibonacci numbers between any two given numbers. Constraints were quite low to allow even recursive non-memoized solutions to run in time. Most of the coders got this problem very quickly.
<br />
<br />
Here is the code from <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, code who managed to solve it in just a minute:

<pre>
int F[ 100 ];

class FibonacciSequence {
    public:
    int numFibs( int a, int b ) {
        F[0] = 0;
        F[1] = 1;
        
        int sum = 0;
        
        for( int i = 2; i < 100; ++i ) {
            F[i] = F[i-1] + F[i-2];
            sum += ( a <= F[i] && F[i] <= b );
            if( F[i] > b ) break;
        }
        
        
        return sum;
    }
};
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7258&amp;rd=10074" name="7258">CarParking</a></b>

</font>

<A href="Javascript:openProblemRating(7258)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506044" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

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

160 / 194 (82.47%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

66 / 160 (41.25%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>fatit</b> for 493.25 points (3 mins 20 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

377.16 (for 66 correct submissions)

</td>

</tr>

</table></blockquote>

The problem asked for finding the nearest palindrome from a given number, within a given range. Many solutions had overflow errors. <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>'s
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=14886245&rd=10074&pm=7258">code</a> had overflows involved, but proved to be correct. For this problem, it was enough to find the next lower and the next higher palindrome. In fact, since the number of palindromes within the given constraint was less than 10<sup>5</sup>, just examining all palindromes would still work. See <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22652634&rd=10074&pm=7258">code</a> as an example to this approach.
<br />
<br />
Here is <tc-webtag:handle coderId="303644" context="algorithm"/>'s code, which finds the closest palindrome on either sides:

<pre>
import java.util.*;
public class CarParking {
    public int closestShed(int now, int streets) {
        long q = now;
        for (int i = 0; ; i++) {
            if (ispal("" + (q - i))) return (int)q - i;
            if (q + i <= streets && ispal("" + (q + i))) return (int)q + i;
        }
    }
    boolean ispal(String s) {
        String q = "";
        for (int i = 0; i < s.length(); i++) q += s.charAt(s.length() - 1 - i);
        return q.equals(s);
    }
}
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6494&amp;rd=10074" name="6494">RiverCrossing</a></b>

</font>

<A href="Javascript:openProblemRating(6494)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506044" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

2 / 194 (1.03%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

1 / 2 (50.00%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>tomekkulczynski</b> for 486.60 points (39 mins 20 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

486.60 (for 1 correct submission)

</td>

</tr>

</table></blockquote>

This problem proved to be relatively hard, with low submission and success rates. It's solution is based on dynamic programming (DP). Most DP-based solutions tend to have a uniform and sequence-driven line of thinking ,which i shall try to explain now.
<br />
<br />
<b>Step #1:</b> Make observations about properties of the system.
<ul>
<li> All units of cargo are identical to one another. Hence it only matters <strong>how many</strong> units of cargo wait on either sides, not which ones wait. (Here "matters" refers to affecting the optimal value of the solution). </li>
<li> During the boat's optimal journey, when it starts from a bank, it will either carry all the units pending at that time, on that bank, or get completely filled. It never moves partly empty while there are units pending. </li>
</ul>

<b>Step #2:</b> Formulate a state of/for the system.
<br />
<br />
While doing this look at all terms you would use to uniquely describe a "situation." More specifically, here, the system consists of boats and units. What "matters" to the optimal value of the solution -- what must be used to describe the system -- would be the properties of the boat and the units. The boat could be on either side of the bank, or travelling inbetween, partly or completely loaded, etc. The units can be on either side of the bank, and they can arrive at different times. During the formulation, we need to describe what's going on at each stage. Here: the boat travels from one bank to another loading units. Cargo continually keep appearing on either sides. 
<br />
<br />
So one convenient way to describe it would be to avoid or disallow the boat to be desribed when it is travelling. which makes sense since, if you were asked to narrate the sequence of events that took place on the boat, you would naturally not narrate those positions. Thus, we end up describing the system with the following attributes (or answers to the following questions): </p>
<ul>
<li> On which side of the bank is the boat currently located? </li>
<li> How many units are there on either sides of the bank? </li>
<li> What is the time now? </li>
</ul>

We require the "time" in order to describe a change in the system. Since the system is dynamic, any changes in answers to "number of units on either side of the bank" cannot be handled if you do not know the time. In other words, you need the time in order to continually update the number of units of either sides of the bank.
<br />
<br />
This step often lets you completely estimate the amount of memory your program is going to take. Dynamic programming works by computing optimal solutions to every reachable state of the system and describing the solution by a sequence of changes between these states. Hence the storage would mostly map a (state) to an (optimal-value). Here, since the optimal value under description is the "total-waiting-time," it can be described in an integer. A state can be described with a tuple of answers to the above three questions. So now what is the maximal number of tuples that exist?
<ul>
<li> Side can be either left or right, hence 2 possiblities. </li>
<li>For units on either side, the constraints guarantee that their total will be less than 200. If there can be a maximal of i units on one side, there can be at most 200-i units on the other. The number of distinct ways in which units can remain after getting picked up by the boat will be (i+1)*(201-i). Since the product is maximised when the two units go equal, there can be atmost 101*101 distinct values for these tuples. Noting this might help you to reduce memory usage, without which describing tuples indivually in static arrays is going to cost you 201*201 tuples.</li>
<li> For time, the example indicates that the total amount of time taken for all these operations can be enormously large. Hence we need to devise an intelligent method to store time. To answer this, trace back and goto where time came into the picture in the first place. We used time only to describe the sequence of changes that occur to the "units-on either-sides" property. It is not necessary to know the current time precisely to dynamically update the second attribute. Accordingly the question "What is the time now?" can be answered differently. Let T be the time of arrival of the last unit. The question needs to be answered with the exact time if the current time was less than T, otherwise you can just say that "current_time >= T". This is because, after all units have arrived, time is no longer required for updating the second attribute("units-on either-sides"). So now how many distinct answers exist to this question? Since T is given <= 100, the number of distinct answers is at most 101. </li>
</ul>
We end up estimating the total maximal number of states of the system as 2*101*101*101 = 2 million (each state mapping to an integer). Building the solution with an array of that size will work, and the total memory complexity of the program was estimated.
<br />
<br />
<b>Step #3:</b> Describe the sequence of changes that occur to the system in terms of the states of the system.
<br /><br />
The changes are brought about by the boat moving here and there and the time varying continually. Here the aim is to let the boat take the best choices to minimize the optimal value. In other words, out of the sequence of possible states attained by the various ways the boat can move, choose the most favorable one. What are the various ways by which the boat can move? From the current time (<b>t1</b>), wait until a time (<b>t2</b>). During this interval we continually load units (on that side of the bank) into the boat as they arrive (See observation #2). After this we end up on a state with the bank switched, time updated to (<b>t2</b> + "time-to-cross-the-river"), and some units arriving (during the time we crossed the river) on either sides of the bank. 
<br /><br />
This completes the solution. See <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&rd=10074&pm=6494&cr=14886245">code</a> for an implementation of this idea. His function go(c,g,a,b) describes a state, with c = current_time, g = side_of_bank, a = units_on_left_side, b = units_on_right_side. He saves the states so that no state is computed twice, using <b>ma</b>. The first for-loop in go() updates the units that will arrive at either sides of the bank, if we start right now. The second loop describes the situation "wait till time <b>i</b> before you start crossing."
<br /><br />
The time complexity is going to be the number_of_states * (avg_number_of_moves_possible_per_state). Since waiting until time <b>i</b> can be described by a loop, which can run at most 100 times, we have our program run in approximately 2M * 100 = 200 million. Note that this is only an upper bound, where we estimated all states to be reachable and maximized transitions/state. In this problem, the actual number of reachable states seems quite low, hence this solution must be safe. However there was a way to reduce the (avg_number_of_moves_possible_per_state). The idea is to detail the events in a differrent way -- instead of saying how long you wait at a bank, say how many units you load at the bank. This will ask you to wait until a particular time at which that number of units becomes available. Since the number of units that the boat can load is at most 50, the transitions/state is at most 50. While this might not really help the run-time of the problem, it's a useful idea to try out various ways to describe the changes, and choose ones which minimize the transitions/state.
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/myprasanna_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13366203" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
