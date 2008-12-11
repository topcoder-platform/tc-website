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
    <A href="/tc?module=HSRoundOverview&rd=10654&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506246" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 30</span><br>Monday, January 29, 2007
<br><br>

<h2>Match summary</h2>

This match was pretty uneven, with standard easy and medium problems and a particularly tough hard that only 2 coders
were able to solve.
<br />
<br />
<tc-webtag:handle coderId="22652634" context="hs_algorithm"/> and <tc-webtag:handle coderId="22641901" context="hs_algorithm"/>
were the only 2 to get any points for the hard problem, earning them spots in first and second
place respectively. The difference between them was almost only the hard, since they had pretty similar performances
on both the easy and the medium. Third place was taken by <tc-webtag:handle coderId="12005484" context="hs_algorithm"/>,
 who got pretty good scores on the easy and the medium and, with the help of the succesful challenge, pulled ahead
of all the other coders who did not solve the hard.

<H1>
The Problems
</H1>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7429&amp;rd=10654" name="7429" onClick="return (false);">HowManyBirthdays</a></b>

</font>

<A href="Javascript:openProblemRating(7429)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506246" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      206 / 222 (92.79%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      179 / 206 (86.89%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>exod40</b> for 249.26 points (1 mins 33 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      223.23 (for 179 correct submissions)

    </td>

  </tr>

</table></blockquote>

This problem was pretty easy, but if you didn't follow the instructions precisely it was also easy to get  wrong.
The easiest and fastest way to solve the problem is to avoid parsing the dates. Since we are only interested
in whether or not the date is equal to <b>today</b> we can just compare the string after the first space of
each member of <b>friends</b> with the string <b>today</b>. If they are equal, we append the name to the
result vector. After that, all you need to do is to sort the vector alphabetically, a function that all
languages have embeded. Most coders that failed this problem forgot about sorting the results or failed at
trying to manually parse the input. Always try to use embeded libraries for parsing.
<br /><br />
See <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>'s
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=14886245&rd=10654&pm=7429">code</a> for an
implementation.
<br /><br />


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7288&amp;rd=10654" name="7288" onClick="return (false);">GoodAndBadPostmen</a></b>

</font>

<A href="Javascript:openProblemRating(7288)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506246" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      149 / 222 (67.12%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      68 / 149 (45.64%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>fpavetic</b> for 461.27 points (8 mins 22 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      331.59 (for 68 correct submissions)

    </td>

  </tr>

</table></blockquote>

Like the easy, this problem was fairly straightforward but had the potential to be tricky. The basic idea is a greedy
approach. The last constraint basically give away the problem: &quot;Each element of <b>black</b> will contain at least one
postman who is not in <b>white</b>.&quot; If you understood that constraint, you probably knew how to solve the problem.
<br /><br />
First, we mark every postman in <b>white</b> as good. Then, we iterate each element of black and if there is exactly
one postman that is not in black, we add him to the set of &quot;bad postmen&quot; (is important not to count him, because
we may get the conclusion that a given postman is bad many times in different elements of <b>black</b>). Appart from
that, insert every postman into a set to know the total number. To wrap up, simply return as first coordinate
the size of the good postmen's set, as second the size of the bad postmen's and as third the size of all postmen's set
less the previous two numbers.
<br /><br />
Check out the
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22652634&rd=10654&pm=7288">solution</a> by <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>
 for code on this problem. To help you follow it,
s1 is the set of good postmen, s2 is the set of non-good (bad or unknown) postmen and bad is the set of
bad postmen.
<br /><br />



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7388&amp;rd=10654" name="7388" onClick="return (false);">AcidRain</a></b>

</font>

<A href="Javascript:openProblemRating(7388)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506246" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      1100

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      8 / 222 (3.60%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      2 / 8 (25.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>fatit</b> for 580.13 points (34 mins 12 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      509.82 (for 2 correct submissions)

    </td>

  </tr>

</table></blockquote>

I've said it before, but it bears repeating: This problem was difficult. Not so much for the
ideas that were needed, but because there was a lot of code to be written and a couple of little details to
take care of.
<br /><br />
Looking at the 10 upper bound for the x coordinate immediately got many coders thinking of an exponential
solution, which was indeed what was needed. Since you can only place a cover with integer endpoints, it's
clear that covering the rain at all integer points in the range is enough.
<br /><br />
The first part of the problem was doing some parsing, and getting [B,E] to [0,E'] by performing a translation
substracting B from every element of both <b>b</b> and <b>e</b>. From now on, E = E'. Now, we see that we have
to cover the E-1 points 1,2,..,E-1. We will define a function f that, given a subset of those points and
a height, calculate the best way to block the rain that is falling exactly at that subset of the points and
at the given height. Clearly, the answer of the question is f(ALL,maxy) where ALL means the entire set
{1,..,E-1} and maxy is the maximum y coordinate.
<br /><br />
The base cases shouldn't give you much trouble. It's clear that f(empty,Y) is 0 for any Y and f(X,0) is invalid for
non-empty X. We'll set f(X,0) to infinite to make it work (this trick of setting to a worse than anything
value the invalid cases works in almost every DP or memoized recursion).
<br /><br />
Now, we have to see how to calculate f(X,Y) for a non-empty X and a postive Y. First, take the actual
configuration of shields at that height. Each configuration can be expressed as a subset of {0,...,E-1}
where a belongs to the set if and only if there is a piece of shield in the segment [a;a+1] (we'll
represent this set with a boolean vector S of E positions numbered 0,...,E-1). Iterating
all existent shields, keep only those with height exactly Y and iterate each segment and for each
segment b-e set S[b]=S[b+1]=...=S[e-1]=true. That gives the current configuration. Now, iterate all
possible configurations (every superset of that represented by S) and for each configuration calculate
which points will have water falling once it passes the current height (you
know which points drop water on top of that configuration by looking at X). The
overall cost of a given configuration is C+f(NX,Y-1) where C is the number of shield segments that are
not in the current configuration (the added shields) and NX is the set of points in which the water
will continue to fall. Take the minimum of those for all possible configurations and you are done.
<br /><br />
The runtime analysis for this says that you have a range for f with 2<sup>E-1</sup>*maxy and at
each place you need to try at most 2<sup>E</sup> configurations getting to an overall runtime
of 2<sup>2*E-1</sup>*maxy. maxy can be pretty big, but since the order is the only thing that matters,
you can remap every Y coordinate to a number between 1 and 50 and then get the algorithm to run on
time by memoizing the function. The remapping can be done simply with the following C++ code (or pretty
similarly in other languages):

<pre>
set&lt;int&gt; ys;
for(int i=0;i&lt;y.size();++i) ys.insert(y[i]);
int j=0;
for(int j=0;!ys.empty();ys.erase(ys.begin()),j++)
	for(int i=0;i&lt;y.size();++i) if (y[i]=*ys.begin()) y[i]=j;
</pre>

For an example of code with an iterative approach see any of the solutions by the winners:
<ul>
<li><tc-webtag:handle coderId="22652634" context="hs_algorithm"/>'s
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22652634&rd=10654&pm=7388">
solution</a>.</li>
<li><tc-webtag:handle coderId="22641901" context="hs_algorithm"/>'s
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22641901&rd=10654&pm=7388">
solution</a>.</li>
</ul>
If you want to check out code with a memoized recursion approach, there are a couple of submissions
in the practice room.
<br /><br />


 

<div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />    <em>TopCoder Member</em>
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
