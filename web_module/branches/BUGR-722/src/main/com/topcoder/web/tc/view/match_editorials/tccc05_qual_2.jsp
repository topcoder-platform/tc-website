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
<tc-webtag:forumLink forumID="505705" message="Discuss this match" /></div>
<span class="bodySubtitle">2005 TopCoder Collegiate Challenge <br> Qualification Problem Set 2</span><BR/>January 11-12, 2005
<br><br>

<span class="bigTitle">Summary</span> 

<p>
This set was of the "Think. Think. Think. Type." variety rather than
the "Think. Type. Type. Type." variety.  Both problems were easy to
code once you figured out exactly what they were asking for.
Congratulations to newcomer <b>B_Carvalho</b> and <b>kalinov</b> for blazing fast solutions to the easy and hard
problems, respectively.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3497&amp;rd=6524" name="3497">Hiking</a></b>
</font>
<A href="Javascript:openProblemRating(3497)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505705" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      154 / 171 (90.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      134 / 154 (87.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>B_Carvalho</b> for 247.53 points (2 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      198.23 (for 134 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem arose out of a math puzzle in which you must show that,
given appropriate conditions, a man who walks up a hill one day and
down the hill the next day must at some point have been at exactly the
same place on the trail at exactly the same time of day both going up
and coming down.  The trick is to imagine that he is two people hiking
on the same day and to realize that the two hikers would inevitably
meet somewhere on the trail.
</p>

<p>
To code this, you first add up the total distance covered by one of
the hikers to find the height of the hill.  Then you iterate through
the two lists, looking for the point at which the cumulative combined 
distance traveled by the two hikers equals or surpasses the height of
the hill.  The main loop looks like
<pre>
    combined = 0;
    for (int i = 0; ; i++) {
      combined += alice[i] + bob[i];
      if (combined &gt; heightOfHill) return i;
      if (combined == heightOfHill) return i+1;
    }
</pre>
You don't need to worry about running off the end of one of the arrays 
because the hikers are guaranteed to meet by the time one of them finishes.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3492&amp;rd=6524" name="3492">Inversions</a></b>
</font>
<A href="Javascript:openProblemRating(3492)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505705" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      112 / 171 (65.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 112 (35.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalinov</b> for 869.10 points (9 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      596.83 (for 40 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To make the lexicographically earliest permutation, you want to leave
the largest possible prefix unchanged.  Put another way, you want to
confine the changes to the smallest possible suffix.  A suffix of size
M has at most Choose(M,2) = M*(M-1)/2 inversions, with the maximum
occurring when the suffix is in reverse order.  When the desired
number of inversions is of the form M*(M-1)/2, then the permutation
consists of a prefix of consecutive numbers in increasing order,
followed by a suffix of consecutive numbers in decreasing order, as in
<pre>
    1 2 3 4 5 9 8 7 6
</pre>
</p>

<p>
The question is what happens when the number of inversions is not of
the form M*(M-1)/2.  Rounding up to the next higher value of M tells
us how many elements must be involved in the suffix, but the suffix
will no longer be in strictly decreasing order.  Consider the amount
by which M*(M-1)/2 exceeds the desired number of inversions.  This is
the number of inversions that we want to <i>remove</i> from the
strictly decreasing suffix, and we want to do so in the way that
brings the smallest possible value in the suffix to the front of the
suffix.
Suppose the suffix was <tt>9 8 7 6 5 4</tt>.  If we bring the 8 to the
front but leave the rest in decreasing order (<tt>8 9 7 6 5 4</tt>),
then we have removed one inversion.  Similarly, if we bring the 7 to
the front but leave the rest in decreasing order (<tt>7 9 8 6 5
4</tt>), then we have removed two inversions.  In general, if we want
to remove K inversions from the suffix, then we move element N-K to
the front of the suffix and leave the rest in decreasing order.
Altogether, the final permutation looks like
<pre>
    1...(N-M) (N-K) N...(N-K+1) (N-K-1)...(N-M+1)
</pre>
where M is the smallest integer such that M*(M-1)/2 is greater than or
equal to the desired number of inversions, and K is M*(M-1)/2 minus
the desired number of inversions.
</p>

<div class="authorPhoto">
    <img src="/i/m/vorthys_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="299177" context="algorithm"/><br />
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

