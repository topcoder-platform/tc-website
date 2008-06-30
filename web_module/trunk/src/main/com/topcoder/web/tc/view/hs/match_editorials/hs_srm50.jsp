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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13483&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="521680" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 50</span><br />Tuesday, June 17, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
<p>
The match with a round number 50 was the first after a long pause. Competitors faced rather trivial easy problem, while the medium one turned out to be pretty hard.
</p>
<p>
    Challenge phase was very fruitful because of the tricky medium problem, most submissions on which didn't make it to the system testing.
</p>
<p>
<tc-webtag:handle coderId="22263204" context="hs_algorithm"/> from Belarus won the match with a spectacular score of <b>2008.89</b> points! 
He showed very solid time on all three problems and got 8 successful challenges. <tc-webtag:handle coderId="22663117" context="hs_algorithm"/> from US took the second place. The winner of ROI 2008 (Russian Olympiad in Informatics) and newcomer to TCHS <tc-webtag:handle coderId="22733480" context="hs_algorithm"/> got the third place.
</p>

</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9769&amp;rd=13483" name="9769">FunnyBirds</a></b> 
</font> 
<a href="Javascript:openProblemRating(9769)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&forumID=521680" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      54 / 56 (96.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 54 (96.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tourist</b> for 249.52 points (1 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      234.48 (for 52 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>

<p>
Let's model the situation described in the problem statement. All we need to know at each second is an amount of birds on a tree and the next number they are going to sing. Having this we can proceed second by second updating those two numbers appropriately. We stop when there are no more birds on a tree. Java solution follows:
</p>

<style type="text/css">
    <!--code { font-family: Courier New, Courier; font-size: 10pt; margin: 0px; }-->
</style>

<!-- ======================================================== -->
<!-- = Java Sourcecode to HTML automatically converted code = -->
<!-- =   Java2Html Converter 5.0 [2006-03-04] by Markus Gebhard  markus@jave.de   = -->
<!-- =     Further information: http://www.java2html.de     = -->
<div align="center" class="java">
<table border="2" cellpadding="3" cellspacing="0" bgcolor="#ffffff">
   <tr>
  <!-- start source code -->
   <td nowrap="nowrap" valign="top" align="left">
    <code>
<font color="#7f0055"><b>public&nbsp;class&nbsp;</b></font><font color="#000000">FunnyBirds&nbsp;</font><font color="#000000">{</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055"><b>public&nbsp;</b></font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">gameTime</font><font color="#000000">(</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">n</font><font color="#000000">){</font><br />
<font color="#ffffff"></font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">res&nbsp;=&nbsp;</font><font color="#990000">0</font><font color="#000000">;</font><br />
<font color="#ffffff"></font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>while&nbsp;</b></font><font color="#000000">(&nbsp;</font><font color="#000000">n&nbsp;&gt;&nbsp;</font><font color="#990000">0&nbsp;</font><font color="#000000">){</font><br />
<font color="#ffffff"></font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">nextNumberToSing&nbsp;=&nbsp;</font><font color="#990000">1</font><font color="#000000">;</font><br />
<font color="#ffffff"></font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>while&nbsp;</b></font><font color="#000000">(&nbsp;</font><font color="#000000">n&nbsp;&gt;=&nbsp;nextNumberToSing&nbsp;</font><font color="#000000">)&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">n&nbsp;-=&nbsp;nextNumberToSing;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">++nextNumberToSing;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">++res;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#ffffff"></font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">res;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#000000">}</font></code>
    
   </td>
  <!-- end source code -->
   </tr>
</table>
</div>
<!-- =       END of automatically generated HTML code       = -->
<!-- ======================================================== -->




<p>
This looks pretty simple, straightforward, and this is probably the first idea that comes to ones mind. But why does it work? The number of birds can be as high as one billion, so how do we know that our program will not exceed a time limit?
</p>
<p>
To answer these questions we need to analyze our algorithm. Let's find out when birds will have to reset their counter and start to sing numbers they already know.
</p>
<p>
After <b>K</b> seconds exactly <b>S(K)</b> = 1 + 2 + ... + K = K*(K+1)/2 birds will fly away. We want to know the maximal K such that S(K) &lt;= N. Solving quadric equation we can see that K is proportional to square root of N. More specifically, for N=10^9 birds will restart singing after K = 44720 seconds. After restart the number of birds is not greater than K and since each second at least one bird flies away we can safely assume that the total number of seconds will not be greater than 2*K, which is under 100000 in the worst case. Now we are sure that our program is fast enough!
</p>
<p>
    <h4>Exercises:</h4>
    <ol>
        <li>Can you solve this problem better than O(sqrt(N))?</li>
        <li>How is the number of restarts depend on N?</li>
    </ol>
</p>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9772&amp;rd=13483" name="9772">SquareCovering</a></b> 
</font> 
<a href="Javascript:openProblemRating(9772)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&forumID=521680" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      48 / 56 (85.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 48 (22.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>K.A.D.R</b> for 429.59 points (11 mins 54 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      318.66 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>

<p>
First, let's find minimum rectangle with sides parallel to the axes which contains all given points (inside or on the border).
In other words, we find maximum and minimum coordinates, both x and y. These four values represent minimum bounding rectangle.
</p>

<p>
Notice that we cannot make this rectangle smaller because in that case some points would be outside. That is why if there is a point strictly inside the rectangle we immediately return -1.
</p>
<p>
If we cannot make it smaller the only possibility left to make it a square – make it bigger. We have no reason to increase the biggest side of the rectangle, only the smallest one (if they are equal we've found what we need).
</p>
<p>
This idea gives the following solution:
</p>

<!-- ======================================================== -->
<!-- = Java Sourcecode to HTML automatically converted code = -->
<!-- =   Java2Html Converter 5.0 [2006-03-04] by Markus Gebhard  markus@jave.de   = -->
<!-- =     Further information: http://www.java2html.de     = -->
<div align="center" class="java">
<table border="2" cellpadding="3" cellspacing="0" bgcolor="#ffffff">
   <tr>
  <!-- start source code -->
   <td nowrap="nowrap" valign="top" align="left">
    <code>
<font color="#7f0055"><b>public&nbsp;class&nbsp;</b></font><font color="#000000">SquareCovering&nbsp;</font><font color="#000000">{</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055"><b>final&nbsp;private&nbsp;</b></font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">INF&nbsp;=&nbsp;</font><font color="#990000">1000000</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">left,&nbsp;right,&nbsp;top,&nbsp;bottom;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055"><b>boolean&nbsp;</b></font><font color="#000000">thereAreNoPointsInside</font><font color="#000000">(</font><font color="#7f0055"><b>int</b></font><font color="#000000">[]&nbsp;</font><font color="#000000">px,&nbsp;</font><font color="#7f0055"><b>int</b></font><font color="#000000">[]&nbsp;</font><font color="#000000">py</font><font color="#000000">){</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>for&nbsp;</b></font><font color="#000000">(</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">i&nbsp;=&nbsp;</font><font color="#990000">0</font><font color="#000000">;&nbsp;i&nbsp;&lt;&nbsp;px.length;&nbsp;++i</font><font color="#000000">)</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>if&nbsp;&nbsp;</b></font><font color="#000000">(</font><font color="#000000">px</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">]&nbsp;</font><font color="#000000">&gt;&nbsp;left&nbsp;&amp;&amp;&nbsp;px</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">]&nbsp;</font><font color="#000000">&lt;&nbsp;right&nbsp;&amp;&amp;&nbsp;py</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">]&nbsp;</font><font color="#000000">&gt;&nbsp;bottom&nbsp;&amp;&amp;&nbsp;py</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">]&nbsp;</font><font color="#000000">&lt;&nbsp;top</font><font color="#000000">)&nbsp;</font><font color="#7f0055"><b>return&nbsp;false</b></font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>return&nbsp;true</b></font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#7f0055"><b>public&nbsp;</b></font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">getMinimalSide</font><font color="#000000">(</font><font color="#7f0055"><b>int</b></font><font color="#000000">[]&nbsp;</font><font color="#000000">px,&nbsp;</font><font color="#7f0055"><b>int</b></font><font color="#000000">[]&nbsp;</font><font color="#000000">py</font><font color="#000000">){</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">left&nbsp;=&nbsp;INF;&nbsp;right&nbsp;=&nbsp;-INF;&nbsp;top&nbsp;=&nbsp;-INF;&nbsp;bottom&nbsp;=&nbsp;INF;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">n&nbsp;=&nbsp;px.length;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>for&nbsp;</b></font><font color="#000000">(</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">i&nbsp;=&nbsp;</font><font color="#990000">0</font><font color="#000000">;&nbsp;i&nbsp;&lt;&nbsp;n;&nbsp;++i</font><font color="#000000">)&nbsp;{</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">left&nbsp;=&nbsp;Math.min</font><font color="#000000">(</font><font color="#000000">left,&nbsp;px</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">])</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">right&nbsp;=&nbsp;Math.max</font><font color="#000000">(</font><font color="#000000">right,&nbsp;px</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">])</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">bottom&nbsp;=&nbsp;Math.min</font><font color="#000000">(</font><font color="#000000">bottom,&nbsp;py</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">])</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">top&nbsp;=&nbsp;Math.max</font><font color="#000000">(</font><font color="#000000">top,&nbsp;py</font><font color="#000000">[</font><font color="#000000">i</font><font color="#000000">])</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font color="#000000">!thereAreNoPointsInside</font><font color="#000000">(</font><font color="#000000">px,&nbsp;py</font><font color="#000000">))&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">-</font><font color="#990000">1</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">w&nbsp;=&nbsp;right&nbsp;-&nbsp;left,&nbsp;h&nbsp;=&nbsp;top&nbsp;-&nbsp;bottom;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font color="#000000">w&nbsp;==&nbsp;h</font><font color="#000000">)&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">w;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>int&nbsp;</b></font><font color="#000000">diff&nbsp;=&nbsp;Math.abs</font><font color="#000000">(</font><font color="#000000">w&nbsp;-&nbsp;h</font><font color="#000000">)</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font color="#000000">w&nbsp;&lt;&nbsp;h</font><font color="#000000">){</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">left&nbsp;-=&nbsp;diff;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font color="#000000">thereAreNoPointsInside</font><font color="#000000">(</font><font color="#000000">px,&nbsp;py</font><font color="#000000">))&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">h;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">left&nbsp;+=&nbsp;diff;&nbsp;right&nbsp;+=&nbsp;diff;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">thereAreNoPointsInside</font><font color="#000000">(</font><font color="#000000">px,&nbsp;py</font><font color="#000000">)&nbsp;</font><font color="#000000">?&nbsp;h&nbsp;:&nbsp;-</font><font color="#990000">1</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">}&nbsp;</font><font color="#7f0055"><b>else&nbsp;</b></font><font color="#000000">{</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">bottom&nbsp;-=&nbsp;diff;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font color="#000000">thereAreNoPointsInside</font><font color="#000000">(</font><font color="#000000">px,&nbsp;py</font><font color="#000000">))&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">w;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">bottom&nbsp;+=&nbsp;diff;&nbsp;top&nbsp;+=&nbsp;diff;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#7f0055"><b>return&nbsp;</b></font><font color="#000000">thereAreNoPointsInside</font><font color="#000000">(</font><font color="#000000">px,&nbsp;py</font><font color="#000000">)&nbsp;</font><font color="#000000">?&nbsp;w&nbsp;:&nbsp;-</font><font color="#990000">1</font><font color="#000000">;</font><br />
<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#ffffff">&nbsp;&nbsp;</font><font color="#000000">}</font><br />
<font color="#000000">}</font></code>
    
   </td>
  <!-- end source code -->
   </tr>
</table>
</div>
<!-- =       END of automatically generated HTML code       = -->
<!-- ======================================================== -->


<h4>Exercises:</h4>
    <ol>
        <li>What if we were to find any smallest covering square, not necessarily with sides parallel to the axes. How would you solve the problem in that case?</li>
    </ol>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9771&amp;rd=13483" name="9771">PositiveArray</a></b> 
</font> 
<a href="Javascript:openProblemRating(9771)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&forumID=521680" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      23 / 56 (41.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 23 (52.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tourist</b> for 930.54 points (7 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      588.12 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
Let's notice two important things. First, we never need to pick a row or a column more than once. And second, having chosen the rows and columns we are going to negate, we can make our moves in any order we like.
</p>
<p>
The first observation gives us the following algorithm. Iterate through all subsets of rows and columns and see if the particular subset makes our matrix positive. The complexity of straightforward implementation will be O(2^(n+m)*n*m) where n and m are the number of rows and columns, respectively. Since n+m equals to 36 in the worst case, this algorithm is definitely too slow to pass.
</p>
<p>
The second observation helps us to improve the algorithm and make it O(2^n*n*m) which is fast enough. Indeed, if we can choose any order of moves, we can negate rows first. After that we can see which columns are still negative and negate them (and only them). Finally, we have to ensure that our matrix is positive and update our answer. For a good example, see <a href="/tc?module=HSProblemSolution&cr=22263204&rd=13483&pm=9771">the solution</a> by <tc-webtag:handle coderId="22263204" context="hs_algorithm"/>.
</p>
<h4>Exercises:</h4>
    <ol>
        <li>Prove or disprove that the answer will never be greater than (n+m)/2</li>
        <li>Can you solve this problem in O(2^n*(n+m)) time (assuming n&lt;=m)?</li>
        <li>What if we were looking for a non-negative array, i.e. the one with each row and column's sum strictly greater than zero. Is that going to change the solution?</li>
        <li>In non-negative array problem, show that the answer can't be -1.</li>
    </ol>
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/it4DOTkp_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20635869" context="algorithm"/><br />    <em>TopCoder Member</em>
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
