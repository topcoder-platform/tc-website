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
    <A href="/stat?c=round_overview&er=5&rd=10011">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506006" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 331</span><br>Thursday, December 21, 2006
<br><br>

<h2>Match summary</h2>

With SRM 331 happening only a few days before Christmas, it was the perfect excuse to escape from the rush of cleaning, cooking and shopping for couple of hours and relax in front of some relatively easy Christmas-themed problems.
<br />
<br />
In Division I we didn't have to wait long for the first submissions, as many coders scored more than 240 points on the easy problem. 
The remaining two problems also didn't stop the top competitors for long -- one could have found himself outside the top 50, even after solving 
all the problems in less than forty minutes. After the end of the coding phase, <tc-webtag:handle coderId="19849563" context="algorithm"/> was
on the top with the impressive score of 1527.24 points, with <tc-webtag:handle coderId="9906197" context="algorithm"/> and
<tc-webtag:handle coderId="10574855" context="algorithm"/> not far behind. <tc-webtag:handle coderId="10574855" context="algorithm"/>  had the fastest
solution on the hard problem, and would have had a better score if not for his resubmission of the medium. 
<br />
<br />
In the challenge phase the 500 pointer was the most popular target of attacks.
<tc-webtag:handle coderId="19849563" context="algorithm"/> gained 50 points, and <tc-webtag:handle coderId="16096823" context="algorithm"/>, who was
until now better known from his development performance,  grabbed 150 challenge points and climbed to the second spot. Maybe it was the TopCoder College
Tour together with <tc-webtag:handle coderId="22629209" context="algorithm"/> visiting Wuhan university that motivated him.
<br />
<br />
In Division II we had another two Chinese coders at the top. <tc-webtag:handle coderId="20287357" context="algorithm"/> won with 1427.33 points,  
and second place went to newcomer <tc-webtag:handle coderId="22663016" context="algorithm"/>.
<br />
<br /> 

