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
<tc-webtag:forumLink forumID="505981" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 306</span><br>Thursday, June 8, 2006
<br><br>

<span class="bigTitle">Match summary</span>


<p>
This SRM attracted  774 coders. This is good, taking into account the number
of participants of recent SRMs, but not as good as one would expect after seeing more than 1,000 people
in several straight SRMs not long ago. Maybe everyone is concentrating on <a href=/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_overview>drawing logos for the TCCC</a>?</p>
<p>
The problem set in both divisions was pretty difficult. In division 1, <tc-webtag:handle coderId="19786437" context="algorithm"/> took home the win
while <tc-webtag:handle coderId="7442498" context="algorithm"/> got second, with the only 2 succesful submissions of the hard problem... Wait. Some
of the top ranked participants are asking the judges to review a crucial play. There's a moment of
tension. Hard problems are being retested. Wow! In a major turn of events, this has become Russian coders
day with <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="15881985" context="algorithm"/> and <tc-webtag:handle coderId="11829284" context="algorithm"/> filling the podium based on solid performances on all problems. Also, 6 out of the
top 8 coders in this SRM were from Russian Federation.
</p>
<p>
In division 2, the problem set was pretty complex and strange, with easy and medium problems being closely related. <tc-webtag:handle coderId="22269126" context="algorithm"/>, <tc-webtag:handle coderId="19773935" context="algorithm"/> and <tc-webtag:handle coderId="16197258" context="algorithm"/> took the first three spots by being the only 3 coders correctly solving the hard problem.
</p>
<p>
Both division champions, <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="22269126" context="algorithm"/>, really showed off by each having the fastest submission of every problem in
their respective problem set and finishing all three in less than half an hour. 
A really impressive debut for <tc-webtag:handle coderId="22269126" context="algorithm"/> and (another) astonishing performance for <tc-webtag:handle coderId="10574855" context="algorithm"/>.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6413&amp;rd=9986"
name="6413">SortMachine</a></b>
</font>
<A href="Javascript:openProblemRating(6413)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505981"
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
      196 / 405 (48.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      130 / 196 (66.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>irakli</b> for 244.11 points (4 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      155.02 (for 130 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was unusual for a division 2 easy, because it required an analysis a little more complex than most problems of that level.
</p><p>
The first thing to realize is that moving two times the same number is useless, because removing all but the last instruction that moves it will not affect the output of the machine and reduce the number of instructions of the code.
</p><p>
Now, we have to think about the output and what will that be: A sequence that has two parts, first all not moved numbers in its original order and then all the moved numbers in the order we moved them.
</p><p>
To have the first part right, all numbers in that part (i.e., numbers that are not moved) will have to be a prefix of the sorted sequence, and have to be in correct order. We can easily see that numbers in the second part can be in any order we want simply by moving them in that order.
</p><p>
So, the problem reduces to see how big can the first part be (i.e., how many numbers can we not move). Since the first part is a prefix in the sorted sequence, we can greedily find it by repeatedly looking in the original sequence the elements of the sorted sequence, only allowing to move forward (if at some point the ith element in the sorted sequence is before the (i-1)th element, then the ith element can't be part of the prefix, so we are done).
</p><p>
For a clean implementation of this idea see <tc-webtag:handle coderId="22269126" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248972&rd=9986&pm=6413&cr=22269126 >code</a>.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6415&amp;rd=9986"
name="6415">BifidSortMachine</a></b>
</font>
<A href="Javascript:openProblemRating(6415)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505981"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      66 / 405 (16.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 66 (34.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>irakli</b> for 479.56 points (5 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      350.00 (for 23 correct submissions)
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
      203 / 324 (62.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      141 / 203 (69.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 246.44 points (3 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      170.56 (for 141 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Please read the editorial comment for SortMachine (directly above this one) before and i'll take explanation from there.
</p><p>
The idea for this problem is similar, but the output sequence has 3 parts. First are the MOVEFRONTed numbers, then the unmoved numbers, and then the MOVEBACKed numbers. Like in the previous problem, and for the same reasons, each number will only be moved once, so the problem is to see how long the middle part (the unmoved numbers) can get. The unmoved numbers  can be any consecutive subsequence of the sorted sequence that appear as a subsequence (in this case not necessarily consecutive) in the original sequence. We can use the same procedure than in the previous problem to find it, allowing to start in any element and trying to build the consecutive set that starts in that element and keep the greatest length we found.
</p><p>
For a clean implementation of this approach see this other <tc-webtag:handle coderId="22269126" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248972&rd=9986&pm=6415&cr=22269126>code</a>. You'll see the continuity in the ideas presented here, because it's code in both problems is almost the same, with one added loop in this one to check every possible start and the variable for keeping the length of the best subsequence found.
</p><p>
For an extended discussion of different ideas and how they work properly or not, see <a href=http://forums.topcoder.com/?module=Thread&threadID=511479 >this thread</a> in the forums.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6417&amp;rd=9986"
name="6417">BlockDistance</a></b>
</font>
<A href="Javascript:openProblemRating(6417)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505981"
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
      31 / 405 (7.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 31 (9.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>irakli</b> for 734.14 points (18 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      574.58 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This is was a classical dynammic programming problem, with a little twist.
There were two similar approaches that solved it in O(N<sup>3</sup>), each of the 3 correct submissions
use one of them. Since 1000<sup>3</sup> is close to the edge of time limits, you had to be careful and do a couple of necessary
optimizations for that to work in time. There is also a solution in O(N<sup>2</sup>) which was safer because 1000<sup>2</sup> is way under the time limit.
I'll present this solution afterwards.
</p><p>
As usually when DP applies to strings, you needed indexes on each of them. Let's call i an index in oldText and j
an index in newText (I'll refer to both parameters as if they were strings, the concatenation part is merely technical).
The function f(i,j) means "what is the lowest number of block insertions to take A to B", where A is the subtring of oldText 
that starts at position i, and B is the substring of newText that starts at position j.
</p><p>
We'll formally define f(i,j) as the minimum of two situations, match and not match.<br/>
Situation 1:<br/>
if the ith character of oldText is equal to the jth character of newText we can get a value of f(i+1,j+1) by
matching those two (no insertion made). If they are not equal, this situation is not used (or gives a possible
value of infinite).<br/>
Situation 2:<br/>
We can do an insertion here (no match), we try every possible insertion (we insert some number of characters) and get the best of them.<br/>
We just take the best of the two situations and we are done. If neither of them makes the transform (or gives infinite
as a response), it means we can't make it at all, so we return infinite to represent that impossibility.
</p>
<p>
This takes O(N<sup>3</sup>) (after memorizing the function or passing it to an iterative DP implementation), because
ther are O(N<sup>2</sup>) states (each pair i,j) and in each of them you loop among several possible insertions (at most N).
</p><p>
The difference between <tc-webtag:handle coderId="22269126" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248972&rd=9986&pm=6417&cr=22269126>solution</a> and <tc-webtag:handle coderId="16197258" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248977&rd=9986&pm=6417&cr=16197258>solution</a> is that for the second situation the first one
finds the best insertion of all positive lengths, and the second one finds the best match for oldText[i], because it HAS to match something, so finds each k&gt;j such as oldText[i] is equal to newText[k] and tries to improve he's actual answer
with f(i,k)+1. Both solutions are clear enough to read, use any of them for reference.
</p><p>
The other possible idea was to add to the (i,j) state another parameter b stating if we are part of an already started block or not.
In situation 1, the cost is always 0 and we recursively call with b = false and in situation 2 we only say that newText[j] is
part of a block, so we recursively call f(i,j+1,true). If b was false, the value this gives as is f(i,j+1,true)+1, (because 
we are starting a new block). If b is false is just f(i,j+1,true), because we are using the same block that was
already counted before.
</p><p>
This takes O(N<sup>2</sup>), because the state space is N*N*2 and each call is done in O(1) (no loop).<br/>
Here I paste a sample Java code for this approach:
</p>
<pre>
int memo[][][];
char[] s,t;
static final int inf = 100000;
//b==0 stands for TRUE and b==1 stands for FALSE
//that way the added cost when inserting is b
int calc(int i, int j, int b) { 
   if (j&gt;=t.length&&i&gt;=s.length) return 0;
   if (j&gt;=t.length) return inf;
   if (i&gt;=s.length) return b;
   if (memo[i][j][b]&gt;-1) return memo[i][j][b];
   int r=inf;
   if (s[i]==t[j]) r=Math.min(r,calc(i+1,j+1,1));
   r=Math.min(r,calc(i,j+1,0)+b);
   return memo[i][j][b]=r;
}

public int minDist(String[] oldText, String[] newText) {
   String s="",t="";;
   for (int i = 0; i &lt; oldText.length; i++) s += oldText[i];
        for (int i = 0; i &lt; newText.length; i++) t += newText[i];
   this.s=s.toCharArray();this.t=t.toCharArray();
   memo=new int[s.length()][t.length()][2];
   for(int i=0;i&lt;s.length();i++)for(int j=0;j&lt;t.length();j++)
      for(int b=0;b&lt;2;b++) memo[i][j][b]=-1;
   return calc(0,0,1)&lt;inf?calc(0,0,1):-1;
}
</pre>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6407&amp;rd=9986"
name="6407">LightSwitches</a></b>
</font>
<A href="Javascript:openProblemRating(6407)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505981"
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
      150 / 324 (46.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      85 / 150 (56.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 494.33 points (3 mins 3 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      350.60 (for 85 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was pretty unusual for a medium. Instead of the classical DP or DFS/BFS we are used to in division 1 500s,
this match had a mostly theoretical problem that was much thinking and little coding. Even though it is possible to use
some linear algebra theory to quickly express the problem, I'll try to explain it with as little theory as possible, so more people can follow the explanation.
</p>
<p>
The important part is to formally state what the problem is asking and solution will be quite standard (in this, it's
similar to many graph problems, where the real problem is in using the right graph). First, let's turn the Y/N matrix into
a 0/1 matrix, 0 for unconnected switch/bulb pairs and 1 for connected ones. It's easy to see than the order in which
we flip the switches is not important, and also that each switch is at most used once because two uses will cancel each other off. So we must assign a number (0 or 1) to each row (switch), and then multiply each element in that row by that
number, add up each column using <a href=http://mathworld.wolfram.com/ModularArithmetic.html>modulo 2 arithmetic</a> (because to see if a bulb is turned on the important thing is the
parity of the number of state changes) and the resulting vector represent the configuration achieved by that assignment. So,
formally, the problem asks for how many different such resulting vectors there are, when iterating over each possible assignment of 0 or 1 to each row.
</p><p>
We say that a switch S can be simulated by a subset of switches not including it OS if and only if when we flip all switches in OS we obtain the exact same transformation than flipping only S.
If a switch can be simulated by the other switches, then it's the same to remove that switch,
because it basically adds nothing to the possible configurations. If we keep removing switches in this fashion
until every switch left is <a href=http://en.wikipedia.org/wiki/Linearly_independent>linearly independent</a> from the others, the final result of possible configurations will turn out to be 2<sup>N</sup>, where N is the number of switches left, because all possible combinations of those switches is a different state (remember they are independent).
</p><p>
Let's go back to our mathematic formulation, to get a linearly independent set of rows we can run the known
<a href=http://mathworld.wolfram.com/GaussianElimination.html>Gaussian elimination</a> on the matrix (without the variable
and the result vector), doing everything with modulo 2 arithmetic. The number of non-zero rows in the result is the
size of the maximum linearly independet set of rows (also called the <a href=http://mathworld.wolfram.com/MatrixRank.html>rank</a> of the matrix).
</p><p>
For a clean enough implementation, see <tc-webtag:handle coderId="275071" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248945&rd=9986&pm=6407&cr=275071>code</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6386&amp;rd=9986"
name="6386">TourCounting</a></b>
</font>
<A href="Javascript:openProblemRating(6386)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505981"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1050
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      30 / 324 (9.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      13 / 30 (43.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 955.60 points (9 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      582.37 (for 13 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
First, let's get rid of the modulo consideration. The modulo m thing is only there because numbers can get too big. Simply doing modulo m after each operation will keep all numbers below 10<sup>9</sup> and make sums and multiplications to never cause overflow (using 64 bit integers).
</p><p>
We will be using matrices a lot in this problem, for simple definitions of matrices, their sum, their product and other basic things you can check out <a href=http://en.wikipedia.org/wiki/Matrix_%28mathematics%29>this page</a>.
</p><p>
What we are given of the graph is it's <a href=http://mathworld.wolfram.com/AdjacencyMatrix.html>adjacency matrix</a>, only replacing 1's with 'Y' and 0's with 'N'. So, as a first step, we must construct the mathematical adjacency matrix as a 2 dimension array of 64 bit integers.
</p><p>
There's a useful theorem we must take into account for this problem and is that when powering the adjacency matrix of any graph to the kth power, what we get in the position (i,j) of the result is the number of paths from i to j that have exactly k steps. Of course, the number of cycles that have exactly k steps are the sum of the elements of the diagonal of the matrix (because are the paths that start and end in the same node). This value is known as the <a href=http://mathworld.wolfram.com/MatrixTrace.html>trace</a> of the matrix.
</p>
<p>
From here on there were a lot of different approaches, each in some point in the line between linear algebra and graph theory. I invite you to check out a couple of different correct codes for this problem to see how, while expressing
the idea in several different ways, when inspecting codes carefully, it's funny that the way they all behave (i.e., the operations they perform when executing) are pretty much the same. I'll continue to explain the idea behind <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248945&rd=9986&pm=6386&cr=10574855>implementation</a>, which seemed
the easiest one to read and understand. This is mostly based in algebraic terms; for an example of a code based
more on graph theory see <tc-webtag:handle coderId="19786437" context="algorithm"/>'s failed <a href=/stat?c=problem_solution&rm=248949&rd=9986&pm=6386&cr=19786437>solution</a> (the bug in it is minor and only in the last line, so you can safely take a look at it, or at the corrected working code he has uploaded to the practice room).
</p>
<p>
Let A be the adjacency matrix of <b>g</b> as described above and N be the number of nodes in <b>g</b> (i.e., also the number of rows and columns of A). As we said, the number cycles of length i is the trace of A<sup>i</sup>. Therefore, our goal of counting all cycles may be divided into counting all cycles of each length and then add all of those together. In other words, the result we need is equal to the sum of the trace of A<sup>i</sup> for all i between 2 and <b>k</b>-1 inclusive. Since sum is commutative, we can say that number is equal to the trace of the sum (in matrix sum) of all matrices A<sup>i</sup> for all i between 2 and <b>k</b>-1. Since A<sup>0</sup> is the <a href=http://mathworld.wolfram.com/IdentityMatrix.html>identity matrix</a> that has all 1s in it's diagonal and therefore has trace equal to N and A<sup>1</sup> is the original matrix that has only 0s in its diagonal and there fore it's trace is 0 we will finally get the following formula:</p>
<pre>
sumTo(m) = Sum of all A<sup>i</sup> for each i between 0 and m, inclusive.
Result = sumTo(<b>k</b>-1) - N.
</pre><p>
When m is even, it's clear than sumTo(m) = sumTo(m/2) + sumTo(m/2)*A<sup>m/2</sup> = sumTo(m/2)*(1+A<sup>m/2</sup>) (here 1 means the identity matrix). When m is odd, we can simply say that sumTo(m) = sumTo(m-1)+A<sup>m</sup>.
This leads to a simple recursive implementation that does O(log(k)) matrix multiplications. Since matrix multiplication is O(N<sup>3</sup>) the total time is O(log(k)*N<sup>3</sup>) which maximum is about 20*35<sup>3</sup> for k &le; 10<sup>6</sup> and N &le; 35, which is small enough (actually, the number of recursive calls to sumTo is 2*log(k) because there is also one call for each 1 in the binary representation of k, and the same applies to the exponentiation, so the constant factor here can be a little high, but we have enough margin). If you failed to understand this last part, please post any questions in the forums and I'll be glad to clarify what you misunderstood.
</p><p>
As a final comment, I like to say that <tc-webtag:handle coderId="11829284" context="algorithm"/>'s <a href=/stat?c=problem_solution&rm=248947&rd=9986&pm=6386&cr=11829284>solution</a> was pretty similar to my original solution
and came up to be pretty different from the rest. It is based on building a 2N*2N matrix with a similar idea of
<a href=/tc?module=Static&d1=match_editorials&d2=tco06_qual>fast fibonacci</a> matrix (remember that <a href=http://mathworld.wolfram.com/BlockMatrix.html>block multiplication</a> is valid in matrices) and simply powering that matrix, with a O(log(k)) number of matrix multiplications, to get the result. I won't give any other details for this approach because it would be too long, but try to inspect the code, is a good lesson of linear algebra.
</p><div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
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
