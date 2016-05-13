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
    <A href="/tc?module=HSRoundOverview&rd=10073&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506043" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 21</span><br>Monday, November 27, 2006
<br><br>

<h2>Match summary</h2> 
In total there were 278 submissions for HS SRM 21 by 148 members. 
Continuing his impressive performance, <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> 
enjoyed another HS SRM win with 1708.72 points. He was followed by <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>, who has just turned red,  
with 1649.62 points after the system test. <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>also did an excellent job with 1596.72 points. After the system test refused a few submissions, 27 members ended up passing all three problems successfully. </font>
<br />
<br />
This set of problems was reasonably easy, and the high number of submissions made 
this set especially exciting. Congratulations to the great number of gifted high schoolers from 
all over the world who performed better than they have before.
<br />
<br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6794&amp;rd=10073" name="6794" onClick="return (false);">PostOffice</a></b> 
</font> 
<A href=""><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506043" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      129 / 137 (94.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      99 / 129 (76.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>fatit</b><font size="2"></font> for 248.41 points (2 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220.63 (for 99 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
This problem was the easiest one, with 129 members' solutions passing the 
system tests. Two tasks should be accomplished here:<br /><br />
&nbsp;&nbsp;&nbsp; 1. Remove all the spaces from both addresses.<br />
&nbsp;&nbsp;&nbsp; 2. Perform a case-insensitive string comparison.<br /><br />
If two strings are equal, simply return -1.
Otherwise, return the leftmost 0-based position at which they differ. Pay 
attention, though -- one tricky case is that either parameter can be an empty string here.<br>
<br>
&nbsp; Here is <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>'s code:

