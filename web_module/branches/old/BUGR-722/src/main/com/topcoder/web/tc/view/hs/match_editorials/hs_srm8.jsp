<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>

    <jsp:include page="../../script.jsp"/>
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
<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

    <tc-webtag:forumLink forumID="506030" message="Discuss this match"/></div>
<span class="bodySubtitle">TCHS SRM 8</span><br>Monday, July 24, 2006
<br><br>

<h2>Match summary</h2>
Three questions with a few hidden tricks resulted in 83 failed solutions out of a total of 207 submissions for TCHS SRM
8, the second in the Delta Quadrant.
<tc-webtag:handle coderId="22375930" context="algorithm"/> capitalised on this, with 325 points from challenges
resulting in an impressive 1893.29 before the system tests had begun.
However, the testing phase claimed as many solutions as the challenge phase, leaving only 6 members with all 3
submissions still standing. Of those, newcomer <tc-webtag:handle coderId="22629359" context="algorithm"/>
had the best possible debut, placing 1st, with <tc-webtag:handle coderId="20246344" context="algorithm"/> coming in
second by a very narrow 0.62 points, and <tc-webtag:handle coderId="7555099" context="algorithm"/> rounding out the top
3 less than a challenge behind.

<H1>The Problems</H1>

<font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=6259&amp;rd=10060" name="6259">FussySleeper</a></b></font>
<A href="Javascript:openProblemRating(6259)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506030" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>
<br>Used as: Division One - Level One:
<blockquote>
    <table cellspacing="2"><tr>
        <td class="bodyText" style="background: #eee;"><b>Value</b></td>
        <td class="bodyText" style="background: #eee;">250</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
            <td class="bodyText" style="background: #eee;">113 / 125 (90.40%)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td>
            <td class="bodyText" style="background: #eee;">69 / 113 (61.06%)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td>
            <td class="bodyText" style="background: #eee;"><b>RuslanSM</b> for 247.77 points (2 mins 42 secs)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td>
            <td class="bodyText" style="background: #eee;">217.67 (for 69 correct submissions)</td></tr>
    </table>
</blockquote>

As the time "00:00" is divisible by every number, you are guaranteed to have at least one solution. With only 24 * 60 =
1440 minutes to check,
it is sufficient to simulate the time, until we get one where we can fall asleep. This can be done minute by minute,
being careful to not simulate illegal times, such as 9:61 or 24:00.<br>
<br/>
To test for divisibility, you can first get the 4-digit number 'HH:MM' by calculating 100*HH + MM. Next, to check if
this is a multiple of the number of elephants,
you may find the mod operator '%' useful, as divisibility is the same as checking whether (100*HH + MM) % elephants ==
0.<br>
<br/>
This strategy was in the <a href="/tc?module=HSProblemSolution&amp;cr=22378820&amp;rd=10060&amp;pm=6259">solution</a> by
the fastest submitter, <tc-webtag:handle coderId="22378820" context="hs"/>, and can be seen below:<br/>
<pre>
    do{
    currentTime[1] ++; // increment minute
    if(currentTime[1] == 60)
    currentTime[0] ++; // increment hour

    currentTime[0] %= 24; // fix times
    currentTime[1] %= 60;
    } while((currentTime[0] * 100 + currentTime[1]) % elephants != 0);

    return currentTime;
</pre>

<br>

<font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=6572&amp;rd=10060" name="6572">WordMath</a></b></font>
<A href="Javascript:openProblemRating(6572)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506030" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>
<br>Used as: Division One - Level Two:
<blockquote>
    <table cellspacing="2">
        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td>
            <td class="bodyText" style="background: #eee;">500</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
            <td class="bodyText" style="background: #eee;">61 / 125 (48.80%)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td>
            <td class="bodyText" style="background: #eee;">49 / 61 (80.33%)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td>
            <td class="bodyText" style="background: #eee;"><b>Weiqi</b> for 480.08 points (5 mins 50 secs)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td>
            <td class="bodyText" style="background: #eee;">341.40 (for 49 correct submissions)</td></tr>
    </table>
</blockquote>

One way to approach this problem, as <a href="/tc?module=HSProblemSolution&amp;cr=22375930&amp;rd=10060&amp;pm=6572">coded</a>
by <tc-webtag:handle coderId="22375930" context="algorithm"/>, was to try every single letter-to-digit mapping,
calculate the sum for each, and return the best of these. To get all the possible mappings you can put the digits {0, 1,
...} into an array, and use a next_permutation method
to iterate through every combination. At worst case, this uses around 10! combinations * 8 letters * 10 words = 290
million. <br/>
<br>
This will only just run in time, providing you use efficient storage, but some optimisations can be implemented to help
speed things up. The key is to realise that you can do a bit of precalculation,
by treating the digits as variables, similar to an algebra question. For example:<br/>
<pre>"CAB" = 100 * C + 10 * A + 1 * B, and
    "AB + BAC" = 20 * A + 101 * B + 1 * C</pre>
