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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=11150&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="519249" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS08 Online Round 3</span><br />Saturday, January 26, 2008
<br /><br />


<h2>Match summary</h2> 

<p>

The round started smoothly with very straightforward easy and a medium that also turned out to be not as medium
as we expected. <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> was the first to submit all three
problems, but shortly he was overtaken by <tc-webtag:handle coderId="22285847" context="hs_algorithm"/> and
<tc-webtag:handle coderId="20812309" context="hs_algorithm"/>. Then, due to two resubmits on the hard he lost the spot in the
top ten. After the coding phase, <tc-webtag:handle coderId="22285847" context="hs_algorithm"/>,
<tc-webtag:handle coderId="20812309" context="hs_algorithm"/> and <tc-webtag:handle coderId="14768757" context="hs_algorithm"/>
were at the top. Unfortunately, <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>'s hard failes system test, so
<tc-webtag:handle coderId="14768757" context="hs_algorithm"/> took his spot. <tc-webtag:handle coderId="22664055" context="hs_algorithm"/>
rounded up the top three with <tc-webtag:handle coderId="22628118" context="hs_algorithm"/> and
<tc-webtag:handle coderId="22673643" context="hs_algorithm"/> being very close.

</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<strong><a href="/stat?c=problem_statement&amp;pm=8563&amp;rd=11150" name="8563">SimilarWords</a></strong>

</font>

<A href="Javascript:openProblemRating(8563)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519249" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level One: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Value</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      250

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Submission Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      96 / 97 (98.97%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Success Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      95 / 96 (98.96%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>High Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      <strong>Zuza</strong> for 248.96 points (1 mins 50 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Average Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      232.81 (for 95 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem can be easily solved with brute force. We can iterate over all pairs of words and check
their similarity. Computing similarity isn't much effort too. For each letter we just count how many
times it appears in one word and how many times in the second one and we take the minimum of these
two. The only catch may be the case insensitive comparison, but examples clarified this issue.

</p>

<font size="+2">

<strong><a href="/stat?c=problem_statement&amp;pm=8445&amp;rd=11150" name="8445">OneTwoThree</a></strong>

</font>

<A href="Javascript:openProblemRating(8445)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519249" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Value</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      500

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Submission Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      89 / 97 (91.75%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Success Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      85 / 89 (95.51%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>High Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      <strong>ahyangyi</strong> for 495.13 points (2 mins 49 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Average Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      386.96 (for 85 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

What does it mean that number <em>K</em> is divisible by all the integers
between 1 and <strong>n</strong>? It simply means that each prime factor of each number between 1 and <strong>n</strong>
is also a prime factor of <em>K</em>. Assume that we are given a prime number <em>p</em> and we want to
know the power it appears with in the smallest number that meets our criteria. Of course it will be
the greatest <em>a</em> such that <em>p<sup>a</sup></em> does not exceed <strong>n</strong>, as a greater power
does not appear in any number between 1 and <strong>n</strong>. So we can simply iterate over all primes between
1 and <strong>n</strong> and compute their powers. The only issue here is not to overflow types. You can see
a nice and clear implementation of the above in <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>'s
<a href ="/tc?module=HSProblemSolution&cr=11972352&rd=11150&pm=8445">solution</a>.

</p>

<font size="+2">

<strong><a href="/stat?c=problem_statement&amp;pm=8447&amp;rd=11150" name="8447">RectanglesArrangement</a></strong>

</font>

<A href="Javascript:openProblemRating(8447)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519249" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Value</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      1000

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Submission Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      37 / 97 (38.14%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Success Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      25 / 37 (67.57%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>High Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      <strong>Loner</strong> for 914.64 points (8 mins 50 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Average Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      546.75 (for 25 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The key observation here is that we shouldn't change the initial order of the rectangles. Why?
They are all the same, so we won't achieve anything clever by swapping them. So naturally, the first
thing we should do is to sort the rectangles. The second thing we now for sure is that the first
rectangle must have its left end an the square <strong>a</strong>. Now assume that we've covered squares from <strong>a</strong> to
<strong>a</strong> + <em>i</em>, inclusive for some <em>i</em> using <em>j</em> first rectangles. What
do we do next? We can try every position of the <em>j</em> + 1-th rectangle and see how many
squares we can cover. So, using a simple dynamic programming algorithm we can compute
the answer. See <tc-webtag:handle coderId="22285847" context="hs_algorithm"/>'s
<a href="/tc?module=HSProblemSolution&cr=22285847&rd=11150&pm=8447">solution</a> for
a reference, as it's ideal implementation of the above idea.

</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/mateuszek_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11801002" context="algorithm"/><br />    <em>TopCoder Member</em>
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
