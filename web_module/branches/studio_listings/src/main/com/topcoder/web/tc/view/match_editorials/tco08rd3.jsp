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
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12013">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520052" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Online Round 3</span><br />Saturday, March 1, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
Participation in this round was a requirement for getting a TCO08 t-shirt in the 
algorithm competition. 295 of the 300 advancers from round 2 were excited about 
the opportunity although the potential magical properties of the t-shirts have 
not been confirmed.
</p>

<p> 
The first two problems were of expected difficulty while the third one was 
slightly easier than usual. In the end a fast solution for the easy problem 
was enough to be among the 150 advancers to the last online round.
</p>

<p> 
The top three consisted of two usual suspects: <tc-webtag:handle coderId="19849563" context="algorithm"/> first and <tc-webtag:handle coderId="10574855" context="algorithm"/> third. The second place went to a new target, <tc-webtag:handle coderId="14768757" context="algorithm"/>.
</p> 

 

<H1>The Problems</H1>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7343&amp;rd=12013" name="7343">ZenoDivision</a></b> 

</font> 

<A href="Javascript:openProblemRating(7343)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      273 / 295 (92.54%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      205 / 273 (75.09%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 245.97 points (3 mins 38 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      191.30 (for 205 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
<b>Task 1: determine the length of the shortest pattern</b><br />
If the pattern has length <pre style="display:inline">N</pre>&nbsp; then <pre style="display:inline">(2<sup>N</sup>-1)/(2<sup>N</sup>)</pre> &nbsp;
pieces of the cake will be eaten in the first <pre style="display:inline">N</pre>&nbsp;steps.
The easiest way to determine the smallest possible <pre style="display:inline">N</pre> &nbsp;is to set <pre style="display:inline">N</pre> &nbsp;= 1..60 and then check whether <pre style="display:inline">2<sup>N</sup>-1</pre> &nbsp;is divisible by <pre style="display:inline">b</pre>.
<br /><br />
<b>Task 2: determine who eats which piece</b><br />
This can be accomplished by checking which bits of <pre style="display:inline">(2<sup>N</sup>-1)*a/b</pre> &nbsp;are set. If 
the bit is set then you will eat the piece, otherwise your friend will.
<br /><br />
For a clear implementation of this approach see <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269286&rd=12013&pm=7343&cr=10574855">solution</a>.
<br /><br />
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7992&amp;rd=12013" name="7992">BattleDice</a></b> 

</font> 

<A href="Javascript:openProblemRating(7992)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      100 / 295 (33.90%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      70 / 100 (70.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>bhzhan</b> for 368.91 points (18 mins 21 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      247.26 (for 70 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem was the slowest solved one, nonetheless it was solvable by quite 
straightforward brute force. This can be done by generating all possible third 
dice and then calculating the probability that you win.</p>
<p>
The possibility of a tie can be ignored since previous throws don&#39;t affect the 
later throws in any way. As always with the kind of problems where you are asked 
to return the lexicographically earliest solution, it is a good idea to generate 
the possibilities in that order.</p>
<p>C++ implementation follows (it passes in approximately 150 milliseconds in 
worst case):</p>
<pre>struct BattleDice {
  vector &lt;int&gt; d1, d2, d3, result;
  int len, r, ibeat[2][16], beaten[2][16];
  double best, p1b2;
  
  void Solve(int p, int m, int ibeat1, int ibeat2, int beaten1, int beaten2) {
    if(p == len) {
      double p1b3 = beaten1 / double(ibeat1 + beaten1);
      double p2b3 = beaten2 / double(ibeat2 + beaten2);
      double now = min(max(1-p1b2, 1-p1b3), min(max(p1b2, 1-p2b3), max(p1b3, p2b3)));
      if(now &gt; best) {
        best = now + 1e-9;
        result = d3;
      }
    } else
      for(d3[p] = m; d3[p] &lt;= r; ++d3[p])
        Solve(p + 1, d3[p], ibeat1 + ibeat[0][d3[p]],
          ibeat2 + ibeat[1][d3[p]], beaten1 + beaten[0][d3[p]], beaten2 + beaten[1][d3[p]]); 
  }
  
  void prep() {
    int ibeat = 0, beaten = 0;
    for(int i = 0; i &lt; len; ++i)
      for(int j = 0; j &lt; len; ++j)
        if(d1[i] &lt; d2[j])
          ++beaten;
        else if(d1[i] &gt; d2[j])
          ++ibeat;
    p1b2 = ibeat / double(ibeat + beaten);
  }
  
  vector &lt;int&gt; die3(vector &lt;int&gt; die1, vector &lt;int&gt; die2, int range) {
    best = 0;
    len = die1.size();
    r = range;
    d1 = die1;
    d2 = die2;
    d3.resize(len);
    memset(ibeat, 0x00, sizeof(ibeat));
    memset(beaten, 0x00, sizeof(beaten));
    for(int j = 1; j &lt;= r; ++j)
      for(int i = 0; i &lt; len; ++i) {
        if(j &lt; d1[i])
          ++beaten[0][j];
        else if(j &gt; d1[i])
          ++ibeat[0][j];
        if(j &lt; d2[i])
          ++beaten[1][j];
        else if(j &gt; d2[i])
          ++ibeat[1][j];
      }
    prep();
    Solve(0, 1, 0, 0, 0, 0);
    return result;
  }
};</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8525&amp;rd=12013" name="8525">SuperWatch</a></b> 

</font> 

<A href="Javascript:openProblemRating(8525)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      94 / 295 (31.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      72 / 94 (76.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>nigulh</b> for 931.34 points (7 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      641.12 (for 72 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


<p>
Given some time zones and an equal number of times in different zones in an 
infinitely long day, the minimum possible imprecision can be calculated by 
subtracting the <pre style="display:inline">n</pre>.
&nbsp;smallest time zone offset from the <pre style="display:inline">n</pre>.
 smallest time and then subtracting the smallest such element from the largest.</p>
 
<p>To the dismay of 295 coders, the days in this problem were not infinitely long.</p>

<p>
Each of the times is given for either day N or day N + 1. Checking 2<sup>40</sup> 
possibilities is clearly too much so the most naive solution is out of the 
question. Looking at the above algorithm for calculating the minimum imprecision 
one should notice that adding a day to any time other than the smallest one can 
never improve the result. At the same time it is never useful to add more than 
one day to any of the times. Thus one can just try to add a day to the first M 
times and see whether it produces a more optimistic result.
<br /><br />
For a clear implementation of this approach see <tc-webtag:handle coderId="8580975" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269282&rd=12013&pm=8525&cr=8580975">solution</a>.</p>

<br /><br />


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