By calculating these multipliers at the start, it changes the operations to closer to 8 * 10 + 10!, which will easily
run in time. <br/>
<br>
However, using the representation above, looking at the second example you can see that if A were greater than B, you
could swap their digit values and the total would increase by (101 - 20) * (A - B).
This is enough to show that once we calculate how much each letter contributes to the overall total, we can greedily
assign the digits,
giving 9 to the letter with the greatest contribution, 8 to the next, and so on.<br>
<br/>
See <tc-webtag:handle coderId="20246344" context="algorithm"/>'s
<a href="/tc?module=HSProblemSolution&amp;cr=20246344&amp;rd=10060&amp;pm=6572">solution</a> for a neat implementation
of this.
<br>
<br>
<br>


<font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=6066&amp;rd=10060" name="6066">PendingTasks</a></b></font>
<A href="Javascript:openProblemRating(6066)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506030" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>
<br>Used as: Division One - Level Three:
<blockquote>
    <table cellspacing="2">
        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td>
            <td class="bodyText" style="background: #eee;">1000</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
            <td class="bodyText" style="background: #eee;">33 / 125 (26.40%)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td>
            <td class="bodyText" style="background: #eee;">6 / 33 (18.18%)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td>
            <td class="bodyText" style="background: #eee;"><b>reiten</b> for 514.30 points (35 mins 42 secs)</td></tr>
        <tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td>
            <td class="bodyText" style="background: #eee;">470.40 (for 6 correct submissions)</td></tr>
    </table>
</blockquote>


On first inspection, the input of this problem may seem a bit unusual. If you consider the tasks as nodes, and
dependencies as edges,
then the input describes a graph. This is also a special type of graph, as the constraints make it a directed graph,
with no cycles,
and exactly one edge out of all but the last node. In other words, a tree rooted at the last task, such as:<br/>
<br><br>

<div align="center">
    <img src="/i/srm/tchs_srm_8.gif" alt="" border="0"/>
</div>
<br><br>
An important realisation is that every node (task) can only be in one of three states:
<ul>
    <li><b>Not executed</b>. If a node is not used, then at most one of its children will used, the rest must be unused.
    </li>
    <li><b>Forced execution</b>. This occurs when the execution of this node will eventually force the root node to be
        executed. In this case, exactly one if its children is used voluntarily, and one other can be a forced
        execution.</li>
    <li><b>Voluntary execution</b>. A node is in this state is executed, but its execution doesn't cause the root task
        to be executed. As its execution does not force termination, all of its children can then also be executed
        voluntarily after it.</li>
</ul>
Using this observation, we can define three values for each node, being the maximum number of tasks that can be executed
in the subtree rooted at node #ref if that node is:<br>
<br/>
not executed = <tt>cache[ref][0]</tt>, a forced execution = <tt>cache[ref][1]</tt> or a voluntary execution = <tt>
    cache[ref][2]</tt><br/>
<br>
The solution is the number of tasks that can be executed before the final task must be, so the required answer is
cache[#tasks - 1][1] - 1;<br/>
The question then is how to calculate these cache values. Using the descriptions above, in pseudocode:<br/>
<pre>
    // task is not executed
    cache[ref][0] = 0 +
    sum( cache[child][0] ) +
    // voluntarily execute the single child that has the best benefit
    max( cache[child][2] - cache[child][0] );

    // task is executed
    cache[ref][1] = 1 +
    sum( cache[child][0] ) +
    // execute two children(c1, c2), one forced.
    max( cache[c1][2] - cache[c1][0] + cache[c2][1] - cache[c1][0] );

    // task is executed
    cache[ref][2] = 1 +
    // all subtasks voluntarily executed too
    sum( cache[child][2] );
</pre>
The ordering of tasks in the input meant you could loop through all tasks and calculate the cache values in order,
taking care to handle the special cases when a task has 0 or 1 children. For a solution which implements the memoized
version of this, see the
<a href="/tc?module=HSProblemSolution&amp;cr=22522591&amp;rd=10060&amp;pm=6066">solution</a> by
<tc-webtag:handle coderId="22522591" context="algorithm"/>.
In this, Time1(ref) calculates cache[ref][0], TimeMin(ref) calculates cache[ref][1], and TimeAll(ref) calculates
cache[ref][2].<br/>
<br>
Also, for those who enjoyed this problem, here are two variations to ponder:
<ul>
    <li>The above algorithm is O(N<sup>3</sup>), as the calculation of cache[ref][1] is quadratic at worst. Is this the
        best you can do?</li>
    <li>What is the best algorithm if the tasks must be executed at priority 3, rather than 2? How about k?</li>
</ul>

<div class="authorPhoto">
    <img src="/i/m/sql_lall_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="275640" context="algorithm"/><br />
    <em>TopCoder Member</em>
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
