<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="summary"/>
    <jsp:param name="tabLev3" value="room2"/>
    </jsp:include>


        <h2>Algorithm Competition Room 2 Summary</h2>
        
        <div class="sub_content">
            <p><img src="/i/m/ivan_metelsky_big.jpg" alt="ivan_metelsky" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Tuesday, May 13, 2008<br />Introduction by <tc-webtag:handle coderId="10481120" context="algorithm" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521199" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>vlad89 wins Room 2!</h3>
            <br />
            <p style="float:right; width:200px; height:350px; margin-left:10px;"><img src="/i/tournament/tco08/shotR2.jpg" alt="vlad89 wins Room 2!" /></p>
            <p><strong>
The Algorithm Competition of TCO'08 continued with Semifinal Room 2. The actions started early as <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" /> submitted the Easy
for 243,28 points. Many other competitors followed closely
behind. Some time later <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" /> found a bug in his code and resubmitted to let the lead to
<tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" />, who quickly made his lead stronger by fast 500 submission. Poles
<tc-webtag:handle coderId="14886245" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" />
had also quite good times on the Medium soon after <tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" />. But the following 15 minutes without submission on 500 showed that the
Medium problem was not very easy. Still, it was not very hard, too, so more submissions on it were made and we saw 12 submissions by the end of coding phase.
</strong></p>

<p><strong>
Nobody was able to solve the Hard problem during the first 60 minutes. After that, we saw almost simultaneous submissions from
<tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" />, and
submission from <tc-webtag:handle coderId="22627586" context="algorithm" darkBG="true" /> followed
quite soon. Things became more interesting, when <tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /> resubmitted his Hard and lose the lead. And they became even more
interesting when submissions on 1000-pointer from <tc-webtag:handle coderId="15056181" context="algorithm" darkBG="true" />,
<tc-webtag:handle coderId="10597114" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="8472826" context="algorithm" darkBG="true" /> came in
moving <tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /> to 5-th place and making it possible the Wildcard duel between
<tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /> and <tc-webtag:handle coderId="144400" context="algorithm" darkBG="true" />.
</strong></p>

<p><strong>
During the challenge phase the leader changed 3 times. At the beginning it was <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" />, then
<tc-webtag:handle coderId="15056181" context="algorithm" darkBG="true" />, then <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" />, and again
<tc-webtag:handle coderId="15056181" context="algorithm" darkBG="true" />. There were totally 3 successful challenges on the Easy,
one on the Medium and 2 on the Hard. Systests didn't change the first three places, but were essential to determine the
Wildcard round advancers. <tc-webtag:handle coderId="15056181" context="algorithm" darkBG="true" /> won the room, <tc-webtag:handle coderId="8355516" context="algorithm" darkBG="true" /> took second
place and <tc-webtag:handle coderId="10574855" context="algorithm" darkBG="true" /> finished on third. <tc-webtag:handle coderId="14886245" context="algorithm" darkBG="true" />,
<tc-webtag:handle coderId="15881985" context="algorithm" darkBG="true" />, <tc-webtag:handle coderId="10597114" context="algorithm" darkBG="true" /> and
<tc-webtag:handle coderId="22627586" context="algorithm" darkBG="true" /> advanced to the Wildcard.
</strong></p>

<p><strong>Congratulations to all advancers and good luck in the next round!</strong></p>
            
            <br /><br />
            <p>by <tc-webtag:handle coderId="8357090" context="algorithm" darkBG="true" /></p>
            <h4>FairDiceGame</h4>
            <p>For this problem, there is a pretty obvious greedy strategy: 
We will construct the fair sequence of turns sequentially, turn after turn.
For each player X we will keep the probability q<sub>X</sub> that he already won.
Initially, these probabilities are all set to zero.
</p>

<p>
The probability of winning exactly in turn T is
p<sub>T</sub> = (5/6)<sup>T-1</sup> * (1/6).
<br/>
We will assign this turn to the first player X such that q<sub>X</sub>+p<sub>T</sub> &le;
1/playerCount.
</p>

