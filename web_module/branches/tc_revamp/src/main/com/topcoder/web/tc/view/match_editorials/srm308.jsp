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
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505983" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 308</span><br>Saturday, June 24, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In both divisions, the first two problems were rather easy and standard, but the third caused some troubles. 
In Division 1 there was only one successful submission for the third problem done by <b>bmerry</b> who took 
the first place. Second and third went to <b>warmingup</b> and <b>andrewzta</b>. 
</p>
<p>
In division 2 there were a lot of submissions for the hard problem, but only ten of them were successful. The Division 2 winner is <b>vlad_D</b>, <b>Piotrus</b> and <b>kupicekic</b> are second and third.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6528&amp;rd=9988"
name="6528">MedianOfNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(6528)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505983"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      371 / 386 (96.11%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      361 / 371 (97.30%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vlad_D</b> for 249.40 points (1 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.92 (for 361 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Clearly, the answer is -1 only if the number of elements in the array is even. 
Otherwise you just need to sort an array and return the middle element.
Alternatively you could iterate through elements of the array and check for the median, using the definition of the median from the problem statement.
</p>
<p>
Here is the sample solution:
</p>
<pre>
    public int findMedian(int[] numbers) {
        Arrays.sort(numbers);
        return numbers.length % 2 != 0 ? numbers[numbers.length / 2] : -1;
    }
</pre>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6477&amp;rd=9988"
name="6477">HuffmanDecoding</a></b>
</font>
<A href="Javascript:openProblemRating(6477)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505983"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      336 / 386 (87.05%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      324 / 336 (96.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Dottik</b> for 444.87 points (3 mins 3 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      337.47 (for 324 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      312 / 319 (97.81%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      311 / 312 (99.68%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gevak</b> for 199.24 points (1 mins 45 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      183.99 (for 311 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The solution of the problem is pretty straightforward. 
You just need to iterate through the dictionary and find 
the prefix that the current string representing the <b>archive</b> 
starts with. After that cut the prefix and repeat the described 
operation until <b>archive</b> is empty.
</p>

<p>
Here is the sample solution:
</p>

<pre>
    public String decode(String archive, String[] dictionary) {
        String ans = "";
        while (!archive.equals("")) {
            for (int i = 0; i &lt; dictionary.length; i++) {
                if (archive.startsWith(dictionary[i])) {
                    ans += (char) ('A' + i);
                    archive = archive.substring(dictionary[i].length());
                    break;
                }
            }
        }

        return ans;
    }
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6476&amp;rd=9988"
name="6476">TreasuresPacking</a></b>
</font>
<A href="Javascript:openProblemRating(6476)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505983"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      109 / 386 (28.24%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 109 (9.17%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vlad_D</b> for 580.00 points (29 mins 3 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      479.49 (for 10 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem is a combination of two well-known versions of the knapsack problem: 
	<a href="http://www.nist.gov/dads/HTML/knapsackProblem.html">discrete</a> and <a href="http://www.nist.gov/dads/HTML/fractionalKnapsack.html">continuous (fractional)</a>.
</p>
<p>
The continuous problem on its own can be solved using greedy approach. You just need to sort all items by the ratio of the value and weight and get the most "precious" items with total weight not exceeding the limit.
</p>
<p>
The discrete problem in case of integer weights can be solved using <a href="http://en.wikipedia.org/wiki/Dynamic_programming">dynamic programming</a> 
with time complexity O(maximal weight * number of items). 
Let A[i, w] be the maximal cost which is possible to get using first i items with total weight w. 
A[i, w] can be calculated using the following recurrence formula: 
<pre>
A[i, w] = max(A[i - 1, w], A[i - 1, w - weight[i]] + cost[i]),
</pre>
i.e. we either do not use the i-th item or use it, whatever leads to the greatest answer for the current weight.
</p>
<p>

Now get back to the original problem. Let's find the solutions of continuous and discrete problems separately for each weight using only divisible and non-divisible treasures correspondingly. If W1 is the weight of the non-divisible treasures in the solution, <b>W</b> - W1 is the weight to be filled with divisible items. To find the solution for the problem you just need to iterate through the all possible values of W1 and choose the one leading to the best result.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6475&amp;rd=9988"
name="6475">CornersGame</a></b>
</font>
<A href="Javascript:openProblemRating(6475)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505983"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      154 / 319 (48.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      143 / 154 (92.86%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rem</b> for 429.15 points (11 mins 57 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      258.63 (for 143 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Let's build a graph, where vertex is the position of four draughts on the board. 
Two vertices are connected with an edge if there is an arbitrary 
move which translate state corresponding to the one vertex to the 
state corresponding to the other. This graph will have at most 58905 
vertices (the number of ways to place draughts on the border) and 
471240 edges (each vertex has at most 16 adjacent edges). 
The minimal number of moves necessary to reach the goal is equal to 
the length of the shortest path from the initial position to the target. 
This length can be easily found using the <a href="http://en.wikipedia.org/wiki/Breadth-first_search">Breadth-first search algorithm</a>.
</p>

<p>
You can look <b>Petr</b>'s solution as a refernce.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6181&amp;rd=9988"
name="6181">Wardrobe</a></b>
</font>
<A href="Javascript:openProblemRating(6181)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505983"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      59 / 319 (18.50%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 59 (1.69%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bmerry</b> for 440.77 points (47 mins 16 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      440.77 (for 1 correct submission) 
    </td>
  </tr>
</table></blockquote>
<p>
First, for each size let's calculate the number of bolts of this size A. We will process the bolts in the ascending order of their sizes. 
</p>
<p>
Let D[s, flag, p1, p2] be the maximum number of unused bolts and holes, if p1 bolts of the size s are connected with holes of the size s + 1, p2 holes of the size s are connected with the bolts of the size s + 1, bolts of size less than s are already balanced and flag is equal to 0, 1, or 2. flag is equal to 0 if there is no unused (in the terms of the problem) holes and bolts of the size s. flag is equal to 1 if there are some unused bolts of the size s and flag is equal to 2 if there are some unused holes of the size s. Clearly, state with both unused bolts and holes is forbidden, because we can connect them.
</p>
<p>
Two states DP = D(s, dp, p1, p2) and DN = D(s + 1, dn, n1, n2) are called balanced if following rules are obeyed:
<ul>
<li> dp + dn != 3, since otherwise corresponding bolts and holes can be connected</li>
<li> p1+n2 &lt;= A[s + 1]</li>
<li> p2+n1 &lt;= A[s + 1]</li>
<li> if dn == 0, p1+n2 == p2+n1</li>
<li> if dn == 1, p1+n2 &gt;= p2+n1</li>
<li> if dn == 2, p1+n2 &lt;= p2+n1</li>
</ul>
</p>
<p>
If two states DP and DN are balanced, and we already know the value of DP, the value of DN can be calculated using one of the following formulas:
<ul>
<li> if dn == 0, DN = DP</li>
<li> if dn == 1, DN = DP + (p1+n2) - (p2+n1)</li>
<li> if dn == 2, DN = DP + (p2+n1) - (p1+n2)</li>
</ul>
</p>
<p>
Using the given formulas it is possible to calculate the answer with the help of <a href="http://en.wikipedia.org/wiki/Dynamic_programming">dynamic programming</a>. You can look at <b>bmerry</b>'s solution which used similar (but not the same) ideas.
</p><div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
