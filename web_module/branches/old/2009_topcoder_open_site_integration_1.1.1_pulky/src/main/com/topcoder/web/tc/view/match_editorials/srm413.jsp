<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 413 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&er=5&amp;rd=13504">Match Overview</a><br />
    <tc-webtag:forumLink forumID="522709" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 413</span><br />Wednesday, August 6, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
In both divisions the SRM started with average times on the easy. The division 1 easy (division 2 medium) was a bit unusual but the forgiving example cases
didn't stop many people from submitting their (incorrect) solutions. The division 1 medium (hard version of division 2 hard) was a bit more unusual.
Many people with all kinds of ratings submitted very fast solutions. While low rated coders submitting when high rated coders still work indicates a tricky problem, this problem didn't give it's true nature away that easily.
</p> 
<p>This was the prequel for the most active challenge phase in a while.
In total there were 863 challenges in division 1 (467 successful) and 635 in division 2 (211 successful). This meant a large change on the <a href="/stat?c=successful_challenges">Challenge Success for a Single Match</a> page.</p>
<p>Most challenge points in division 1: <tc-webtag:handle coderId="15206296" context="algorithm"/> (700), <tc-webtag:handle coderId="14970299" context="algorithm"/> (650), an extra 23 coders got 300 or more.<br />
Most challenge points in division 2: <tc-webtag:handle coderId="22689570" context="algorithm"/> (325), <tc-webtag:handle coderId="22695599" context="algorithm"/> (300).
</p>
<p>Top 3 in division 1: <tc-webtag:handle coderId="13351270" context="algorithm"/> (1715.26), <tc-webtag:handle coderId="11972352" context="algorithm"/> (1654.34), <tc-webtag:handle coderId="22663468" context="algorithm"/> (1580.38).<br />
Top 3 in division 2: <tc-webtag:handle coderId="22695599" context="algorithm"/> (1831.71), <tc-webtag:handle coderId="22689570" context="algorithm"/> (1696.31), <tc-webtag:handle coderId="22688045" context="algorithm"/> (1535.05).
</p>

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9840&amp;rd=13504" name="9840">Subway2</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9840)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522709" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      541 / 732 (73.91%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      473 / 541 (87.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>kcm1700</strong> for 241.05 points (5 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      166.05 (for 473 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Distance <strong>s</strong> you can travel in <strong>t</strong> seconds by accelerating from 0 m/s: <strong>s = 0.5*acceleration*t<sup>2</sup></strong>.
Without the speed limit the best way is to accelerate <strong>length/2</strong> meters and then decelerate the rest of the way.<br />
Done this way it would take <strong>t1 = sqrt(length / maxAcceleration)</strong> seconds to reach the midpoint. If the speed you would gather in that time is less than or equal to <strong>maxVelocity</strong> then the result is just <strong>2 * t1</strong>.
Otherwise you must accelerate to <strong>maxVelocity</strong> in <strong>t2 = maxVelocity / maxAcceleration</strong> and keep going until you are <strong>0.5 * maxAcceleration * t2 * t2</strong> meters from the end.</p>
<p>C++ code:</p>
<pre>double minTime(int length, int maxAcceleration, int maxVelocity) {
  double t1 = sqrt(length / double(maxAcceleration));
  if(maxAcceleration * t1 &gt; maxVelocity) {
    double t2 = maxVelocity / double(maxAcceleration);
    return (length - maxAcceleration * t2 * t2) / maxVelocity + 2 * t2;
  } else
    return 2 * t1;
}</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9839&amp;rd=13504" name="9839">ArithmeticProgression</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9839)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522709" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      414 / 732 (56.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      80 / 414 (19.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>kcm1700</strong> for 452.67 points (9 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292.97 (for 80 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      590 / 618 (95.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      276 / 590 (46.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bmerry</strong> for 243.98 points (4 mins 29 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184.75 (for 276 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem offered many ways to solve it but most of them suffered from floating point imprecision. If you have not read <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=integersReals">Representation of Integers and Reals</a> then this would be a good time to do so.<br />
For each <strong>seq<sub>i</sub></strong> the minimum <strong>d = (seq[i] - a0) / (i + 1)</strong>. You will obviously need the largest of them to have a chance of satisfying all of them.
To confirm that your result is valid, you need to check whether <strong>seq[i] == floor(a0 + (i + 1) * d)</strong> for every <strong>i</strong>.
</p>
<p>C++ code:</p>
<pre>double minCommonDifference(int a0, vector &lt;int&gt; seq) {
  // fraction representing 0/1 (minimum permissible value)
  pair &lt;long long, long long&gt; res(0, 1);
  // find d
  for(int i = 0; i &lt; seq.size(); ++i)
    if(res.first * (i + 1) &lt; (seq[i] - a0) * res.second) {
      res.first = seq[i] - a0;
      res.second = i + 1;
    }
  // check whether a solution is possible
  for(int i = 0; i &lt; seq.size(); ++i)
    if(seq[i] != a0 + (i + 1) * res.first / res.second)
      return -1;
  return res.first / double(res.second);
}</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9837&amp;rd=13504" name="9837">InfiniteSequence</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9837)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522709" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      286 / 732 (39.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      149 / 286 (52.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>jtmr</strong> for 974.88 points (4 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      747.90 (for 149 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This was the easy version of InfiniteSequence2 with <strong>x</strong> and <strong>y</strong> set to 0. This simplification allowed simple memoization to pass without problems by doing exactly what the problem statement tells you to do. 
</p>
<p>C++ code:</p>
<pre>map &lt;long long, long long&gt; mem;
long long calc(long long n, int p, int q) {
  if(n == 0)
    return 1;
  if(mem.count(n))
    return mem[n];
  mem[n] = calc(n / p, p, q) + calc(n / q, p, q);
  return mem[n];
}</pre>

<p>In other languages you would have to use either an associative container instead of map or use a solution of InfiniteSequence2.</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9922&amp;rd=13504" name="9922">InfiniteSequence2</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9922)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522709" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      537 / 618 (86.89%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      96 / 537 (17.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>RAVEman</strong> for 480.64 points (5 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      344.61 (for 96 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Here you can't do full memoization because of the memory limit and can't do plain recursion because of the time limit so you need to use a hybrid approach.<br />
Since all examples could be passed with simple recursion, many low rated coders submitted without verifying that their solutions is fast enough.<br />
Many extra tests that could be passed by using full memoization. This caused many higher rated coders to fail.<br />
The result was a very low success rate and very active challenge phase.</p>
<p>To fit inside both the time and memory limits you had to memoize the result for a few million smaller values of <strong>n</strong> and use plain recursion for the rest.<br />
See <tc-webtag:handle coderId="15471665" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rd=13504&amp;pm=9922&amp;cr=15471665">code</a> for an example of this.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9844&amp;rd=13504" name="9844">TreeCount</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9844)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522709" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      68 / 618 (11.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 68 (64.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>klopyrev</strong> for 811.34 points (14 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      546.11 (for 44 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This dynamic programming problem offered a few different ways to represent the state/location you were currently in.
The main thing to notice is that if you are at vertex <strong>v</strong> and you came there from vertex <strong>parent</strong>
then you will never reach a vertex you have already visited unless you go from <strong>v</strong> back to <strong>parent</strong>.<br />
See <tc-webtag:handle coderId="19849563" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rd=13504&amp;pm=9844&amp;cr=19849563">solution</a> for a double dynamic programming solution
or <tc-webtag:handle coderId="9906197" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rd=13504&amp;pm=9844&amp;cr=9906197">code</a> for an entry to the shortest code competition.
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21547660" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
