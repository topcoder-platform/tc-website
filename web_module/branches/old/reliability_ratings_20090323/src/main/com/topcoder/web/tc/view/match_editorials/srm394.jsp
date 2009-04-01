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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=11128">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520546" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 394</span><br />Saturday, March 22, 2008
<br /><br />



<h2>Match summary</h2> 

<p>A healthy turnout of 1500 coders was faced with tough problemsets in both divisions. However, that was no obstacle for <tc-webtag:handle coderId="10574855" context="algorithm"/> to show impressive times on both medium and hard and to win Division 1 achieving the best-ever rating of 3799 (and with such high rating revealing a bug in the rating distribution application, as well :)).</p>

<p>In Division 1 coders were faced with a tricky easy which suggested a possibility of greedy approaches (many of which were incorrect), a somewhat involved geometrical medium and a not-so-straight-forward graph DP as a hard. The submissions of the medium and hard were scarcer than usual and only 11 coders submitted all 3 problems. However, only 8 of them survived the challenges and system tests with no losses. Another sixty-something had two problems standing in the end. The Top 3 was comprised solely of Russian coders: <tc-webtag:handle coderId="10574855" context="algorithm"/> won the match with two best times and a comfortable lead, <tc-webtag:handle coderId="11829284" context="algorithm"/> was the second thanks to two successful challenges which helped him score higher than <tc-webtag:handle coderId="20557229" context="algorithm"/>, who was the third.</p>

