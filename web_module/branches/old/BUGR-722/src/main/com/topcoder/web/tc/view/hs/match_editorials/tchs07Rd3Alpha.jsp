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
    <A href="/tc?module=HSRoundOverview&rd=10729&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514495" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 3 Alpha</span><br>Monday, March 19, 2007
<br><br>



<h2>Match summary</h2> 

Fairly difficult medium and hard problems led to a relatively low scoring HS match.
<tc-webtag:handle coderId="15092597" context="hs_algorithm"/>
won the match with 1174.04 points,
<tc-webtag:handle coderId="15117368" context="hs_algorithm"/>
finished second with 1041.94 and
<tc-webtag:handle coderId="10039742" context="hs_algorithm"/>
rounded out the top three with 775.53.
Only three coders successfully solved the hard problem, and only two were
able to solve all three problems.
<br /><br />

A good score on the easy problem was enough to advance. Congratulations to the 25
lucky competitors who won a place in the onsite finals!
<br /><br />

<H1> 
The Problems 
</H1>
 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7607&amp;rd=10729" name="7607">Kings</a></b> 
</font> 
<A href="Javascript:openProblemRating(7607)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      40 / 40 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 40 (92.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>neal_wu</b> for 248.51 points (2 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      223.85 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Based on my own experience, I think that the most difficult part of
this problem is separating the kings with unique names
from those who have a namesake(s). Probably one of the most obvious ways to achieve
this separation is just to count the number of occurences of each name in the
given list. Map data structure provides a good aid here. After separation, we
need to do a second pass over the list in order to enumerate the kings whose
names occurs in the list more than once.
<br />
<br />

C++ code follows:

<pre>
template &lt;class Ty, class Tx>
Ty cast(const Tx &x) {
    Ty y; stringstream ss(""); ss&lt;&lt;x; ss.seekg(0); ss>&gt;y; return y;
}

class Kings {
public:
    vector &lt;string> enumerate(vector &lt;string> names) {
        map &lt;string, int> count1, count2;
        int n, i;
        n = names.size();
        for (i = 0; i &lt; n; i++) count1[names[i]]++;
        for (i = 0; i &lt; n; i++) if (count1[names[i]] > 1)
            names[i] += " " + cast&lt;string&gt;(++count2[names[i]]);
        return names;
    }
};
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7609&amp;rd=10729" name="7609">DividingRectangle</a></b> 
</font> 
<A href="Javascript:openProblemRating(7609)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      18 / 40 (45.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      14 / 18 (77.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gurugan1</b> for 390.61 points (15 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      315.95 (for 14 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

There are six ways of dividing rectangle according to the rules described
in the problem statement. They are all shown on Figure 1:
<br /><br />

<div align=center><img src="/i/education/tchs_alpha3_fig1.gif"><br />
Figure 1. Ways of dividing.</div>

<br /><br />

So we just need to try each of these ways and bruteforce delimiter-positions
between the smaller rectangles. Summing up the elements of the smaller
rectangles can be done straightforwardly due to the low constraints.
<br /><br />

Java code follows:


<pre>
public long maxProduct(String[] rectangle) {
    long[][] a;
    long ret;
    int n, m, i, j, k;
    n = rectangle.length;
    m = rectangle[0].length();
    a = new long[n][m];
    for (i = 0; i &lt; n; i++)
        for (j = 0; j &lt; m; j++)
            a[i][j] = rectangle[i].charAt(j) - '0';
    ret = 0;
    for (i = 0; i &lt; m - 2; i++) for (j = i + 1; j &lt; m - 1; j++)
        ret = Math.max(ret, sum(0, 0, n - 1, i) * sum(0, i + 1, n - 1, j) *
                            sum(0, j + 1, n - 1, m - 1));
    for (i = 0; i &lt; n - 2; i++) for (j = i + 1; j &lt; n - 1; j++)
        ret = Math.max(ret, sum(0, 0, i, m - 1) * sum(i + 1, 0, j, m - 1) *
                            sum(j + 1, 0, n - 1, m - 1));
    for (j = 0; j &lt; m - 1; j++) for (i = 0; i &lt; n - 1; i++)
     ret = Math.max(ret, sum(0, j + 1, n - 1, m - 1) * sum(0, 0, i, j) *
                   sum(i + 1, 0, n - 1, j));
    for (j = 0; j &lt; m - 1; j++) for (i = 0; i &lt; n - 1; i++)
     ret = Math.max(ret, sum(0, 0, n - 1, j) * sum(0, j + 1, i, m - 1) *
                   sum(i + 1, j + 1, n - 1, m - 1));
    for (i = 0; i &lt; n - 1; i++) for (j = 0; j &lt; m - 1; j++)
     ret = Math.max(ret, sum(0, 0, i, j) * sum(0, j + 1, i, m - 1) *
                   sum(i + 1, 0, n - 1, m - 1));
    for (i = 0; i &lt; n - 1; i++) for (j = 0; j &lt; m - 1; j++)
     ret = Math.max(ret, sum(0, 0, i, m - 1) * sum(i + 1, 0, n - 1, j) *
                   sum(i + 1, j + 1, n - 1, m - 1));
    return ret;
}
</pre>

