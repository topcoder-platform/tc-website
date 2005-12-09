<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505788" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 274</span><br>Wednesday, November 23, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>
SRM 274 was won by <b>Petr</b> with 1862.76 points, with the second-fastest time on each of the three problems, and 5 successful and 2 unsuccessful challenges.  <b>Zis</b> took second on 1602.75 points and <b>MikeMirzayanov</b> third with 1542.67.
<br><br>
In Division Two, newcomer <b>zhuzeyuan</b> had a clear victory with correct solutions to the three problems in 3 minutes, 5 minutes and 20 minutes respectively, and a flawless 6 challenges for a total of 1755.04 points.  <b>m4t3o</b> was second with 1305.38 points and another newcomer <b>rkistner</b> took third with 1300.73.

<br><br>
The writer for this match's problems was <b>Andrew_Lazarev</b>.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4842&amp;rd=8071" name="4842">SimpleDuplicateRemover</a></b>
</font>
<A href="Javascript:openProblemRating(4842)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505788" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      306 / 323 (94.74%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      275 / 306 (89.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>CoreDumped</b> for 248.01 points (2 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      206.54 (for 275 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was a simple exercise for the Division Two coders.  Given a list of integers, remove all but the last occurrence of every integer that occurs more than once, and return the result.
<br><br>
To solve this we can consider each element of the list in order, check if the same integer occurs later in the list, and add it to a second list if it doesn't.  We then return the second list.

<br><br>
This problem had a very high success rate, but some coders still failed the problem, either failing to understand the question, not planning out a proper algorithm, or in one unfortunate case, passing the wrong parameters to the memset() library function.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5881&amp;rd=8071" name="5881">PalindromeMaker</a></b>
</font>
<A href="Javascript:openProblemRating(5881)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505788" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      237 / 323 (73.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      138 / 237 (58.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>zhuzeyuan</b> for 488.46 points (4 mins 23 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      344.21 (for 138 correct submissions)
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
      248 / 249 (99.60%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      227 / 248 (91.53%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Per</b> for 247.14 points (3 mins 3 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      217.93 (for 227 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In this problem we have to form a palindrome, a string that does not change when reversed, by rearranging a given string of letters.  In particular, we want the lexicographically-minimum such palindrome.

<br><br>
It is easy to check if this is possible.  If there's an even number of each letter, then we can keep taking two of a letter out of the input string and put one on each end of the output string.  Since we want the lexicographically minimum string, we choose the letters later in the alphabet first, and finish with the earlier letters so that they occur first in the output string.
<br><br>
If one letter occurs an odd number of times, then we can simply remove one of these letters from the input string, form the minimum palindrome, and then put the odd letter back in the middle.
<br><br>
If more than one letter occurs an odd number of times, then we cannot form a palindrome from the input string, and we return the empty string as the problem requires.
<br><br>
The most common way to solve this problem was to first build an array of 26 integers which contains the number of times each letter occurs, then check if there are zero, one or more letters that occur an odd number of times, and then construct the output string from this array.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4845&amp;rd=8071" name="4845">AmountApproximation</a></b>
</font>
<A href="Javascript:openProblemRating(4845)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505788" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      133 / 323 (41.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 133 (8.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>RangerXL</b> for 719.84 points (19 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      559.07 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This is a variation of the "stamp problem."  We have an unlimited supply of two types of bills, one worth p1 dollars and one worth p2 dollars.  We want to find the minimum dollar value that is at least D that we can construct from the two types of bills.
<br><br>
Equivalently, we want to find the minimum E, where E>=D and the equation X * p1 + Y * p2 = E can be solved where X and Y are non-negative integers.
<br><br>
The largest sensible value of X to try is D/p1, rounded up, since with that many p1-dollar bills we will have a total of at least D dollars.  
<br><br>

We can try each value of X from 0 to D/p1+1, and for each of these we find the total when we add enough p2-dollar bills to bring that total up to at least D.  Then we take the minimum of these totals.
<br><br>
If we make p1==1 a special case, then this can be implemented just barely fast enough in C++.
<br><br>
A further observation will allow us to bring the run time down significantly.  p2 bills of value p1 dollars each are interchangeable with p1 bills of value p2 dollars each.
<br><br>
So if we have a solution where X is at least p2, then we can replace p2 of those p1-dollar bills with p1 p2-dollar bills.  So we do not need to consider values of X larger than p2, as any value we can create with X p1-dollar bills can be created with (X-p2) p1-dollar bills.
<br><br>
So the maximum value of X we need to consider is min(D/p1+1,p2).  If we ensure p1 is greater than p2, swapping the two if necessary, then this will be at most about sqrt(D) iterations, which is easily under time.
<br><br>
Here is a short solution by <b>misof</b>, written after the contest.  An explanation of how it works is left as an exercise to the reader!
<br><br>
<pre>
#define X approximate
int X(int D, int p, int q) {
	return D/p>=q ? q ? X(D,q,p%q) : (D+p-1)/p*p : D>0 ? p&lt;q ?
		X(D,q,p) : ( p+X(D-p,p,q) &lt;? (D+q-1)/q*q ) : 0;
}

</pre>

For a much clearer solution, see <b>rkistner</b>'s.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5887&amp;rd=8071" name="5887">DyckwordUniformer</a></b>
</font>
<A href="Javascript:openProblemRating(5887)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505788" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      131 / 249 (52.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      58 / 131 (44.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>ivan_metelsky</b> for 474.80 points (6 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      295.35 (for 58 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Here we are given a <a href="http://mathworld.wolfram.com/DyckPath.html">Dyck path</a> as a string of 'X's and 'Y's.  We are told that two Dyck paths are equivalent if we can turn one into the other by a series of operations where we swap two adjacent substrings which are each Dyck paths.  We must find the lexicographically-minimum Dyck path that is equivalent to the input string.  If the input string is not a valid Dyck path, we return "".
<br><br>
Dyck paths are equivalent to rooted ordered trees.  We can form the tree by beginning at the root, and taking each letter of the string in sequence.  For each 'X', we draw a new edge down from the current node and create a new node.  For each 'Y', we follow the edge from the current node up to its parent.  We can reverse this process to form the string from a tree.  If the children of a node are equivalent to the strings (S1),(S2),...(Sn), then that node is equivalent to the string X(S1)YX(S2)YX(S3)Y...X(Sn)Y.
<br><br>
In this rooted tree, the operation of swapping adjacent Dyck paths is equivalent to swapping two adjacent children of the same node.  Therefore we can reorder the children of any node.  So to find the tree corresponding to the lexicographically-minimum string, we want to recursively transform each child of the root node into the minimum equivalent node, and then sort the children in lexicographic order.

<br><br>
Here is psuedocode for this function:
<br><br>
<pre>
min(S)
	decompose S into Dyck paths XS1Y, XS2Y, ... XSnY
	for i=1..n
		Si=min(Si)
	sort(S1..Sn)
	return XS1YXS2YXS3Y...XSnY
</pre>
and here is pseudocode to check if a string is a Dyck path:
<br><br>
<pre>
dyck(S)
	X=0,Y=0
	for each s in S
		if(s=='X')
			X++
		else
			Y++
		if (Y>X) return false
	if(X!=Y) return false
	return true
</pre>
One can also try making arbitrary swaps of Dyck paths in the string that result in a lexicographically-smaller string, until no more swaps are possible.  This is guaranteed to work eventually, but may take O(n^2) swaps, so you must be careful about how efficiently you find strings to swap.  See Per's solution for this approach.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4839&amp;rd=8071" name="4839">RingImposition</a></b>
</font>

<A href="Javascript:openProblemRating(4839)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505788" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      79 / 249 (31.73%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      48 / 79 (60.76%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>rem</b> for 967.66 points (5 mins 13 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      744.57 (for 48 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In this problem, we clearly can't simulate the process N times, since N can be up to one billion.

<br><br>
If we consider the circle of numbers to be a vector, then performing one summing operation is equivalent to multiplying the vector by this matrix:
<br><br>
<pre>
    [1 1 0 0 0]
    [0 1 1 0 0]
S = [0 0 1 1 0]
    [0 0 0 1 1]
    [1 0 0 0 1]
</pre>
So we want to multiply the vector by this matrix N times, or equivalently, we can multiply the vector by the matrix S^N.
<br><br>
We can compute the matrix S^N very quickly using <i>binary exponentiation</i>.  Google for it.  :)
<br><br>
For an example of this technique, if N=11, then we can do the following sequence of matrix multiplications to find S^11:
<pre>
S^2 = S * S
S^4 = S^2 * S^2
S^8 = S^4 * S^4
S^11 = S * S^2 * S^8.
</pre>

We perform all these operations modulo 100.
<br><br>
For some clear code using matrix multiplication, see <b>rem</b>'s solution.
<br><br>
One creative coder used the generally-useful technique of following the process until the values cycle, and then figuring out where in the cycle you would be after N steps.  Unfortunately, in this problem the cycle length can be far too long with some inputs for this to work.
<br><br>
To paraphrase the old joke about the mechanic's bill, 10 points of this problem are for coding the algorithm, and 990 points are for knowing which algorithm to code!

</p>

      <img src="/i/m/John_Dethridge_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="270505" context="algorithm"/><br />
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
