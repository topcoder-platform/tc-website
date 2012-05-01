<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12175">Match Overview</A><br />
    <tc-webtag:forumLink forumID="521320" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 403</span><br />Wednesday, May 28, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This single round match was realy lucky. Over 1000 of lucky coders, lucky problems, lucky time of the day (especially here, in Ukraine) and of course lucky numbers. What else
do you need to have have fun during 100 lucky minutes of TopCoder competition?
</p>
 
 <p>
Division 1 was won by young Ukrainian star <tc-webtag:handle coderId="22074760" context="algorithm"/> who was able to get higher score than three targets and many other
higher ranked coders. He was followed by <tc-webtag:handle coderId="10574855" context="algorithm"/> who took home silver medal again. Bronze this
time went to Venezuela, to <tc-webtag:handle coderId="22653044" context="algorithm"/>. Those top tree coders of the event together
with <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="8394868" context="algorithm"/> formed the quintet
"We've solved all three problems this time".
 </p>

<p>
Division 2 competition ends up with <tc-webtag:handle coderId="22679947" context="algorithm"/>, <tc-webtag:handle coderId="7523583" context="algorithm"/> and
<tc-webtag:handle coderId="20054287" context="algorithm"/> on the top three places.
</p>
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8567&amp;rd=12175" name="8567">TheLargestLuckyNumber</a></b> 
</font> 
<A href="Javascript:openProblemRating(8567)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521320" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      471 / 517 (91.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      368 / 471 (78.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>KnightOfTheSun</b> for 249.16 points (1 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208.46 (for 368 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was realy lucky and everyone who opened it probably was feeling lucky to have such an oppotunity for warm up. Due to constraints all you had to do is just to
iterate through all integers from <b>n</b> downto 1 and return the first lucky number. And I think that all of you enjoyed the part of checking whether some number is lucky or not.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8568&amp;rd=12175" name="8568">TheLuckyNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8568)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521320" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      343 / 517 (66.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      119 / 343 (34.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>jbnpaul</b> for 493.35 points (3 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      327.78 (for 119 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      408 / 429 (95.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      301 / 408 (73.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>UdH-WiNGeR</b> for 249.54 points (1 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.20 (for 301 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The key thing in this problem is to observe that actually there are not so many lucky numbers between 1 and 1,000,000,000.
More precisely there are 1022 such numbers in that interval. So one of the easiest way of solving this problem is to generate all lucky
numbers below 1,000,000,000 and count how many of them are between <b>a</b> and <b>b</b>. Also during SRM there were
implemented some fast and nice recursive solutions based on the same idea. Unfortunately brute force solutions timed out, so not everyone
enjoyed this problem in fact.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8571&amp;rd=12175" name="8571">TheSumOfLuckyNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8571)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521320" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      68 / 517 (13.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 68 (22.06%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>iliyafilippov</b> for 788.77 points (15 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      569.02 (for 15 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
If someone has counted all lucky numbers below 1,000,000,000, he or she can easily do the same for 1,000,000. The result is 126 (let's denote this number as <b>m</b>). Now
we can construct DP solution that finds the smallest amount of lucky numbers needed to represent each integer between 1 and <b>n</b>. For each integer we will try each
lucky number as a candidate for first one in a desired representation. Let <b>Res</b>[i] be amount of lucky numbers needed to represent i. Then
<b>Res</b>[i] = min(<b>Res</b>[ i - <b>lucky</b>[j] ] + 1) for each j from 1 to 126, where <b>lucky</b> is an array of all lucky numbers below 1,000,000.
Having such information calculated, we can easily construct the resulting array trying to take smallest possible lucky number on each step. The complexity
of this DP solution is O(<b>n*m</b>) and it is just fine to fit in 2 seconds time limit.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8569&amp;rd=12175" name="8569">TheLuckySequence</a></b> 
</font> 
<A href="Javascript:openProblemRating(8569)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521320" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      292 / 429 (68.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      157 / 292 (53.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>crazyb0y</b> for 457.15 points (8 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      294.14 (for 157 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's divide all sequences we are looking for into four classes. First class is the class of sequences that start with a lucky number that has 4 as the most
significant digit and ends with lucky number that ends with 4. Let's denote this class (4, 4). Similarly we can define classes (4, 7), (7, 4) and (7, 7). Also let's denote
the amount of distinct lucky numbers in <b>numbers</b> that starts with 4 and ends with 4 as <b>lucky44</b>. Similarly <b>lucky47</b>, <b>lucky74</b>, <b>lucky77</b> are defined.
</p>

<p>
If we know the number of different sequences of length <b>n</b> for each class (<b>Res44[n], Res47[n], Res74[n], Res77[n]</b>), we can easily calculate those
four numbers for sequences of length <b>n+1</b>. For example <b>Res47[n + 1] = Res44[n]*lucky47 + Res47[n]*lucky77</b>. Than the easiest part goes - just to implement these things.
But wait. Don't you think that it's too easy for Div1 Medium? Actually there is one more problem - <b>length</b> is too big and you can fill a smell of time out. But after thinking a little bit more
one can observe that this process can be represented as matrix multiplication. And well
known algo of raising matrix to <b>length</b> power in O(log(<b>length</b>)) is just what you need to speed up your solution.
</p>

<p>
We have a 2x2 matrix A with <b>lucky44</b> and <b>lucky47</b> in the first row and <b>lucky74</b> and <b>lucky77</b> in the second one. In general, A<sup><b>n</b></sup> contains
four numbers <b>Res44[n], Res47[n], Res74[n], Res77[n]</b>. And we need to raise A to the <b>length</b>-th power. How can we do it fast? It is easy to calculate the following row of
matrices A, A<sup>2</sup>, A<sup>4</sup>, A<sup>8</sup>, ... . Then we can represent A<sup><b>length</b></sup> as a product of matrices from that row. The number
of matrixes in the product will be equal to number of 1's in the binary representation of <b>length</b>. Due to this, there will be no more than log<sub>2</sub>(<b>length</b>) matrices
in the product.
</p>

<p>
And one more very interesting author's observation. I have seen several almost correct solution for this problem each having a following problem. Contestants
just forgot to check if some element of <b>numbers</b> is lucky. They were considering only the first and the last digits for this purpose. So the conclusion is that you
have to be very careful during SRM and to pay attention to each small thing of a problem.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8572&amp;rd=12175" name="8572">TheLuckySum</a></b> 
</font> 
<A href="Javascript:openProblemRating(8572)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521320" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      39 / 429 (9.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 39 (25.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 654.58 points (23 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      556.17 (for 10 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
At the first sight this problem is very similar to Div2 Hard, but with a little bigger constrains. Thus this two problems should have similar solutions. But unfortunately Div2 Hard solution
is not good for this one. So we need to figure out something else.
</p>

<p>
Let's start thinking together. We have 1022 lucky numbers and an integer <b>n</b> to be represented as a sum of those lucky numbers. One can observe that if we can do this,
we don't need more that 9 such lucky numbers. Let a proof of this fact be a lucky homework for you. Denote MAX = 9, N = 1022 and M = 9 (maximal number of decimal positions).
Suppose we know how to calculate for an integer <b>n</b> the minimal possible amount of lucky numbers that sum up to <b>n</b>. Let's denote this knowledge as
some function F(<b>n</b>). Than for each element in resulting array we can just iterate through all lucky numbers looking for the smallest appropriate one.
It means that we are looking for the smallest lucky number <b>m</b> such that F(<b>n</b>) = F(<b>n - m</b>) + 1. After this we will set <b>n = n - m</b> and will be looking for
the next element of resulting array, and so on.
</p>

<p>
Now we have to think about function F(<b>n</b>). Assuming the algo described above it should be quite fast. So how can we calculate minimal number of
lucky summands for some integer <b>n</b>? Let's consider DP with three dimentions - amount of lucky numbers, decimal position, carry.
DP[<b>x</b>][<b>y</b>][<b>z</b>] will give answer for a question if it's possible to represent <b>m</b> = (<b>n</b> div 10<sup><b>y</b></sup>) - <b>z</b> as a sum of no
more than <b>x</b> lucky numbers. Obviously, if DP[<b>x</b>-1][<b>y</b>][<b>z</b>] = true, then DP[<b>x</b>][<b>y</b>][<b>z</b>] = true. In other cases we have to use
exactly <b>x</b> lucky numbers. At the current decimal position we don't care where we'll put 4's and where 7's. The only thing we have to consider is the number of 4's and the number
of 7's. Their sum modulo 10 should be equal to <b>m</b> modulo 10 and if so we have to check DP[x][y + 1][(z + {sum of 4's} + {sum of 7's}) div 10].
</p>

<p>
The complexity of the described algo is O(MAX*N*M*MAX*MAX). So we don't need to worry about running time of the program. This algo is not very hard for
implementing and it's working time is quite small. So the last thing you have to do is a homework. Enjoy.
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Vasyl(alphacom)_big3.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13351270" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
