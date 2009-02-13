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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10936">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516065" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 368</span><br />Tuesday, October 2, 2007
<br /><br />



<h2>Match summary</h2> 

 

<p> 
After my previous sets of rather hard Division 2 problems I decided to try sharing
a problem as the Div1 easy and Div2 hard. The experiment proved to be quite 
successful and led to a reasonably hard Division 2 problem set. Twenty-two coders
were able to finish all three problems, and between them speed and successful
challenges mattered.
</p> 

<p>
Thanks to five successful challenges <tc-webtag:handle coderId="22695787" context="algorithm"/>
took the first place with a comfortable lead of over 200 points. 
A newcomer <tc-webtag:handle coderId="22663781" context="algorithm"/>
was second and <tc-webtag:handle coderId="22661088" context="algorithm"/> third.
</p>

<p>
Division 1 had a harder time, with a medium problem that required some knowledge
of geometry
and a tough hard problem from coding theory. Five minutes before the end there 
were only a few submissions on the hard problem, and most of them were obviously
wrong. As usual, we got more submissions during the last minutes, but the challenge
phase was efficient and the system tests merciless. In the end, only 
<tc-webtag:handle coderId="7210680" context="algorithm"/>'s solution survived
all the tests (including three challenges), and gave him a reason to 
be proud.
</p>

<p>
However, solving the hard problem was not enough to win the match. 
An obvious candidate for match victory was 
<tc-webtag:handle coderId="251074" context="algorithm"/>
with his fastest times both on the easy and on the medium problem. 
But this time he had to settle for second place -- 
<tc-webtag:handle coderId="15764636" context="algorithm"/>
discovered how tricky the easy problem is, and with eight 
successful challenges beat <tc-webtag:handle coderId="251074" context="algorithm"/>
(and his "only" five successful challenges)
by mere two points. 
The third place went to 
<tc-webtag:handle coderId="7390224" context="algorithm"/>,
who became a target after this match.
</p>

 
<h3>Usage notes</h3>

<p>
This editorial is suitable for people of all ages, races and genders. 
Recommended daily usage: stop <em>before</em> your head starts to hurt.
The text comes with free exercises, feel free to discuss them in the forums.
</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8241&amp;rd=10936" name="8241">PirateTreasure</a></b> 

</font> 

