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
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
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
    <A href="/stat?c=round_overview&er=5&rd=10710">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516050" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 353</span><br>Thursday, June 7, 2007
<br><br>



<h2>Match summary</h2> 

Division 2 was presented with a balanced problem set with a trivial easy, straightforward medium and standard 
dynamic programming as a hard. 
A bunch of coders solved all three problems correctly. 
Division 2 was won by 
<tc-webtag:handle coderId="22675094" context="algorithm"/>, followed by 
<tc-webtag:handle coderId="22215915" context="algorithm"/> and 
<tc-webtag:handle coderId="15454422" context="algorithm"/>.

<br /><br />

Division 1 was another story, with a relatively easy 250 problem and straightforward but still error-prone medium that 
employed elementary physics. 
The hard problem was a tough nut for TopCoders that morning, with a total of zero successful submissions. 
The top three places were determined mostly according to the number of successful challenges among those 
who had submitted easy and medium problems. 
So, <tc-webtag:handle coderId="7446789" context="algorithm"/> took the first place with 6 challenges, while 
<tc-webtag:handle coderId="7433858" context="algorithm"/> and <tc-webtag:handle coderId="22014601" context="algorithm"/> 
took second and third place respectively. 
Notably third, fourth and fifth places were taken by high school students - <tc-webtag:handle coderId="22014601" context="algorithm"/>, 
<tc-webtag:handle coderId="19931322" context="algorithm"/> and <tc-webtag:handle coderId="20812309" context="algorithm"/> respectively.

<br />
<br />
 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7839&amp;rd=10710" name="7839">EllipseCoverage</a></b> 
