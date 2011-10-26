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
    <A href="/stat?c=round_overview&er=5&rd=10766">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516054" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 357</span><br>Thursday, July 12, 2007
<br><br>



<h2>Match summary</h2> 

<p> 
<tc-webtag:handle coderId="19849563" context="algorithm"/> easily cruised through the field to 
victory.
TopCoder and web-casting veteran <tc-webtag:handle coderId="270505" context="algorithm"/> came second with a 100+ gap,
and <tc-webtag:handle coderId="272408" context="algorithm"/> rounded out the top three, finishing almost 300 points behind John.
Ukrainian fellows <tc-webtag:handle coderId="7389864" context="algorithm"/> and 
<tc-webtag:handle coderId="9927526" context="algorithm"/> had a close race for the fourth place, 
with <tc-webtag:handle coderId="7389864" context="algorithm"/> being a bit faster.</p>
<p>
In Division 2, <tc-webtag:handle coderId="22672408" context="algorithm"/> and <tc-webtag:handle coderId="22630601" context="algorithm"/>
had significantly more points than all other competitors, followed by <tc-webtag:handle coderId="10562379" context="algorithm"/>
in third place.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2432&amp;rd=10766" name="2432">MnemonicMemory</a></b> 
</font> 
<A href="Javascript:openProblemRating(2432)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516054" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      480 / 532 (90.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      443 / 480 (92.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>einstein41389</b> for 246.52 points (3 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189.00 (for 443 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As often happens with Division 2 easy problems, an accurate implementation is all you need to solve this problem.
Let's do this step by step. 
First, words of the same length must be used in lexicographical order. 
This can be achieved by sorting the <b>dictionary</b> at the very beginning and using words of the same length in the 
order they'll appear in <b>dictionary</b> after sorting.
Second, you can not use each element of <b>dictionary</b> more than once. 
To assure this, we'll keep an array of booleans, where the i-th element will be <i>true</i> if and only if 
the i-th element of <b>dictionary</b> was already used in our mnemonic representation. 
When you have done these two points, the rest is trivial:
<pre>
Arrays.sort(dictionary);
boolean[] used = new boolean[dictionary.length];
for (int i = 0; i < number.length(); i++) {
    int dig = number.charAt(i) - '0';
    for (int j = 0; j < dictionary.length; j++)
        if (!used[j] && dictionary[j].length() == dig) {
        // here we add an extra leading space before the very first word, we'll take care of it later
            ans += (" " + dictionary[j]); 
            used[j] = true;
            break;
    }
    }
return ans.trim(); // to throw out the extra leading space
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6254&amp;rd=10766" name="6254">Hotel</a></b> 
</font> 
<A href="Javascript:openProblemRating(6254)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516054" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      250 / 532 (46.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      83 / 250 (33.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>neha_gedela</b> for 471.72 points (7 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      332.36 (for 83 correct submissions) 
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
      437 / 454 (96.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      330 / 437 (75.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sluga</b> for 247.36 points (2 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212.48 (for 330 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This one is a classical DP problem. The state of DP is the number of customers you need to attract. 
If the number of customers C is non-positive, you can get them with a cost of 0.
If the number of customers C is positive and you have already found the optimal costs for all smaller numbers, the solution
is simple: check all cities from the input and try to attract customers[i] for the cost of
cost[i]. Since you already know the cost of attracting (C - customers[i]) customers, you can find the optimal 
answer for C as the minimum of all (bestCost(C - customers[i]) + cost[i]).
As an implementation detail, we can shift all numbers in bestCost array by 100, to avoid going out of bounds:
<pre> 
int[] bestCost = new int[minCustomers + 101];
for (int i = 1; i <= minCustomers; i++) {
    bestCost[i + 100] = 100000000;
    for (int j = 0; j < cost.length; j++)
         bestCost[i + 100] = Math.min(bestCost[i + 100], bestCost[i + 100 - customers[j]] + cost[j]);
}
return bestCost[minCustomers + 100];
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6406&amp;rd=10766" name="6406">WebsiteRank</a></b> 
</font> 
<A href="Javascript:openProblemRating(6406)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516054" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      42 / 532 (7.89%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 42 (7.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Cristiano</b> for 596.08 points (27 mins 42 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500.14 (for 3 correct submissions) 
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
      335 / 454 (73.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 335 (22.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 453.24 points (9 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      256.32 (for 75 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The main part of this problem is to find for each link from site A to site B whether we should count votes for site A towards site B or we should discard this link.
To solve this question, we build the graph of the network, which has an edge from vertex A to vertex B if and only if
site A directly links to site B. Then we build the transitive closure of this graph and start checking all edges 
of the initial graph one by one.
An edge A->B of the graph should be discarded if the transitive closure of the graph has an edge from B to A.
As the result we will receive an acyclic graph.
</p>
<p>
Having that done, the problem becomes quite easy. We start calculating votes for each of the sites, starting from the sites
which do not have any incoming links. For each such site, we a) add its number of votes to each of the sites it links to, 
and b) destroy all edges outgoing from it. We are done when we compute the number of votes for all websites (or, at least, for the website we are interested in).
</p>
<p>
I must note that the simplest implementation of transitive closure algorithm (Floyd-Warshall) may time out on big cases.
Therefore, you need to either use Dijkstra or an optimized FW implementation. See <tc-webtag:handle coderId="19849563" context="algorithm"/>'s <a href="/stat?c=problem_solution&cr=19849563&rd=10766&pm=6406">code</a>
for a clean (and the fastest) solution for this problem.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4593&amp;rd=10766" name="4593">ChipArea</a></b> 
</font> 
<A href="Javascript:openProblemRating(4593)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516054" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 454 (3.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 16 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 809.91 points (18 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      664.53 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
We are asked to find the area of the largest empty rectangle. 
This rectangle can't be enlarged, so it must have on its edges points from the input or edges of the wafer. 
Let's assume the rectangle we search for has a point on its left edge. 
If we have a fixed point and we want to find the largest empty rectangle with this point (x0, y0) on its left side, then we can go through the points to its right in x sorted order and update two variables: top and bottom. 
Let's say we've reached point (x1, y1), now the rectangle with the left upper corner (x0, top) and with the right lower corner (x1, bottom) is the largest rectangle that starts from x0, ends at x1, and doesn't contain any point. 
It is possible for a point to the right of (x0, y0) to have the same y0 so we have to be careful for this case, although the successful solutions don't seem to take care of it. 
We have now a simple O(n) algorithm that finds the largest empty rectangle if we know a point on its left side.
 We can end the search when it's clear that the next areas are smaller than the largest area we found so far; this pruning helps a lot because of the distribution of points in the problem. Now we can solve the problem in O(n^2) time. 
This complexity seems big for when n is about 25000 but the accepted solutions all used this idea.
</p>
<p>
<tc-webtag:handle coderId="10481120" context="algorithm"/>, who tested the problem, has a solution which works in O(n log^2 n):
If we want to find the largest rectangle that contains point (x, y) and doesn't contain any point in the input then if we have the points (x', y') and (x", y") in the input, where x < x' < x" and y < y' < y", then we don't care about point (x", y"). 
This holds for the other quadrants as well. 
If we have n points sorted by their y coordinate, then we can find the points we do care about in O(n). 
If the points are randomly distributed, then the number of points we care about is O(log n). 
After we found the interesting points we can use the previous idea to find the largest rectangle that contains point (x, y) in O(log^2 n).
</p>
<p>
Knowing this we can solve the problem using divide and conquer: first we divide space and points with a vertical line in two equal rectangles and recursively find the largest empty rectangles in each of the two rectangles, then we want to find the largest rectangle some part containing the separating line. 
The second step can also be solved with divide and conquer, by splitting horizontally the line in two then solving those problems, and finally find the largest empty rectangle that contains the point of intersection of the vertical and horizontal lines. 
This solution is O(n log^2 n) but the randomness of the input is important.
</p>
<br /><br />






<div class="authorPhoto">
    <img src="/i/m/Cosmin.ro_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303185" context="algorithm"/><br />
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
