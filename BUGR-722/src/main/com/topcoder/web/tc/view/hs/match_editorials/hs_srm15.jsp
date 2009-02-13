<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

<tc-webtag:forumLink forumID="506037" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 15</span><br>Monday, September 25, 2006
<br><br>

<h2>Match summary</h2> 

<p>
In this problem set coders faced an easy first problem, an easy second -- which had the same number of correct submissions as the first problem-- 
and a not very difficult third, though it did require some accuracy in coding.
<br />
<br />
After the coding phase, <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> was the first, but challenge phase made him fourth,
and after system tests he finished in third place. <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>
finished second, getting 100 points during the challenge phase. <tc-webtag:handle coderId="22630491" context="hs_algorithm"/> took  first place
with 175 challenge points, racking up his second first-place finish in only his second High School SRM.
</p>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6729&amp;rd=10067" name="6729">NumbersLine</a></b> </font> <A href="Javascript:openProblemRating(6729)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506037" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      133 / 143 (93.01%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      112 / 133 (84.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 249.40 points (1 mins 23 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      234.38 (for 112 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>

In this problem, the main thing was to parse integers from a string, but to do it carefully. The sample code can be as follows: 
<pre>
   public int getLeast(String line, int givenNumber) {
      line += " ";
      int curr = 0, mn = 10000;
      for(int i = 0; i < line.length(); i++) {
         if (line.charAt(i) == ' ') { if ((curr != 0) && (curr > givenNumber) && (mn > curr)) mn = curr; curr = 0; } else
            curr = 10*curr + line.charAt(i) - '0';
      }
      if (mn == 10000) return -1; else return mn;
   }
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6588&amp;rd=10067" name="6588">ShootingGallery</a></b>
</font>
<A href="Javascript:openProblemRating(6588)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506037" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      117 / 143 (81.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      112 / 117 (95.73%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 496.00 points (2 mins 33 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      416.96 (for 112 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>

The second problem didn't take long time for competitors to solve it
and, since it had only five wrong solutions, there weren't many possibilities for challenge.
<br />
<br />
In this problem, the simplest approach was to count the probability that your friend will not hit the target in n or less shots.
For each shot he misses with probability (1-accuracy/100.0), and shots are independent, so you may count it as (1-accuracy/100.0)^n.
And when this probability becomes less than or equal to 0.5, you should break and return current n.
<br />
<br />
From examples you can see that the answer will never be greater than 68, so you didn't need to worry about time limit or double precision.
<br /><br />
Java code follows:
<pre>
   public int profitableBet(int accuracy) {
    double p = 1-(accuracy/100.0),w = 1;
    for(int n=0;;n++) {
        w *= p;
        if (w <= 0.5) return n;
    }
   }
</pre>

</p>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6596&amp;rd=10067" name="6596">SetOfBoxes</a></b> </font> <A href="Javascript:openProblemRating(6596)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506037" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      47 / 143 (32.87%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      29 / 47 (61.70%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 844.93 points (12 mins 39 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      530.16 (for 29 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
In this problem, you were asked to count the probability that a point will be contained in some number K of boxes.
You can say it as follows: it is the probability that a point will be contained in at least K boxes
minus the probability that a point will be contained in at least K+1 boxes.
For each box, you may count the number of boxes it is contained in.
Then the probability that a point will be contained in at least K boxes will be equal to the sum of the areas of the boxes,
contained in K-1 other boxes (which represents the favourable outcomes), divided by 10,000 - the area of the large square box
(all possible outcomes).
<br />
<br />
In other words, you could solve this problem using these steps:
<ul>
<li> Parse the coordinates of triangles </li>
<li> For each pair of triangles, determine if the first one lies in the second one </li>
<li> For each triangle, determine the number of triangles in which it is contained</li>
<li> For each triangle that is contained in <b>inBox</b> triangles, add its area to the answer </li>
<li> For each triangle that is contained in <b>inBox</b>+1 triangles, substract its area from the answer </li>
<li> If <b>inBox</b> is 0, add 10000 to answer </li>
</ul>
You can also see <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>'s code or 
<tc-webtag:handle coderId="19931322" context="hs_algorithm"/>'s code a clear implementation of this approach.
</p>

<div class="authorPhoto">
    <img src="/i/m/Vedensky_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="9927526" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
