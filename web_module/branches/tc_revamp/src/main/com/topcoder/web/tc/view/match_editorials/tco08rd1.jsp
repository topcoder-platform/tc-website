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
    <A href="/stat?c=round_overview&er=5&amp;rd=12011">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519631" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Online Round 1</span><br />Saturday, February 16, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This Saturday more than 1,500 coders logged into the arena to compete in the first round of this year's TCO.
With 900 places for advancers, the strategy to advance was clear: slow and steady. In the end, the number
of coders with positive scores was a bit lower than 900, and thus everyone with a positive score advanced
to the next round.
</p> 

<p>
Of course, not every participant decided to go for the slow and steady approach. Some of the higher-rated
coders went for fast and steady :-)
</p>

<p>
A bug in the room seeding algorithm forced the admins to prepare a fix during the coding phase, 
and then fix everything during the intermission. This was kind of like watching a Formula 1 in the pit stop:
in a short amount of time, many things had to happen to allow the competition to proceed.
Luckily, everything went smoothly, and the only effect the coders could see was that the intermission
was 10 minutes longer.

<p>
Of course, that was not necessarily a bad thing. While many coders spent part of the time chatting,
some were glad to have ten more minutes to prepare challenge cases for greedy solutions of the 250,
and incorrect or slow solutions of the 500 and 1000.
</p>

<p>
The round went to 
<tc-webtag:handle coderId="10574855" context="algorithm"/>
after his spectacular performance in the challenge phase.
His 11 correct challenges (and not a single wrong one) 
gave him an almost 550 point lead before the rest of the coders.
Second place went to 
<tc-webtag:handle coderId="22662189" context="algorithm"/>.
Looking at his rating graph, soon we'll have a new target.
Another TopCoder veteran, 
<tc-webtag:handle coderId="144400" context="algorithm"/>,
finished third, even with a resubmitted easy problem.
</p>

 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8641&amp;rd=12011" name="8641">DiscountCombination</a></b> 

</font> 

<A href="Javascript:openProblemRating(8641)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      1392 / 1507 (92.37%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      586 / 1392 (42.10%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gawry</b> for 243.99 points (4 mins 28 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      183.30 (for 586 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
There are up to 2<sup>50</sup> possible ways to buy the shoes we don't want. 
In two seconds it is not possible to try all these ways to find the best one.
We have to find something that will help us prune the search.
</p>

<p>
One such observation: Suppose that we have two shoe models that give us the
same discount. Clearly, we should prefer the cheaper of these two.
</p>

<p>
The other observation we need is that the problem statement promised us
that there are only three types of discounts.
</p>

<p>
What can we do now? Take all the models, and split them into three heaps, one
for each discount type. Now, within each heap we can order the models according
to their price.
</p>

<p>
What did we gain? 
Suppose that the optimal solution involves buying A models from the first heap,
B models from the second heap, and C models from the thid heap. We now know 
that those must be the A (or B or C) cheapest models from that heap.
</p>

<p>
All that remains is to find the right values A, B, and C that give us
the best total price. Each of these values is at most 50, and thus we
can simply examine all triples (A,B,C) and pick the best one.
</p>

<p>
C++ code follows.
</p>

<pre>
  double minimumPrice(vector &lt;string&gt; discounts, int price) {
    vector&lt;int&gt; disc[4];
    int N = discounts.size();
    for (int i=0; i&lt;N; i++) {
      int x,y;
      stringstream(discounts[i]) &gt;&gt; x &gt;&gt; y;
      disc[y].push_back(x);
    }
    for (int i=1; i&lt;=3; i++) sort(disc[i].begin(), disc[i].end());
    double res = 1e30;
    for (unsigned a=0; a&lt;=disc[1].size(); a++)
    for (unsigned b=0; b&lt;=disc[2].size(); b++)
    for (unsigned c=0; c&lt;=disc[3].size(); c++) {
      double now = 0.0;
      for (int i=0; i&lt;a; i++) now += disc[1][i];
      for (int i=0; i&lt;b; i++) now += disc[2][i];
      for (int i=0; i&lt;c; i++) now += disc[3][i];
      now += price * pow(0.99,a*1.) * pow(0.98,b*1.) * pow(0.97,c*1.);
      res = min(res,now);
    }
    return res;
  }
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6851&amp;rd=12011" name="6851">Chomp</a></b> 