Function s(i1, j1, i2, j2) returns a sum of all elements between rows i1 and i2
and columns j1 and j2, inclusive.
<br /><br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7537&amp;rd=10729" name="7537">GamesSchedule</a></b> 
</font> 
<A href="Javascript:openProblemRating(7537)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      6 / 40 (15.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 6 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>LynValente</b> for 578.85 points (29 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      537.26 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

It is not difficult to realize that this one can be solved by backtracking,
but it is much more difficult to implement it quickly and correctly.
<br />
<br />

Parameters for the backtracking function <i>rec</i> are:
<ul>
<li><i>r</i> - number of the game (number of the rows in the schedule table)</li>
<li><i>c</i> - number of the team (number of the rows in the schedule table)</li>
<li><i>d</i> - number of the unassigned colors left during the <i>r</i><sup>th</sup> game</li>
<li><i>e</i> - experience of the team that plays in the <i>r</i><sup>th</sup> game (<i>e</i> = -1 if it's unknown because none of the first <i>c</i>-1 teams is assigned to this game)</li>
<li><i>cmask</i> - binary mask of the colors. <i>i</i><sup>th</sup> bit of <i>cmask</i> is set if and only if <i>i</i><sup>th</sup> color is assigned to one of the first <i>c</i>-1 teams during <i>r</i><sup>th</sup> game</li>
</ul>

Function <i>rec</i> requires the following global variables:
<ul>
<li><i>g[][]</i> - original schedule</li>
<li><i>n</i> - number of teams</li>
<li><i>k</i> - number of colors</li>
<li><i>ex[]</i> - <i>ex[i]</i> contains the number of games played by <i>i</i><sup>th</sup> team during the first <i>r</i> games</li>
<li><i>col[][]</i> - <i>col[i][j]</i> = 1 if <i>i</i><sup>th</sup> team played for color <i>j</i> during the first <i>r</i> games, <i>col[i][j]</i> = 0 in the other case</li>
</ul>

The recursive backtracking function <i>rec</i> tries to assign every color to the team <i>c</i> in the game <i>r</i> and return the number of ways
to complete the schedule starting from <i>r</i><sup>th</sup> row and <i>c</i><sup>th</sup> column assuming that the previous part of the schedule is
filled according to the values of global variables and argument <i>cmask</i>.
It takes into account all neccessary constraints.
</p>

<p>
C++ code follows:
</p>

<pre>
vector &lt;string&gt; g;
int n, k;
int ex[5], col[5][5];

int rec(int r, int c, int d, int e, int cmask) {
    if (c == n && d) return 0;
    if (c == n) return rec(r + 1, 0, k, -1, 0);
    if (r == n) return 1;
    int ret, i;
    ret = 0;
    if (d && ex[c] < k && (e == -1 || e == ex[c]))
     for (i = 0; i < k; i++) if (!((cmask >> i) & 1) && !col[c][i])
             if (g[r][c] == '?' || g[r][c] == 'A' + i) {
          ex[c]++;
          col[c][i] = 1;
          ret += rec(r, c + 1, d - 1, ex[c] - 1, cmask | (1 &lt;&lt; i));
          col[c][i] = 0;
          ex[c]--;
         }
    if (g[r][c] == '?' || g[r][c] == '-') ret += rec(r, c + 1, d, e, cmask);
    return ret;
}

class GamesSchedule {
public:
    int howMany(vector &lt;string> schedule, int _k) {
     g = schedule;
     n = schedule.size();
     k = _k;
     memset(ex, 0, sizeof(ex));
     memset(col, 0, sizeof(col));
     return rec(0, 0, k, -1, 0);
    }
};
</pre>



<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />    <em>TopCoder Member</em>
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
