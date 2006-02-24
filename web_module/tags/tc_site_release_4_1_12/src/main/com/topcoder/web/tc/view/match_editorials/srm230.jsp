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
<tc-webtag:forumLink forumID="505716" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 230</span><br>Tuesday, February 8, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Last night's SRM was one of the most exciting in recent history.  <b>SnapDragon</b>, <b>tomek</b>, <b>John
Dethridge</b>, and <b>radeye</b> were neck and neck till the very end.  The top ranked competitors submitted
their solutions in rapid succession, each vying for the top position.  After an unusually active and
tumultuous challenge phase many things were uncertain, except who would win.  Assuming his solutions
passed, <b>radeye</b> was assured the first place prize.  Once the systests finished, <b>radeye</b>'s position as
winner was confirmed.  In Division 2, an Indonesian coder with the handle <b>titid_gede</b> won first place by a
considerable margin.  The newcomer <b>jkburt</b> took home a respectable second place finish.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3560&amp;rd=6519" name="3560">InequalityChecker</a></b>
</font>
<A href="Javascript:openProblemRating(3560)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505716" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      190 / 225 (84.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183 / 190 (96.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ctynan</b> for 245.03 points (4 mins 3 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186.45 (for 183 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The most popular solution computed each sum separately using a for loop.  Since the only possible
denominators are 1, 2, and 4, the final calculation can be done pretty easily.  An alternate
solution uses the fact that<pre>
   1<sup>3</sup> + ... + n<sup>3</sup> = n<sup>2</sup>(1 + n)<sup>2</sup>/4
</pre>
Using this formula, we find that the final result is always n<sup>2</sup>/4.  This shows that in
actuality, the final denominator can only be 1 or 4.  A solution written in Java follows:<pre>
  int[] getDifferences(int n) { 
    return n%2==0 ? new int[]{n*n/4,1} : new int[]{n*n,4}; 
  }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3561&amp;rd=6519" name="3561">SortEstimate</a></b>
</font>
<A href="Javascript:openProblemRating(3561)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505716" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      67 / 225 (29.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      21 / 67 (31.34%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ronit_dragon</b> for 489.45 points (14 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      339.65 (for 21 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      148 / 182 (81.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      102 / 148 (68.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>radeye</b> for 298.28 points (2 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      234.10 (for 102 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The two major obstacles in this problem are the runtime, and the corner cases.  Seeing as there is
no straightforward method to directly solve the inequality, we need to search for the correct value.
In order to write a
solution that runs quickly enough, a binary search should be used.  When deciding the initial upper
bound for your binary search, make sure to use a value greater than <b>time</b>.  The solutions
that did not take this precaution failed on inputs where <b>time</b> was low. 
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3448&amp;rd=6519" name="3448">DeserializeSequence</a></b>
</font>
<A href="Javascript:openProblemRating(3448)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505716" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      28 / 225 (12.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      13 / 28 (46.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>titid_gede</b> for 890.46 points (10 mins 13 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      595.93 (for 13 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is a typical Div 2 Hard.  Recursively check all possible situations, and count how many
work.  To solve the problem, we write a recursive function that takes 2 parameters: the string to
work on, and the previous sequence element.  In the body of the function, we try all possible
prefixes that represent valid integers.  To be valid, the integer cannot be less than the preceding
sequence element, and must be between 1 and 100000 inclusive.  The function can then be called
recursively with the remaining suffix, and the newly obtained value as arguments.  Memoization can
be used to speed up this process, but it was not required given the constraints.  Java code
follows:
<pre>int rec(String str, int prev) { 
  if (0 == str.length()) return 1;
  int ret = 0, curr = 0;
  for (int end = 0; end &lt; str.length(); end++) {
     curr = (curr * 10) + str.charAt(end)-'0';
     if (curr &lt; prev) continue;
     if (curr &gt; 1000000) break;
     ret += rec(str.substring(end+1),curr);
  } 
  return ret;
}
public int howMany(String str) { 
  return rec(str,1); 
} </pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3564&amp;rd=6519" name="3564">PascalCount</a></b>
</font>
<A href="Javascript:openProblemRating(3564)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505716" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      112 / 182 (61.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      50 / 112 (44.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 463.33 points (8 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      325.69 (for 50 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The input constraints made computing each binomial coefficient impossible.  The values become
unwieldly on the longer rows.  Luckily, we can get away with knowing how many times 2, 3, and 5
divide each term.  An entire row can be processed left-to-right in an efficient manner using the
following identity: <pre>
       i!             i-j                 i!
 ---------------- * ---------  =  -------------------   
    j! * (i-j)!       j+1          (j+1)! * (i-j-1)!</pre>
Thus, we can quickly compute how many times 2, 3, and 5 divide the current term using the previous
term and (i-j)/(j+1).  To illustrate how these divisibility counts are used, we look at
the case of determining how many terms are divisible by 6.  Since checking divisibility by 6 is
equivalent to checking divisibility by 2 and 3, we determine how many terms in a row have positive counts for
both 2 and 3.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3046&amp;rd=6519" name="3046">MultiReplacer</a></b>
</font>
<A href="Javascript:openProblemRating(3046)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505716" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      57 / 182 (31.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      47 / 57 (82.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 838.39 points (7 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600.87 (for 47 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Let #a(x) denote the number of a's occuring in the string x.  This problem boils down to computing
#a(f(x)), #b(f(x)), and #c(f(x)) given that you know #a(x), #b(x), and #c(x).  First, let's look at
explicit formulas for these terms:<pre>
   #a(f(x)) = #a(arep)*#a(x) + #a(brep)*#b(x) + #a(crep)*#c(x)
   #b(f(x)) = #b(arep)*#a(x) + #b(brep)*#b(x) + #b(crep)*#c(x)
   #c(f(x)) = #c(arep)*#a(x) + #c(brep)*#b(x) + #c(crep)*#c(x)
</pre>  Rewriting this in terms of matrices we get:<pre>
 ( #a(arep)  #a(brep)  #a(crep) )   ( #a(x) )   ( #a(f(x)) )
 ( #b(arep)  #b(brep)  #b(crep) ) * ( #b(x) ) = ( #b(f(x)) )
 ( #c(arep)  #c(brep)  #c(crep) )   ( #c(x) )   ( #c(f(x)) )</pre>
Using matrices we have reduced the problem of applying f many times to exponentiating a matrix many
times.  Since we can exponentiate a matrix to the kth power in time logarithmic in k, we are able to
compute the result quite quickly.  Care should be taken to apply the modulus after each arithmetic
operation in order to avoid overflowing.
</p>

 
<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
