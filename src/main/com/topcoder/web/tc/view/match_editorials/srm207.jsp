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
<tc-webtag:forumLink forumID="505670" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 207</span><br>Tuesday, August 10, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In division 2, today, coders were faced with a relatively simple easy problem,
but many fell to a couple of special cases.  The medium problem involved sorting
of Strings based on a separate criteria, and proved to be a bit difficulty for
both divisions.  The division 2 hard problem was relatively typical, and turned
out to be a simpler version of the division 1 hard.  At the end of the
competition, KelvinYe won with the help of two challenges.  Not far behind was
csd98412, in second place, and rrenaud was a distant third.<br/><br/>
In division 1, coders were faced with an easier set than they were used to.
Though the string manipulation of the easy problem tripped many people up, the
medium problem required little more than standard brute force and the hard
problem, though tricky, was well within reach.  nicka81, despite losing his easy
problem, found two challenges which enabled him win comfortably.  Ryan was a
little less than 100 points behind in second, and kalinov was a close third.</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2928&amp;rd=5853" name="2928">TransportCounting</a></b>
</font>
<A href="Javascript:openProblemRating(2928)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505670" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      178 / 193 (92.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      125 / 178 (70.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>35C4P3</b> for 246.51 points (3 mins 23 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      206.17 (for 125 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
If a bus starts ahead of us, then we will pass it if and only if we end up ahead
of it or next to it after <b>time</b> minutes.  Since all of the speeds are
constant, there is no way for us to pass a bus but then end up behind it.  We
can calculate our final position as <b>speed</b>*<b>time</b>, and calculate each
of the buses final positions as
<b>velocity<sub>i</sub></b>*<b>time</b>+<b>position<sub>i</sub></b>.
<br/><br/>
There is, however, an exception to this rule.  If a bus starts at position 0, it
must be counted, regardless of its velocity.  Therefore, we must count a bus if
it ends at a position less than or equal to our end position, or if it starts at
position 0.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2866&amp;rd=5853" name="2866">RegularSeason</a></b>
</font>
<A href="Javascript:openProblemRating(2866)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505670" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      83 / 193 (43.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      45 / 83 (54.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mmoll</b> for 403.56 points (14 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      239.71 (for 45 correct submissions)
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
      163 / 170 (95.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      110 / 163 (67.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Yarin</b> for 234.83 points (7 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      165.54 (for 110 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first thing to do in this problem is to calculate the expected number of
wins for each team.  Some coders might have been a little scared of the math
here, but it's actually quite simple.  If a team has a 50% chance of winning a
game, then it is expected to win 0.5 games.  If it has a 50% chance of winning
one game, and a 20% chance of winning another game, then it is expected to win
0.5 + 0.2 = 0.7 games.  In other words, you just add up all of the
probabilities.  As the notes suggested, however, it isn't a good idea to add up
0.5 and 0.2 because you might end up a little bit off due to the inexactness of
floating point representation.  Instead, you should add up 50 and 20, and wait
until the end to divide by 100.<br/><br/>
Once you calculate how many games each team is expected to win, it is just a
matter of sorting.  To accomplish this, you could either write your own
comparator, and use the built in sorting functions of your favorite language, or
just implement your own simple O(n<sup>2</sup>) sorting algorithm.  Either way,
you needed to be careful to sort by the expected number of wins prior to
rounding, not the rounded values, and then you had to break ties alphabetically
by team name.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2915&amp;rd=5853" name="2915">CaptureThemAll</a></b>
</font>
<A href="Javascript:openProblemRating(2915)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505670" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      33 / 193 (17.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      14 / 33 (42.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>KelvinYe</b> for 821.78 points (13 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      643.95 (for 14 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Knight movement on a chessboard is a classic example of a search problem.  There
are a lot of different ways to solve it, but the two most well-known approaches
are the Breadth-First Search (BFS) and the Depth-First Search (DFS).  In most
cases, a BFS is faster and if you can afford the extra memory it requires, it is
generally preferable.  <br/><br/>
In a BFS, you typically maintain a First-In First-Out queue, which you
initialize to contain a single location - the starting point.  You also maintain
a mapping that keeps track of how far it is to each location.  Initially, you
set the distance to every point to infinity, except for the starting point,
whose distance you set to 0.  Then, you start removing locations from your
queue.  Each time you remove a location from the queue, you look at all of the
locations that can be reached from that location.  For each such location that has
a distance of infinity, you add that location to the queue and update its
distance.  Eventually, all of the reachable locations will have a distance
assigned to them, and the queue will be empty, at which point you are
done.<br/><br/>
In this problem, our mapping can be a simple 2D array, with an element for each
spot on the chessboard.  There are a lot of different ways to implement the
queue, but in problems like this I always like to use a 2D array for that as
well.  The queue array will have 64 rows, and 2 columns - one column for X, and
one for Y.  We will also have two integers, head and tail, telling us which row
is the head of the queue, and which one is the tail of the queue.  Initially, we
will set the first row of the queue to be our starting location, head to 0,
and tail to 1:
<pre>
    int distances[8][8];
    int queue[64][2];
    queue[0][0] = startX;
    queue[0][1] = startY;
    for (int i = 0; i&lt;8; i++){
        for (int j = 0; j&lt;8; j++){
            distances[i][j] = -1;//Using -1 for infinity
        }
    }
    distances[startX][startY] = 0;
    int head = 0;
    int tail = 1;
    while(tail &gt; head){
        int x = queue[head][0];
        int y = queue[head][1];
        head++;
        foreach ((x',y') reachable from (x,y)){
            if(distances[x'][y'] == -1){
                distances[x'][y'] = distances[x][y] + 1;
                queue[tail][0] = x';
                queue[tail][1] = y';
                tail++;
            }
        }
    }
</pre>
Now, we can calculate the distance from any location on the board to any other
location, so we figure out the distances from the knight's initial location to
both the rook and to the queen, as well as the distance from the rook to the
queen (which is equal to the distance from the queen to the rook).  With these
distances, we just consider the two possible orders in which we can capture the
two pieces, and return the minimum distance to get them both.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2894&amp;rd=5853" name="2894">TCSocks</a></b>
</font>
<A href="Javascript:openProblemRating(2894)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505670" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      80 / 170 (47.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      62 / 80 (77.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Yarin</b> for 393.46 points (15 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      275.34 (for 62 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
A quick glance at the constraints for this problem reveals that there are at
most 10 cities.  Since you have to start and finish at city 0, there are only 9!
possible routes you could take - few enough to consider them all.<br/><br/>
The first thing that I did was to parse the input into something more usable.  I
parsed <b>cost</b> and <b>time</b> into 2D int arrays, and then I made a new
2D array, prev, so I could quickly look up now many competing salesmen had
visited a city at a given time.  I set it up so that prev[i][j] told me how many
people had visited city j by time i, noting that I would never need to look up
times greater than about 100.<br/><br/>
Then, it was just a matter of implementing a brute force recursive algorithm.
The basic idea here is that the recursive function considers heading to each of
the cities that haven't been visited next:
<pre>
    recurse(boolean[] visited, int cur, int tm){
        int maxProfit = (money[cur]&gt;&gt;prev[tm][cur])-cost[cur][0];
        foreach (city i != 0){
            if(!visited[i]){
                visited[i] = true;
                int profit = recurse(visited,i,tm+time[cur][i]);
                maxProfit = max(maxProfit, profit + 
                            (money[i]&gt;&gt;prev[tm][cur]) - cost[cur][i]);
                visited[i] = false;
            }
        }
        return maxProfit;
    }
</pre>
Note that &gt;&gt; is the shift right operator, and does the same thing as
dividing by powers of 2.  As a challenge, try to implement an algorithm that
runs under the time limit even when there are 20 cities.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2926&amp;rd=5853" name="2926">GetThemAll</a></b>
</font>
<A href="Javascript:openProblemRating(2926)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505670" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      16 / 170 (9.41%)
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
      <b>nicka81</b> for 720.24 points (19 mins 21 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      569.29 (for 8 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is very similar to the medium in that it could also be solved using
a brute force approach.  In fact, it is an instance of the famous traveling
salesman problem, and can be solved similarly.  However, the difficulty here
lies in finding the distances between two locations in terms of knights moves.
Without any loss of generality, lets say that the knight starts at (0,0) and
must go to (x,y), where both x and y are positive.  We can establish a lower
bound on the number of moves by observing that we never move more than 2 at a
time, so it takes at least ceil(x/2) moves and at least ceil(y/2) moves.  Also,
we only move a total of 3 moves at a time, so it takes at least ceil((x+y)/3)
moves.  However, these are only approximations, and we'll need to be a bit more
clever to get the actual numbers.  Luckily, a mostly greedy approach will work.
We can use a greedy algorithm to get close to our destination, and then use a
BFS (as in the div 2 hard) to finish up in as few moves as possible.  This works
because when the knight is far away from its destination, it is easy to predict
the direction that most of its moves will be in.  For example, if the knight is
going to (247,201), we can approximate that about 2/3 of its moves will be in
the (+2,+1) direction, while 1/3 of its moves will be in the (+1,+2) direction.
There will be a few moves that are not in either of those directions, but not
very many, so we can figure them out with our BFS at the end.<br/><br/> Now,
there are a bunch of different approaches we can take to the greedy part of the
problem, and I'll only outline a couple of them.  The first is to always move in
the direction that takes us closest to the line between the two points.  This
approach follows the general principle that the shortest path between two points
is a straight line, but it requires a bit more work than a simpler approach with
a similar idea.  Here, we work backwards from (x,y), and always take the move
(-2,-1) or (-1,-2) that brings us closer to the diagonal x==y.  If we get to the
x or y axis while following this approach, we know that we can move 4*d along
the axis in 2*d moves.  Eventually, we will get reasonably close to the origin,
and then we use our BFS.  How close should we get before we switch to a BFS
though?  Switching to a BFS as soon as both coordinates get to be less than 30
will certainly work, and 10 will work also.  You could easily run your BFS all
the way out to 1000 or so though, if you were really nervous.<br/><br/>

Another approach is to consider a few special cases where the number of moves
required can be computed directly.  Let's say that y is greater than x.  We
could make <tt>floor(y/2)</tt> moves in the <tt>(+1,+2)</tt> direction and <tt>y
    mod 2</tt> moves in the <tt>(+2,+1)</tt> direction.  This will bring us an x
position of <tt>floor(y/2) + (y mod 2) * 2</tt>.  If this position is greater
than <tt>x</tt>, by <tt>g</tt> and <tt>g mod 2 == 0</tt>, then we can convert
<tt>g/2</tt> of the <tt>(+1,+2)</tt> moves into <tt>(-1,+2)</tt> moves, and we
would end up at the right place with a minimum number of moves.  Alternatively,
if <tt>floor(y/2) + (y mod 2) * 2</tt> is less than <tt>x</tt> by <tt>g</tt>,
and <tt>g mod 3 == 0</tt> we can convert <tt>g/3</tt> of the <tt>(+1,+2)</tt>
moves into <tt>(+2,+1)</tt> moves and then add <tt>g/3</tt> more
<tt>(+2,+1)</tt> moves.  This will increase <tt>x</tt> by <tt>g</tt> and keep
<tt>y</tt> the same.  By combining this closed form approach with a BFS, we can
figure out the distance between any two points in constant time.<br/><br/>
It turns out that, when the destination is far away, we can always get to one of
these special cases in at most one move.  From here, we can actually eliminate
the BFS portion of the code, as marian did in room 3 (though he looked up the
formula).  He failed only due to an input with no pieces, and though it isn't
obvious that his f() function will calculate the distance correctly, it does.
</p>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
