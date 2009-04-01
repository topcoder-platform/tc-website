<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 57 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=HSRoundOverview&amp;rd=13526&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="523423" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 57</span><br />Saturday, September 20, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
TCHS SRM 57 was easier than a typical TCHS SRM, with higher than 50% success rate in all 3 problems. More than 30 coders submitted all 3 problems, and 16 coders were able to get all 3 correct. The winner was <tc-webtag:handle coderId="22664055" context="hs_algorithm"/>, who finished 3 problems within 20 minutes after the contest started.

</p> 
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9821&amp;rd=13526" name="9821">WordFindPuzzle</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9821)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523423" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      95 / 114 (83.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      73 / 95 (76.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>petar1</strong> for 245.71 points (3 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      172.54 (for 73 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem itself is very easy and straightforward. You are given a few words (or possibly none) and a board. You are asked to find those words on the board. One tricky thing is that the word must be found both horizontally and vertically. Another is that the word can be reversed so that 'abc' can be found if there is 'cba' on the board, for instance.<br />
To check if a word can be found horizontally on the board, we need to go through each row of the board and to check if a word can be found in the row left-to-right or right-to-left. string.find() in C++ or String.indexOf() in Java can be used to check whether a word is found left-to-right in a row of the board. To check if it can be found right-to-left, we can simply reverse the word and do the same thing.<br />
Once a word is found horizontally, we now want to check if the word can also be found vertically. One trick is to rotate the given board by 90 degrees either clockwise or counter-clockwise. Once the board is rotated, we can try finding a word horizontally on the rotated board so see if it were to be found vertically on the original board. In practice, it can be done by constructing a string object representing a column instead of row (which was given).<br /> 
<tc-webtag:handle coderId="22677505" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&amp;cr=22677505&amp;rd=13526&amp;pm=9821">solution</a> can be a good reference.

</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10071&amp;rd=13526" name="10071">TwoLotteryGames</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10071)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523423" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      63 / 114 (55.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      55 / 63 (87.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>v3ctor</strong> for 496.84 points (2 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      396.83 (for 55 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In many countries, it is not rare to see lottery advertisements like 'choose 6 numbers out of 45 numbers, blah blah...' or 'take 5 numbers out of 39 numbers, blah blah...'. When you pass by the newsstand near your home, school, or work, you might compute the winning probability, from time to time. <br />
In New York, USA, for instance, there is this lottery game called 'TAKE 5' where you choose 5 numbers between 1 and 39, inclusive. The winning probability (where you get all 5 numbers that will be chosen later) is easy to compute: 1 / Binom(39, 5) = 1 / 575757. Now there could be a second place where you get only 4 numbers correctly, and it is not very hard to compute. Out of 5 numbers that you choose, 4 numbers MUST BE chosen by the organizers and the other number MUST NOT BE chosen: Binom(5, 4) * Binom(39-5, 5-4) / Binom(39, 5) = 5 * 34 / 575757. <br />
Now it can be generalized. the probability that you get exactly x numbers correctly is Binom(m, x) * Binom(n-m, m-x) / Binom(n, m). Thus, for the given problem, where it states 'at least k numbers', we can just sum up the probabilities for evrey x between k and m, inclusive. <br />
See <tc-webtag:handle coderId="22694926" context="hs_algorithm"/><a href="/tc?module=HSProblemSolution&amp;cr=22694926&amp;rd=13526&amp;pm=10071">solution</a> as a reference to this approach. <br />
It is worth to note that this problem can be solved by brute-force approach as well since n is small enough. Since there can be at most 8 numbers from which you can choose, you can try all possible combinations of m numbers chosen out of 1..n, inclusive. Without loss of generality, we can assume that the organizers will choose m numbers (1, 2, ..., m). Then, we can easily count the number of permutations that contain more than or equal to k numbers between 1 and m, inclusive. Take an example with n = 5, m = 3, k = 2. Then, there are 5C3 = 10 possible combinations:<br />
(1, 2, 3) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 2, 4) <br />
(1, 2, 5) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 3, 4) <br />
(1, 3, 5) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 4, 5) <br />
(2, 3, 4) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2, 3, 5) <br />
(2, 4, 5) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (3, 4, 5) <br />
Out of these 10 combinations, there are only 7 combinations that contain 2 or more numbers between 1 and 3, inclusive: <br />
(1, 2, 3) <br />
(1, 2, 4)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 2, 5) <br />
(1, 3, 4)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 3, 5) <br />
(2, 3, 4)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2, 3, 5) <br />
This approach will take roughly O(n!). n is fairly small so that this approach would not cause a time-out.<br />
Solutions with brute-force approach can be shorter than the classic binomial, probability approach. Because, at the end of the day, what we want to achieve during the competition is get a high score one each problem, you might better off writing a inefficient, short solution than a very elegant solution. <br />
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10064&amp;rd=13526" name="10064">LostSortingAlgorithm</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10064)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523423" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      35 / 114 (30.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 35 (54.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>v3ctor</strong> for 965.78 points (5 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      694.58 (for 19 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem came to my mind when I was in Decision Theory class. You are given a number of prioritized attributes and a list of objects represented by the attribute values. Can you sort all the objects such that the prioritization of attribute will not violated by any pair of two objects? This problem is too trivial for TopCoder members as it just involves a sorting algorithm. One question came to my mind: 'if you are given such sorted objects, could you recover the prioritization of the attributes?' It is a fairly easy question as long as the number of attributes is small, like in this problem LostSortingAlgorithm. <br />
To solve this problem, you can try all permutations of attributes, and check if there is a conflict between two houses; alternatively, you can also sort the houses with the chosen permutation and check if newly sorted houses have the same order as the given list of houses - either way, n is fairly small. If you can find a successful permutation of attributes, you just return it. If you find more than one, report that there are too many possible ways. Otherwise, report that no permutation can make it - Helen must have sorted in the wrong way in this case. <br />

See <tc-webtag:handle coderId="22664055" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&amp;cr=22664055&amp;rd=13526&amp;pm=10064">solution</a> using this approach. <br />

Question: if the number of attribute can be up to 15 and the number of houses up to 1000, can you find an efficient solution?
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/ltdtl_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15511417" context="algorithm" /><br />    <em>TopCoder Member</em>
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
