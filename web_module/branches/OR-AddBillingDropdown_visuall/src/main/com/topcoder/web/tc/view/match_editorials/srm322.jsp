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
    <A href="/stat?c=round_overview&er=5&rd=10002">Match Overview</A><br>
    <tc-webtag:forumLink forumID="505997" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 322</span><br>Monday, October 9, 2006
<br><br>

<h2>Match summary</h2> 

 

<p>
Single Round Match 322 had a fairly high number of registrants (985) and a very dynamic
start, with several coders of both divisions getting the easy problem in much less than five
minutes.
<br /><br />
In Division 1 the easy and hard problems were easier than usual, but a pretty theoretical
medium tricked many coders. <tc-webtag:handle coderId="19849563" context="algorithm"/> did
not have a  good start, but an amazing 900+ performance on the hard took him near the
top, and three successful challenges got him the rest of the way. A little behind was
<tc-webtag:handle coderId="274023" context="algorithm"/>, who also managed to get three challenges
on top of a solid performance on the problems, and needed only one more to get first.
Completing the podium was <tc-webtag:handle coderId="14886245" context="algorithm"/>, who had a solid performance
 on all problems but would have needed an incredible challenge phase to get higher in the ranking.
<br /><br />
In division 2 the problem set was more balanced and many coders were able to get the three problems right.
The key for winning was the hard problem, where a fast and correct implementation made a big difference.
<tc-webtag:handle coderId="15101078" context="algorithm"/> took home a win thanks to fast solutions
in all problems, which gave him enough of a margin to avoid worrying about the challenge phase. In second
place came <tc-webtag:handle coderId="21052072" context="algorithm"/> and in third
<tc-webtag:handle coderId="15491535" context="algorithm"/>, also thanks to coding and not to challenges.
<br /><br />
</p> 

 

<H1> 

The Problems 

</H1>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6665&amp;rd=10002" name="6665">DerivativeSequence</a></b> 

</font> 

