<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 53 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=HSRoundOverview&amp;rd=13486&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="522385" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 53</span><br />Wednesday, July 23, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
In this match 73 competitors faced a set of trivial Easy, tricky Medium and neutral Hard 
(which ended having more correct solutions than Medium) problems.
<br /><br />
The challenge phase was relatively calm, with 12 successfull challenges.
Surprisingly, the system test brought down all but 10 submissions on Medium.
<br /><br />
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/> 
took home one more match win with 5 successfull challenges, 
<tc-webtag:handle coderId="22675094" context="hs_algorithm"/> 
and 
<tc-webtag:handle coderId="22686287" context="hs_algorithm"/> 
rounded out the top three.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9818&amp;rd=13486" name="9818">DNAConstruction</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9818)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522385" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      69 / 71 (97.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      65 / 69 (94.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bbi5291</strong> for 249.17 points (1 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      229.24 (for 65 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Since there is no restriction for the sequence of nucleotides that form each DNA chain,
the DNA molecule can be constructed from any set of complementary pairs, and its length
will be equal to the number of complementary pairs used.
To form an AT pair, we need both A and T nucleotides, so
if we have <strong>NA</strong> A nucleotides and <strong>NT</strong> T nucleotides, we can form at most 
<strong>min(NA, NT)</strong> AT pairs. Same logic can be applied to CG pairs.
<br /><br />
Finally, to find the maximal number of complementary pairs in a set of nucleotides
(and the maximal length of a DNA molecule which can be constructed using it),
we need to count the numbers of nucleotides of each type in the input set, and 
return <strong>min(NA, NT) + min(NC, NG)</strong>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9804&amp;rd=13486" name="9804">AnomalousCancellation</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9804)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522385" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      45 / 71 (63.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 45 (22.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>neal_wu</strong> for 404.83 points (14 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297.17 (for 10 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The idea of the solution is pretty straightforward: implement the cancellation procedure exactly 
as described in the statement. Pseudocode follows:
<pre>
for each subsequence of digits of numerator
    for each subsequence of digits of denominator
        check whether cancelling these subsequences of digits is valid:
            the numbers of digits in both subsequences must be equal
            the digits in both subsequences are the same 
        and appear in the same order
            the fraction left after cancelling the subsequences is valid:
        there are didits left in both numerator and denominator
        both numerator and denominator are positive
        the fraction left after cancelling is equal to the original fraction
        if cancelling the subsequences is valid, compare the resulting numerator 
        and the current minimal numerator (initially it is the original
        numerator)
    if the resulting numerator is less than the current minimal one, 
        store the notation of the resulting fraction as the return value
</pre>
See 
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&amp;cr=22663117&amp;rd=13486&amp;pm=9804">solution</a>
for a sample implementation.
<br /><br />
However, the problem turned out to be really tricky for most of the competitors.
Two most popular mistakes were cancelling same digits in wrong order and not checking
whether the resulting fraction is equal to the original fraction.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9803&amp;rd=13486" name="9803">LockedDoors</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9803)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522385" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      21 / 71 (29.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 21 (76.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bbi5291</strong> for 872.43 points (11 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      681.59 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem can be solved using 
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=graphsDataStrucs2">BFS</a>
with states 
(x-position of the cell, y-position of the cell, bitmask of the keys carried after entering the cell).
The only difference from the ordinary BFS is handling the 6-bit keys bitmask:
<ul><li>
at the start keys bitmask is 000000 (no keys picked up)
</li><li>
if the cell which is to be entered is a key, the corresponding bit of the keys bitmask must be set to 1
</li><li>
if the cell which is to be entered is a door, it can be entered only if the corresponding bit of the keys bitmask
is set to 1
</li></ul>
See 
<tc-webtag:handle coderId="22686287" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&amp;cr=22686287&amp;rd=13486&amp;pm=9803">solution</a>
for a sample implementation.
</p>

 

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15635590" context="algorithm" /><br />    <em>TopCoder Member</em>
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