</font> 

<A href="Javascript:openProblemRating(6851)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      796 / 1507 (52.82%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      667 / 796 (83.79%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>NauCoder</b> for 474.06 points (6 mins 43 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      313.93 (for 667 correct submissions)  

    </td> 

  </tr> 

</table></blockquote> 

<p>
We can easily find out that after each move the game board will have the following shape:
</p>

<pre>
XXXXXXXX
XXXXXXXXXXXXX
XXXXXXXXXXXXXXXX
</pre>

<p>
More precisely, the state of the game can be described by three integers A &le; B &le; C,
giving the length of the top, middle, and bottom row, respectively.
</p>

<p>
Note that C&le;100, thus there are roughly 10<sup>6</sup> states.
In each state, the number of possible moves is equal to the number of remaining cells. It follows
that the number of possible moves is never greater than 300.
</p>

<p>
(Exact values: There are 176,851 valid positions, and we have to examine a total of 26,527,650 moves.)
</p>

<p>
This makes it possible to search the entire state space, and for each state (i.e., position of the 
game) compute which player wins. The algorithm for this is described in
<tc-webtag:handle coderId="13396848" context="algorithm"/>'s
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=algorithmGames">tutorial on
games</a>.
</p>

<p>
This algorithm uses the following idea: A position is winning (for the player to move), if there
is a move that leads to a position that is losing (again, for the player to move, which would be
our opponent). And vice versa, a position is losing if all moves lead to winning positions.
</p>

<p>
This algorithm can be easily extended to compute the number of moves: If we are in a winning
position, and there are multiple losing positions to choose from, pick the one where the game
will be shortest. And if we are in a losing position, do the contrary.
</p>

<p>
The solution is most easily implemented using recursion with memoization.
C++ code follows.
</p>

<pre>
  int memo[105][105][105];

  int solve(int a, int b, int c) {
    // base case: I'm forced to lose
    if (a==1 &amp;&amp; b==0 &amp;&amp; c==0) return -1;

    // memoization: if I already computed this, return the result
    int &amp;result = memo[a][b][c];
    if (result != 0) return result;

    result = -1; 
    int r[3]; r[0]=a; r[1]=b; r[2]=c;

    // try all possible moves
    for (int row=0; row&lt;3; row++) 
      for (int col=0; col&lt;r[row]; col++) {
        if (row+col==0) continue; // ... except for the move where we lose

        int s[3]; s[0]=a; s[1]=b; s[2]=c;
        for (int i=row; i&lt;3; i++) s[i] = min(s[i], col);
        // now, s[] contains the row lengths after the move 

        int curr = solve(s[0],s[1],s[2]);
        if (curr &lt; 0) {
          if (result&lt;0) 
            result=1-curr; // we found the first winning move
          else 
            result=min(result,1-curr); // check whether this winning move is better
        } else {
          if (result&lt;0) 
            result=min(result,-curr-1); // check whether this losing move is better
        }
      }
    return result;
  }

  int moves(int N) { return solve(N,N,N); }
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8598&amp;rd=12011" name="8598">BoxFilling</a></b> 

</font> 

<A href="Javascript:openProblemRating(8598)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      125 / 1507 (8.29%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      25 / 125 (20.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>SkidanovAlex</b> for 709.03 points (20 mins 0 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      527.51 (for 25 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The process described in the problem statement can be visualised as "peeling off" layers from the box. 
First, we remove the "top" layer, then the "back" layer, then the "left" layer, then the "top" layer again, and
so on, until the entire box is removed. 
</p>

<p>
A similar process is used for the 2D case: alternately we remove the "top" and the "left" row of the rectangle.
Of course, the 2D rectangles can have different orientations in 3D space, and this is where those phrases like
"all cubes with minimal X and Y coordinates" came into play &ndash; they simply made sure that for any orientation
the process will work in the same way.
</p>

<p>
Of course, we can't afford to number each and every unit cube in the box, there are too many of them.
</p>

