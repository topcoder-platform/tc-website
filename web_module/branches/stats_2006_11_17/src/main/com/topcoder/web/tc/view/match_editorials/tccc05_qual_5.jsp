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
<tc-webtag:forumLink forumID="505708" message="Discuss this match" /></div>
<span class="bodySubtitle">2005 TopCoder Collegiate Challenge <br> Qualification Problem Set 5</span><BR/>January 11-12, 2005
<br><br>

<span class="bigTitle">Summary</span> 

<p>
The results for this set were close. Im2Good got the top score, but 16 other competitors had scores within 100 of his.
<br /><br />
The 250 was a simple simulation problem. The 1000 was a probability/dynamic programming problem. 
<br /><br />
Partially because of sample data on the 250 that omitted some cases, many
competitors ended up with a total score of 0 and a positive score was enough to qualify on this set .
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3507&amp;rd=6527" name="3507">TimeOfPossession</a></b>
</font>
<A href="Javascript:openProblemRating(3507)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505708" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      141 / 168 (83.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      78 / 141 (55.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>robymus</b> for 239.51 points (4 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      173.75 (for 78 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The sample input for this problem didn't include cases in which B started with the ball, or in which a posession change other than a "SWITCH" happened during the game, which tripped some competitors up. Aside from lack of sample input for all cases, this problem is straightforward.
<br /> <br />
Because of the note about multiple events, we know that the events are given in
the order in which they happen. This means that we can go through the events in
order, keeping track of which team posesses the ball after each event, and add up the segments of time during which team A has the ball.
<br /> <br />
A simple way to represent times is in seconds since the game started, which can
be calculated from the clock time mm:ss as mm*60 + ss.  
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3510&amp;rd=6527" name="3510">NestedRandomness</a></b>
</font>
<A href="Javascript:openProblemRating(3510)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505708" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      101 / 168 (60.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 101 (62.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Im2Good</b> for 954.91 points (4 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      710.61 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The chance of getting the result <tt>x</tt> on a single call to
<tt>randomInt(N)</tt> is <tt>1/N</tt> for <tt>x | 0 &#8804; x &lt; N</tt>, or 0 otherwise.
<br /><br />

Now consider nested calls. The result of a call depends on the result of earlier calls to randomInt. For example, if the first call to randomInt returns 5, then there is no chance of the second call returning 6. 
<br /><br />

On the <tt>n</tt>th call, the chance of the result being <tt>x</tt> depends on
the result, <tt>r</tt>, of the <tt>n-1</tt><sup>st</sup> call. If <tt>x &#8805;
    r</tt> then there is no chance of <tt>randomInt(r)</tt> returning
<tt>x</tt>. Otherwise the chance is <tt>1/r</tt>. This means that in order to
calculate the chance of getting <tt>x</tt> on the <tt>n</tt>th call to
<tt>randomInt</tt>, we need to sum the probability of getting <tt>x</tt> over
all possible return values, <tt>r</tt>, from the <tt>n-1</tt><sup>st</sup> call. 
<br /><br />

As a recurrence, <tt>C(n,x)</tt>, the chance of <tt>x</tt> being the result from
the <tt>n</tt><sup>th</sup> call to <tt>randomInt</tt>, can be expressed:
<br /><br />

<tt>C(n,x) = (sum from i = x+1 to n of C(n-1, i)/i)</tt>
<br /><br />

The table <tt>C</tt> can be built using dynamic programming: 
</p>
<pre class="code">
/* Initialize the table with the probabilities 
 * for the first call to randomInt */
for(int x = 0; x &lt; N; x++)
  chance[0][x] = 1.0/N;

/* Build the rest of the table using the recurrence for C */
for(int n = 1; n &lt; nestings; n++)
  for(int x = 0; x &lt; N; x++)
    for(int k = x+1; k &lt; N; k++)
      chance[n][x] += chance[n-1][k]/k;

/* Return the chance of the result being target */
return chance[nestings-1][target];
</pre>
<p>
The algorithm above is <tt>O(N*N*nestings)</tt>, which is small enough that it easily runs in 8 seconds for <tt>N = 1000</tt> and <tt>nestings = 10</tt>. It is possible, however, to write an algorithm that runs in <tt>O(N*nestings)</tt>. Notice that <tt>C(n,x) - C(n,x+1) = C(n-1, x+1)/(x+1)</tt>. This suggests the following replacement for the nested loops in our algorithm:
</p>
<pre class="code">
for(int n = 1; n &lt; nestings; n++)
  for(int x = N-n; x &gt;= 0; x--)
    chance[n][x] = chance[n][x+1] + chance[n-1][x+1]/(x+1);
</pre>

<p>
<!--<img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">-->
By&#160;<tc-webtag:handle coderId="8587884" context="algorithm"/><br />
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

