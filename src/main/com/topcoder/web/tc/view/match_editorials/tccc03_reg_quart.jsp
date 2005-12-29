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
<tc-webtag:forumLink forumID="505566" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Collegiate Challenge <br> Regional QuarterFinals</span><BR/>Wednesday, February 26, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p>  Tension builds as we get closer and closer to the finals.  This round, the Regional Quarterfinals, proved to be
    one of the most interesting to date.  After 15 minutes only a few competitors submitted the easy problem, a
    departure from the normal frantic pace.  John Dethridge, the top ranked competitor, was seemingly unfazed by
    the problem set.  He sped through all 3 problems winning the round by a margin.  Quite amazingly he finished
    both the easy and the hard before second highest ranked coder Yarin submitted his first problem.  As time passed
    many coders finished the treacherous easy and were able to complete the rest of the problems.  Although slightly
    troubled by the easy problem, Reid finished off the rest of the set with ease propelling him to second place.
    Previous tournament champions jonmac and dmwright are both returning to top form winning their respective rooms.

</p>

<h1>The Problems</h1>

<font size="+2"><b>Champagne</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505566" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 1 - Level 1:
<blockquote>
  <table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">300</td></tr>
    <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">168 / 273  (61.54%) </td></tr>
    <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">100 / 168  (59.52%)</td></tr>
    <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>John Dethridge</b> for 272.77 points</td></tr>
  </table>
</blockquote>

<p>
    One popular way to solve this problem involves building an array of the entire champagne glass tower simulating
    the process second by second.  At the beginning of each iteration pour 1 unit of champagne into the first glass.
    Then loop through the entire tower searching for spills.  If a spill occurred, distribute its contents to the two
    glasses below it.  An optimization on this method involves pouring all of the champagne into the first glass all
    at once, and processing the rest of the tower as before.  Some other coders used recursive methods that similarly
    handled spillage and distribution of champagne.  An easy way to deal with the required fractional amounts was to
    pick some arbitrarily large power of 2 and store all glass contents as fractions of that amount.  2^23 would have
    been more than sufficient for all of the possible tower sizes.  At the end a call to a GCD function would reduce
    the fraction producing the correct results.  This method avoids the use of any floating points values.

</p>
<font size="+2"><b>Marketing</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505566" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 1 - Level 2:
<blockquote>
    <table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">99 / 273  (36.26%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">66 / 99  (66.67%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>sjelkjd</b> for 448.58 points</td></tr>
    </table>
</blockquote>

<p>
    The problem requirements cleanly map to a pair of concepts in the field of graph theory.  Splitting the marketed
    products equally to two consumer groups corresponds to the notion of bipartite or 2-colorable graphs.  Once a
    graph is determined to be bipartite one must determine the number of distinct connected components in order to
    calculate the flexibility present in marketing schemes.  2-colorability is quickly verified using a depth first
    search that colors each adjacent vertex with a different color.  If you ever try to color the same vertex twice
    with a different color each time, the graph is not bipartite and your method can return -1 immediately.  To
    determine the number of components a depth first search will suffice again.  A single call to the search on a
    particular vertex will identify all reachable vertices.  Repeating this process until all vertices have been
    reached one way or another will produce the number of components.  2 raised to this number is the number of
    possible ways to market the products.
</p>
<font size="+2"><b>Macros</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505566" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 1 - Level 3:
<blockquote>
    <table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">39 / 273  (14.29%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">18 / 39  (46.15%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>John Dethridge</b> for 888.44 points</td></tr>
    </table>
</blockquote>

<p>
This problem is related to a well known algorithm in formal language theory that determines which strings are
    derivable from a given grammar.  The existence of this algorithm, called CKY after its inventors, proves that
    the membership problem for context-free languages is decidable.  Using dynamic programming this algorithm
    determines which non-terminals (called Variable Characters in the problem) can produce fragments of the string,
    and then builds the entire string from these fragments.  For example, lets say the string was &quot;abba&quot;.
    The algorithm would first determine which 2 character substrings can be produced by the given rules and how they
    are produced, i.e. whether ab, bb, and ba can be derived and which non-terminals can produce them.  Using that
    information it tries produce the 3 character substrings.  This continues until it determines which non-terminals
    can produce the entire string.
</p>

<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
