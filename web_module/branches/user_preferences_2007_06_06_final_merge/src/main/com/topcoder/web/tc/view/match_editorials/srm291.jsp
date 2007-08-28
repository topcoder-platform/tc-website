<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505857" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 291</span><br>Tuesday, February 21, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
In division 1 easy and medium problems have a pretty high success rate, but only 6 participants successfully solved the hard. The winner is <b>marek.cygan</b> who is more than 250 points ahead of <b>Per</b> and <b>bmerry</b>.
</p> 
<p> 
In division 2 medium and hard problems were the same as easy and medium from division 1. Only 9 participants were able to solve the hard contradictory to 124 successful solutions from division 1. The first place got the newcomer <b>mastodonth</b>, followed by <b>oldbig</b> and another newcomer <b>vyxaryx</b>.
</p> 

<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6074&amp;rd=9812" name="6074">FarFromPrimes</a></b> 
</font> 
<A href="Javascript:openProblemRating(6074)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      402 / 488 (82.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      255 / 402 (63.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>fpavetic</b> for 248.21 points (2 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.97 (for 255 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The solution for this task is pretty straightforward. 
You just need to loop over all numbers from A to B and check for each 
if it is far from primes. The main challenge here is to write function 
which will check if the number is prime or not. Here is the sample 
implementation of such function:

<pre>
  boolean isPrime(int num) {
    if (num &lt; 2) return false;
    for (int i = 2; i*i &lt;= num; i++) 
      if (num % i == 0) return false;
    return true;
  }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=6072&rd=9812" name="6072">Snowflakes</a></b> 
</font> 
<A href="Javascript:openProblemRating(6072)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505857" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    232 / 493 (47.06%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    214 / 232 (92.24%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>raalveco</b> for 485.64 points (4 mins 54 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    297.84 (for 214 correct submissions) 
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
    376 / 392 (95.92%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    366 / 376 (97.34%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Eryx</b> for 247.72 points (2 mins 43 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    190.45 (for 366 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
There are two different solutions for this problem. 
You can iterate through all cells of the flared out snowflake and for 
each cell find where it will be in the folded triangle by modeling the 
described in the problem statements manipulations. 
Another way is to simulate unfolding of the folded snowflake by 
inversing the original manipulations. You can see <b>Eryx</b>'s 
solution as an example for the first way, 
and <b>Petr</b>'s solution for the second.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6071&amp;rd=9812" name="6071">CrazySwitches</a></b> 
</font> 
<A href="Javascript:openProblemRating(6071)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      33 / 488 (6.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 33 (27.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mastodonth</b> for 821.93 points (13 mins 51 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      567.83 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      229 / 390 (58.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      123 / 229 (53.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ulan</b> for 461.49 points (8 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      312.44 (for 123 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This task can be solved using graph theory. The graph should be build using following 
considerations. The vertex of the graph is pair of our current position and 
state of the light in all rooms. Two vertices are connected with an 
oriented edge of weight 0, if it is possible to get from the first to the 
second by turning exactly one switch. Two vertices are connected with an 
oriented edge of weight 1, if it is possible to get from the first to the second 
by making exactly one movement.
</p>
<p>
To solve the problem in terms of such graph we need to find a shortest by 
total weight way from the initial state to the final. It can be done by 
using slightly modified breadth-first search. To minimize the number of "1"-weight edges, 
it is necessary to replace queue with deque. After taking the vertex from 
the head of the deque, the vertices adjusted with "0"-weight edge should be added 
to the head of the deque, and the vertices adjusted with "1"-weight edge 
- to the tail of the deque.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=5954&rd=9812" name="5954">StickedWords</a></b> 
</font> 
<A href="Javascript:openProblemRating(5954)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505857" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    88 / 392 (22.45%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    6 / 88 (6.82%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    <b>marek.cygan</b> for 747.85 points (17 mins 48 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
    <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
    515.55 (for 6 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>
Let's define <b>L(c)</b> as the maximal length of the sequence which can be built starting 
with the letter <b>c</b>. Let's build a graph where vertices are letters and 
edges are words. Each edge is oriented from the first letter of the 
corresponding word to the last and has the weight equal to the length 
of the word minus one. The <b>L(c)</b> can be found by using the Ford-Bellman algorithm on 
this graph. Note, the <b>L(c)</b> could be infinite, 
if a cycle can be reached from the corresponding vertex of the graph.
</p>

<p>
We will store the current answer as an array of characters <b>A[i]</b>. For each position 
in the array <b>A[i]</b> we will store the flag <b>C[i]</b> which is true, 
if the <b>A[i]</b> is the end of some sequence starting from the beginning of 
the array and built using the rules from the problem statement. All <b>A[i]</b> 
at the beginning should be equal to some "empty" character, which should be considered 
lexicographically later than any other, all <b>C[i]</b> should be equal to false.
</p>

<p>
The following pseudo-code shows the algorithm of the solution:
</p>

<pre>
  for i = 0..len-1 {
    if (i &gt; 0) and (not C[i]) continue;
    foreach Word in dic {
      if (i + length(Word) + L(last symbol of Word) &lt; len) continue;
      if (A[i] is not empty) and (Word[0] != A[i]) continue;
      S = substring of A starting on the i-th position 
        with length equals to the length of Word;
      if (Word &gt; S) continue;
      if (Word == S) C[i + length(Word) - 1] = true;
      if (Word &lt; S){
        Pos = i + position of the first character which differs in Word and S;
        for j = pos..index of the last non-empty character of A {
          C[j] = false;
        }
        for j = 0..length(Word) - 1 {
          A[i + j] = Word[j];
        }
        for j = i+length(Word)..index of the last non-empty character of A {
          A[j] = empty;
        }
        C[i + length(Word) - 1] = true;
      }
    }
  }
</pre>

<p>
The answer will be the part of the <b>A</b> from the beginning to the first 
<b>i</b>&gt;=<b>len</b>-1 for which <b>C[i]</b> is true. 
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
