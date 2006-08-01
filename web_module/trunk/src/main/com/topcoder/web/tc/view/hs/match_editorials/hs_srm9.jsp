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
</head>

<body>

<jsp:include page="/top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
<tc-webtag:forumLink forumID="506031" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 9</span><br>Monday, July 31, 2006
<br><br>

<h2>Match summary</h2>
<p>
Submission rates today were pretty high - more than 90 percents contestants submitted 
first two problems and more than a half of them submitted the hard.
Most of hards were down after the first couple of minutes of the challenge phase,
giving some points to strong challengers. 
After the system tests, <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> took home his second HS SRM win with 
<tc-webtag:handle coderId="14886245" context="hs_algorithm"/> and <tc-webtag:handle coderId="22378820" context="hs_algorithm"/> rounding the top three.
</p>
 
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6633&amp;rd=10061" name="6633">ExcitingGame</a></b>
</font>
<A href="Javascript:openProblemRating(6633)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506031" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
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
      81 / 83 (97.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      74 / 81 (91.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Zuza</b> for 249.19 points (1 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      230.43 (for 74 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Solution to this problem is just a simple simulation. Make sure you start counting from 1 (not from zero) and 
that you switch to classmate 0 after classmate with number (nClassmates - 1). 
<pre>
    public int howMany(int nClassmates, int nTimes, int who) {
        int ans = 0;
        for (int i = 0; i < nTimes; i++) 
            if (i % nClassmates == who && (i + 1) % 3 == 0) 
	ans ++;
        return ans;
    }
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6599&amp;rd=10061" name="6599">SimpleCompressor</a></b>
</font>
<A href="Javascript:openProblemRating(6599)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506031" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      75 / 83 (90.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      53 / 75 (70.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Burunduk3</b> for 487.08 points (4 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      367.97 (for 53 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In this problem coders were asked to show their ability to use recursion. 
If we want to uncompress a string s, the basic cases are the following ones:
<il>
<li>s is empty. In this case return will be just an empty string.</li>
<li>s starts with a letter (like "A<i>tail</i>"). In this case we can uncompress the first letter and the tail of s independently. 
The uncompression of a letter is just the same letter, and to uncompress the tail of s we recursively call method uncompress(s.substring(1)).
To get the final return value, we append the result of the recursive call to the first character.
</li>
<li>s ends with a letter. Similarly to the previous case, we uncompress the string s without the last character and append this character to the result.</li>
<li>If s doesn't match any of the cases mentioned above, we are sure that s starts and ends with brackets (like "[D<i>tail</i>]"). 
To compute the answer, we discard both brackets, find the tail of the remaining substring, recursively uncompress it, and add to the answer D times.
</li>
</il>

Java implementation of this approach follows:

<pre>
    public String uncompress(String s) {
        // Empty string
        if (s.length() == 0)
            return "";
        int N = s.length();

        // s starts with a letter
        if (Character.isLetter(s.charAt(0)))
            return s.charAt(0) + uncompress(s.substring(1));

        // s ends with a letter
        if (Character.isLetter(s.charAt(N - 1)))
            return uncompress(s.substring(0, N - 1)) + s.charAt(N - 1);

        // s starts and ends with a bracket
        String ans = "";
        String part = uncompress(s.substring(2, N - 1));
        for (int i = 0; i < s.charAt(1) - '0'; i++) ans += part;
        return ans;
    }
</pre>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6197&amp;rd=10061" name="6197">ProductsMatrix</a></b>
</font>
<A href="Javascript:openProblemRating(6197)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506031" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      47 / 83 (56.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 47 (21.28%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Zuza</b> for 940.39 points (7 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      710.41 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
A lot of coders tried to brute force this problem by generating all elements of matrix <b>A</b>, writing them into a big array and sorting it.
Unfortunately, the resulting array can contain up to 100000*100000 elements, which is way too many numbers to even try to generate them all.
</p>
<p>
The problem asks us to find the number at the <b>k</b>-th position in the array. Lets look at the inverted problem - given a number, find its position in the array 
(or, if array doesn't contain this number, find the position where it would be inserted to keep array sorted). 
If we can solve this inverted problem, we can use binary search to solve our main problem (if you are not familiar with binary search, you can read our 
<a href="/tc?module=Static&d1=tutorials&d2=binarySearch">tutorial</a>).
To find the position of a number X in the final array, we need to find how many elements of the array are not greater than X. 
This number is the same as the number of elements of matrix <b>A</b> which are not greater than X. 
</p>
<p>
The easiest way to find this number is to iterate through all rows of matrix <b>A</b>.
Really, row i of matrix <b>A</b> contains <b>n</b> elements - i, 2*i, 3*i, ..., <b>n</b>*i. 
If X is greater or equal than <b>n</b>*i, then row i contains <b>n</b> elements not greater than X.
If X is smaller than <b>n</b>*i, then row i contains (X / i) elements which are not greater than X (proving this fact is left to the reader).
To find the total number of such elements in matrix <b>A</b>, we iterate through all rows of the matrix and sum up the numbers for each row.
If you are able to find this number, the binary search implementation becomes really short. For a clean C++ implementation of this approach, see <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=11972352&rd=10061&rm=249312&pm=6197">solution</a>.</p>


  <img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
  By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
  <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
  </p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170">
  <jsp:include page="/public_right.jsp">
   <jsp:param name="level1" value="privatelabel"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
