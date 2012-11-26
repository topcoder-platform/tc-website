<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 54 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13523&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="522873" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 54</span><br />Saturday, August 16, 2008
<br /><br />


<h2>Match summary</h2>
<p>Only 79 highschoolers participated in the match. They were faced with rather standard problem set, without any tricky problems.
Somewhat unexpectedly, almost the same number of coders correctly solved the medium and the hard problems. <tc-webtag:handle coderId="22675094" context="hs_algorithm"/> won the round thanks to
the fastest submission on the easy and not much slower one on the hard along with two successful challenges. <tc-webtag:handle coderId="22715873" context="hs_algorithm"/> and
<tc-webtag:handle coderId="22744485" context="hs_algorithm"/> rounded up the top three.</p>
<h1>The Problems </h1>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9946&amp;rd=13523" name="9946">ProblemSetter</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9946)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522873" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">250 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">70 / 79 (88.61%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">64 / 70 (91.43%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>crazyb0y</strong> for 246.20 points (3 mins 32 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">191.41 (for 64 correct submissions) </td>
</tr>
</tbody>
</table>
</blockquote>
<p>This problem was just a simple simulation of the process described clearly in the statement. We have to check
all triples of problems and choose the one which is the best for our purposes. The only thing to remember is to
search the triples in the correct order so we choose the triple with the easiest easy, the hardest hard and the easiest
medium possible. Of course we can also check the triples in any order by using tie breaker explicitly, but that requires much
more effort.</p>
<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9748&amp;rd=13523" name="9748">SegmentDisplay</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9748)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522873" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">500 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">42 / 79 (53.16%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">27 / 42 (64.29%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>bbi5291</strong> for 467.92 points (7 mins 32 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">330.71 (for 27 correct submissions) </td>
</tr>
</tbody>
</table>
</blockquote>
<p>What do we have here? We have some number of segments and we know how many segments we need for each digit.
The standard option is to choose any digit for the first position and try to make the rest of the number
with the rest of the segments. With dynamic programming we can count how many numbers can be formed with
different numbers of segments. The intuition seems to be very easy. If A(<em>k</em>) denotes how many different
numbers can be formed with <em>k</em> segments and we choose a digit that needs <em>p</em> segments, then the
rest of the number can be formed by A(<em>k</em> - <em>p</em>) ways. So to calculate A(<em>k</em>), we should just check all the possibilities
for the first digit and sum up all the ways. The only tricky part were the leading zeros, but it didn't melt up things much. See
the fastest <a href="/tc?module=HSProblemSolution&amp;cr=22696982&amp;rd=13523&amp;pm=9748">submission</a>
by <tc-webtag:handle coderId="22696982" context="hs_algorithm"/> for a reference.</p>
<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9750&amp;rd=13523" name="9750">NumberPartition</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9750)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522873" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">1000 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">30 / 79 (37.97%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">26 / 30 (86.67%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>sim40_sh</strong> for 923.48 points (8 mins 19 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">656.17 (for 26 correct submissions) </td>
</tr>
</tbody>
</table>
</blockquote>
<p>This problem wasn't much more complicated than the previous one. The first thing we should concern is how to count
how many different partitions there are for a given number. The approach for this part of the problem is almost the same
as in the medium. If we're partitioning number <em>p</em>, we have to choose the smallest number in the partition. It may be any
number between 1 and <em>p</em>, inclusive. If we choose <em>q</em>, then the rest of the parition will be the partition
of <em>p</em> - <em>q</em> with the smallest number being bigger than or equal to <em>q</em>. Quite standard two-dimensional dynamic
programming solution will solve the problem for us. Let A(<em>p</em>, <em>q</em>) denote the number of different partitions of <em>p</em>
with the smallest number in each partition being at least <em>q</em>. Then, of course
<pre>
&nbsp;&nbsp;A(<em>p</em>, <em>q</em>) = sum for all <em>i</em> from <em>q</em> to <em>p</em> ( A(<em>p</em> - <em>i</em>, <em>i</em>) )
</pre>
Ok, so we know how to count different partitions of a given number. Now we want to costruct them. That's also not so hard. We have
to determine the first number in the partition. We know how many partitions there are that have 1 at the first place, how many have 2 at
the first place and so on. So we know in which group is the <strong>k</strong>-th one we're looking for. As we know the first number, we know which
partition from those that have the same first number is the one we're interested in. We just have to subtract from <strong>k</strong> the number
of partitions that have smaller first number. Now, if we subtract this first number we found from <strong>n</strong>, we are left with smaller problem
and we can solve it in exactly the same way. See a nice and clear
<a href="/tc?module=HSProblemSolution&amp;cr=22675094&amp;rd=13523&amp;pm=9750">implementation</a> of the above by
<tc-webtag:handle coderId="22675094" context="hs_algorithm"/> for a reference.
</p>
<p>
The alternative way of solving this problem is to note that <strong>k</strong> can't be big (the limit is
1,000,000, and in fact the number of partitions when <strong>n</strong>=50 is even less - 204,226). So we
can implement recursive brute force algorithm which generates absolutely all partitions
and stop it when <strong>k</strong> of them were generated.
</p>

<div class="authorPhoto">
    <img src="/i/m/mateuszek_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11801002" context="algorithm" /><br />    <em>TopCoder Member</em>
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