<p>Division 2 coders found an Easy which required careful coding, 
a Medium which many of them found quite hard to figure out and 
a Hard which asked for some clever ideas. 
Noone managed to solve all three problems correctly.
<tc-webtag:handle coderId="22658932" context="algorithm"/> seemed to win the match thanks 
to the best score on Hard, but his violation of the UCR took the victory away from his hands. 
<tc-webtag:handle coderId="22696982" context="algorithm"/> was the author of the other 
1000-pointer which survived the system tests, bringing him the victory, while  
<tc-webtag:handle coderId="22682913" context="algorithm"/> and
<tc-webtag:handle coderId="22707682" context="algorithm"/> 
rounded out the Top 3 with quick submissions of the first two problems and the help of challenges.</p>
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8734&amp;rd=11128" name="8734">MountainWalk</a></b> 
</font> 
<A href="Javascript:openProblemRating(8734)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520546" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      629 / 791 (79.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      569 / 629 (90.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dinoj18</b> for 243.02 points (4 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      164.40 (for 569 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The problem was a simulation of a walk with some details not to be overlooked. The following code is self explanatory.</p>

<pre>
public int cellsVisited(String[] map, int heightDifference) {
    int X = 0, Y = 0, n = map.length, m = map[0].length(), ans = 0;
    int dx[] = {1, 0, -1, 0};
    int dy[] = {0, -1, 0, 1};
    boolean[][] were = new boolean[50][50];
    for(int i = 0; i &lt; n; i++) 
        for(int j = 0; j &lt; m; j++) were[i][j] = false;
    boolean go = true;
    while(go == true) {
        ans++;
        were[X][Y] = true;
        go = false;
        for(int k = 0; k &lt; 4; k++) {
            int nx = X + dx[k], ny = Y + dy[k];
            if(nx &gt;= 0 &amp;&amp; nx &lt; n &amp;&amp; ny &gt;= 0 
                    &amp;&amp; ny &lt; m &amp;&amp; were[nx][ny] == false) {
                int diff = map[nx].charAt(ny) - map[X].charAt(Y);
                if(diff &lt; 0) diff = -diff;
                if(diff &lt;= heightDifference) {
                    X = nx;
                    Y = ny;
                    go = true;
                    break;
                }
            }
        }
    }
    return ans;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8594&amp;rd=11128" name="8594">RoughStrings</a></b> 
</font> 
<A href="Javascript:openProblemRating(8594)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520546" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      233 / 791 (29.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      55 / 233 (23.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Alex_KPR</b> for 435.17 points (11 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      268.03 (for 55 correct submissions) 
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
      556 / 605 (91.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      411 / 556 (73.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>yuhch123</b> for 246.66 points (3 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      176.53 (for 411 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>Counting the number of occurences of each letter in our original string we may reformulate the problem:</p>

<p><i>Given k natural numbers a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>k</sub> you can modify them by repeating the following procedure no more than n times: pick a number a<sub>i</sub> &gt; 0 and replace it by a<sub>i</sub> - 1. Denote the resulting sequence of natural numbers (zeroes you throw out) b<sub>1</sub>, b<sub>2</sub>, ..., b<sub>m</sub>. Find the minimal value of max b<sub>i</sub> - min b<sub>i</sub> you can obtain.</i></p>

<p>There are quite a few different approaches to this problem varying in "greediness" involved. Perhaps the simplest one is not greedy at all: just iterate through all possible values M = max b<sub>i</sub> and m = min b<sub>i</sub> and then iterate through all a<sub>i</sub>'s to see which ones have to be thrown out/reduced in order to make them fit in the interval [m, M]. For each such a<sub>i</sub> one adds cost of its modification (which is a<sub>i</sub> if a<sub>i</sub> &lt; m, a<sub>i</sub> - M if a<sub>i</sub> &gt; M, and zero otherwise) and if the cumulative cost is less than or equal to n one checks if M - m is better than the current answer.</p>

<p>Consult <tc-webtag:handle coderId="14768757" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269504&rd=11128&pm=8594&cr=14768757"> code</a> to see this approach in practice. You may also want to see <tc-webtag:handle coderId="310333" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269508&rd=11128&pm=8594&cr=310333"> solution</a> for a neat implementation of a somewhat different idea.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8547&amp;rd=11128" name="8547">ProperDivisors</a></b> 
</font> 
<A href="Javascript:openProblemRating(8547)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520546" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      29 / 791 (3.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 29 (6.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bbi5291</b> for 538.73 points (32 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      369.36 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The problem was quite easy if one noticed what should be done. The constraints were too high for a straight forward 'iterate over every m in the interval and compute the number of its cool divisors' approach since in the most naive form this would be O(b*a<sup>1/2</sup>) which is circa 10,000,000,000. The last example suggested that one wouldn't get away with plain brute force. Some coders decided to try their luck anyway, exposing their solutions for easy challenges.</p>

<p>We solve using the usual gun - change the order of summation! Instead of summing over all m's in the interval we sum over all candidates to cool divisors k and count how many times a particular k is calculated in the sum d(a) + d(a + 1) + ... + d(a + b). But given k this is easy: it is equal to [(a + b)/k] - [(a - 1)/k] - ([(a + b)/k<sup>n</sup>] - [(a - 1)/k<sup>n</sup>]) for obvious reasons (here [x] is the integer part of x). If k is greater than a - 1 then in this way we count it as a divisor of itself once which requires some adjustments (the last if in the code) since cool divisors must be less than numbers themselves. With these observations the resulting code is really short:</p>

<pre>
public int P(int k, int n) {
    if(n == 1) return k;
    return k * P(k, n - 1);
}
    
public int analyzeInterval(int a, int b, int n) {
    int sum = 0;
    if(a == 1) {
        a++;
        b--;
    }
    for(int k = 2; k &lt;= (a + b)/2; k++) sum += ((a + b)/k - (a - 1)/k);
    for(int k = 2; P(k, n) &lt;= a + b; k++) sum -= ((a + b)/P(k, n) - (a - 1)/P(k, n));
    if(a &lt;= (a + b)/2) sum -= ((a + b)/2 - a + 1);
    return sum;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8546&amp;rd=11128" name="8546">CentersOfSymmetry</a></b> 
</font> 
<A href="Javascript:openProblemRating(8546)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520546" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      77 / 605 (12.73%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      48 / 77 (62.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 512.96 points (12 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      304.47 (for 48 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>Geometry problems are certainly one of the most 'beloved' among contestants. CenetrsOfSymmetry was no exception: a fair amount of coders that openned it soon gained some confidence and decided to check out the Hard straight away. No, but seriously, the problem was not that hard, especially if one has some pre-written libraries for handling the most common geometrical operations. And if not, well, this was a chance to create some.</p>

<p>Note that if we have some intersection point of two given lines then after a symmetry with respect to some point it goes to an intersection point of two given lines (maybe to itself). Thus if there are intersection points then the only candidates to centers of symmetry that we are looking for are midpoints between pairs of (not necessarily distinct) intersection points of given lines. Moreover, since <i>any </i> intersection point behaves this way when treated with symmetry, while iterating through pairs of intersection points and checking their midpoints we may fix one of the points to optimize a bit. Calculating intersection points of pairs lines is a standard operation and checking if the symmetry of the given line is again a given line is easy: just check if the images under symmetry of the two given points on the line are collinear with some two points defining another (or possibly the same) line. Constraints were low enough so there was no need to worry about precise calculations of the coordinates of points and choosing any decent precision should have been enough.</p>

<p>Another case is when there are no intersection points, i.e., all the given lines are parallel. Now the answer is 0 or -1. It is not hard to see that the answer is -1 in this case if and only if the lines are "symmetrically spaced", i.e., the sequence d<sub>1</sub>, d<sub>2</sub>, ..., d<sub>k</sub> of distances between adjacent lines possesses the property d<sub>i</sub> = d<sub>k - i + 1</sub>. This may seem exotic to check but it is not really hard. One may calculate the intersection coordinates of the given lines with one of the coordinate axes and, after ordering the obtained numbers, check if the sequence of differences between adjacent numbers possesses the aforementioned property (Thales' theorem suggests us that this is equivalent, though it is trivial anyway). Another way to do it is to convert all the lines into "normal form" (i.e., find the defining linear polynomials P<sub>i</sub>(x, y) = a<sub>i</sub> * x + b<sub>i</sub> * y + c<sub>i</sub> of the lines) and check if the "shiftings" (i.e., P<sub>i</sub>(0, 0) = c<sub>i</sub>) are "symmetrically spaced".</p>

<p>By the way, it is not hard to prove (exercise!) that the answer is always -1, 0 or 1, i.e., if there are at least two centers of symmetry then there are infinitely many of them. The idea of the proof is to show that if A and B are two distinct centers of symmetry then the image of A under symmetry centered at B is once again a center of symmetry. An interested reader is invited to work out the details.</p>

<p>Though it is difficult to read codes for geometry problems one may wish to look at the submissions of <tc-webtag:handle coderId="19849563" context="algorithm"/> <a href="/stat?c=problem_solution&rm=269505&rd=11128&pm=8546&cr=19849563">here</a> or <tc-webtag:handle coderId="15868491" context="algorithm"/> <a href="/stat?c=problem_solution&rm=269504&rd=11128&pm=8546&cr=15868491">here</a>.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8593&amp;rd=11128" name="8593">PseudoRandomKingdom</a></b> 
</font> 
<A href="Javascript:openProblemRating(8593)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520546" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 605 (6.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      27 / 37 (72.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 846.64 points (7 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      497.35 (for 27 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>First of all, it is not hard to see that the map of the roads of the kingdom is a tree. It is also quite evident that the problem begs for a DP solution. Let's find one!</p>

<p>Let's consider our original tree as a rooted tree with root 0. For each node x we wish to find an array dp[x][] such that the subtree rooted at x has probability dp[x][c] of having the most costly path from x to one of its leafs to have cost c, while not violating an assumption that the cost of any path in this subtree does not exceed <b>savings</b>. Indeed, this is what we want: if we know dp[0][] then the answer we must return is dp[0][0] + dp[0][1] + ... + dp[0][<b>savings</b>]. So how do we find such dp[x][]? Well, we iterate through all children y of x and compute dp[y][] first and then update the current version of dp[x][] which is initialised as {1, 0, ..., 0}. How does the updating work? Well, we know dp[x][] when we analyzed the first k children of x (initially k = 0) and we want to update to new_dp[x][] (latter we will assign dp[x][] := new_dp[x][]), where we also analyzed (k + 1)'st child y. How do we do that? Well, that's easy - just iterate through all costs b of an edge connecting x to y, and all costs a of the most costly path from y to one of its leaves, and all costs d of the cost of the most costly path connecting x to one of its leaves (where we analyzed only first k children) and add new_dp[x][max(d, b + a)] += p * dp[y][a] * dp[x][d] (new_dp[x][] is initialized as {0, 0, ..., 0}), where p = 1/(<b>cost</b> + 1) is the probability of an edge having cost b. Surely, this must work - we do not do anything fancy, plainly consider all possibilities of costs. But there are also some restrictions not to be overlooked. Namely, while iterating we skip those triples of (b, a, d) for which b + a + d > <b>savings</b> because we can not have paths of cost greater than <b>savings</b> in our subgraph rooted at x.</p>

<p>A real-quick implementation of this solution is <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269510&rd=11128&pm=8593&cr=10574855">code</a>.</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Xixas_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22629218" context="algorithm"/><br />
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
