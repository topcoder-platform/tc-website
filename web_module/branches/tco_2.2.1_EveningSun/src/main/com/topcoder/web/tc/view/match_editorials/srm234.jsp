<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505725" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 234</span><br>Wednesday, March 16, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
During this fast paced SRM, many coders were able to finish the entire set well before the coding
phase ended.  The Div 1 Hard, scored at 850, proved easier than the medium for most high ranked
competitors.  With a blazing medium submission, and a respectable challenge phase performance, 
<b>SnapDragon</b> was able to claim the Div 1 title.  This victory was particularly special, since
it allowed Snap to reclaim his throne at the
top of Division 1.  Remaining on top will be the biggest challenge, with <b>Tomek</b> less than 40
points behind.  In Division 2, the newcomer <b>Weixing Li</b> won by a comfortable margin.  Honorable
mention goes to <b>Savior</b> and <b>logged</b> for taking second place in their respective divisions.
</p>
<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3995&amp;rd=6533" name="3995">ComboLength</a></b>
</font>
<A href="Javascript:openProblemRating(3995)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505725" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      270 / 283 (95.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      226 / 270 (83.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gdiitk</b> for 248.31 points (2 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      219.35 (for 226 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem asks for the longest substring entirely composed of one letter.  To compute this,
loop over the input string, and count the length of each potential substring.  Java code follows:<pre>
public int howLong(String moves) {
    int ret = 1;
    for (int i = 1, c = 1; i &lt; moves.length(); i++) 
   ret = Math.max(ret, c = moves.charAt(i) == moves.charAt(i-1) ? c+1 : 1);
    return ret;
}
</pre>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3055&amp;rd=6533" name="3055">FractionSplit</a></b>
</font>
<A href="Javascript:openProblemRating(3055)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505725" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      212 / 283 (74.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      133 / 212 (62.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gdiitk</b> for 492.58 points (3 mins 29 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      331.79 (for 133 correct submissions)
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
      171 / 172 (99.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      150 / 171 (87.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 246.53 points (3 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      211.27 (for 150 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This premise of this problem is a nice exercise for a Discrete Mathematics course.  One must prove
that all positive fractions of the form n/d can be written as a sum of distinct unit fractions.
Typically induction is used on the case where n&lt;d.  This result is then extended to the case where
n&gt;=d.  Luckily, the problem statement revealed the key to the exercise.  Repeatedly try to
remove the largest possible unit fraction.  Thankfully, the inputs are low enough that overflow is
not an issue.  Java code follows:<pre>
public String[] getSum(int nn, int dd) {
    long n = nn, d = dd;
    ArrayList al = new ArrayList();
    while (n &gt; 0) {
   long x = (d+n-1)/n;
   al.add("1/"+x);
   n = n*x - d;
   d *= x;
    } 
    return (String[])al.toArray(new String[0]);
}
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4021&amp;rd=6533" name="4021">DerivationDisplay</a></b>
</font>
<A href="Javascript:openProblemRating(4021)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505725" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      49 / 283 (17.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      19 / 49 (38.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>WeixingLi</b> for 765.17 points (16 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      506.23 (for 19 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be paraphrased as follows: Write a parser.  Since the grammar in question is fixed,
the CFG rules can be hardcoded into the solution.  The structure of the CFG, combined with the
constraints, insure that there will always be a unique solution.  Essentially, this means that the
input string would belong to the set
<pre>        { a<sup>n</sup>b<sup>m</sup> | n != m } </pre>
or the set
<pre>        { bxa | x is a positive length string }. </pre>
The early replacement steps entirely depend on which of the above sets contains the input string.
The later steps are determined by m and n, or the contents of x.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3998&amp;rd=6533" name="3998">WeirdRooks</a></b>
</font>
<A href="Javascript:openProblemRating(3998)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505725" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      650
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      55 / 172 (31.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      32 / 55 (58.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 528.26 points (14 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      336.17 (for 32 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem has a structure that lends itself to a recursive solution.  Processing the board from
bottom to top, we eliminate one row at a time, and recursively solve a smaller instance.  If no rook
is placed on the bottom row, then all of the squares in the row can be marked special.  Storing
the number of these special squares, we then sever the bottom row from the board, and recurse on the remaining
upper rows.  If we place a rook in the bottom row, then only the squares to its right can be marked as
special.  In addition, when recursing on the upper rows, the column the rook resides in must be
deleted from the board.  Without any memoization-style optimizations, the algorithm described here
passes all systests.  On the largest case, it required 16 million recursive calls, and ran in
under 2 seconds.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3968&amp;rd=6533" name="3968">HowUnsorted</a></b>
</font>
<A href="Javascript:openProblemRating(3968)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505725" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      850
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      64 / 172 (37.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 64 (40.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>AdrianKuegel</b> for 828.24 points (4 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      603.02 (for 26 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This classic problem can be solved in numerous ways, but the standard method is Merge sort.  The
simple O(n<sup>2</sup>) inversion (unsortedness point) counting algorithm will timeout due to the input size.  
The Merge sort technique works as follows.  To count the number of inversions in an array of size m,
we first divide the array in half, and count the number of inversions in each half.  Clearly the
inversions in each half will contribute to the total number of inversions in the array.  Next we
sort each half.  Finally, as done in Merge sort, we fill an array in sorted order, using the two
halves as input.  When we use a value x from the right half, we know that a certain number of
inversions occurred in the original array.  This is because x is the lowest remaining value, but it sat to the
right of all elements in the left half, so the number of remaining left half elements must be added
to the inversion total.  One added benefit of this process, is that we can skip the &quot;sort each
half&quot; step, since we are sorting during the process anyways.
</p>
 
<div class="authorPhoto">
    <img src="/i/m/brett1479_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