<p>
There are two issues to consider. First, note that p<sub>1</sub>=1/6. If there are more than
six players, the player that takes the first turn will win the game with probability at least
1/6, which is more than 1/playerCount. Thus for more than six players there is no fair sequence
of turns.
</p>

<p>
Second, we need to convince ourselves that this greedy strategy actually works for 6 or less
players. What could go wrong? It could happen that after, say, 47 turns,
we would get a situation where all q<sub>X</sub> are approximately equal, and 
p<sub>48</sub> is larger than each of the values (1/playerCount)-q<sub>X</sub>.
In such a situation we would not be able to assign turn 48 to any of the players.
</p>

<p>
Luckily, this is not the case. To see why it is so, first note the following fact:
Suppose that the game just reached some turn T. With probability 1/6 the game will 
end in this turn, with probability 5/6 it will go on and end in some later turn.
Thus for each T the probability that the game has more than T turns is 5 times 
larger than the probability that the game has exactly T turns.
</p>

<p>
For each player X, let r<sub>X</sub> = (1/playerCount)-q<sub>X</sub>.
At any moment, the sum of all r<sub>X</sub> is exactly equal to the remaining, unassigned
probability.
</p>

<p>
As we noted above, in each turn we assign exactly 1/6 of the remaining probability 
to one of the players. However, we know that the remaining probability is equal to
the sum of all r<sub>X</sub>. And as there are at most 6 players, 
the largest r<sub>X</sub> is at least equal to 1/6 of the remaining probability.
Thus there is always at least one player who can take the next turn.
</p>

<p>
For the given limit on the number of turns, we can multiply all probabilities
by 6<sup>maximumTurn</sup>, and do all computations in exact, 64-bit integers.
However, the limits are so low that even a solution that uses doubles should 
be precise enough.
</p>

            <br />
            <p>by <tc-webtag:handle coderId="10481120" context="algorithm" darkBG="true" /></p>
            <h4>IsoscelesTriangle</h4>
            <p>