</font> 
<A href="Javascript:openProblemRating(7839)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516050" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      483 / 774 (62.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      393 / 483 (81.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>CBETO3AP</b> for 245.81 points (3 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      186.58 (for 393 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Given that the constraints on the size of ellipse in the input are small, we can easily traverse all integral points in some region containing ellipses
and check if they lie inside. The simplest choice was a big rectangle, for
example with coordinates <b>(-500, -500) - (500, 500)</b>. If we choose this
rectangle on plane it will be big enough to cover every possible ellipse given
as input -- we can easily traverse each integral point in rectangle, checking if
it lies strictly in given ellipse or not.

<br />
<br />

Checking whether a point with the given coordinates lies in ellipse or not is
described in problem description, and it is a trivial procedure. However, it can
be performed in two ways: slow and fast. Most participants used slow checking,
e.g. calculating distance using doubles and checking against given <b>d</b>.
A much faster and accurate solution with integer arithmetic only exists: we can
easily avoid doubles, ignoring sqrt operation - we
can use sum of squared distances from the integral point to foci to check if the
point lie inside. You can see <tc-webtag:handle coderId="22652321" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=265093&amp;rd=10710&amp;pm=7839&amp;cr=22652321">solution</a> 
as a reference.

<pre>
  #define i64 long long
 
  i64 len(int x1, int x2, int y1 ,int y2) {
    i64 res = (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
    return res;
  }

  int calculateCoverage(int x1,int y1,int x2,int y2,int dd){
    int res=0;
    for(int i=-500;i<500;i++)
      for(int j=-500;j<500;j++) {
        i64 a = len(x1, i, y1, j);
        i64 b = len(x2, i, y2, j);
        i64 d = dd;
        if (4*a*b<(d*d-a-b)*(d*d-a-b))
          res++;
      }
    return res;
  }
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7838&amp;rd=10710" name="7838">Glossary</a></b> 
</font> 
<A href="Javascript:openProblemRating(7838)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516050" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      253 / 774 (32.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      156 / 253 (61.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Msching</b> for 479.51 points (5 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      257.39 (for 156 correct submissions) 
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
      573 / 616 (93.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      486 / 573 (84.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bmerry</b> for 236.09 points (6 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      160.45 (for 486 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This problem required a clean implementation of the described simple and straightforward
logic. However, a significant amount of coders failed to provide a working
solution. Most failed submissions were in times larger than the fastest (and
prettiest) <a href="/stat?c=problem_solution&amp;rm=265059&amp;rd=10710&amp;pm=7838&amp;cr=251074">code</a> 
by <tc-webtag:handle coderId="251074" context="algorithm"/>. So never forget about the KISS
principle while competing in TopCoder SRM's.

<br /><br />
First we need to sort items in a case-insensitive way, and then fill two columns:
the first column with items whose first letter is from 'A' to 'M', and the second
column with items from 'N' to 'Z'. We can now fill those two columns
separately, and after completion we will merge them into one column of strings
- resulting glossary.

<br /><br />
To fill one column with words we just push them one after another, and if the first
letter changes we also push a "letter-header" to column. Don't forget to
provide a letter-header for the first word in the column.

<br /><br />
To easily merge two columns with different number of elements, we simply add empty
strings (strings of 19 spaces) to the smaller column. When the heights are equal,
merging is a trivial thing.

<br /><br />
You can see <tc-webtag:handle coderId="251074" context="algorithm"/>'s solution as a reference.

<br /><br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7847&amp;rd=10710" name="7847">PlatformJumper</a></b> 
</font> 
<A href="Javascript:openProblemRating(7847)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516050" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      100 / 774 (12.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      27 / 100 (27.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>flaresky</b> for 871.23 points (11 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      664.35 (for 27 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
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
      483 / 616 (78.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292 / 483 (60.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 485.04 points (5 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      357.77 (for 292 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Obviously, each journey in the problem is directed downward. That implies each journey has
finite length, and each platform can be visited at most once. So, we can employ
dynamic programming to solve this problem. Let's introduce function <b>F[v]</b>
- the maximal number of collected coins, among all journeys ending at <b>v</b>
platform.

<br /><br />
If we can calculate that set of platforms <b>S[v]</b>, such that platform v can be
reached by one jump from every platform from <b>S[v]</b>, then <b>F[v]</b> can
be easily computed as a maximum:


<p align="center"><b>F[v] = coins[v] + max{y from S[v]} F[y]</b></p>

Where <b>coins[v]</b> is number of coins at platform <b>v</b>.

<br />
<br />
The trickiest part of the problem was to verify if we can jump from one platform
to another. This required knowledge of high school physics. Let's consider two
platforms with coordinates <b>(x1,y1)</b> and <b>(x2,y2)</b>,
<b>y1&gt;y2</b>. Jumper need to cover <b>abs(x1-x2)</b> distance in <b>Ox</b>
direction and <b>(y1-y2)</b> in <b>Oy</b> direction. Suppose, that we move with highest possible speed in <b>Ox</b>
direction - <b>Vmax</b>. Then we need time <b>Tneed</b> <b>= abs(x1-x2)/Vmax</b>
to complete jump. However, when flying we are moving downward by force of
gravity. We can calculate length of path in <b>Oy</b>
direction in time <b>Tneed</b>: <b>Dy</b><b>
= g*Tneed^2/2</b>. If <b>Dy</b> is greater than <b>(y1-y2)</b>
obviously we can't perform such a jump.

<br /><br />
Most failed submissions incorrectly checked whether we can jump from one platform to
another.

<br /><br />
<tc-webtag:handle coderId="19929536" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=265057&amp;rd=10710&amp;pm=7847&amp;cr=19929536">solution</a> 
clearly follows these ideas:

<pre>
  int maxCoins(vector &lt;string> ss, int v, int g)
  {
    int i,j,k;
    n = ss.size();
    for (i=0; i&lt;n; i++)
      sscanf(ss[i].c_str(),"%d %d %d",&cc[i].x, &cc[i].y, &cc[i].c);

    sort(cc, cc+n); // sorting in order of increasing height

    int opt[60], ans = 0;
    for (i=n-1; i>=0; i--)
    {
      opt[i] = cc[i].c;
      for (j=i+1; j&lt;n; j++)
        if ( opt[j]+cc[i].c>opt[i] &&
             (long long) (cc[i].x-cc[j].x)* (cc[i].x-cc[j].x)*g <=
             (long long)(cc[j].y-cc[i].y)*2*v*v )
          opt[i] = opt[j]+cc[i].c;
      if (opt[i]>ans) ans = opt[i];
    }
    return ans;
  } 
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7843&amp;rd=10710" name="7843">FurnitureRobbery</a></b> 
</font> 
<A href="Javascript:openProblemRating(7843)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516050" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      50 / 616 (8.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 50 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>null</b> for null points (NONE) 
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

Fifty solutions were submitted to this problem at coding phase, but no coder survived
after system test. It's surely a rare thing at TopCoder.
However, a number of coders were just a few lines of code
behind the right solution. For example the cool <a href="/stat?c=problem_solution&amp;rm=265059&amp;rd=10710&amp;pm=7843&amp;cr=251074">solution</a> 
by <tc-webtag:handle coderId="251074" context="algorithm"/> passes system test successfully, if
we add one check at the beginning - whether the famous sofa is already at
the first line.

<br /><br />

Obviously, this not-so-hard problem required imitation of furniture movement. To avoid
visiting the same state a few times we will create a hash function, assigning an
integer to some furniture position.

<br /><br />

Let us first encode some furniture position into an array of integers. Because we have
at most 30 field positions, let's assign a <b>2<sup>x</sup>, x=0..30-1</b> to each of them. 
Then, each piece of furniture can be encoded as an integer, by applying <i>binary OR</i> operation to
integers located in cells occupied by piece of furniture. So, each floor plan
state can be encoded as a array of integers, where
each integer corresponds to some piece of furniture. The hash code of the whole floor
plan can be calculated as a polynomial of array of furniture codes. <b>Important</b>:
we will assume that first code is always code of famous sofa, and other codes -
at most 14 integers - are sorted. This assumption greatly reduces number of
possible states. This small illustration shows its significance:</p>

<pre>
AAA..BB       AAA..CC       AAA..CC
....CC.       ....BB.       ....DD.
DD.....       DD.....       BB.....
</pre>

All these positions will be considered as equal, according to the hash code calculation
technique described above.

<br /><br />

Detailed description of good hash function usage and its calculation requires large
amount of space and can be found in many books on algorithms. So, hashing
details will be avoided (you still can consult self-explanatory <a href="/stat?c=problem_solution&amp;rm=265059&amp;rd=10710&amp;pm=7843&amp;cr=251074">solution</a> 
of <tc-webtag:handle coderId="251074" context="algorithm"/> with excellent implementation of
this problem).

<br /><br />

Now we have an effective memorization structure, and we can safely apply
breadth-first search to find position where part of famous sofa is located at
top row. Use of breadth-first search allows us to return the result when first
such state will be found. Its realization is pretty obvious, and most coders
should be familiar coding such algorithms.

<br /><br />`





<div class="authorPhoto">
    <img src="/i/m/xOberon_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="9906220" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
