<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505638" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Collegiate Challenge <br> Qualification Problem Set 5</span><BR/>February 23-24, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
In this round, another set of 100 coders made it to the final round, with only
12 non-zero scores being cut.  This was mostly due to a very simple level one
problem, and a brute-forceable level two.  Competition was fierce, as the top
5 coders were separated by less than 50 points.  Too bad there wasn't a
challenge phase!
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>FunctionIter</b> 
</font> 
<A href="_Javascript:openProblemRating(2334)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505638" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      121 / 139 (87.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      110 / 121 (90.91%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>k_m</b> for 245.18 points (3 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.99 (for 110 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Problems don't get much simpler than this.  Follow the directions and return
the answer.  You are given a function, with its output values for each
possible input value.  You are then asked to iterate it for bound times.
Then, you are to iterate the function until it returns the same value you
started with.  The problem can be solved in one loop:
</p>

<pre>
int t = x;
int n = 0;
while(n &lt;= bound || t != x)
{
  t = f[t];
  n++;
}
return n;
</pre>

<p>
Simply stated, we continue to call the function on t until we have called it
more than bound times and t is equal to x.  By converting to a for-loop, we
can compress the code to a 3-line solution:
</p>

<pre>
int n, t;
for(n = 0, t = x; n &lt;= bound || t != x; n++, t=f[t]);
return n;
</pre>

<font size="+2"> 
<b>MoneyRun</b> 
</font> 
<A href="_Javascript:openProblemRating(2324)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505638" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      82 / 139 (58.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 82 (54.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Jan_Kuipers</b> for 486.79 points (8 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      325.99 (for 45 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem can be solved by brute force.  A path that a person can take
can be described with the points at which the person moves to the right, and
the points at which the person moves down.  For the worst case of a 7x7 grid,
The person moves exactly 12 times, 6 times to the right and 6 times down.  For
example, a path on a 7x7 grid can be described as "RDDDRRRDRRDD".  The number
of possible paths is therefore defined by the choice function C(12, 6),
because there are that many ways to put 6 R's in a field of 12 characters
(with the rest being D's).  Therefore, the maximum number of paths for an
individual is 924.  with two individuals, 924<sup>2</sup> is the maximum
number of combinations of paths, giving us about a million possibilities to
check.  This is probably best done through a recursive function, where at each
point, all possibilities are tried, and money which is picked up is put back
when the function exits to try another path.
</p>

<p>
Of course, with a higher maximum, such as a 50x50 grid, brute force would not
be possible, as C(98,49)<sup>2</sup> would be way too many possibilities.
However, there is another way to process the paths, using memoization.
First we assume that each person moves at the same speed and starts at the
same time (this is an important point!).  The logic is, if we get to a point
where you are at position (x<sub>1</sub>, y<sub>1</sub>), and your friend is
at position, (x<sub>2</sub>, y<sub>2</sub>), then the maximum amount of money
you can subsequently pick up is not affected by your path to that location.
Therefore, we define a function maxMoney(x<sub>1</sub>, y<sub>1</sub>,
x<sub>2</sub>, y<sub>2</sub>), which is memoized on the four input values.
The answer then is simply maxMoney(0, 0, 0, 0).  The function can be written
as follows:
</p>

<pre>
int cache[MAXC][MAXR][MAXC][MAXR]; // initialized all to -1
vector&lt;string&gt; grid;
int maxMoney(int x1, int y1, int x2, int y2)
{
  if(x1 &gt;= MAXC || y1 &gt;= MAXR || x2 &gt;= MAXC || y2 &gt;= MAXR)
    return 0;
  if(cache[x1][y1][x2][y2] != -1)
    return cache[x1][y1][x2][y2];
  int money = grid[y1][x1] - '0';
  if(x1 != x2 || y1 != y2)
    money += grid[y2][x2] - '0';
  return cache[x1][y1][x2][y2] = money + max(
    max(maxMoney(x1 + 1, y1, x2 + 1, y2), maxMoney(x1, y1 + 1, x2 + 1, y2)),
    max(maxMoney(x1 + 1, y1, x2, y2 + 1), maxMoney(x1, y1 + 1, x2, y2 + 1)));
}
</pre>

<p>
With MAXC and MAXR = 50, this would probably get past topcoder systests, but
if MAXC and MAXR were 200, the above O(n<sup>4</sup>) solution would certainly
time out.  See if you can solve this problem in O(n<sup>3</sup>), and I will
post the answer to the algorithms round table.
</p>

<p>
<img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