Without loss of generality we can assume that triangle's points must be located not in centers of rectangular grid cells, but in lattice points (x, y) such that 0 &le; x &lt; <b>N</b> and
0 &le; y &lt; <b>M</b>.
</p>
<p>
First of all, let's prove that we can't construct an <a target="_blank" href="http://en.wikipedia.org/wiki/Equilateral_triangle">equilateral triangle</a> with all its 3 vertices in
lattice points. Suppose, we're able to construct such triangle ABC. If d is the length
of triangle's side, then the triangle's area can be calculated as d<sup>2</sup> * sqrt(3) / 4. As d<sup>2</sup> is an integer, the area is irrational. From
the other view, we can calculate the area as half the absolute value of the cross product of vectors AB and AC (see "Cross product"
section of the <a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tutorials&amp;d2=geometry1">geometry tutorial</a> for clarification). From this way of calculation it follows
that the area is rational. Obviously, the same number can't be rational and irrational at the same time, so equilateral triangles are not possible.
</p>
<p>
The proven fact means that we can restrict ourselves to only triangles which are isosceles, but not equilateral.
Let ABC be an isosceles triangle with |AB| = |AC| = L. If vector AB has coordinates
(dx1, dy1) and vector AC has coordinates (dx2, dy2), then the equality dx1<sup>2</sup> + dy1<sup>2</sup> = dx2<sup>2</sup> + dy2<sup>2</sup> holds.
Assuming that <b>N</b> is the height of input grid and <b>M</b> is its width, there are the following obvious bounds for dx1, dx2, dy1, dy2: - (<b>N</b> - 1) &le; dx1, dx2 &le; <b>N</b> - 1,
- (<b>M</b> - 1) &le; dy1, dy2 &le; <b>M</b> - 1. We start our algorithm by iterating through the all possible values of dx and dy within these bounds and breaking all vectors (dx, dy)
into groups with constant value of dx<sup>2</sup> + dy<sup>2</sup>.
</p>
<p>
Now, obviously both vectors (dx1, dy1) and (dx2, dy2) must lie in the same group. So we iterate through all pairs of vectors (dx1, dy1) and (dx2, dy2) lying in the same group and for
each pair we need to determine the number of possible placements of point A such that the whole triangle ABC lies completely inside the given lattice grid. Suppose that A is placed at (x, y), then
B must be placed at (x + dx1, y + dy1) and C must be placed at (x + dx2, y + dy2). Let's write inequalities for all coordinates to ensure they all have allowed values:
</p>
<pre>
0 &le; x &le; <b>N</b> - 1,         0 &le; y &le; <b>M</b> - 1
0 &le; x + dx1 &le; <b>N</b> - 1    0 &le; y + dy1 &le; <b>M</b> - 1
0 &le; y + dx2 &le; <b>N</b> - 1    0 &le; y + dy2 &le; <b>M</b> - 1
</pre>
<p>Simplification of these inequalities gives:</p>
<pre>
minX = max(0, -dx1, -dx2) &le; x &le; min(<b>N</b> - 1, <b>N</b> - 1 - dx1, <b>N</b> - 1 - dx2) = maxX
minY = max(0, -dy1, -dy2) &le; y &le; max(<b>M</b> - 1, <b>M</b> - 1 - dy1, <b>M</b> - 1 - dy2) = maxY
</pre>
<p>Now it's not hard to see that there are totally (maxX - minX + 1) * (maxY - minY + 1) possible placements of point (x, y). To obtain the answer we need to sum this value for all
pairs of vectors (dx1, dy1) and (dx2, dy2). There's only one thing left which we must not forget. We should ignore pairs where dx1 = -dx2 and dy1 = -dy2. Each such
pair gives not a triangle, but three points lying on the same line.</p>
<p>Note that any equilateral triangle would be counted 3 times instead of 1 in the described method, but it doesn't really matter as we've already proved that equilateral triangles
are not possible.</p>
            

            <br />
            <p>by <tc-webtag:handle coderId="8357090" context="algorithm" darkBG="true"  darkBG="true" /></p>
            <h4>ColorfulBalls</h4>
            <p>If we denote the total number of balls as N, each state of the game can 
be represented as an integer partition of the number N. For example, 
if N=10, one possible partition is 1+1+3+5. This partition corresponds
to the state where there are balls of four colors, one color is represented
5 times, one 3 times, and the remaining two colors have one ball each.
Note that if we just need the expected number of turns, we don't care 
which color is which.
</p>

<p>
The number of partitions grows exponentially, but not too quickly.
For N=24 the total number of partitions is just 1575.
</p>

<p>
As with many similar problems that correspond to Markov processes, the 
expected number of turns can be computed for all the states at once
by solving a system of linear equations.
</p>

<p>
These equations can be computed in the following way: For example, consider
the state 1+4. There are 5*4=20 ways how the first turn can look like.
In 12 of these ways nothing happens (we draw two balls of color 2), in 4 we get
to the state with all colors equal, and in 4 we get to the state 2+3.
Thus for this state we get the equation:
</p>

<p>
turns(1+4) = 1 + ((12/20)*turns(1+4) + (4/20)*turns(5) + (4/20)*turns(2+3))
</p>

<p>
The problem with this approach is that we can not afford to use Gaussian
elimination to solve the entire system &ndash; there can be up to 1575
equations, and the time complexity of Gaussian elimination is Theta(equations<sup>3</sup>).
</p>

<p>
There are two ways out. One is a clever and optimized numeric solution, that computes
the probability distribution after a lot of steps. If you decide to go this way, you 
have to make sure that you don't do unnecessary work (e.g., for each state you should
pre-compute the list of reachable states), and make enough optimizations to ensure that
the number of steps you can afford to simulate within the time limit is sufficient 
to give the required precision.
</p>

<p>
The second, more pretty way out, needs one more observation: 
In each turn the number of colors (=elements in the partition) either
stays the same or decreases by 1. Thus we don't have to solve the entire system at once,
we can split its solution into smaller parts.
</p>

<p>
More precisely, we start by setting turns(N)=0. We can now solve a small system of equations
to compute all the values turns(a+b). Then another small system of equations to compute
all the values turns(a+b+c), and so on.
This way, the largest system of equations we will have to solve will have just 400 equations.
(This will happen for N=24 when 
computing the results for partitions into 7 elements from the results for partitions into 6 elements.)
</p>
            
            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