<A href="Javascript:openProblemRating(8241)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516065" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      300 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      505 / 625 (80.80%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      448 / 505 (88.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>FrancaiS</b> for 297.13 points (2 mins 47 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      216.74 (for 448 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
We will imagine a coordinate system in the plane of the island, with the x axis pointing east
and the y axis pointing north.
Now moves north, south, east and west correspond to moves by [0,+1], [0,-1], [+1,0], and [-1,0].
The hardest part in solving this task was to compute how do the moves in the other four directions
change our coordinates.
</p>

<p>
Here we can use the theorem of Pythagoras. Say that we make a move "X steps northeast". 
Its equivalent is moving Y steps north and the same amount east, for some unknown (not
necessarily integer) value Y.
How to compute Y?
</p>

<div align="center"><img src="/i/education/srm368.png" /></div>

<p>
The situation can be drawn as a right triangle where the hypotenuse has length X and both legs 
have length Y, just as in the picture above.
From Pythagoras's theorem we get 
the equation Y<sup>2</sup> + Y<sup>2</sup> = X<sup>2</sup>.
This can be simplified to 2Y<sup>2</sup> = X<sup>2</sup>. Both sides of the equation are positive,
thus we can compute their square roots and they have to be equal.
We get Y&radic;2 = X.
</p>

<p>
That can be rewritten to Y = X/&radic;2. Another form of the same expression is
Y = X&radic;2/2. (We can obtain it by multiplying both the numerator and the denumerator
of X/&radic;2 by &radic;2.)
Thus the move "X steps northeast" is the same as "X&radic;2/2 steps north, X&radic;2/2
steps west".
</p>

<p>
One more thing: instead of having the same code eight times (once for each direction),
it is much more convenient and less error prone to enter the directions as constants,
and then to use loops. Our code that uses this approach follows.
</p>

<pre style="color: #9c0000;">
<font color="navy">public</font> <font color="navy">final</font> <font color="navy">class</font> PirateTreasure {
  <font color="navy">double</font> sq2   = Math.sqrt(<font color="red">2.0</font>) / <font color="red">2.0</font>;
  String[] DIR = {<font color="red">&quot;NORTH&quot;</font>,<font color="red">&quot;SOUTH&quot;</font>,<font color="red">&quot;EAST&quot;</font>,<font color="red">&quot;WEST&quot;</font>,
                  <font color="red">&quot;NORTHWEST&quot;</font>,<font color="red">&quot;NORTHEAST&quot;</font>,<font color="red">&quot;SOUTHWEST&quot;</font>,<font color="red">&quot;SOUTHEAST&quot;</font>};
  <font color="navy">double</font>[] dx  = {    <font color="red">0</font>,    <font color="red">0</font>,    <font color="red">1</font>,   -<font color="red">1</font>, -sq2,  sq2, -sq2,  sq2};
  <font color="navy">double</font>[] dy  = {    <font color="red">1</font>,   -<font color="red">1</font>,    <font color="red">0</font>,    <font color="red">0</font>,  sq2,  sq2, -sq2, -sq2};
  <font color="darkgreen">// going in the direction DIR[i] corresponds to moving by +dx[i],+dy[i]</font>

  <font color="navy">public</font> <font color="navy">double</font> getDistance (<font color="navy">int</font>[] steps, String[] directions) {
    <font color="navy">double</font> x=<font color="red">0</font>, y=<font color="red">0</font>;
    <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;steps.length; i++) {
      <font color="navy">int</font> d=<font color="red">0</font>;
      <font color="navy">while</font> (!directions[i].equals(DIR[d])) d++;
      x += dx[d] * steps[i];
      y += dy[d] * steps[i];
    }
    <font color="navy">return</font> Math.sqrt(x*x+y*y);
  }
}
</pre>

<h4>Exercises</h4>

<ul>
<li>1.1 Suppose that you are allowed to ignore some of the directions.
Design a polynomial algorithm that will compute at most how far from the initial location can you get.
<li>1.2 Solve a variation of the original task where directions are given in degrees instead of compass directions.
(Hint: sine and cosine will be your friends.)
<li>1.3 In this setting (arbitrary directions), can you still solve the same task as in 1.1?
</ul>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8244&amp;rd=10936" name="8244">TurningLightOn</a></b> 

</font> 

<A href="Javascript:openProblemRating(8244)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516065" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      253 / 625 (40.48%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      224 / 253 (88.54%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ryuwonha</b> for 489.88 points (4 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      345.17 (for 224 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
First of all, note that the order in which we flip the switches does not matter. 
And flipping a switch twice is obviously the same as not flipping it at all.
Thus all we need to do is to find the smallest set of switches we have to flip.
</p>

<p>
Consider the bulb in the lower right corner. There is only one switch that affects this bulb. 
If this bulb is currently off, we have to flip that switch.
</p>

<p>
Now consider the bulb to the left of it. There are only two switches that affect it, and
for one of them we already decided whether to flip it or not. If the bulb is currently
off, we have to flip the other switch. 
</p>

<p>
We can continue in this way until we set all the switches in the bottom row correctly.
Now we can move on to the next row (again, starting from the right), and so on,
until we process the entire board.
</p>

<p>
Obviously, this process will always lead to all bulbs being on at the end. 
Also, all the flips we made were necessary -- if we omit any of them, we can find
a bulb that won't be on. Thus their count is optimal.
</p>

<p>
A straightforward implementation of this approach leads to the following 
O(R<sup>2</sup>C<sup>2</sup>) algorithm:
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font> solveSlow(String[] B) {
  <font color="navy">int</font> R = B.length, C = B[<font color="red">0</font>].length();
  <font color="navy">boolean</font>[][] on = <font color="navy">new</font> <font color="navy">boolean</font>[R][C];
  <font color="navy">for</font> (<font color="navy">int</font> r=<font color="red">0</font>; r&lt;R; r++) <font color="navy">for</font> (<font color="navy">int</font> c=<font color="red">0</font>; c&lt;C; c++) on[r][c] = (B[r].charAt(c)==<font color="red">'1'</font>);
  <font color="navy">int</font> res = <font color="red">0</font>;
  <font color="navy">for</font> (<font color="navy">int</font> r=R-<font color="red">1</font>; r&gt;=<font color="red">0</font>; r--) <font color="navy">for</font> (<font color="navy">int</font> c=C-<font color="red">1</font>; c&gt;=<font color="red">0</font>; c--) <font color="navy">if</font> (!on[r][c]) {
    <font color="darkgreen">// if this bulb is off, we have to flip the corresponding rectangle</font>
    <font color="navy">for</font> (<font color="navy">int</font> x=<font color="red">0</font>; x&lt;=r; x++) <font color="navy">for</font> (<font color="navy">int</font> y=<font color="red">0</font>; y&lt;=c; y++) on[x][y] = !on[x][y];
    res++;
  }
  <font color="navy">return</font> res;
}
</pre>

<h4>Exercises</h4>

<ul>
<li>2.1 There is an O(RC) algorithm for this task. Find one.
<li>2.2 Is it possible to design a real board with bulbs and switches that would behave like the one 
  in the problem statement? How/why?
<li>2.3 Write a formal proof of the statement "for each final state of the board there is exactly one
combination of switches that produces it".
</ul>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8245&amp;rd=10936" name="8245">JumpingBoard</a></b> 

</font> 

<A href="Javascript:openProblemRating(8245)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516065" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

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

      192 / 625 (30.72%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      33 / 192 (17.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>kemo</b> for 796.92 points (10 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      544.97 (for 33 correct submissions) 

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

      495 / 523 (94.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      174 / 495 (35.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>bmerry</b> for 243.16 points (4 mins 47 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      178.54 (for 174 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
We'll start with one definition: Let C be a cell that contains a number.
If it is allowed to move the token from C to some other cell D, we will
call D the child of C.
</p>

<h4>A slower solution</h4>

<p>
One possible way of approaching the problem is almost deceptively simple.
Given a cell, what is the maximum number of moves
we can make starting in this cell? If the cell is a hole (or outside the board),
the answer is clearly zero. If it is a number, the answer is one larger than
the maximum of the answers for its children.
</p>

<p>
Of course, the board may contain cycles. In that case, if we can reach a cycle
from a cell, the answer for this cell will be &infin;.
</p>

<p>
One way how to solve the task was simply to iterate through all the cells, and
for each of them check whether we can already compute the answer. 
Repeat this process until you encounter an iteration where you can compute
no new information. At this moment you can safely conclude that for all
cells that are still unknown the answer is &infin;.
</p>

<p>
(A sketch of a proof why this really works: Prove by induction that if an answer
for a cell is a finite integer X, then you will compute this in the X-th iteration
or earlier. The induction step works because all children of this cell must have
finite answers that are less than X.)
</p>

<pre style="color: #9c0000;">
String[] B; <font color="darkgreen">// the board</font>
<font color="navy">int</font> R,C;    <font color="darkgreen">// the number of rows and cols on the board</font>
<font color="navy">int</font>[] dr={-<font color="red">1</font>,<font color="red">1</font>,<font color="red">0</font>,<font color="red">0</font>}, dc={<font color="red">0</font>,<font color="red">0</font>,-<font color="red">1</font>,<font color="red">1</font>};

<font color="navy">int</font> solveUsingIterations() {
  <font color="darkgreen">// initialize best to 0 for holes / -1 for unknown</font>
  <font color="navy">int</font>[][] best = <font color="navy">new</font> <font color="navy">int</font>[R][C];
  <font color="navy">for</font> (<font color="navy">int</font> r=<font color="red">0</font>; r&lt;R; r++) <font color="navy">for</font> (<font color="navy">int</font> c=<font color="red">0</font>; c&lt;C; c++)
    <font color="navy">if</font> (B[r].charAt(c)==<font color="red">'H'</font>) best[r][c]=<font color="red">0</font>; <font color="navy">else</font> best[r][c]=-<font color="red">1</font>;

  <font color="navy">for</font> (<font color="navy">int</font> loop=<font color="red">0</font>; loop&lt;R*C+<font color="red">10</font>; loop++) {
    <font color="darkgreen">// iterate through the board and try to compute new information</font>
    <font color="navy">for</font> (<font color="navy">int</font> r=<font color="red">0</font>; r&lt;R; r++) <font color="navy">for</font> (<font color="navy">int</font> c=<font color="red">0</font>; c&lt;C; c++) {
      <font color="navy">if</font> (best[r][c]&gt;=<font color="red">0</font>) <font color="navy">continue</font>;
      <font color="navy">int</font> mx=<font color="red">0</font>, ok=<font color="red">1</font>, jumpLength=B[r].charAt(c)-<font color="red">48</font>;
      <font color="navy">for</font> (<font color="navy">int</font> d=<font color="red">0</font>; d&lt;<font color="red">4</font>; d++) {
        <font color="navy">int</font> nr=r+jumpLength*dr[d], nc=c+jumpLength*dc[d];
        <font color="navy">if</font> (nr&lt;<font color="red">0</font> || nr&gt;=R || nc&lt;<font color="red">0</font> || nc&gt;=C) {
          mx = Math.max(mx,<font color="red">1</font>);
        } <font color="navy">else</font> {
          <font color="navy">if</font> (B[nr].charAt(nc)==<font color="red">'H'</font>) {
            mx = Math.max(mx,<font color="red">1</font>);
          } <font color="navy">else</font> {
            <font color="navy">if</font> (best[nr][nc]==-<font color="red">1</font>) ok=<font color="red">0</font>; <font color="navy">else</font> mx = Math.max(mx,best[nr][nc]+<font color="red">1</font>);
          }
        }
      }
      <font color="navy">if</font> (ok==<font color="red">1</font>) best[r][c]=mx;
    }
  }
  <font color="navy">return</font> best[<font color="red">0</font>][<font color="red">0</font>];
}
</pre>

<p>
Note that in our code we use a fixed number of iterations. We can do this because no
finite answer can be larger than RC -- any path without cycles can only visit each
of the cells at most once. 
</p>

<p>
The time complexity of this solution is O(R<sup>2</sup>C<sup>2</sup>).
</p>

<h4>A faster solution</h4>

<p>
Instead of applying the "one plus maximum of answers for all children" formula 
on all cells over and over again, we can try to compute it only for the cells where
it really matters. 
</p>

<p>
We can easily rewrite the formula into a recursive solution:
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font> getResult(<font color="navy">int</font> r, <font color="navy">int</font> c) {
  <font color="navy">if</font> (r&lt;<font color="red">0</font> || r&gt;=R || c&lt;<font color="red">0</font> || c&gt;=C) <font color="navy">return</font> <font color="red">0</font>;
  <font color="navy">int</font> res = <font color="red">0</font>;
  <font color="navy">int</font> jumpLength=B[r].charAt(c)-<font color="red">48</font>;
  <font color="navy">for</font> (<font color="navy">int</font> d=<font color="red">0</font>; d&lt;<font color="red">4</font>; d++)
    res = Math.max(res, <font color="red">1</font>+getResult( r+jumpLength*dr[d], c+jumpLength*dc[d] ) );
  <font color="navy">return</font> res;
}
</pre>

<p>
This code still has two problems. The first problem is that it tries all possible
paths. For inputs like the one below the number of paths grows exponentially
when we increase the input size. This would cause the solution to exceed the time
limit.
</p>

<pre style="color: #9c0000;">
12H12H12H12H12H
2H12H12H12H12H1
H12H12H12H12H12
12H12H12H12H12H
2H12H12H12H12H1
H12H12H12H12H12
</pre>

<p>
This illness can be cured using simple memoization: Once we compute an answer,
store it and never recompute it again.
</p>

<p>
The other problem is that the input may contain cycles.
In that case our code would fail as well (either with a timeout, or with an
incorrect answer, depending on exactly when we change the memoized value).
To handle cycles correctly, we have to be able to detect them. Once we detect
a cycle, we can immediately return -1.
</p>

<p>
Plenty of failed solutions show that detecting cycles is not as easy as
it might seem. For example, many solutions fail on the following case:
</p>

<pre style="color: #9c0000;">
3HH5HHHHHH
HHHHHHHHHH
HHHHHHHHHH
5HH4H2H8HH
HHHHHHHHHH
HHH2HHHHHH
</pre>

<p>
The reason why the solutions failed is that there are two different ways
how to reach the cell with the number 4 -- and the failed solutions
just noted "I already discovered this cell" and incorrectly assumed that
they found a cycle.
</p>

<p>
The correct reasoning is a bit different: we found a cycle if and only if
we are making a move from a cell C to some other cell we used on the way
to C. How to implement this check? 
When you enter a cell for 
the first time, set its state to "being processed". Once you try to enter
such a cell for the second time, you just discovered a cycle. 
When you finished processing the cell (and everything that is reachable
from the cell), change its state from "being processed" to "done", 
and store the answer for this cell.
</p>

<p>
(Again, a sketch of a proof why this works: If there are no reachable cycles, the 
situation above clearly can't happen. If there are reachable cycles, sooner or later
it will happen that we visit the last cell of one of the cycles. At this moment,
all of the cycle's cells are marked as "being processed", and when processing the children
of the current cell you will discover this cycle.)
</p>

<p>
The code with both fixes (memoization and cycle detection) follows:
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font>[][] memo;

<font color="navy">int</font> getResult(<font color="navy">int</font> r, <font color="navy">int</font> c) {
  <font color="navy">if</font> (r&lt;<font color="red">0</font> || r&gt;=R || c&lt;<font color="red">0</font> || c&gt;=C) <font color="navy">return</font> <font color="red">0</font>;
  <font color="navy">if</font> (memo[r][c] &gt;= <font color="red">0</font>) <font color="navy">return</font> memo[r][c];
  <font color="navy">if</font> (memo[r][c]==-<font color="red">2</font>) <font color="navy">return</font> <font color="red">987654321</font>; <font color="darkgreen">// we found a cycle, return infinity</font>
  memo[r][c]=-<font color="red">2</font>; <font color="darkgreen">// set the cell to &quot;being processed&quot;</font>
  <font color="navy">int</font> res = <font color="red">0</font>;
  <font color="navy">int</font> jumpLength=B[r].charAt(c)-<font color="red">48</font>;
  <font color="navy">for</font> (<font color="navy">int</font> d=<font color="red">0</font>; d&lt;<font color="red">4</font>; d++)
    res = Math.max(res, <font color="red">1</font>+getResult( r+jumpLength*dr[d], c+jumpLength*dc[d] ) );
  memo[r][c] = res;
  <font color="navy">return</font> res;
}

<font color="navy">int</font> solveRecursively() {
  memo = <font color="navy">new</font> <font color="navy">int</font>[R][C];
  <font color="navy">for</font> (<font color="navy">int</font> r=<font color="red">0</font>; r&lt;R; r++) <font color="navy">for</font> (<font color="navy">int</font> c=<font color="red">0</font>; c&lt;C; c++)
    <font color="navy">if</font> (B[r].charAt(c)==<font color="red">'H'</font>) memo[r][c]=<font color="red">0</font>; <font color="navy">else</font> memo[r][c]=-<font color="red">1</font>;
  <font color="navy">int</font> x = getResult(<font color="red">0</font>,<font color="red">0</font>);
  <font color="navy">if</font> (x &gt; <font color="red">900000000</font>) <font color="navy">return</font> -<font color="red">1</font>;
  <font color="navy">return</font> x;
}
</pre>

<p>
The time complexity of this solution is O(RC).
</p>

<h4>Exercises</h4>

<ul>
<li>3.1 How would the problem change if you were allowed to pick the starting cell?
Is it still possible to solve it in O(RC)?
<li>3.2 How large can the answer be? The largest test case I used in the systests
had the answer 1057, but there is clearly plenty of space for improvement.
<li>3.3 Explain how is depth-first search on a directed graph related to 
our second solution. 
</ul>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8249&amp;rd=10936" name="8249">PolylineUnion</a></b> 

</font> 

<A href="Javascript:openProblemRating(8249)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516065" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      254 / 523 (48.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      80 / 254 (31.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>bmerry</b> for 442.58 points (10 mins 30 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      277.29 (for 80 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
A high-level idea of the solution should be pretty clear: 
For each pair of polylines,
find out whether they intersect. Build a graph where the vertices correspond to
polylines, and edges mean that the polylines have a point in common. The 
answer is the number of components of this graph.
</p>

<p>
We'll start with the last part. The input can contain at most 625 polylines
(each consisting of a single point). This means that the O(N<sup>3</sup>)
Floyd-Warshall algorithm will be pretty close to the time limit. As a contestant
in C++ I would go for Floyd-Warshall without hesitation, but for the reference
solution I implemented an O(N<sup>2</sup>) breadth-first search instead:
</p>

<pre style="color: #9c0000;">
<font color="navy">int</font> countComponents(<font color="navy">boolean</font>[][] G) {
  <font color="navy">int</font> N = G.length;
  <font color="navy">boolean</font>[] used = <font color="navy">new</font> <font color="navy">boolean</font>[N]; <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N; i++) used[i]=<font color="red">false</font>;
  <font color="navy">int</font>[] Q = <font color="navy">new</font> <font color="navy">int</font>[N+<font color="red">10</font>];
  <font color="navy">int</font> qs=<font color="red">0</font>, qf=<font color="red">0</font>;
  <font color="navy">int</font> res = <font color="red">0</font>;
  <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;N; i++) <font color="navy">if</font> (!used[i]) {
    res++;
    qs=<font color="red">0</font>; qf=<font color="red">1</font>; Q[<font color="red">0</font>]=i; used[i]=<font color="red">true</font>;
    <font color="navy">while</font> (qs&lt;qf) {
      <font color="navy">int</font> k = Q[qs++];
      <font color="navy">for</font> (<font color="navy">int</font> j=<font color="red">0</font>; j&lt;N; j++) <font color="navy">if</font> (G[k][j]) <font color="navy">if</font> (!used[j]) {
        Q[qf++]=j;
        used[j]=<font color="red">true</font>;
      }
    }
  }
  <font color="navy">return</font> res;
}
</pre>

<p>
How to check whether two polylines intersect? This can again be broken down to a simpler
problem: check whether two (possibly degenerate) line segments intersect. To check
whether two polylines intersect, simply iterate over each polyline's segments:
</p>

<pre style="color: #9c0000;">
<font color="navy">boolean</font> polylinesIntersect(<font color="navy">int</font> x, <font color="navy">int</font> y) {
  <font color="navy">for</font> (<font color="navy">int</font> i=<font color="red">0</font>; i&lt;len[x]; i++) <font color="navy">for</font> (<font color="navy">int</font> j=<font color="red">0</font>; j&lt;len[y]; j++) {
    <font color="navy">int</font> ii=i+<font color="red">1</font>, jj=j+<font color="red">1</font>;
    <font color="navy">if</font> (ii==len[x]) ii--; <font color="navy">if</font> (jj==len[y]) jj--;
    <font color="navy">if</font> (segmentsIntersect(x,i,ii,y,j,jj)) <font color="navy">return</font> <font color="red">true</font>;
  }
  <font color="navy">return</font> <font color="red">false</font>;
}
</pre>

<p>
Note that our code transparently handles polylines consisting of a single point 
by duplicating the last point of each polyline.
</p>

<p>
Checking whether two line segments AB and CD intersect is a pretty standard task.
One possible way is to start by checking whether one of the endpoints lies on
the other segment. If this is true, return true. Otherwise the segments can
only intersect in an inner point. This happens if and only if (A and B lie on
different sides of CD, and C and D lie on different sides of AB).
Using vector operations both checks can be implemented in such a way that they 
work for degenerate cases as well.
</p>

<h4>Exercises</h4>

<ul>
<li>4.1 Show how to answer the question "do points A and B lie strictly on different sides 
of the line CD" using vector products only. Your method should return false if C=D.
<li>4.2 Show how to answer the question "does point A lie on the segment BC"
using vector and scalar products only.
<li>4.3 What is the maximum number of intersections one can get for a valid input?
</ul>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8247&amp;rd=10936" name="8247">BinaryCodes</a></b> 

</font> 

<A href="Javascript:openProblemRating(8247)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516065" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      18 / 523 (3.44%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 18 (5.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>cnettel</b> for 557.23 points (31 mins 7 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      557.23 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem can be approached in several ways. In this editorial we will describe
the idea that was implemented as the reference solution, and the thought process 
used to design it. It is not the simplest solution possible, but it contains
a lot of insight into the problem, and a theoretical upper bound that guarantees
it to pass system tests.
</p>

<p>
First of all, we'll explain one issue that's not really related to the actual
problem: there is no difference between an <em>ambiguous</em> and a <em>really
ambiguous</em> code. This is because if a code is ambiguous, there is a string
S that has at least two decodings. But then the string SS (two copies of S, one
after another) has at least four decodings, and thus the code is really ambiguous.
Of course, the <em>shortest</em> counterexample does not have to be of this form.
</p>

<p>
We will explain the ideas behind our solution both theoretically, and on the
following example code:
</p>

<pre style="color: #9c0000;">
{"110010","10","1100","110","0101010","001","001110","001001110"}
</pre>

<p>
This code is (really) ambiguous. One possible proof is that 
the string <code style="color: #9c0000;">1100101010</code> has these three decodings:
</p>

<pre style="color: #9c0000;">
1100101010 = 110010 + 10 + 10 
           = 1100 + 10 + 10 + 10 
           = 110 + 0101010
</pre>

<p>
In the rest of the text, the term <em>code words</em> will mean
the elements of the input array <code style="color: #9c0000;">code</code>. 
We will use the term <em>string</em> to denote a concatenation
of some code words. 
In our solution we will try to assemble some string from
the given code words in three different ways.
</p>

<h4>Basic observations</h4>

<p><em>
Warning. This section deliberately ignores one issue. 
Don't worry, everything
will be handled in detail later.
</em></p>

<p>
Given a code, how can we find a proof that it is really ambiguous? 
We have to create some string in three different ways.
We can start by picking three
code words we will start with. In the example above, these would be
<code style="color: #9c0000;">110010</code> for the first way, <code style="color: #9c0000;">1100</code> for the second
and <code style="color: #9c0000;">110</code> for the third way. 
</p>

<p>
Note that we can not just choose any three code words. It only makes sense
to choose code words such that all of them are prefixes of the longest one
we choose -- otherwise the constructed strings can not be equal. 
</p>

<p>
Now, imagine a graph where the vertices have the form 
(string1, string2, string3).
For example, the situation after picking the initial code words 
in the example above would correspond to the vertex
<code style="color: #9c0000;">(110010,1100,110)</code>.
</p>

<p>
The edges in this graph will be directed, and they will correspond
to adding a code word to one of the three strings.
In our example, adding the code word <code style="color: #9c0000;">10</code>
to the first string would take us to the vertex
<code style="color: #9c0000;">(11001010,1100,110)</code>.
</p>

<p>
Clearly, the code is ambiguous if and only if we can reach
a vertex with three equal strings. This brings us to the 
idea of our first attempt at a solution.
</p>

<h4>First attempt at a solution</h4>

<p>
One thing our graph is still missing is a way how to find
the <em>shortest</em> counterexample. But this can easily
be solved: our solution will process the vertices ordered
by the length of the longest of the three strings.
If we do it this way, once we find a vertex with three
equal strings, we can be sure that no other vertex will
correspond to a better solution.
</p>

<p>
A different way of looking at the algorithm: 
we will add edge lengths. The length of an edge will
represent the increase in the length of the longest
string. For example, the edge from
<code style="color: #9c0000;">(110010,1100,110)</code> to
<code style="color: #9c0000;">(11001010,1100,110)</code> will have length 2,
the edge from <code style="color: #9c0000;">(110010,1100,110)</code> to
<code style="color: #9c0000;">(110010,110010,110)</code> will have length 0.
In this graph the answer to our original question
is simply the length of the shortest path to a
vertex of the form <code style="color: #9c0000;">(S,S,S)</code>.
And our algorithm is suddenly nothing else but a
plain Dijkstra's shortest path algorithm.
</p>

<p>
Still, we have a long way to go. For example, our graph has infinitely 
many states, and we still can not tell when to stop looking
and decide that the code is not ambiguous.
</p>

<h4>Smaller states</h4>

<p>
Note that it makes no sense to store three strings in the state,
as two of them are always prefixes of the third one. We can simply
store the longest string, and the number of letters missing in
the second and the third string.
</p>

<p>
For example, the state <code style="color: #9c0000;">(110010,1100,110)</code> 
will change to <code style="color: #9c0000;">(110010,2,3)</code>.
</p>

<h4>"Less" states</h4>

<p>
Now the insight with Dijkstra's algorithm will start to matter.
We will now merge some states together. 
We are trying to answer questions of the form:
"What is the shortest way of extending these three strings
to get the same final string?".
The important observation is that the answer to such a question
does not depend on the part that all three strings have in common.
</p>

<p>
For example, if it is possible to reach a final vertex from <code style="color: #9c0000;">(110010,1100,110)</code>,
then it is also possible to reach a final vertex
from <code style="color: #9c0000;">(010,0,)</code> -- by adding the same code words.
</p>

<p>
Of course, the graph would still remain infinite. 
For now, just keep this optimization in mind, we will use it later,
when it will make more sense.
</p>

<h4>Getting a finite graph</h4>

<p>
The next thing we should notice is that making
a move like <code style="color: #9c0000;">(110010,1100,110)</code> to
<code style="color: #9c0000;">(11001010,1100,110)</code> is pretty much 
pointless. If we are in a "wrong" vertex that does
not lead to a solution, we can discover it earlier
by trying (and failing) to extend the shorter strings.
If we are in a "right" vertex, we can still gain
something by only trying to extend the shorter strings
-- we'll only try the possibilities that make sense
at the moment.
</p>

<p>
So much for intuition, and now a formal conclusion.
From now on, in our solution we will only try to
extend the shortest of the three strings. 
</p>

<p>
Clearly, we lost nothing -- every final vertex that was
reachable before will still be reachable (only the
number of ways how to reach it decreased).
</p>

<p>
On the other hand, did we gain something? 
We will show that we did.
If we use our new approach, the three strings
will always have similar lengths. But this means
that our optimization from the previous section
could really help. We will now prove this.
</p>

<p>
Theorem: Suppose that we use the strategy that
always extends the shortest string. Then the difference
between the longest and the shortest string is always
a suffix of some code word.
</p>

<p>
Proof: After picking the initial code words this
is clearly true. Now suppose that we are in a vertex where
it is true, and we extend the shortest string using some
code word C. There are two possibilities: Either the
extended string is now the longest one, or not.
Refer to the ASCII art below.
In the first case, the difference is now a suffix of C,
in the second case, it is still the suffix of the same
code word as before.
</p>

<pre style="color: #9c0000;">
Case 1:
|----string-1--|-last-word-|
|----string-2------|
|----string-3----|-----C--------|
                   |-difference-|
</pre>

<pre style="color: #9c0000;">
Case 2:
|----string-1--|-last-word-|
|----string-2------|
|----string-3----|--C--|
                   |-diff.-|
</pre>

<p>
The conclusion: each state of our search can be represented by
three small integers: the index of the code word at the end
of the longest string, and two offsets stating how many letters
are missing in the second and the third string.
</p>

<h4>A longer example</h4>

<p>
We will now show the entire path that corresponds to our well known
example. For reference, we now repeat the code words, this time
with their indices.
</p>

<pre style="color: #9c0000;">
{#0: "110010",  #1:"10",   #2: "1100",   #3: "110",
 #4: "0101010", #5: "001", #6: "001110", #7: "001001110"}
</pre>

<p>
Path in the original graph:
</p>

<pre style="color: #9c0000;">
start
-> 
(110010,1100,110) 
-> 
(110010,1100,1100101010)
->
(110010,110010,1100101010)
-> (four more steps where we add 10)
(1100101010,1100101010,1100101010)
</pre>

<p>
Path in the compressed graph:
</p>

<pre style="color: #9c0000;">
start
->                     [edge cost 6]
(#0,2,3)
->                     [edge cost 4]
(#7,4,6)
->                     [edge cost 0]
(#7,4,4)
-> (four more steps where we add 10)
(#7,0,0)
</pre>

<h4>Fixing what we ignored so far</h4>

<p>
The observations made so far would be sufficient to implement a solution...
except that we ignored an important detail. The detail is that in the optimal
solution two of the three strings may start with the same code word. 
In our example code, notice the following solution:
</p>

<pre style="color: #9c0000;">
001001110 = 001 + 001 + 110 
          = 001 + 001110 
          = 001001110
</pre>

<p>
The problem is that if we are in the state where two strings
are equal (e.g. <code style="color: #9c0000;">(001001110,001,001)</code>),
we have to know whether the two equal strings were constructed
in the same way or not.
</p>

<h4>Summary: a complete solution</h4>

<p>
Suppose that there are W code words, each with at most N characters.
We will build a graph with 3WN<sup>2</sup> vertices. Each vertex
is an ordered quadruple (code word index, offset1, offset2, situation type).
There can be three situation types:
</p>

<ul>
<li>type 0: all three strings are constructed in different ways
<li>type 1: the two longer or equal strings are constructed in the same way
<li>type 2: the two strictly shorter strings are constructed in the same way
</ul>

<p>
In the beginning, brute force over all pairs and triplets of initial code
words and fill the priority queue. From now on, repeat: pop a vertex from the queue,
try all ways how to extend the shortest code word, whenever you improve
the shortest path to some vertex, insert it into the priority queue.
Once you pop a final vertex (one where both offsets and situation type are zero),
return its distance. Once the queue is empty, you know that the code is
not ambiguous, and you can return -1.
</p>

<p>
Note that in situation 2 we have two ways how to extend: Either extend both 
strings using the same code word (and remain in situation 2 or 1), or use two
different code words to get to situation 0.
</p>

<h4>Exercises</h4>

<ul>
<li>5.1 Derive close asymptotic bounds for the number of edges in our graph
and for the time complexity of our algorithm.
<li>5.2 Given a non-ambiguous binary code, how efficiently can you decode strings of zeros and ones?
How does the situation improve if the code is a prefix code?
</ul>

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
