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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10788&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516567" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 41</span><br />Saturday, October 13, 2007
<br><br>


<h2>Match summary</h2> 

<p>
The match attracted 102 registrants, 37 of them newcomers, and had a rather high success rate, 
with 11 people getting all three problems correct.
<br />
<tc-webtag:handle coderId="22653715" context="hs_algorithm"/>
 won the match with impressive 6 successful challenges. 
<tc-webtag:handle coderId="22659963" context="hs_algorithm"/>
 took the second place due to the fastest submission on Hard, and a newcomer 
<tc-webtag:handle coderId="22675110" context="hs_algorithm"/>
 finished third.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=8137&amp;rd=10788" name="8137">MajorityElement</a></strong>
</font>
<A href="Javascript:openProblemRating(8137)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516567" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      79 / 85 (92.94%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 79 (79.75%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>spencer</strong> for 249.54 points (1 mins 13 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      233.00 (for 63 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
For each element of the array, you need to count the number of elements in the array
which are equal to it (including the element itself), and compare this number to
half of the array's size. Since there can be at most one majority element, you can return
the first element for which the number of its occurencies exceeds half of the array's size.
This problem had a surprisingly low success rate, with most failed solutions 
ignoring corner cases like majority element being equal to 0 or 1000.

See 
<tc-webtag:handle coderId="20559795" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=20559795&rd=10788&pm=8137">solution</a>
for a sample implementation.
</p>

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7744&amp;rd=10788" name="7744">NotationLength</a></strong>
</font>
<A href="Javascript:openProblemRating(7744)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516567" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      71 / 85 (83.53%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      58 / 71 (81.69%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Quelloquialism</strong> for 494.73 points (2 mins 56 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      387.40 (for 58 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The low constraints allowed this problem to be solved in a very straightforward
way: loop through numbers from <strong>low</strong> to <strong>high</strong>,
write each number in <strong>radix</strong>-based notation and in decimal notation, calculate the notation lengths' ratio, 
and find the average of ratios. 
<br />
However, this approach was successfully implemented by the only competitor, who used library method 
<strong>java.util.Integer.toString(n, radix)</strong>
that returns the <strong>radix</strong>-based notation of <strong>n</strong> as a String 
(see 
<tc-webtag:handle coderId="22627975" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22627975&rd=10788&pm=7744">solution</a>
). Note that using similar method of class <strong>java.math.BigInteger</strong> results in time limit
(see 
<tc-webtag:handle coderId="22697869" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22697869&rd=10788&pm=7744">solution</a>
).
<br />
Most solutions had implemented analytic approaches. 
The essential thing to notice was that we need only the notation length, 
not the notation itself, therefore we don't need string notations.
The length of the <strong>radix</strong>-based notation of <strong>n</strong> can be calculated in the following way:
divide <strong>n</strong> by <strong>radix</strong> while <strong>n</strong> is positive; the answer will be the number of divisions done
(see 
<tc-webtag:handle coderId="22683239" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22683239&rd=10788&pm=7744">solution</a>
).
<br />
Another way to get this length is to compare <strong>n</strong> to the consecutive powers of <strong>radix</strong>:
if <strong>radix</strong><sup>k</sup> &lt;= <strong>n</strong> &lt; <strong>radix</strong><sup>k+1</sup>,
the length of <strong>radix</strong>-based notation of <strong>n</strong> is <strong>k</strong> 
(see 
<tc-webtag:handle coderId="22659963" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22659963&rd=10788&pm=7744">solution</a>
for a version of this approach).
</p>

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7902&amp;rd=10788" name="7902">TrianglesBoard</a></strong>
</font>
<A href="Javascript:openProblemRating(7902)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516567" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      31 / 85 (36.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 31 (38.71%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>henryy</strong> for 755.81 points (17 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      502.94 (for 12 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
To solve this problem, you need to implement the recursive process of removing
cells as described in the statement, starting from each cell in turn, 
choose the starting cell which results in the maximal score, and return this score. 
<br />
Let's have a closer look at the implementation.
The main part of the solution is the function which, given the coordinates
of the cell at the board, 
<ol>
<li>if this cell is marked as removed, does nothing and quits.</li>
<li>marks this cell as removed; if the cell is colored, increases the score.</li>
<li>if the cell is 'A', calls itself for all adjacent cells;
<br />
if the cell is colored, calls itself only for adjacent cells of same color;   
<br />
if the cell is 'R', calls itself for all other cells in the row.</li>
</ol>
For a cell represented with <strong>board</strong>[i][j] (0-based indices), adjacent cells will be
(i,j-1), (i,j+1) in the same row, and either (i-1,j-1) in the row above (for odd j),
or (i+1,j+1) in the row below (for even j).
<br />
See
<tc-webtag:handle coderId="22659963" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22659963&rd=10788&pm=7902">solution</a>
for a sample implementation.
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15635590" context="algorithm"/><br />    <em>TopCoder Member</em>
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
