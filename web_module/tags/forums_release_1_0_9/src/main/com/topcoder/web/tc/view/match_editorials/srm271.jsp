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
<tc-webtag:forumLink forumID="505785" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 271</span><br>Tuesday, November 8, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Division 1 saw a quite traditional match, with almost no challenge opportunities
and a quite hard 1000 point problem
only a few coders could get right. Apparrently, after the rules for the next TCO
were announced, tomek found new motivation to do well in the SRMs and he won
this one the way we remember him from the "old times" &ndash; with a solid time
on all three tasks. Petr took second and pparys third. The only other coder
to get the hard task right was ploh, but his failed medium placed him only fourth.
</p>

<p>
In Division 2, wshtb had the fastest time on the hard problem and won the match,
with olive in second, and X_X in the third place. The best newcomer was pytko.13,
he placed fifth with the help of the fastest time on the medium problem.
</p>

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4788&amp;rd=8068"
name="4788">CheckFunction</a></b>
</font>
<A href="Javascript:openProblemRating(4788)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505785"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      262 / 277 (94.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      261 / 262 (99.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>batman7</b> for 249.30 points (1 mins 30 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      229.73 (for 261 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
The best way to do problems like this one is to put all the constants from the
problem statement into constants in your program. In this case, we will make
a simple array that contains the number of dashes for each of the digits.
Then for each digit in <b>code</b> we look into this array and add the 
corresponding value to the result. C++ code follows:
</p>

<pre>
// a zero has 6 dashes, a one has 2 dashes, ...
int dashes[] = { 6, 2, 5, 5, 4, 5, 6, 3, 7, 6 };

int newFunction(string code) {
  int result = 0;
  for (unsigned int i=0; i&lt;code.size(); i++) 
    result += dashes[ code[i]-'0' ];
  return result;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4497&amp;rd=8068"
name="4497">BlackWhitePlane</a></b>

</font>
<A href="Javascript:openProblemRating(4497)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505785"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      136 / 277 (49.10%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      57 / 136 (41.91%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>pytko.13</b> for 457.00 points (17 mins 2 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      318.47 (for 57 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

The first part of this task is rather boring, we have to parse the input
to get the description of the circles.
</p>

<p>
If (in addition to the conditions in the problem statement) somebody told us 
the color of each of the circles, the task would be pretty simple: add the
areas of all white circles and subtract the areas of all black circles to get
the result.
</p>

<p>
(If you don't see this immediately, imagine the order in which the circles
are actually drawn and keep track of the total white area. Each time a white
circle is drawn, it is drawn on a completely black background, thus you add
its area to the total white area. Similarly, each time a black circle is drawn,
you subtract its area from the total white area. The final result of a summation
doesn't depend on the order in which we sum the elements.)
</p>

<p>
So all we have to do is to be able to tell the color of each of the circles.
How to do it? Fix a circle C. In the moment we are going to draw C, all larger
circles have already been drawn. If C lies in none of them, it will be white.
If it lies in one of them, it will be black. If it lies in two of them, the outer
one is white, the inner one is black, thus C has to be white again. And so on.
</p>

<p>
Thus the color of C depends on the parity of the number of circles that contain C.
Here we come to the last problem: How shall we check whether a circle Q contains
our circle C?

</p>

<p>
As the circles don't intersect each other, it is enough to check whether the centre
of C lies inside Q, in other words whether 
(X<sub>Q</sub>-X<sub>C</sub>)<sup>2</sup>
+ 
(Y<sub>Q</sub>-Y<sub>C</sub>)<sup>2</sup>

&lt;
R<sub>Q</sub><sup>2</sup>
</p>

<pre>
// count, centers and radii of the circles
int N, X[64], Y[64], R[64];

// check whether circle C is inside circle Q
int inside(int C, int Q) {
  int dx = X[Q] - X[C];
  int dy = Y[Q] - Y[C];
  return (dx*dx + dy*dy &lt; R[Q]*R[Q]);
}

double area(vector <string> circles) {
  double result = 0.0;

  // ... parse the input ...
  
  for (int i=0; i&lt;N; i++) {
    int containMe = 0;
    for (int j=0; j&lt;N; j++) if (R[j] &gt; R[i])
      if (inside(i,j))
        containMe++;
    double area = M_PI * R[i] * R[i];
    if (containMe%2 == 1) area = -area;
    result += area;
  }

  return result;
}

</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4518&amp;rd=8068"
name="4518">OneFight</a></b>
</font>
<A href="Javascript:openProblemRating(4518)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505785"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      58 / 277 (20.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      32 / 58 (55.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>wshtb</b> for 891.00 points (10 mins 11 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      606.81 (for 32 correct submissions)
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
      216 / 252 (85.71%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      205 / 216 (94.91%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nicka81</b> for 245.85 points (3 mins 42 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      181.21 (for 205 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Clearly it doesn't make sense to start killing monster A, stop after a few slashes,
go to kill monster B and at some later point return to finish monster A. If we start
by killing B and only then go after A, the total amount of damage we take will be less,
as B dies sooner. Thus we will surely kill the monsters one after another. The only 
problem left: in what order shall we do it?
</p>

<p>
As the easy Division 1 problems sometimes go, there were two ways of doing this:
one that required thinking and one that didn't. Let's start with the second one.
</p>

<p>
There are at most 10! = 3628800 permutations of the monsters (i.e., ways to order them). 
It is possible to check them all and select the best one. C++ code follows:
</p>

<pre>
int N = damage.size(); // N -- the count of monsters
int totalDamage = 0;
for (int j=0; j&lt;N; j++) totalDamage += damage[j];

vector&lt;int&gt; perm(N);
for (int i=0; i&lt;N; i++) perm[i] = i; // generate the first permutation

int result = 987654321;
do {
  int damageThisStep = totalDamage;
  int damageTaken = 0;
  for (int i=0; i&lt;N; i++) {
    int monsterToKill = perm[i];
    // ceiling(a/b) is computed as (a+b-1)/b using ints only
    int stepsNeeded = (life[ monsterToKill ] + yourDamage - 1) / yourDamage;
    damageTaken += steps * damageThisStep;
    damageThisStep -= damage[ monsterToKill ];
  }
  result = min( result, damageTaken );
} while (next_permutation(perm.begin(), perm.end() ));
return result+1;

</pre>

<p>
To find the efficient way of solving this task, first consider the case with two monsters,
the first one needing H1 hits to die and doing D1 damage each turn, the second one with parameters
H2 and D2.
</p>

<p>
If we kill monster 1 first, the total damage we take will be H1*(D1+D2) + H2*D2. 
If we kill monster 2 first, the total damage we take will be H2*(D1+D2) + H1*D1. 
Clearly we should start with the first monster if H1*D2 is less than (or equal to) H2*D1.
Or equivalently, if (H1/D1) &le; (H2/D2).
</p>

<p>
Now consider the general case. We claim that it is optimal to sort the monsters by
(Hi/Di) and kill them in this order. Proof: Consider any solution that's not sorted. 
Clearly we can find two consecutive monsters that don't obey the order. By swapping these
two monsters we can improve the solution &ndash; we will get less total damage from these two,
the amount of damage taken from the other monsters won't change. The conclusion: Any solution
that isn't sorted can be improved, and thus it isn't optimal. The only solution that can be optimal
(and therefore is optimal) is the sorted one.
</p>

<p>
When doing the sorting, it is good practice to avoid using real numbers. Instead of comparing
double(H1)/D1 and double(H2)/D2, compare H1*D2 and H2*D1. 
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4597&amp;rd=8068"
name="4597">GameEnding</a></b>
</font>
<A href="Javascript:openProblemRating(4597)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505785"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      138 / 252 (54.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      108 / 138 (78.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dkorduban</b> for 430.16 points (11 mins 51 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      288.29 (for 108 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
All we need to know here is a bit of combinatorial game theory. We will call
a position <i>winning</i> if the player that's going to make the next move
has a strategy that will guarantee him winning the game regardless of what his
opponent does. We will call all the other positions <i>losing</i>. (Note that
if a player is in a losing position, then his opponent has to have a winning
strategy.)
</p>

<p>
We can give a simple recursive definition of winning and losing positions:
</p>

<ul>
<li>All positions where the game is over are losing. (The player can't make
a valid move, therefore he loses the game immediately.)

<li>If all moves from a position lead to winning positions, the position is a losing one.
(If everything we do brings our opponent into a winning position, we will lose.)
<li>If there is a move that leads to a losing position (for the opponent), the current
position is winning (and this is a good move to make).
</ul>

<p>
We can rewrite this definition into a simple recursive procedure. Due to the 
constraints in the problem statement this solution was fast enough to solve all
valid inputs in time.
</p>

<pre>
int piece[10][2]; // locations of the pieces
int N, M; // the dimension of the board, the current number of pieces in play 

// check whether pieces i and j attack each other
int attacks(int i, int j) {
  int dx = abs(piece[i][0] - piece[j][0]);
  int dy = abs(piece[i][1] - piece[j][1]);
  if (dx == 0) return 1;
  if (dy == 0) return 1;
  if (dx == 2 &amp;&amp; dy == 1) return 1;
  if (dx == 1 &amp;&amp; dy == 2) return 1;
  return 0;
}

int playerOnMoveWins() {
  M++;
  // try all possible moves
  for (int i=0; i&lt;N; i++) 
    for (int j=0; j&lt;N; j++) {
      // add a new piece
      piece[M-1][0] = i;
      piece[M-1][1] = j;
      
      // check whether this is a valid move
      int ok=1;
      for (int k=0; k&lt;M-1; k++) if (attacks(k,M-1)) { ok=0; break; }
      if (!ok) continue;

      // if the move is valid, evaluate the new position recursively
      if (!playerOnMoveWins()) { 
        // we found a valid move
        
        M--; // don't forget things like this when leaving recursion!
             // (this is the bug I made in the SRM :P )
        return 1; 
      }
    }

  // no move will guarantee winning the game, we lose
  M--;
  return 0;
}

string result(int n, vector <string> moves) {
  // ... parse the input ...

  // check whether the input is valid
  for (int i=0; i&lt;M; i++) 
    for (int j=0; j&lt;i; j++)
      if (attacks(i,j)) 
        return "Invalid input";

  int winning = playerOnMoveWins();
  if ( moves.size()%2 == 1 ) winning = !winning;

  if (winning) return "First player wins";
  return "Second player wins";
}

</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4787&amp;rd=8068"
name="4787">ConvexHull</a></b>
</font>
<A href="Javascript:openProblemRating(4787)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505785"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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

      6 / 252 (2.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 6 (66.67%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ploh</b> for 558.18 points (31 mins 2 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      527.13 (for 4 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
First of all let's consider a simpler problem: 
Let P<sub>0</sub>, P<sub>1</sub>, ..., P<sub>k</sub> be
points determining a polyline such that:
</p>

<ul>
<li> All P<sub>i</sub> have integer coordinates [x<sub>i</sub>,y<sub>i</sub>].

<li> P<sub>0</sub>=[0,0], P<sub>k</sub>=[X,Y]
<li> for all i, x<sub>i</sub> &le; x<sub>i+1</sub> and y<sub>i</sub> &lt; y<sub>i+1</sub>

<li> for all i, the slope of the line P<sub>i</sub>-P<sub>i+1</sub> is less than the slope 
of the line P<sub>i+1</sub>-P<sub>i+2</sub>
</ul>

<p>
These conditions describe exactly those polylines that can be used as "one quarter of a convex
polygon". We will call them <i>boundary polylines</i>. We will be interesting in 
maximizing k, given X and Y. Let best[X][Y] be the largest number of points a 
boundary polyline from [0,0] to [X,Y] can have. We will show how to compute these
values.

</p>

<p>
Consider an arbitrary [X,Y]-boundary polyline. Let dx<sub>i</sub> = x<sub>i+1</sub> - x<sub>i</sub>,
dy<sub>i</sub> similarly. Let gcd(x,y) denote the greatest common divisor of the numbers x, y.
If for some i gcd(dx<sub>i</sub>,dy<sub>i</sub>)=d&gt;1, we can make this segment d times shorter,
thereby obtaining a [X',Y']-boundary polyline with the same number of points (and X'&le;X, Y'&lt;Y).

</p>

<p>
Thus each boundary polyline can be reduced into a shorter boundary polyline, that has the
same number of points and dx and dy for all its segments are relatively prime. We will call such
polylines <i>basic</i>.
</p>

<p>
On the other hand, any [X,Y]-boundary polyline can easily be extended to get a [X',Y']-boundary
polyline (with X'&ge;X, Y'&ge;Y) &ndash; just make the first segment longer and the last segment
taller.
</p>

<p>

What follows that best[X][Y] = number of points on the best basic [X',Y'] polyline for some 
X'&le;X, Y'&le; Y. (Clearly best[X][Y] can't be larger, because we can reduce the best polyline
to some basic one. On the other hand, the best basic polyline can be extended to get a valid
[X,Y]-polyline.)
</p>

<p>
Thus it is enough to generate basic boundary polylines. For each [X,Y] we will compute the maximum
number of points on a [X,Y]-basic boundary polyline. We will use dynamic programming to do this.
To make sure that the slope of line increases, we will process the possible vectors [dx,dy] in
increasing slope order, each time extending the currently best polylines by another segment.
</p>

<p>
Moreover, we can note that if sometimes we may decrease dx or dy of a segment of a polyline
without violating the slope condition. In that case, we get a shorter polyline with the same
number of points again. As a consequence, it can be shown that it is enough to consider basic 
polylines with segments having dx,dy&le;25. The proof is left as an exercise for the reader ;)
[Hint: consider the total dx and dy for all such vectors.]
</p>

<p>
The following code computes the array bestBasic[][], where bestBasic[X][Y] is the length
of the best basic [X,Y]-boundary polyline that can be assembled from the considered set
of vectors. We claim that for any [X,Y] an optimal boundary polyline can be constructed
by extending one of these polylines.

</p>

<pre>
typedef pair<int,int> PII;
vector<PII> V;

// generate vectors with relatively prime coordinates
for (int i=1; i&le;25; i++) 
  for (int j=1; j&le;i; j++) 
    if (__gcd(i,j)==1) {
      V.push_back(PII(i,j));
      if (i!=j) V.push_back(PII(j,i));
    }
V.push_back(PII(0,1));

// sort the vectors according to their slope
int VS = V.size();
for (int j=0; j&lt;VS; j++)
  for (int i=0; i&lt;j; i++)
    if (V[i].first * V[j].second &gt; V[j].first * V[i].second) 
      swap(V[i],V[j]);

// compute the best lengths of paths that use our vectors
int bestBasic[210][210];    
memset(bestBasic,0,sizeof(bestBasic));
    
bestBasic[0][0]=1;

for (int k=0; k&lt;VS; k++)
  for (int i=200; i&ge;0; i--)
    for (int j=200; j&ge;0; j--) {
      if (i &lt; V[k].first) continue;
      if (j &lt; V[k].second) continue;
      int q = bestBasic[ i-V[k].first ][ j-V[k].second ];
      if (q) best[i][j] &gt;?= q+1;
    }

</pre>

<p>
Now we simply compute the desired array best[][]:
</p>

<pre>
for (int i=0; i&le;200; i++)
  for (int j=0; j&le;200; j++) {
    best[i][j] = max(2, bestBasic[i][j]); // 2 is a straight line segment
    if (i==0 &amp;&amp; j==0) best[i][j] = 1;
    
    // either we already have the optimal solution,
    // or we get it by extending some other optimal solution
    if (i) best[i][j] &gt;?= best[i-1][j];
    if (j) best[i][j] &gt;?= best[i][j-1];
  }
}
</pre>

<p>

Now we are left with the final step: How to find the best polygon?
We will assemble it from four boundary polylines. Similarly as in the 
polyline case, an optimal polygon can always be extended to touch all
four sides of the rectangle. What we have to find are four points (one 
of each of the sides of the rectangle) that divide the boundary of the
polygon into four boundary lines.
</p>

<p>
There are too many possibilities to employ brute force, thus we will use 
dynamic programming. We will try all possibilities for the placement
of the first point P1. For each point P2 on the second side, compute the best 
number of points on a boundary polyline from P1 to P2. Then, for each point
P3 on the third side compute the best total number of points on a boundary
starting in P1, going through some P2 and ending in P3. Do the same for all
P4 on the fourth side and choose the possibility that (together with the 
optimal boundary polyline from P1 to P4) gives the maximal number of points.
</p>

<p>
An important "catch" in the problem was that sometimes it is useful to 
have a corner of the polygon in the corner of the rectangle. As example 2
in the problem statement claims, the best polygon for m=n=4 has got 9
vertices &ndash; and it is impossible to make it without placing one of its
vertices into the corner.
</p>

      <img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
