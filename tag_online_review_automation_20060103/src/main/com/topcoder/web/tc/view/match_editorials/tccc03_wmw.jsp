<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505563" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Collegiate Challenge <br> Round 1 - W and MW Regional</span><BR/>Thursday, February 20, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p>The first round for the students in the W/MW regions was maybe a little easier than for those competing two days
    ago. The medium and the hard problem had low acceptance rate; the medium had several potential traps and special
    cases that you could fall in, and the hard involved geometry, a topic that can scare any TopCoder. Luckily the
    easy problem was easier, and since all that mattered was getting a positive score to advance to the next round
    (due to the low number of competitors), you only had to solve this one to be safe. <b>bigg_nate</b> got the top
    score, an impressive <b>1415.93</b> points, more than 200 points ahead of the runner-up.
</p>

<H1> The Problems </H1> 

<font size="+2"><b>FleasFleas</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505563" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">250</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">136 / 154  (88.31%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">116 / 136  (85.29%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>malpt</b> for 246.22 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>malpt</b> <i>(room 11)</i></p>

<h4>Implementation</h4><br/>

<p>This problem, which is recursive in description, can easily
be solved with a recursive approach. Let f(n,k) be the total
number of fleas. Of the n fleas, k are infested with n more fleas
of which k-5 are infested etc. So the general case is
f(n,k)=n+k*f(n,k-5). The terminal case if when k&lt;=0 in which
f(n,k)=n (none of the n fleas are infested, so we have n fleas).</p>

<p>It remains to deal with the overflow. If the function ever
wants to return a number greater than 10 million <i>or</i> -1,
we return -1. We must make sure not to calculate n+k*f(n,k-5)
right away - first we must check if f(n,k-5) is -1, then
we can calculate n+k*f(n,k-5).</p>


<font size="+2"><b>LongestRun</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505563" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">83 / 154  (53.90%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">31 / 83  (37.35%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>bigg_nate</b> for 405.00 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4><br/>

<p>This problem can be divided into two steps: either the longest run is in one string only, or it is in a
    concatenation of strings. The first case is trivial, we simply loop through all strings, and for each string we
    loop through all characters. If a character is the same as the previous character, we increase a counter with 1;
    otherwise we reset it to 1. The best result found over all strings is stored in some variable.</p>

<p>If the longest run is in the concatenation of several strings, it will be in the following format:</p>

<pre>

start-string intermediate-string intermediate-string ... stop-string
</pre>

<p>Clearly the intermediate strings can only be strings containing only one character, namely the last character of
    start-string and the first character of stop-string (these two characters must of course also be the same).
    We can now brute-force search for the start-string and stop-string with the following algorithm (pseudo-code):</p>

<pre>

loop through all possible start-strings
  loop through all possible stop-strings
    if start-string and stop-string are different
      if last char in start-string is the same as first char in stop-string
        let c=last char in start-string
        let count=number of c characters at the end of start-string +
           number of c characters at the beginning of stop-string
        loop through all remaining strings
          if string only contains letter c
            count=count+string length
          end if
        end loop
        if count is greater than best found so far
          update best
        end if
      end if
    end if
  end loop
end loop

</pre>

<font size="+2"><b>Tether</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505563" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1000</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">28 / 154  (18.18%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">8 / 28  (28.57%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>bigg_nate </b> for 780.13 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>dmwright</b> <i>(room 9)</i></p>

<h4>Implementation</h4><br/>

<p>This problem reduces to the following geometry problem: given a circle and two points, of which one point lies on
    the circle, calculate the shortest distance between them under the constraints that you may not "walk"
    (or whatever) inside the circle.</p>

<p>One of the points was (0,-r), where r is the radius of the circle, while the other point is x,y. Again there are
    two cases to consider: either the circle interferes with the shortest path, or it doesn't. In the latter case
    (which happens when y &lt;= -r) it's simply the Euclidean distance between the two points, calculated using
    Pythagoras formula.</p>

<p>In the trickier case, we start at 0,-r (point A) and walk along the circle perimeter, and then at some point
    (call it P) continue straight ahead to x,y (point B) - see figure. Clearly we should try to walk as little as
    possible along the circle and as soon as possible in a straight line.</p>

<img align="right" src="/contest/problem/Tether/cc.gif"></img>

<p>Using the notation in the picture, we see that the OPB is a right triangle - this will always be the case for the
    shortest path! We can now set up the following equations:</p>

<pre>
|OB| = sqrt(x*x + y*y)
|OP| = r
|BP| = sqrt(|OB|*|OB| - |OP|*|OP|)
cos(a) = |OP|/|OB|
tan(b) = x/y
t = p - a - b;
|AP| = t*r
|AB| = |AP| + |BP|
</pre>

<p>It's slightly trickier than this because you have to consider in which
quadrant B is. This can be solved using atan2 instead of atan, and taking
the absolute value of x (which won't affect the answer because of symmetry).
For implementation details, see the reference solution.</p>

<p>
<img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