<p>
Lucky news is that we don't need to do this, and it will even make our solution a bit simpler.
Most of the instructions are "take this set of cubes that doesn't contain the one you need, and number it".
At this point, the only thing that matters is the volume of that set (i.e., the count of unit cubes
it contains). If the last value used before this set was N, and this set contains M cubes, then the
last of them will get the number N+M. And we don't really care how the numbers N+1 to N+M are distributed.
</p>

<p>
This allows us to write a simple function that solves the 3D case: Remove 2D rectangles of cubes and sum their
sizes, until we find the layer that contains our cube.
</p>

<pre>
  // c* is in [0,s*)
  long long solve3D(long long sx, long long sy, long long sz, long long cx, long long cy, long long cz) {
    long long result = 0;

    while (true) {
      // remove the top layer
      if (sx==1 || sy==1 || sz==1) break;
      if (cz==0) return result + solve2D(sx,sy,cx,cy);
      result += sx*sy; cz--; sz--;

      // remove the back layer
      if (sx==1 || sy==1 || sz==1) break;
      if (cy==0) return result + solve2D(sx,sz,cx,cz);
      result += sx*sz; cy--; sy--;

      // remove the left layer
      if (sx==1 || sy==1 || sz==1) break;
      if (cx==0) return result + solve2D(sy,sz,cy,cz);
      result += sy*sz; cx--; sx--;
    }

    // if we got here, a single 2D case remains of the entire box
    if (sx==1) return result+solve2D(sy,sz,cy,cz);
    if (sy==1) return result+solve2D(sx,sz,cx,cz);
    if (sz==1) return result+solve2D(sx,sy,cx,cy);
  }
</pre>

<p>
As the volume is at most 10<sup>18</sup>, one of the dimensions is at most 10<sup>6</sup>, and thus the while-loop
will make at most 10<sup>6</sup> iterations. 
</p>

<p>
We can make a similar solution for the 2D case. However, there is one small catch: Removing rows one at a time
can lead to exceeding the time limit for a (10<sup>9</sup> x 10<sup>9</sup> x 1) box.
</p>

<p>
Luckily, we can easily speed this solution up. If our cube has 0-based coordinates (CX,CY), then we will clearly
make free=min(CX,CY) full iterations of the while-loop before hitting our cube. We can easily count all the cubes
used in these steps, and only then do the remaining part of the function.
</p>

<pre>
XXXXXXXXXXXXXXX
XXXXXXXXXXXXXXX
XXXXXXXXXXXXXXX
XXX.......?....
XXX............
XXX............
XXX............
</pre>

<p>
The schema above shows a 15x7 rectangle after three iterations. The cells denoted 'X' are those that were numbered
already, '?' is our cube, its coordinates are (10,3). The count of 'X'es is (15*3) + (7-3)*3.
</p>

<p>
The general 2D solution will look as follows:
</p>

<pre>
  // c* is in [0,s*)
  long long solve2D(long long sx, long long sy, long long cx, long long cy) {
    long long result = 0;
    long long free = min(cx,cy);
    result += free*(sx+sy-free);
    cx-=free; cy-=free;
    sx-=free; sy-=free;

    while (true) {
      if (sx==1 || sy==1) break;
      if (cy==0) return result+cx+1;
      result+=sx; cy--; sy--;
      if (cx==0) return result+cy+1;
      result+=sy; cx--; sx--;
    }
    if (sx==1) return result+cy+1; else return result+cx+1;
  }
</pre>

<p>
And our work is done. All that remains is to count the number of dimensions of the given box, and then
to call the appropriate function:
</p>

<pre>
  long long getNumber(int sx, int sy, int sz, int cx, int cy, int cz) {
    cx--; cy--; cz--;

    if (sx==1 &amp;&amp; sy==1) return cz+1;
    if (sx==1 &amp;&amp; sz==1) return cy+1;
    if (sy==1 &amp;&amp; sz==1) return cx+1;

    if (sx==1) return solve2D(sy,sz,cy,cz);
    if (sy==1) return solve2D(sx,sz,cx,cz);
    if (sz==1) return solve2D(sx,sy,cx,cy);

    return solve3D(sx,sy,sz,cx,cy,cz);
  }
</pre>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