<A href="Javascript:openProblemRating(6665)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505997" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      427 / 447 (95.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      410 / 427 (96.02%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>zombiecoder</b> for 249.37 points (1 mins 25 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      221.73 (for 410 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem simply asked to simulate the given process. The easiest way was
to carefully translate the rules of the difference sequence into your language
like this:
<pre>
int[] difSeq(int[] a) {
    int[] b=new int[a.length-1];
    for(int i=0;i&lt;b.length;i++) b[i]=a[i+1]-a[i];
    return b;
}
</pre>
And implement the order iteration recursively like this:
<pre>
int[] derSeq(int[] a, int n) {
    if (n==0) return a;
    return (difSeq(a), n-1);
}
</pre>
It was also possible to do a fully iterative approach. To see that approach, check out <tc-webtag:handle coderId="22054923" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249986&rd=10002&pm=6665&cr=22054923">code</a>.<br>
<br>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6804&amp;rd=10002" name="6804">GroupWork</a></b> 

</font> 

<A href="Javascript:openProblemRating(6804)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505997" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      319 / 447 (71.36%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      189 / 319 (59.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tdc241</b> for 489.87 points (4 mins 6 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      355.68 (for 189 correct submissions) 

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

      467 / 474 (98.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      394 / 467 (84.37%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>sjelkjd</b> for 248.02 points (2 mins 32 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      222.06 (for 394 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

In this problem you can start by looking at the constraints. Seeing that the
number of total people is inaccesible for an iteration, it immediately follows
that it is necessary to simplify the problem.
<br /><br />
Since we need to maximize
K*X, and iterating among all possible K is not feasible, we can try iterating
every possible X. There are at most 50, because X is the skill level of some
workers in the group, and there is at most one different skill level per element
in the input arrays. Now, with X fixed, we would like to get K as big as possible.
You can see that all workers with skill level less than X cannot be a part of the
group, but all others can, so we recruit them. This leads to a O(n<sup>2</sup>)
implementation that is good enough to solve the problem. Check out
<tc-webtag:handle coderId="7390224" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249964&rd=10002&pm=6804&cr=7390224">code</a>
for a readable implementation.
<br />
<br />
It was also possible to sort the pairs by skill level -- with this approach, you don't need the
inner iteration to count the number of workers with skill level greater than or
equal to X, leading to an overall O(n log n). For code with this idea,
see <tc-webtag:handle coderId="11972352" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249961&rd=10002&pm=6804&cr=11972352">solution</a>.
<br />
<br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6800&amp;rd=10002" name="6800">BattleshipChecker</a></b> 

</font> 

<A href="Javascript:openProblemRating(6800)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505997" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      117 / 447 (26.17%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      63 / 117 (53.85%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>preyas_p</b> for 775.75 points (16 mins 17 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      497.58 (for 63 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem only needed a careful implementation, so many coders were able to
get it right. The large amount of examples also prevented many failures
leading to a big success rate for a hard problem. Not all correct answers were equal, however -- some clever implementations
were much faster to code and get bug free.
<br />
<br />
The best way to check if the board was correct (the hardest part of the problem)
was to first look for diagonal touching. Any two cells that were both diagonally connected
and occupied indicate that the board is wrong, so we returned "REJECTED." This can
be done easily with a single iteration over each possible two-by-two square on the board.
<pre>
for(int i=0;i&lt;9;i++)for(int j=0;j&lt;9;j++)
   if ((board[i][j]=='X' && board[i+1][j+1]=='X') ||
       (board[i+1][j]=='X' && board[i][j+1]=='X')) return "REJECTED";
</pre>
Knowing that there is no diagonal touching, it's easy to see that every connected
component has to be a straight line, so we get the connected components (with
a flood, DFS or BFS) sizes collection (sizes can be from 1 to 10) and check that
there are exactly 4 of size 1, 3 of size 2, 2 of size 3, 1 of size 4 and zero of
sizes greater than 4.
<pre>
//example with a flood or DFS
int size(int i, int j, char[][] board, boolean[][] mark) {
    if (i&lt;0||j&lt;0||i&gt;9||j&gt;9||mark[i][j]||board[i][j]!='X') return 0;
    mark[i][j]=1;
    return 1+size(i+1,j,board,mark)+size(i-1,j,board,mark)+
       size(i,j+1,board,mark)+size(i,j-1,board,mark);
}
</pre>
Having checked if the board is correct, all that's left is to iterate the rows and
columns with a simple simulation to count the points -- and that's it.
<pre>
int[] rowNP=new int[10],colNP=new int[10];
for(int i=0;i&lt;10;i++)for(int j=0;j&lt;10;j++)
    if (board[i][j]=='X') rowNP[i]=colNP[j]=1;
int pts=20;
for(int i=0;i&lt;10;i++) pts-=rowNP[i]+colNP[i];
return "ACCEPTED, " + pts + " POINTS";
</pre>
<br /><br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6779&amp;rd=10002" name="6779">ExtendedDominoes</a></b> 

</font> 

<A href="Javascript:openProblemRating(6779)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505997" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      99 / 474 (20.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      41 / 99 (41.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Eryx</b> for 493.65 points (3 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      314.09 (for 41 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This does not seem like a graph problem at first. The fact that the
input is limited to 10 different numbers can be misleading -- and could make you think
that the solution is somehow exponential -- but there is a quite simple an efficient
idea using graphs. If fact, this is yet another eulerian graphs problem. First,
let's translate the input into a graph that has digits from '0' to '9' as nodes
and one edge connecting the 2 numbers of each piece (of course, these edges are
bidirectional, as are the pieces). Now, the problem is to divide the set of edges
into cycle collections.
<br />
<br />
Based on the mentioned <a href=http://en.wikipedia.org/wiki/Eulerian_graph>eulerian
graphs</a> property, we can see that this can only be done if the
<a href=http://mathworld.wolfram.com/VertexDegree.html>degree</a> of each node is even.
Of course, we do not only want to know whether this is possible or not, since this
just distinguishes between zero and non-zero cases, but we also want the exact number.
<br />
<br />
Let's look at each node separately. A single node has some number of edges <i>d</i>
that have it as an endpoint. Each time we enter the node in a cycle, we must also
leave, so we have to put the <i>d</i> edges in <i>d</i>/2 pairs -- meaning that if
we enter the node using one edge, we leave it using the one that was assigned
(pairs are bidirectional).
<br />
<br />
Now, each cycle collection is completely defined by the pairings defined of all nodes.
By the definition given in the problem statement, we can see that cycle collections
are the same if pairings are the same (because the connected pieces to a given piece
<i>p</i> are given by the pairings of the each of the nodes representing the two numbers
in <i>p</i>). So, we calculate the number of distinct pairings of each node and the result
is simply the product of those 10 numbers.
<br />
<br />
The number of pairings of an odd number is of course, zero (because we can pair them all
without repeating). The number of pairings of 0 is 1, and the number of pairings of an even
number greater than 0 is <i>f(x) = (x-1)*f(x-2)</i> because we get the first element, we
select who is its partner (x-1 choices) and then we pair the remaining x-2 elements. Since
<i>x</i> can only have a value between 0 and 9, there is no need to memoize or hardcode this
values, although it could easily be done. Java code for a simple solution follows:
<pre>
int[] f={1,0,1,0,3,0,15,0,105,0};
public long countCycles(String[] p) {
    int[] d=new int[10];
    for(String s : p)for(int i=0;i&lt;2;++i) d[s.charAt(i)-'0']++;
    long r=1;
    for(int di : d) r*=f[di];
    return r;
}
</pre>
Note: Since the constraints guarranted that the result will fit in a 64-bit signed integer
type, there was no need to worry about overflow, but a piece set that was complete with
exception of 0-1, 2-3, 4-5, 6-7 and 8-9 would have a result that is greater than 2<sup>63</sup>
(this has all nodes with degree 8). In fact, 9 nodes with degree 8 and 1 with degree 6 would
also cause overflow, but neither of these combinations were allowed.
<br />
<br />
Just as a comment: see the incredibly fast <tc-webtag:handle coderId="8355516" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249949&rd=10002&pm=6779&cr=8355516">submission</a>,
with an amazing set of <tt>define</tt>'s.
<br />
<br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6646&amp;rd=10002" name="6646">StrawberryFieldsOnFire</a></b> 

</font> 

<A href="Javascript:openProblemRating(6646)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505997" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      103 / 474 (21.73%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      67 / 103 (65.05%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 934.19 points (7 mins 38 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      535.39 (for 67 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Happy birthday to you, happy birthday to you, happy birthday, dear John...
happy birthday to you. The day this problem was used (October 9) was
<a href=http://en.wikipedia.org/wiki/John_lennon>John Lennon</a>'s birthday,
and the title, the initial quote and the name of the farmer are in
his honor (if you do not know what I'm talking about,
<a href=http://en.wikipedia.org/wiki/Strawberry_Fields_Forever>wikipedia</a>
does).
</p>
<p>
Getting to the problem, it was easier than many other hard ones, and many coders were able
to finish it, some with really high scores.
</p>
<p>
The function that you were required to calculate may look hard at first glance -- there can be a lot (10<sup>18</sup>) of cells, and just calculating the time it takes each
one to be covered can be expensive. But seeing that the number of burned cells is
monotonically increasing (a fact that regular TC members probably saw pretty fast), it
follows that a binary search is in order (iterating every possible time was also not
a good option because, as examples showed, the answer can be pretty big).
</p>
<p>
To be able to do a binary search, we must provide a way to calculate, for a given time,
if the need of farmer John was fullfilled, or, in other words, if the number of not
burned cells was greater than or equal to <b>need</b>.
</p>
<p>
Since, as we mentioned previously, there are many cells, we need to do something clever here.
The limited number of places where the fire can start (50) give the burn after some time a
shape of many overlapped rectangles. This regular form needs to be used to cut time down.
If we calculate the rectangles -- at time T the rectangle
that is made by the fire starting at i,j has one corner at max(i-T,1),max(j-T,1) and the other
one in min(i+T,<b>w</b>),min(j+T,<b>h</b>) -- and then extend the all rectangle borders we get
rectangle areas that are either entirely burned or entirely alive. Accordingly, we can iterate only those
areas and, for each of them, check any of its cells to see if it is burned or not. If it's
not, we add to the counter the area's surface.
</p>
<div align="center">
<img src="/i/srm/srm322.png" alt="SRM322" />
</div>
<p>
In the above picture, red squares are the fire starters, yellow ones are the ones that are
on fire now (at time 2) and the black lines are the mentioned rectangles (at distance 2 from
the red squares) and their extension. As you can see, each black delimited area is either
entirely red/yellow or entirely white.
</p>
<p>
To do the aforementioned division, you need to get the set of all x coordinates and all y coordinates
in each rectangle, and add the borders (0 and <b>w</b> or <b>h</b> respectively), then sort each set
and do the iteration of each rectangle. For each i,j you either sum (x[i+1]-x[i])*(y[i+1]-y[i]) if
cell x[i],y[i] is fire-free or don't. To see if a given cell is free, simple iterate all rectangles and
check if it is contained. Since the number of elements in each of x and y sets is bounded by twice the
number of rectangles plus the borders of the field, each one can have at most 102 elements, and therefore
there are at most 102<sup>2</sup> field areas to check. Each check costs 50, getting to 102<sup>2</sup>*50.
Finally, the binary search cannot take more than 64 steps (because is a 32 bit number), so the overall
number of iterations is upper bounded by 64*50*102<sup>2</sup>, which easily fits on time.
</p>
<p>
For an implementation with this idea see <tc-webtag:handle coderId="274023" context="algorithm"/>'s
<a href=/stat?c=problem_solution&rm=249954&rd=10002&pm=6646&cr=274023>code</a>.
</p>


</p>

<div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
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
