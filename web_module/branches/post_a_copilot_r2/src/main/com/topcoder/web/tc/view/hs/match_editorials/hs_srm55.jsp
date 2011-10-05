<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 55 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=HSRoundOverview&amp;rd=13524&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="523059" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 55</span><br />Tuesday, August 26, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
Easy problem appeared to be really easy, so almost all coders successfully solved it. Medium was a bit more tricky and only 11 solutions passed system tests.
There was only one correct solution for the hard and it brought first place to <tc-webtag:handle coderId="22707311" context="algorithm"/>. He was followed by <tc-webtag:handle coderId="22692508" context="algorithm"/> and <tc-webtag:handle coderId="22687801" context="algorithm"/>.
</p> 
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9955&amp;rd=13524" name="9955">VeryInterestingMovie</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9955)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523059" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
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
      51 / 53 (96.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 51 (88.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>xiaowuc1</strong> for 249.28 points (1 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.22 (for 45 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first thing that has to be noticed is that problem can be solved for each row separately. Then you can see that the problem can be solved
for each consecutive group of availible seats separately. If such group has length <strong>L</strong>, then you can place <strong>L</strong>/2 students on this places
if <strong>L</strong> is even or (<strong>L</strong>+1)/2 studenrs, otherwise. Look here for a very short 
<a href="/tc?module=HSProblemSolution&amp;cr=22717415&amp;rd=13524&amp;pm=9955">solution</a> 
by <tc-webtag:handle coderId="22717415" context="algorithm"/>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9957&amp;rd=13524" name="9957">MagicStones</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9957)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523059" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
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
      17 / 53 (32.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 17 (64.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>gogokefakefa</strong> for 465.28 points (7 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      304.39 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem was to find the maximum period of a permutation of length <strong>N</strong>. The period of a permutation is the minimum number of repeated invokations
required to get back to start. Looking at any permutation you can notice that it can be broken into some cycles. The least common multiple of the lengths 
of these cycles is the period of the permutation. For example let's look on the permutation {1,4,0,3,2,5}. It has two cycles: 0->1->4->2->0 and 3->5->3.
Their lengthes are 4 and 2, so the period of permutation will be lcm(4,2) = 4. So the problem is to select such numbers <strong>x<sub>1</sub></strong>, <strong>x<sub>2</sub></strong> , ... , <strong>x<sub>k</sub></strong> that <strong>x<sub>1</sub></strong> + <strong>x<sub>2</sub></strong> + ... + <strong>x<sub>k</sub></strong> = <strong>N</strong> and 
lcm (<strong>x<sub>1</sub></strong>, <strong>x<sub>2</sub></strong>, ... , <strong>x<sub>k</sub></strong>) is as big as possible. As it is clear that it is useless to use cycles of equal
length the problem can be solved by finding all such sets of <strong>x<sub>1</sub></strong>, <strong>x<sub>2</sub></strong>, ... , <strong>x<sub>k</sub></strong>, where all
<strong>x<sub>i</sub></strong> are unique and their sum is not greater than <strong>N</strong> and then selecting the set with the greatest least common multiple.
You can see the implementation of this idea in this 
<a href="/tc?module=HSProblemSolution&amp;cr=22740595&amp;rd=13524&amp;pm=9957">solution</a> by
<tc-webtag:handle coderId="22740595" context="algorithm"/>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9958&amp;rd=13524" name="9958">CollectingPostmarks</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9958)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523059" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
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
      9 / 53 (16.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 9 (11.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>wcao</strong> for 722.30 points (19 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      722.30 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first quiestion which appeared was "What do I have to do with the postmarks which I already have ?". And the answer was quite clear. As sell and buy
prices for each postmark are equal you can initialy sell all the postmarks you have and maybe buy some of them later. So now we can assume that we have
no postmarks and need to find the set of postmarks with total value not less than <strong>K</strong> and total price as small as possible. Let's divide all the 
postmarks into two groups of equal sizes (if the number of postmarks is odd one of the groups will have 1 more element than the other). Each group will 
have not more than 16 postmarks and the number of subsets of postmarks of each group will be not greater than 2<sup>16</sup>. So we can list all subsets 
of postmarks of first and second group and call the lists <strong>A</strong> and <strong>B</strong> respectively. It is also clear than if for some two subsets of first group 
numbered <strong>i</strong> and <strong>j</strong> it appears that <strong>A</strong>[<strong>i</strong>].cost >= <strong>A</strong>[<strong>j</strong>].cost and <strong>A</strong>[<strong>i</strong>].value <= <strong>A</strong>[<strong>j</strong>].value
then subset <strong>A</strong>[<strong>i</strong>] is useless (it will be always better to use subset <strong>A</strong>[<strong>j</strong>] than subset <strong>A</strong>[<strong>i</strong>]). The same is correct
for list <strong>B</strong>. Now let's assume that both list are ordered in such way that for any <strong>i</strong>: <strong>A</strong>[<strong>i</strong>].value < <strong>A</strong>[<strong>i</strong>+1].value, <strong>A</strong>[<strong>i</strong>].cost < <strong>A</strong>[<strong>i</strong>+1].cost, <strong>B</strong>[<strong>i</strong>].value < <strong>B</strong>[<strong>i</strong>+1].value and <strong>B</strong>[<strong>i</strong>].cost < <strong>B</strong>[<strong>i</strong>+1].cost. Now for each <strong>i</strong> we can find such <strong>j</strong> that <strong>A</strong>[<strong>i</strong>].value+<strong>B</strong>[<strong>j</strong>].value >= <strong>K</strong> 
and <strong>B</strong>[<strong>j</strong>].cost is as small as possible. The pair with the smallest total cost will be the answer. Using the order of elements in <strong>A</strong> 
and <strong>B</strong> all this pairs can be checked in linear time. You can see a clear implementation of this idea in this very fast 
<a href="/stat?c=problem_solution&amp;rm=298462&amp;rd=13506&amp;pm=9958&amp;cr=15868491">solution</a> 
by <tc-webtag:handle coderId="15868491" context="algorithm"/>
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/Gluk_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8433628" context="algorithm" /><br />    <em>TopCoder Member</em>
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