<pre>
&nbsp;&nbsp;&nbsp; char down(char x)
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(x&gt;='A' &amp;&amp; x&lt;='Z') return x-'A'+'a';
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return x;
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; int matchAddress(string a, string b)
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string A,B;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(i=0; i&lt;a.size(); i++) if(a[i] != ' ')&nbsp; A+=down(a[i]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(i=0; i&lt;b.size(); i++) if(b[i] != ' ')&nbsp; B+=down(b[i]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(A == B) return -1;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(i=0; A[i]==B[i]; i++);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return i;
&nbsp;&nbsp;&nbsp; }
</pre>
<br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6795&amp;rd=10073" name="6795" onClick="return (false);">FixedPoint</a></b> 
</font> 
<A href=""><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506043" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      97 / 137 (70.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      87 / 97 (89.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Xixas</b><font size="2"></font> for 480.09 points (5 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      357.61 (for 87 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
A fixed point is a point that does not change upon application of a 
map, system of differential equations, etc. One of the oldest fixed-point 
theorems - Brouwer's - was developed in 1910. By 1928, John von 
Neumann was using it to prove the existence of a &quot;minimax&quot; solution to two-agent 
games (which translates itself mathematically into the existence of a 
saddlepoint). For this problem, you are not required to know much about such fixed point theorem, 
but only to solve the following set of equations:<br />
<br />
&nbsp; (scale * cos(rotate) - 1) * x - scale * sin(rotate) * y = -translate[0] * cos(rotate) + translate[1] * sin(rotate)<br />
&nbsp;  scale * sin(rotate) * x + (scale * cos(rotate) - 1) * y = -translate[0] * sin(rotate) - translate[1] * cos(rotate)
<br /><br />
Step 1: To get a clear view, we define four new variables a A, B, C and 
D.<br /><br />
&nbsp; A = (scale * cos(rotate) - 1) <br />
&nbsp; B = scale * sin(rotate) <br />
&nbsp; C = -translate[0] * cos(rotate) + translate[1] * sin(rotate)<br />
&nbsp; D = -translate[0] * sin(rotate) - translate[1] * cos(rotate)<br />
<br />
Step 2: These two equations are becoming:<br />
<br />
&nbsp; A * x - B * y = C (1)<br />
&nbsp; B * x + A * y = D (2)<br />
<br />
Step 3: To calculate the answer of x, we do:<br />
<br />
(1) * A:&nbsp; A * A * x - A * B * y = A * C<br />
(2) * B:&nbsp; B * B * x + A * B * y = B * D<br />
<br />
Step 4: Equation(1)'s left side + Equation(2)'s left side = Equation(1)'s right side + Equation(2)'s right side<br />
<br />
&nbsp; A * A * x + B * B * x = A * C + B * D<br />
<br />
Step 5: x = ( A * C + B * D ) / ( A * A + B * B )<br />
<br />
The sample method can be applied to calculate the answer of y:<br />
<br />
&nbsp; (1) * B : A * B * x - B * B * y = B * C<br />
&nbsp; (2) * A : A * B * x + A * A * y = A * D<br />
<br />
&nbsp; (2) * A - (1) * B<br />
&nbsp; A * A * y + B * B * y = A * D - B * C<br />
<br />
&nbsp; y = ( A * D - B * C ) / ( A * A + B * B )<br />
<br />
Here is my code:
<pre>
&nbsp; double A = (scale * cos(rotate) - 1); 
&nbsp; double B = scale * sin(rotate);
&nbsp; double C = -translate[0] * cos(rotate) + translate[1] * sin(rotate);
&nbsp; double D = -translate[0] * sin(rotate) - translate[1] * cos(rotate);
&nbsp; vector &lt;double&gt; ans;
&nbsp; ans.push_back(( A * C + B * D ) / ( A * A + B * B ));
&nbsp; ans.push_back(( A * D - B * C ) / ( A * A + B * B ));
&nbsp; return ans;
</pre>
<br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6796&amp;rd=10073" name="6796" onClick="return (false);">ElectiveSystem</a></b> 
</font> 
<A href=""><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506043" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote>
	<table cellspacing="2" id="table1"> 
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
      52 / 137 (37.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 52 (53.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b><font size="2">
for 955.23 points (6 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      712.26 (for 28 correct submissions) 
    </td> 
  </tr> 
</table></blockquote>
<p>This is a normal Dynamic Programming problem. We define S[i] as the sum of goodness 
  for the first i time units. dp[i][j] means the maximum value for the first i time 
  unites if we log in j times within it, but with a limit of D time units for each login.<br>
  The equation of state is:
  <br /><br />
  <tt>&nbsp; dp[i][j] = max{ dp[i-D][j-1] + S[i]-S[i-D], dp[i-1][j] }</tt> (here <tt>i-D</tt> will be replaced by <tt>0</tt> 
if <tt>(i-D&lt;0)</tt>)
<br /><br />
The above equation consists of two aspects:
<ol>
<li>The i-th time unit is not a part of any login. Well, we can ignore the existence 
  of the i-th time unit. Under such circumstances, maximum of dp[i][j] equals to the maximum value of 
  first i-1 time units divided into j logins:&nbsp; dp[i][j]=dp[i-1][j].</li>
 <li>The i-th time unit is in one of the j logins, suppose it 
  is numbered as the j-th login. <b>Since all the goodness are positive, the longer 
  you log in, the larger goodness you will get.</b> We can assume that j-th login be a 
  consecutive period from i-D+1 to i, and under such condition, dp[i][j] = dp[i-D][j-1] 
  + sum(i-D+1, i-D+2, ..., i) = dp[i-D][j-1] + S[i]-S[i-D]. (In case of i-D+1&lt;0, 
  all the time units before i should be picked up, so 0 will be used instead of i-D.)</li></ol>

Here is <tc-webtag:handle coderId="22660522" context="hs_algorithm"/>'s code:
<pre>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 0;i &lt; s.size();i ++)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int j = 0;j &lt; s[i].length();j ++)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n ++;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a[n] = s[i][j] - 'a' + 1;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(S , 0 , sizeof(S));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 1;i &lt;= n;i ++)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S[i] = S[i - 1] + a[i];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(dp , 0 , sizeof(dp));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 1;i &lt;= n;i ++)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int j = 1;j &lt;= K;j ++)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int t = i - D;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (t &lt; 0) t = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dp[i][j] = max(dp[i][j] , dp[t][j - 1] + S[i] - S[t]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dp[i][j] = max(dp[i][j] , dp[i - 1][j]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = max(ret , dp[i][j]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
</pre> 

<div class="authorPhoto">
    <img src="/i/m/zhuzeyuan_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="19929536" context="algorithm"/><br />    <em>TopCoder Member</em>
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