<H1>The Problems</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7266&amp;rd=10011" name="7266">SantaGifts</a></b>
</font>
<A href="Javascript:openProblemRating(7266)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506006" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      472 / 538 (87.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      398 / 472 (84.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>chadnov</b> for 245.55 points (3 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      191.15 (for 398 correct submissions)
    </td>
  </tr>
</table></blockquote>

All we need to do is to simulate the process described in the problem statement.
We begin with the array filled with empty strings and than loop through all the gifts,
appending each to the corresponding string. The 0-based index of the kid that gets the
k-th gift can be computed as k%N.
<pre>
public String[] distribute(String[] gifts, int N) {
        String[] res = new String[N];
        Arrays.fill(res, "");
        for(int i=0;i&lt;gifts.length &amp;&amp; i&lt;4*N;i++)res[i%N]+=gifts[i]+" ";
        for(int i=0;i&lt;res.length;i++)res[i]=res[i].trim();
        return res;
}
</pre>
Two things to remember is not processing more than 4*N gifts, and not leaving trailing spaces. 
<br />
<br />
 
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7280&amp;rd=10011" name="7280">CarolsSinging</a></b>
</font>
<A href="Javascript:openProblemRating(7280)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506006" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      217 / 538 (40.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      124 / 217 (57.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>batterlife</b> for 490.56 points (3 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      304.01 (for 124 correct submissions)
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
      378 / 397 (95.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      351 / 378 (92.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>marek.cygan</b> for 247.82 points (2 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      210.06 (for 351 correct submissions)
    </td>
  </tr>
</table></blockquote>

<i>
    Dashing through the snow<br>
    On a one-horse open sleigh,<br>
    Over the fields we go,<br>
    Laughing all the way...<br>
</i>

<br /><br />
Once we notice that there are at most 10 carols, it becomes obvious that a simple brute force solution is enough to solve this problem.
We are going to loop through all the possible subsets of carols (not more than 1023) and choose the smallest one that satisfies the problem condition.
<br />
<br />
Looping through all the subsets of a set is a technique commonly used in TopCoder problems, 
which explains the very fast submissions made by the experienced coders. The easiest way to do it is to use bitmasks to represent subsets.
If you need more information on what a bitmask is,  or how it applies here, check the <a href ="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=bitManipulation">
 excellent article</a> by <tc-webtag:handle coderId="251074" context="algorithm"/> on that topic.

<pre>
    public int choose(String[] lyrics) {
        int res = 1000;
        int[] masks = new int[lyrics.length];
        int carols = lyrics[0].length();
        for (int i = 0; i &lt; lyrics.length; i++)
            masks[i] = Integer.parseInt(lyrics[i].replace('Y', '1').replace('N', '0'), 2);
        for (int m = 0; m &lt; 1 &lt;&lt; carols; m++) {
            boolean ok = true;
            for (int i = 0; i &lt; masks.length; i++)
                if ((masks[i] &amp; m) == 0) ok = false;
            if (ok &amp;&amp; Integer.bitCount(m) &lt; res) res = Integer.bitCount(m);
        }
        return res;
    }
</pre>

The solution above shows a nice Java trick to convert a string of 'Y' and 'N' into an integer and use it as a bitmask.
It can be seen in the <a href="http://www.topcoder.com/stat?c=problem_solution&cr=14846952&rd=10011&pm=7280">
    fastest Java submission</a>, written by <tc-webtag:handle coderId="14846952" context="algorithm"/>.
<br />
<br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7261&amp;rd=10011" name="7261">ChristmasTree</a></b>
</font>
<A href="Javascript:openProblemRating(7261)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506006" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      52 / 538 (9.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 52 (55.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gislan</b> for 796.65 points (15 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      544.59 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>


To count all the ways to decorate a tree we can write a recursive function which processes one level of the tree at the time.
Please note that result for subsequent levels depends only on what baubles we choose to use, not how we place them on the level.
<br />
<br />
On each level we have three options to consider:
<ol>
<li>Covering the whole level with the same color.</li>
<li>Using two bauble colors on the level - this can be done only for the levels with even numbers.</li>
<li>Using all three colors - the level number must be dividable by 3.</li>
</ol>
When we are dealing with the second option. The number of ways to cover a level, with two colors, can be computed using combinatorics as 
<b>n!/(n/2)!/(n/2)!</b>. Similarly for the third option it's <b>n!/(n/3)!/(n/3)!/(n/3)!</b>. Look at  
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263079&rd=10011&pm=7261&cr=22662922">this solution</a> of 
 <tc-webtag:handle coderId="22662922" context="algorithm"/> for a clean implementation.
<br /><br />
As often happens we can improve performance of a recursive solution by adding a memoization, though in this problem it's not necessary,
 since we have no more than 10 levels and it easily runs under the time limits.
<br /><br />
 
 <font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6479&amp;rd=10011" name="6479">Shopping</a></b>
</font>
<A href="Javascript:openProblemRating(6479)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506006" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      255 / 397 (64.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      151 / 255 (59.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>haha</b> for 485.31 points (4 mins 58 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      332.84 (for 151 correct submissions)
    </td>
  </tr>
</table></blockquote>

At the first sight it looks like a knapsack problem, with the difference that we don't want to fill it up to the exact size
but  want to be able to fill all the sizes not exceeding X. The funny thing about this difference, though, is that it  
actually makes the problem easier to solve because a greedy solution exists.
<br /><br />
Let's analyze the coins in ascending order. We always have to start with a coin of value 1. If we don't have such a coin we simply
return -1, and that's the only case when we do that. The second coin must be either 1 or 2 -- any higher value won't allow us to pay the amount of 2 dollars.
<br /><br />
Now consider the general case, when we have already taken some coins that sum up to <b>S</b> 
(and allow to pay all the amounts from 1 to <b>S</b> at the same time). We cannot take a next coin with value greater then <b>S</b>+1, because that won't allow
us to pay <b>S</b>+1 dollars. If we take any coin with value <b>x &lt;= S+1</b> it will allow us to pay every amount from 1 to <b>S + x</b>, so the best choice is
to pick as high <b>x</b> as we can. That translates into short code:

<pre>
int numCoins(int[] values, int X){
        sort(values);
        int sum =0;
        int res =0;
        if(values[0]!=1)return -1;
        for(int p=0;sum&lt;X;res++){
            sum+=values[p];
            while(p&lt;values.length-1 &amp;&amp; sum +1 &gt;=values[p+1])p++;
        }
        return res;
    }
</pre>

If you are still not convinced by the above explanation, it can be easily proven that any solution with an optimal number of coins, can be converted to
a solution generated according to the above paragraph only by exchanging coins.
<br />
<br /> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7265&amp;rd=10011" name="7265">HiddenSquares</a></b>
</font>
<A href="Javascript:openProblemRating(7265)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506006" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      95 / 397 (23.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      82 / 95 (86.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 838.84 points (12 mins 58 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      585.39 (for 82 correct submissions)
    </td>
  </tr>
</table></blockquote>

Every corner of every square we can get must have an X coordinate existing in <b>x1</b> or <b>x2</b> arrays (similarly  for the Y coordinate).
That makes at most 10,000 possible points to consider. We can loop through all such points, assuming it is, for example, in the upper-left corner of a square.
Now since the upper-right corner also must be in the set of possible points we have not more than 100 points to check (the Y coordinate is set).
The pseudocode of a solution can look like this:

<pre>
int res =0;
foreach point (x,y)
    foreach x2 &gt; x {
        int L = x2 - x; //length of the square's edge
        if( maxDown[x][y] &gt;= L &amp;&amp;
            maxDown[x+L][y] &gt;= L &amp;&amp;
            maxRight[x][y] &gt;= L &amp;&amp;
            maxRight[x][y+L] &gt;= L)
                res++;
    }
</pre>

maxDown and maxRight are precomputed arrays, containing the length of the longest line segment reaching down/right from a given point. 
Note that line segment is not necessarily the edge of a single rectangle, but can build from a few overlapping edges.
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/slex_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8382018" context="algorithm"/><br />
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
