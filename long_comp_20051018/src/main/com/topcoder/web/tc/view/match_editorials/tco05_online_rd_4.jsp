<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

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
<%--
<tc-webtag:forumLink forumID="505003" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505388">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Online Round 4</span><br>Wednesday, September 7, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
TCO Round 4 provided an amazing conclusion to the online competitions.  Unlike the previous rounds,
not a single problem was easily solved by the coders.  Even the Level 1 problem provided trouble for the
top ranked competitors.  The difficult problem set helped make the challenge phase extremely
eventful.  HardCoder, who claimed 18th place, did not have a successful submission.  His 400 point
score was earned purely through challenges.  The top two finishers, texel and Petr, were the only to
solve all 3 problems correctly.  Petr, the highest rated coder to advance to the next round, will
get a chance to prove himself onsite for the first time.  Good luck to all in the upcoming rounds.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4696&amp;rd=8036" name="4696">CompanyMessages</a></b>
</font>
<A href="Javascript:openProblemRating(4696)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>

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
      85 / 98 (86.73%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      59 / 85 (69.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gawry</b> for 237.60 points (6 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183.72 (for 59 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Despite its simple appearance, this problem proved difficult enough to stump many of the
competitors.  To solve it, we recursively try to answer the question "Who's the boss?"  Given a subset
of the total number of employees, we try each as the boss of that subset, and recursively solve the
problem without the chosen boss.  Then we count messages sent to the boss, and determine which
choice is best.  To see that this process works, note that the relative order of the lower
employees do not affect their communications with the boss.  This shows that the problem exhibits the type of
structure necessary for DP/memoization.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4645&amp;rd=8036" name="4645">TokenGrid</a></b>
</font>
<A href="Javascript:openProblemRating(4645)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
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

      54 / 98 (55.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 54 (29.63%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalmakka</b> for 344.15 points (21 mins 15 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      241.12 (for 16 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
Some argued that this was the hardest problem of the set.  The basic idea behind the solution is to
keep adding tokens to the unknown node until we can arrive at the final board setup.  After each
token is added we simplify the grid where possible. 
Determining when to stop this process can be very costly if not done correctly.  To speed this up, we
use a grid hash function.  This is done by treating the standard nodes of the grid as digits in a
large number.  The place value of each digit is the number of neighbors the corresponding node has.  
Once the hash is computed, it can be compared to the final setup to see if we have found a successful return
value.  If not, we can mark the hash in a boolean array.  We return -1 when an array entry is marked
twice.  A simple analysis of the constraints shows
that this array will required no more than 13436928 entries.  In fact, only a fraction of these
entries are markable by any input case.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3053&amp;rd=8036" name="3053">GetSubsequence</a></b>
</font>
<A href="Javascript:openProblemRating(3053)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
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
      8 / 98 (8.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      7 / 8 (87.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>texel</b> for 608.71 points (26 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      526.96 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem struck me as being trickier than the usual DP/memoization tasks I have come across.
The two major issues are the ordering of the list, and that duplicate subsequences are hard to
avoid.  The major hurdle is to define the following function which computes, starting from a given
position in the string, with a given initial letter, the number of subsequences of a specified
length.  Java code for this function follows:
<pre>
public long num(String s, int pos, int left, char c) {
  if (left == 0) return 1;
  if (pos == s.length()) return 0;
  int k = left + 51 * (pos + 51 * ( c > 'Z' ? c-'a'+26 : c-'A' ) );
  if (cache[k] > -1) return cache[k];
  //Current character doesn't match c
  if (s.charAt(pos) != c) return cache[k] = num(s,pos+1,left,c);
  //Matched last character
  if (left - 1 == 0) return cache[k] = 1;
  long ret = 0;
  //Try all possible next letters
  for (char cc = 'A'; cc <= 'z'; cc++) {
    if (cc == 'Z'+1) cc = 'a';
    ret += num(s,pos+1,left-1,cc);
  } 
  return cache[k] = ret;
}
</pre>
Above the cache has been prefilled with negative values.  The key motivation behind the above code
is that a subsequence that starts with a letter c can be forced to use the first c in s searching
from position pos.  For example, if we are finding subsequences of abcabc, then the subsequences
that begin with b can be looked at as b followed by a subsequence of cabc.  There is no reason to
use the second b as the initial b.  This allows us to avoid duplicates.<br />
<br />
Next we must find a particular subsequence in L.  First we use num to compute the number of
subsequences of each possible length.  The sum of these becomes our modulus.  Then we count through
the possible lengths until we reach the one with our subsequence in it.  Once this is found, we step
through possible first letters again looking for our subsequence.  This is repeated on the second
letter, and so forth, until we find the return value.
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
