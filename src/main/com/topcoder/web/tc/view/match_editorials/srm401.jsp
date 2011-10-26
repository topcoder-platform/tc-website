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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12173">Match Overview</A><br />
    <tc-webtag:forumLink forumID="521053" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 401</span><br />Tuesday, May 6, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
The last SRM before TCO08 onsite finals became the most crowded TopCoder SRM ever as the limit on the number of participants was increased to 1750.
</p>
<p>
To finish in top3 in Division 1 it was enough to solve all three problems correctly, which was done by <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="19849563" context="algorithm"/> and <tc-webtag:handle coderId="8355516" context="algorithm"/>, who finished first, second and third respectively. Because of many corner cases in the medium problem challenge phase was very fruitful, affecting final positions of many coders a lot.
</p>
<p>
In Division 2 nobody managed to solve the 1000-pointer correctly, so the top places were distributed between those, who were really fast on easy and medium and managed to make some successful challenges. This resulted in <tc-webtag:handle coderId="22700469" context="algorithm"/>, taking the first place, followed by <tc-webtag:handle coderId="21006140" context="algorithm"/>, <tc-webtag:handle coderId="22682908" context="algorithm"/> and a newcomer <tc-webtag:handle coderId="22729120" context="algorithm"/>.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8314&amp;rd=12173" name="8314">DreamingAboutCarrots</a></b> 
</font> 
<A href="Javascript:openProblemRating(8314)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      739 / 833 (88.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      266 / 739 (35.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>KnightOfTheSun</b> for 249.01 points (1 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.21 (for 266 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p><b>First approach</b></p>
<p>Under the given constraints it was possible to iterate through all lattice points that lie in a rectangle with corners (min(x1,x2),min(y1,y2)) and (max(x1,x2),max(y1,y2)) and check whether they lie on the given segment or not. This check can be done using cross product of vectors (you can see <a href="/tc?module=Static&d1=tutorials&d2=geometry1">this tutorial</a> by <tc-webtag:handle coderId="159052" context="algorithm"/> for more information about geometrical basics).
</p>
<p>
See <a href="/stat?c=problem_solution&rm=270146&rd=12173&pm=8314&cr=22723138">this</a> solution by <tc-webtag:handle coderId="22723138" context="algorithm"/> for implementation of this approach.
</p>
<p><b>Second approach</b></p>
<p>
The second approach uses the following notion about lattice points, lying on the segment: neighbouring lattice points lie on the same distance from each other. Now consider the greatest common divisor of max(x1,x2) - min(x1,x2) and max(y1,y2) - min(y1,y2). Then there can be at most this value minus one lattice point, lying on the segment as described above.
</p>
<p>
This approach was used by <tc-webtag:handle coderId="22714770" context="algorithm"/> to achieve high score on this problem.
</p>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8776&amp;rd=12173" name="8776">FIELDDiagrams</a></b> 
</font> 
<A href="Javascript:openProblemRating(8776)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      260 / 833 (31.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      176 / 260 (67.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dlwjdans</b> for 484.98 points (5 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      286.72 (for 176 correct submissions) 
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
      587 / 650 (90.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      549 / 587 (93.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 246.54 points (3 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187.12 (for 549 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p><b>First approach</b></p>
<p>
This problem could be solved by simple dynamic programming. Let's construct FIELD diagrams row by row, starting from the first one (it will have index zero). Let dp[i][j] be the number of possible ways to extend a FIELD diagram that has all rows up to i-th already constructed and has the length of the last constructed row (the row number i - 1) equal to j. Then dp[fieldOrder][ANY_VALUE] should be taken equal to 1 (we have constructed a valid diagram) and dp[i][j] can be calculated as follows:

<code><pre>
long[][] dp = new long[fieldOrder + 1][fieldOrder + 1];
for (int k = 0; k &lt;= fieldOrder; k++) {
    dp[fieldOrder][k] = 1;
}
for (int i = fieldOrder - 1; i &gt;= 0; i--) {
    for (int j = 0; j &lt;= fieldOrder; j++) {
        dp[i][j] = 0;
        for (int k = 0; k &lt;= Math.min(j, fieldOrder - i); k++) {
            dp[i][j] += dp[i + 1][k];
        }
    }
}    
</pre></code>
Now the answer for the problem will be dp[0][fieldOrder] - 1 as we have counted a digram, containing no boxes.
</p>
<p>
This approach was used by <tc-webtag:handle coderId="19849563" context="algorithm"/> to achieve high score on this problem.
</p>
<p><b>Second approach</b></p>
<p>
The second approach was to notice that the number of FIELD diagrams of order n is equal to C<sub>n+1</sub> - 1, where C<sub>n</sub> is the n-th <a href="http://en.wikipedia.org/wiki/Catalan_number">Catalan number</a>. See description of monotonic paths (analogs of FIELD diagrams) in the article for further explanation of why this formula works.
</p>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8321&amp;rd=12173" name="8321">RunningLetters</a></b> 
</font> 
<A href="Javascript:openProblemRating(8321)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      55 / 833 (6.60%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 55 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The shortest message appears somewhere in the given text, let it length be PeriodLen. Taking the first PeriodLen letters of the text as the message will give us the same text, so we can assume that the shortest message appears in the beginning of the text.
</p>
<p>
The hardest thing is to find this shortest message in linear time. Here KMP algorithm will help us a lot (see description of KMP algorithm in <a href="/tc?module=Static&d1=tutorials&d2=stringSearching">this tutorial</a>). Let's construct prefix function (which is called failure function in the tutorial) for the text and look its value on the last element of the text (let us call this value PrefLen, it gives us the length of the longest suffix of the text, which is at the same time its prefix). Now it is obvious that PrefLen is equal to TextLen - PeriodLen. This gives us solution shown below: 
<code><pre>
int textLength = text.length();
int[] prefixFunction = new int[textLength];
prefixFunction[0] = 0;
int cur = 0;
for (int i = 1; i &lt; textLength; i++) {
    while (cur &gt; 0 &amp;&amp; text.charAt(cur) != text.charAt(i)) {
        cur = prefixFunction[cur - 1];
    }
    if (text.charAt(cur) == text.charAt(i)) {
        cur++;
    }
    prefixFunction[i] = cur;
}
return textLength - prefixFunction[textLength - 1];
</pre></code>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8315&amp;rd=12173" name="8315">ParticleCollision</a></b>
</font> 
<A href="Javascript:openProblemRating(8315)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      244 / 650 (37.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      72 / 244 (29.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gozman</b> for 454.77 points (13 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      275.94 (for 72 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p><b>First approach</b></p>
<p>
The first approach is to find points of intersection of a cylinder x^2 + y^2 = 1 with the given line (using equations x = vx * t + x0 and y = vy * t + y0), solving quadratic equation for t, and then check whether solutions of this equation really lie on the given spiral. A case when vx and vy are both equal to zero should be considered separately.
</p>
<p>
See very clear implementation of this approach in <tc-webtag:handle coderId="22641658" context="algorithm"/>'s solution <a href="/stat?c=problem_solution&rm=270088&rd=12173&pm=8315&cr=22641658">here</a>.
</p>
<p><b>Second approach</b></p>
<p>
The second approach was to believe that intersections can happen only in points where z is half-integer. It turned out that under given constraints this was true. See discussion in forums <a href="http://forums.topcoder.com/?module=Thread&threadID=612711">here</a> for some ideas about why this can be true for arbitrarily large input numbers.
</p>
<p>
I found four coders, who used this approach during the SRM: <tc-webtag:handle coderId="22675302" context="algorithm"/>, <tc-webtag:handle coderId="22645364" context="algorithm"/>, <tc-webtag:handle coderId="22675094" context="algorithm"/> and <tc-webtag:handle coderId="7580203" context="algorithm"/>.
</p>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8320&amp;rd=12173" name="8320">NCool</a></b> 
</font> 
<A href="Javascript:openProblemRating(8320)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 650 (1.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 11 (45.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 539.64 points (30 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      430.14 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First of all let's notice that we can consider only N-cool segments that contain exactly N lattice points, covered by the polygon, and also have their endpoints in lattice points (let's call these segments N-really-cool segments) as long as all longer N-cool segments contain these segments as their part. So a point is N-cool if and only if it is an endpoint of some N-really-cool segment. This can be checked easily, because two points are endpoints of some N-really-cool segment if and only if their coordinates are equal modulo N - 1 (i.e. x1 mod (N - 1) = x2 mod (N - 1) and y1 mod (N - 1) = y2 mod (N - 1)).
</p>
<p>
Now if we find all lattice points, covered by the polygon, we are done, as we can easily check the property above. Because of the facts that the vertices of the polygon are given in random order, there can be duplicate points and three points, lying on the same line, it was really useful to construct convex hull of the given points first, rearranging them in some more useful order. Here comes the algorithm of finding a convex hull, constructing it as a union of the upper and the lower hull (see explanation of this algorithm in <a href="">this tutoial</a> by <tc-webtag:handle coderId="251074" context="algorithm"/>). Now points, covered by the polygon, can be found in a single line sweep pass, which studies every possible x coordinate, finding points with maximal and minimal y on this line and writing down all intermediate points.
</p>
<p>
You can see my implementation of this approach in the practice room.
</p>
<p><b>Excercise</b></p>
<p>Prove that if there are more than N^2 lattice points, covered by the polygon, then there exists (N + 1)-cool segment.</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15152215" context="algorithm"/><br />
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
