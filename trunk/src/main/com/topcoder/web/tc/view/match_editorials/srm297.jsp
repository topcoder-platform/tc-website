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
<tc-webtag:forumLink forumID="505863" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 297</span><br>Thursday, April 6, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>The only coder to solve all three problems in Division I, Burunduk1, won the
match by a wide margin, scoring 1126.13&nbsp;points, followed by liympanda with 812.74 points and asaveljevs
with 808.46 points.</p>

<p>Division II, on the other hand, was a close race, with 33 contestants
solving all three problems. Newcomer owenlin won the
match by his fast submissions, followed closely by .UncleMike,
ar2rd, kcrtseng and mmyzf.</p>
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6139&amp;rd=9818" name="6139">PackingParts</a></b> 
</font> 
<A href="Javascript:openProblemRating(6139)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505863" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      330 / 351 (94.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      283 / 330 (85.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kcrtseng</b> for 247.05 points (3 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      209.07 (for 283 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>The problem statement describes the solution, so it is only necessary to correctly
simulate it. One of the most elegant approaches is to simply loop over the boxes,
and keep a pointer to the largest part packed so far. The solution may look as
follows:</p>

<pre>
public int pack(int[] parts, int[] boxes) {
   int part = 0;
      for (int b = 0; b < boxes.length && p < parts.length; b++)
         if (parts[p] <= boxes[b]) p++;
   return part;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6169&amp;rd=9818" name="6169">OptimalQueues</a></b> 
</font> 
<A href="Javascript:openProblemRating(6169)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505863" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      266 / 351 (75.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      130 / 266 (48.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rajeshrathod</b> for 488.68 points (4 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      354.51 (for 130 correct submissions) 
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
      267 / 273 (97.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      209 / 267 (78.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kalinov</b> for 248.00 points (2 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217.10 (for 209 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>This problem is one of those that are easy to code once you see the trick
and convince yourself that it works. In this case, we can simply sort the
customers by their arrival time. Then, we assign customers greedily into
queues, from the customer who waited longest to the customer who waited
shortest.</p>

<p>Consider the case with k queues and service time T minutes. Since we have k
queues, k customers will be served immediately. The service time is constant, so
after T minutes all queues free up, and another batch of k customers will begin
service. The third batch of k customers will begin service after having waited
for 2 * T minutes. So, k customers will be served immediately, another k
customers will have to wait T minutes, another k customers will have to wait 2
* T minutes, and so forth. </p>

<p>If we assign the customers to batches by their arrival time, some customer K
will end up waiting longest in total. Now, we can see that assigning this
customer to either an earlier batch or a later batch could not possibly result
in a better solution. All customers in the earlier batches have been waiting at
least as long as K has before the bank opened. If we move K to an earlier batch,
we will have to move some other customer L who has waited at least as long as K.
This cannot improve the solution, because now L will be waiting at least as
long as K previously did. If we move K to a later batch, K will have to wait
longer in total, so again the solution will not improve.</p>

<pre>
public int minWaitingTime(int[] clientArrivals, int tellerCount, int serviceTime) {
   int n = clientArrivals.length;
   Arrays.sort(clientArrivals);
   int ret = 0;
   for(int i=0; i&lt;n; i++) {
      int cur = clientArrivals[n - i - 1] + serviceTime * (1 + i / tellerCount);
      ret = (ret > cur) ? ret : cur;
   }
   return ret;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6135&amp;rd=9818" name="6135">RandomizedQuickSort</a></b> 
</font> 
<A href="Javascript:openProblemRating(6135)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505863" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      107 / 351 (30.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      55 / 107 (51.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mmyzf</b> for 866.72 points (11 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      589.82 (for 55 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>With 55 correct submissions, this problem did not seem to cause much trouble
to a number of Division 2 coders. The problem asks us to compute the expected running
time of the randomized <span class=SpellE>quicksort.</span></p>

<p>The first step towards the solution is to understand how the described
version of <span class=SpellE>quicksort</span> works. At each step, <span
class=SpellE>quicksort</span> randomly selects an element of the list as the
pivot. An important observation is that since the pivot is chosen randomly, the
probability that the largest element will be chosen as the pivot is the same as
the probability that the smallest element will be chosen, and also equal to the
probability that any other given order statistic will be chosen. Since we have
n possible outcomes all occurring equally likely, the probability of each one
must be the same: 1/n.</p>

<p>Once <span class=SpellE>quicksort</span> has chosen the pivot, it calls <span
class=GramE>partition(</span>) to split the list into two parts: a part that
contains all elements smaller than the pivot, and a part that contains all
elements larger than the pivot. By the <span class=SpellE>constraints</span> of
the problem, no two elements can have the same value, so no other element will
be equal to the pivot. Then, <span class=SpellE>quicksort</span> calls itself
recursively on both smaller lists.</p>

<p>So, with probability 1/n, the smallest element of the list will be chosen as
the pivot, and <span class=SpellE>quicksort</span> will <span class=SpellE>recurse</span>
on lists of sizes 0 and n &#8211; 1. With probability 1/n, the second smallest
element of the list will be chosen, and <span class=SpellE>quicksort</span>
will <span class=SpellE>recurse</span> on lists of sizes 1 and n &#8211; 2. Simply
extending this argument, <span class=GramE>the <span class=SpellE>i</span></span><span
class=SpellE>-th</span> smallest element (1 &lt;= <span class=SpellE>i</span>

&lt;= n) of the list will be chosen with probability 1/n, and will cause <span
class=SpellE>quicksort</span> to call itself recursively on lists with sizes <span
class=SpellE>i</span> &#8211; 1 and n &#8211; <span class=SpellE>i</span>.</p>

<pre>
public double getExpectedTime(int listSize, int S, int a, int b) {
   if (listSize <= S) return 1.0 * b * listSize * listSize;
   if (cache[listSize] > 0) return cache[listSize];
   double ret = 0;
   for(int i = 0; i &lt; listSize; i++) {
      double t = getExpectedTime(i, S, a, b) + getExpectedTime(listSize - i - 1, S, a, b) + 1.0 * a * listSize;
      ret += t / listSize;
   }
   return cache[listSize] = ret;
}

</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6025&amp;rd=9818" name="6025">CageTheMonster</a></b> 
</font> 
<A href="Javascript:openProblemRating(6025)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505863" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      156 / 273 (57.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 156 (40.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rem</b> for 456.03 points (8 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      278.45 (for 63 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>This problem, like so many others, has a key idea that we must realize
before successfully tackling it. First, we need to notice that if it is possible
to contain the monster at all, four force fields must be sufficient. If we have
more than four force fields, three fields must be parallel, and since the
monster will be trapped between two of them, the third field is useless. But, if
we try all possible placements of up to four fields, we end up with an <span
class=GramE>O(</span>n^6) algorithm which clearly will not run in time for n =
40. A smarter approach is to realize that the monster can always be contained
by four force fields if we can place it so that it is not on the edge of the
labyrinth. If the map does not allow us to place the monster so that it is not on
the edge of the labyrinth, then we cannot contain it. So, since we can easily
tell whether the monster can be captured using four force fields, our brute
force solution would only need to check all sets of up to three fields. For
each possible set of fields, we can find the connected components of the map.
If some component that contains a starting point for the monster is enclosed
inside the labyrinth, then the set of fields gives us one possible solution. The
resulting <span class=GramE>O(</span>n^5) algorithm may run in time, but it is
a little tricky to implement correctly.</p>

<p>Most coders used an approach that is both more efficient, as well as easier
to code. The key realization is that we cannot improve a solution by moving a
force field away from the monster. For example, consider a vertical force field
that is to the right of the monster. The force field prevents the monster from
entering any cell on the map in the column of the force field, or any column to
the right of the force field. So, instead of thinking about the force field as
blocking one column, we can think of it as blocking its column, as well as the
entire section of the labyrinth to the right of it. Then, it becomes clear that
shifting the force field to the right cannot possibly constrain the monster
further.</p>

<p>Once we realize that we can consider only creating force fields in rows and <span
class=GramE>columns adjacent to the starting position of the monster, the
problem becomes</span> fairly straightforward. For each allowed starting position
of the monster, there are four possible adjacent force fields we can create. We
try all 16 possible subsets of them, and use depth-first search or
breadth-first search to check whether the monster can escape. Since we have up
to <span class=GramE>O(</span>n^2) starting positions to check, and we take
O(n^2) time to check whether the monster can escape, we end up with an O(n^4)
algorithm that will easily run in time and is not too difficult to implement.</p>
<pre>
public int capture(String[] labyrinth) {
   lab = labyrinth;
   h = lab.length;
   w = lab[0].length();
      
   int ret = 10;
   for(int r = 1; r &lt; h - 1; r++) {
      for(int c = 1; c &lt; w - 1; c++) {
         for(int a = 0; a &lt; 16; a++) {
            if (lab[r].charAt(c) != '^') continue;
               
            blockR1 = blockR2 = -2;
            blockC1 = blockC2 = -2;
            int cur = 0;
            if ((a & (1&lt;&lt;0)) != 0) { blockR1 = r - 1; cur++; }               
            if ((a & (1&lt;&lt;1)) != 0) { blockR2 = r + 1; cur++; }
            if ((a & (1&lt;&lt;2)) != 0) { blockC1 = c - 1; cur++; }
            if ((a & (1&lt;&lt;3)) != 0) { blockC2 = c + 1; cur++; }

            vis = new boolean[55][55];
            if (cur &lt; ret && !escape(r,c)) ret = cur;
         }
      }
   }

   if (ret == 10) return -1;
   return ret;
}

</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6168&amp;rd=9818" name="6168">DynamiteBoxes</a></b> 
</font> 
<A href="Javascript:openProblemRating(6168)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505863" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      10 / 273 (3.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 10 (40.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>liympanda</b> for 520.58 points (34 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      474.80 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>Unlike the first two Division I problems, this problem requires not only
noticing a trick, but also careful implementation of the algorithm. A standard
approach to problems similar to this one is to use dynamic programming whose
parameters are height of the stack, some state representation of what the previous
level of the stack looks <span class=GramE>like,</span> and the size of the
cluster so far. This would almost work except for one complication that makes
this a Division I Hard problem: if we have two dynamite-filled boxes placed
diagonally, they don&#8217;t touch, and we cannot tell whether they are
connected at some lower level, or whether they belong to two separate clusters.
Furthermore, if the cubes belong to two separate clusters, we need to know the
sizes of both clusters to compute the rest of the problem.</p>

<p>Given a stack with a 2 x 2 base, cubes at one level cannot belong to more
than two clusters. So, one way to represent the state is using the following
parameters: a bitmask that represents the previous layer of the stack, two
numbers that representing the sizes of the one or two components we have at
this level, and a <span class=SpellE>boolean</span> value that states that if
in the previous layer the boxes were positioned diagonally, whether they belong
to the same cluster.</p>

<p>We iterate over the levels of the stack, and at each level compute the
possible next states, as well as the transition probabilities. The computation of
the transition probabilities is conceptually not too difficult, but we have to be careful
not to make mistakes. lyimpanda’s solution roughly follows this approach. Alternatively, instead of using bitmasks to represent the previous layer, it is also possible to simply enumerate the 7 cases: no dynamite boxes, one dynamite box, two adjacent dynamite boxes, two diagonal dynamite boxes that are not connected in lower layers, two diagonal dynamite boxes that are connected, three dynamite boxes and four dynamite boxes. kalinov’s solution follows this approach.</p><div class="authorPhoto">
    <img src="/i/m/igorsk_big.jpg" alt="Author" />
</div>
<div class="authorText">

  By&#160;<tc-webtag:handle coderId="7269339" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
