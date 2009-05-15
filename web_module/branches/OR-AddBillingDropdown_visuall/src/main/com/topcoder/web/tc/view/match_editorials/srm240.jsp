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
<tc-webtag:forumLink forumID="505731" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 240</span><br>Saturday, April 30, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This problem set gave competitors a hard time. The only problem with success rate over 50%
was the division 1 easy... with 52,75%. At the end of the coding phase, 18 people submitted
all three problems and <b>antimatter</b>, <b>dgarthur</b> and <b>nicka81</b> were in the lead.
But the challenge phase claimed over 60 submissions (<b>natori</b> was responsible for 7 of
them) and systests even more. When the dust settled, only <b>Eryx</b> and <b>bladerunner</b> 
had three correct submissions and they took the top spots. <b>nicka81</b> rounded out the top 3
with the help of 2 successful challenges.
</p>
<p>
In division 2 no one was able to solve all three problems. Only two people solved the hard,
first timer <b>Weeblie</b> and <b>lschyt</b>, and they took the top two spots. Third place
was for <b>fluffy_</b>, also with the help of 2 successful challenges.
</p>

<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3527&amp;rd=6539" name="3527">Pronunciation</a></b>
</font>
<A href="Javascript:openProblemRating(3527)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505731" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      240 / 291 (82.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      111 / 240 (46.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>fluffy_</b> for 238.96 points (6 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      180.79 (for 111 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
To check whether a word is pronouncable, most people looped through the letters of a word, checking
whether i-th, (i+1)-th and (i+2)-th letters are all consonants and checking whether the
i-th and (i+1)-th letters are vowels, that are different. You should ignore case doing this.
In Java you can also solve it by using regular expressions. After this, just
loop through the words and return the first one that isn't pronouncable or
return an empty string if they all are.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4455&amp;rd=6539" name="4455">TravellingByTrain</a></b>
</font>
<A href="Javascript:openProblemRating(4455)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505731" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      86 / 291 (29.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 86 (20.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Egor</b> for 429.56 points (11 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      275.28 (for 18 correct submissions)
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
      182 / 193 (94.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      96 / 182 (52.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Zis</b> for 228.02 points (8 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      168.68 (for 96 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The key observation here is that in order to arrive at the destination station as early
as possible, it is always good to arrive at each transfer station as early as
possible. With this in mind, split each element of the timetable into the individual
trains and process them as follows:
</p>
<ul>
<li>determine the departure time;</li>
<li>check whether you can catch it this day or you have to wait until the next day;</li>
<li>determine the arrival time and day;</li>
<li>if the arrival moment is earlier than the best found sofar, update the earliest arrival moment.</li>
</ul>
<p>
In the end this gives the earliest arrival moment for the destination station.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3529&amp;rd=6539" name="3529">MoneyExchange</a></b>
</font>
<A href="Javascript:openProblemRating(3529)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505731" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      34 / 291 (11.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 34 (5.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lschyt</b> for 722.88 points (19 mins 12 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      721.94 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem basically consisted of two parts. First you have to parse the 
input rates. It's convenient to give each money type a number and store the rates in
an array rate[i][j], indicating the best rate from type i to type j. Next you
have to find all combined best rates. To find them, you can use a slight 
variation of the Floyd-Warshall all shorthest paths algorithm:
</p>
<pre>
for (int k=0; k&lt;N; k++)
  for (int i=0; i&lt;N; i++)
    for (int j=0; j&lt;N; j++)
      rate[i][j] >?= rate[i][k] * rate[k][j];
</pre>
<p>
After this rate[numberOf(type1)][numberOf(type2)] contains the desired result.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4567&amp;rd=6539"
name="4567">WatchTower</a></b>
</font>
<A href="Javascript:openProblemRating(4567)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505731" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      48 / 193 (24.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      12 / 48 (25.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 486.18 points (14 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      345.78 (for 12 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This medium problem gave most coders a hard time, proving that geometry is always
difficult. If you want to build the watchtower at a certain position x, it's not
very difficult to find out the necessary height. You have to be able to watch
over each piece of the landscape. To be able to oversee the piece of the landscape 
(x1,y1)-(x2-y2), just extrapolate this line segment to position x. So the tower must
have height of at least
</p>
<center><pre>
y1 + (x-x1) * (y2-y1)/(x2-x1).
</pre></center>
<p>
Taking the maximum of these terms over all pieces of the landscape results in the
minimum height. But where to place the tower?
</p>
<p>
You can show that you have to place it on either one of the given points
or on a position where two of the (extrapolated) pieces of the landscape intersect.
If you build it on another place, shifting it to either the left or the right will
always result in a tower of at least the same height, as the picture shows.
</p>
<center>
<img src="/i/srm/srm240.jpg" alt="" border="0"></img>
</center>
<p>
Working out these intersection points requires a little math. We can also do without
this math: with the above observation you can also show that the minimal height is
convex on each piece, so a ternary search also works.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4457&amp;rd=6539"
name="4457">MailArchiving</a></b>
</font>
<A href="Javascript:openProblemRating(4457)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505731" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      49 / 193 (25.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      22 / 49 (44.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>rem</b> for 814.96 points (9 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      596.38 (for 22 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem asked for a dynamic programming approach. We call best[i][j] the
minimal number of selections to archive e-mails i to j, not including j.
If j equals i, the range is empty, so the result is 0. If j is greater than i, 
we can express the result in smaller pieces. To do
so, we note that we have to archive e-mail i at some time. We can archive it on its own, 
giving the result
</p>
<center><pre>
1 + best[i+1][j],
</pre></center>
<p>
or we can archive it together with equal e-mails. If we archive it together with an 
e-mail on position k, we cannot archive e-mails with positions smaller than k together
with e-mails with positions greater than k, so this results in
</p>
<center><pre>
best[i+1][k] + best[k][j]
</pre></center>
<p>
Taking the minimum of these terms results in the desired answer. The easiest way to implement
this is recursion with memoization.
</p>

<div class="authorPhoto">
    <img src="/i/m/Jan_Kuipers_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="309453" context="algorithm"/><br />
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

