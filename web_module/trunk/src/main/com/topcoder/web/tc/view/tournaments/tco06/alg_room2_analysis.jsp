<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room2"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco06/onsite_photos/shot_room2.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p>
<span class="bigTitle">Eryx Wins Room 2</span>
<br><br>
<img src="/i/m/FogleBird_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<tc-webtag:forumLink forumID="505777" message="Discuss this match" /><br>
Thursday, October 13, 2006<br>
Introduction by <tc-webtag:handle coderId="160049" context="algorithm"/>
<br><br><br>
After an unfortunate power outage during the Room 1 portion of the finals, the Room 2 portion began as scheduled at 1 PM PST.  Eryx, the number one seed for the room, was the first to submit the 250-point problem for a score of 214.13 points.  This gave him a considerable lead as the next two to submit were nearly 40 points behind: dgarthur with 176.10 points and venco with 175.40.  Eventually, all but two competitors submitted the "easy" problem.  After tackling the 250, some coders attempted the hard while others went in order with the medium.  About half of them submitted the medium, changing up the rankings.  ardiankp had the highest submission score of 421.30 points while venco moved to first with a submission of 379.82.  Although quite a few compiled and tested the 1000, none was confident enough to submit.
<br><br>
The challenge phase proved quite eventful as many coders lost points on unsuccessful challenges.  Even natori, one well known for his many successful challenges, ended up losing 50 points with two bad challenge attempts.  In the end only two submissions failed due to challenges: venco's and ardiankp's 500-point submissions.
<br><br>
After system tests, the rankings didn't change too dramatically.  The top three remained in position: Eryx, daveagp, and John Dethridge.  The top two automatically advance to the final round while those in 3rd through 6th get a second chance in tomorrow's early wildcard round.
</p>

<h1>RingCount</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
We start with the outermost ring (of '.'s) and work our way in. At each new ring, we perform a flood fill to find all the characters of the same type that are connected orthogonally. As we do this, we assign all of the characters in each ring (where a ring may be '.'s or 'X's here) a number, counting from the outside in. If the bitmap is valid, then each character will be adjacent (both orthogonally and diagonally) to characters that have either the same number, a number one higher or a number one lower, since each character must be adjacent to characters in the same ring, the ring surrounding them, or the ring immediately inside them. If a character was adjacent to another character whose number differed by more than 1, then there would have to be a break in either the ring immediately outside of it, or immediately inside of it. So, the algorithm ends up being very simple: 
<pre>
 number = 1
 if(border is not '.'s)return -1
 for(i = 0 to sizeof(bitmap)-1)
     for(j = 0 to sizeof(bitmap[i])-1)
         if(!assigned[i][j])
             flood_fill(i,j,number++)

 for(i = 0 to sizeof(bitmap)-1)
     for(j = 0 to sizeof(bitmap[i])-1)
         for(di = -1 to 1)
             for(dj = -1 to 1)
                 if(i+di and j+dj are in range and
                         abs(assigned[i][j]-assigned[i+di][j+dj]) > 1)
                     return -1
 if(number % 2 == 1)return -1;//innermost ring is '.'s
 else return number/2
</pre>

<h1>AreaSplit</h1>
<p>
by <tc-webtag:handle coderId="310430" context="algorithm"/>
<br><br>
We will start by marking white all squares that have to be colored
(the positions of <b>board</b> with an '#'), and proceed with
coloring individual squares until we arrive to a solution.
</p>
<p>
Since the blue pattern is a shifted version of the red one,
each square in the red pattern has a corresponding blue square
that is at a distance (dx, dy) relative to the red one, for
some constant dx and dy. The main idea of the algorithm is
to iterate over all possible values of (dx, dy) and check if
a solution exists. If one is found (this will be unique, see
below), it has to be compared with previously found solutions
to resolve any tie-breakers.
</p>
<p>
First thing to notice is that if we can split the given
pattern into two half-patterns, it is not important which of
the two is colored red and which one blue. So we can begin
by coloring one random square red (i.e., the half-pattern, to
which this square ends up belonging, will be defined to be
the red one). The square of the blue pattern corresponding
to the square we just marked red will be any of the remaining
white squares, so we iterate over these squares and check
for a solution.
</p>
<p>
Until now we have marked one square red and one blue, corresponding
to the same position in their respective half-pattern, so that
we can deduce the distance (dx, dy) between the two half patterns.
For any square at a position (x, y) that we mark red, we have
to mark the square at position (x + dx, y + dy) blue, and for
any square at a position (x, y) that we mark blue, we have to
mark the square at position (x - dx, y - dy) red. Noticing this,
we can construct a solution by iterating over all remaining white
squares and checking if it is possible to mark this red
(i.e., the square at a distance (dx, dy) relative to this is also
white) or blue (i.e., the square at a distance (-dx, -dy) relative
to this is also white). If neither is possible for some square,
then we break, since a coloring with this (dx, dy) is not possible.
If exactly one of these (red/blue) is possible, then we mark this
one red/blue and the corresponding one blue/red, and continue with
another white square. If both of these (red/blue) are possible,
then we continue with another white square, and leave this for
later to check again.
</p>
<p>
Remains to show that this coloring procedure will eventually
terminate, i.e., if there is still a white square to check, there
will always be at least one square that can not be colored both
red and blue. In fact, if (x, y) is white, then there will be
a maximum n >= 0 with (x + n * dx, y + n * dy) being also white
and (x + (n + 1) * dx, y + (n + 1) * dy) not white. That means
that (x + n * dx, y + n * dy) can not be colored red, so this
will either lead the algorithm to a break (no pattern split
possible for this dx, dy), or reduce the number of white
squares by 2 (coloring this one blue and the corresponding
one red).

</p>
<p>
This also shows that if we check the white squares in order
(e.g. row by row, from left to right), we will always either
be able to color this or break this (dx, dy)-check with no
solution, making the coloring procedure efficient and
helping avoid timeouts (the reasoning for this is that either
(x+dx, y+dy) or (x-dx, y-dy) will be in a previous row or in
the same row further left, i.e., a square we have already painted).
</p>
<p>
When we have found a solution, we just need to crop the
leftmost/rightmost columns and the uppermost/lowermost
rows that do not contain any red square, and do the
tie-breaker checks described in the problem description
comparing this solution to the best solution found so
far, and in the end return the best found solution
(or an empty <tt>String[]</tt> if no solution was found).
</p>
<p>
The following pseudo-code describes the algorithm:
</p>
<pre>
String[] best = new String[0];  // The best solution found so far.
Set board[x0][y0] = 'R' for some arbitrary (x0, y0) with board[x0][y0] == '#'
Iterate over all (x,y) with board[x][y] = '#' {
    // deep copy board to a local variable
    String[] copy = board.clone();
    copy[x][y] = 'B';
    dx = x - x0;
    dy = y - y0;
    // do the following iteration in order, e.g. row by row, left to right
    Iterate over all (x1, y1) with copy[x1][y1] = '#' {
        boolean canBeRed = false;
        boolean canBeBlue = false;
        if (copy[x1 + dx][y1 + dy] == '#') {
            canBeRed = true;
        }
        if (copy[x1 - dx][y1 - dy] == '#') {
            canBeBlue = true;
        }
        if ((canBeRed == false) && (canBeBlue == false)) {
            continue with next (x,y);
        }
        if ((canBeRed == true) && (canBeBlue == false)) {
            copy[x1][y1] = 'R';
            copy[x1 + dx][y1 + dy] = 'B';
        if ((canBeRed == false) && (canBeBlue == true)) {
            copy[x1][y1] = 'B';
            copy[x1 - dx][y1 - dy] = 'R';
        }
        if ((canBeRed == true) && (canBeBlue == true)) {
            // this can not happen if we iterate (x1,y1) in order.
        }
    }
    Change every 'R' into an '#' and every 'B' into an '.' in copy.
    Crop copy to the smallest rectangle that contains all '#' characters.
    If best is not empty and has less columns than copy continue with next (x,y)
    If best is not empty, has the same width as copy but less rows continue with next (x,y)
    If best is not empty, has the same width and height as copy and comes earlier
        lexicographically than copy, continue with next (x,y)
    Set best = copy;
}
return best;

</pre>

<h1>RandomChoice</h1>
<p>
by <tc-webtag:handle coderId="310430" context="algorithm"/>
<br><br>
We first need to find sets of outcomes that have equal
probability of occuring. The probability of one specific
outcome is:
</p>
<pre>
probH(nHH, nHT, nTH, nTT) = pH * (pHH ^ nHH) * (pHT ^ nHT) * (pTH ^ nTH) * (pTT ^ nTT)
probT(nHH, nHT, nTH, nTT) = pT * (pHH ^ nHH) * (pHT ^ nHT) * (pTH ^ nTH) * (pTT ^ nTT)
</pre>
<p>
The first one (<code>probH</code>) is the probability for outcomes that
start with Heads, the second (<code>probT</code>) the probability for
outcomes that start with Tails. <code>nXY</code> is the number of
occurances within the outcome we are regarding of a throw turning
out X ('H' for Heads, 'T' for Tails) followed by a throw turning
out Y ('H' for Heads, 'T' for Tails).
</p>
<p>

For two outcomes to have the same probability of occuring, they shall
share the same <code>nHH</code>, <code>nHT</code>,
<code>nTH</code> and <code>nTT</code> and the same first throw.
(since we only take into account equal probabilities independent of the
actual values of <code>pH</code>, <code>pHT</code> and <code>pTH</code>).
So we need two further functions that calculate how many of the
2<sup>n</sup> possible outcomes share the same <code>nXY</code> and
first throw:

</p>
<pre>
countH(nHH, nHT, nTH, nTT)
countT(nHH, nHT, nTH, nTT)
</pre>
If we have these functions (see further down for how these can be computed),
the basic idea of the solution is to iterate
over all possible <code>nHH</code>, <code>nHT</code>, <code>nTH</code>
and <code>nTH</code>, and add the following probability to the result
(which is to be initialised to 0.0 at the beginning):
<pre>
p += (countH(nHH, nHT, nTH, nTT) / k) * k * probH(nHH, nHT, nTH, nTT);
p += (countT(nHH, nHT, nTH, nTT) / k) * k * probT(nHH, nHT, nTH, nTT);
</pre>

<p>
(<code>(countH() / k) * k</code> is the number of combinations (out of the
countH() ones) that can be mapped to the original <code>k</code> outcomes
as described in the problem statement).
</p>
<p>
Since each of <code>nXY</code> can get to the order of <code>n</code>,
it is clear that we can not simply iterate over all possibilities
with <code>n</code> getting values up to 1000.
In order to reduce the number of iterations we need, notice that
the <code>nXY</code> are not totally independent from eachother:
For example, when there are <code>nHT</code> positions in the coin throw sequence,
where a Tails throw follows a Heads throw, there will be an equal
number (or +/-1) of positions, where a Heads throw follows a Tails throw.
Similarly, if <code>nHT</code> and <code>nHH</code> are known, we
also know the total number of Heads (up to +/- 1), and with that
also the number of Tails, and with <code>nTH</code> we can
finally also deduce <code>nTT</code>. So in total, we have to iterate
only over all possible <code>nHT</code> and <code>nHH</code>

and handle all possible cases as shown in the following pseudo-code.
</p>
<pre>
double p = 0.0;
for (nHH = 0; nHH < n; nHH++) {
    for (nHT = 0; nHT < n; nHT++) {
        // Case 1: First throw is Heads, last throw is Heads
        nH = nHT + nHH + 1 // (total number of Heads)
        nT = n - nH = n - nHT - nHH - 1  //(total number of Tails)
        nTH = nHT
        nTT = n - nHT - nHH - 1 - nTH // ( = nT - nTH)
        p += (countH(nHH, nHT, nTH, nTT) / k) * k * probH(nHH, nHT, nTH, nTT);

        // Case 2: First throw is Heads, last throw is Tails
        nH = nHT + nHH
        nT = n - nH = n - nHT - nHH
        nTH = nHT - 1
        nTT = n - nHT - nHH - nTH - 1 // ( = nT - nTH - 1)
        p += (countH(nHH, nHT, nTH, nTT) / k) * k * probH(nHH, nHT, nTH, nTT);

        // Case 3: First throw is Tails, last throw is Heads
        nH = nHT + nHH + 1
        nT = n - nH = n - nHT - nHH - 1
        nTH = nHT + 1
        nTT = n - nHT - nHH - 1 - nTH // ( = nT - nTH)
        p += (countT(nHH, nHT, nTH, nTT) / k) * k * probT(nHH, nHT, nTH, nTT);

        // Case 4: First throw is Tails, last throw is Tails
        nH = nHT + nHH
        nT = n - nH = n - nHT - nHH
        nTH = nHT
        nTT = n - nHT - nHH - nTH - 1 // ( = nT - nTH - 1)
        p += (countT(nHH, nHT, nTH, nTT) / k) * k * probT(nHH, nHT, nTH, nTT);
    }
}
return p;
</pre>
<p>
Remains to compute <code>countH()</code> and <code>countT()</code>.
So we want to count how many combinations of <code>n</code> consecutive
coin throws (with the first outcome given) contain exactly

<code>nXY</code> pairs of an Y outcome following an X outcome. 
From <code>nXY</code> and the first throw outcome we can deduce how
many Heads and Tails throws are in total in the sequence (in fact
it is easier to pass it as an argument to the countX functions since
we have already computed it, see above), and how many Heads and Tails runs
are in the sequence - a Heads/Tails run is a sequence of consecutive
Heads/Tails outcomes, e.g. "HHHHTHTTTHHH" has 3 Heads runs ("HHHH", "H" and
"HHH") and 2 Tails runs ("T" and "TTT"). The total result of the
<code>countX()</code> function is now the number of ways we can split
<code>nH</code> Heads throws into <code>runsH</code> runs, multiplied
by the number of ways we can split <code>nT</code> Tails throws into

<code>runsT</code> runs. This is equal to
<code>choose(nH - 1, runsH - 1) * choose(nT - 1, runsT - 1)</code>
(since we have to split the <code>nH</code> Heads at <code>runsH - 1</code>
positions, and each position can be choosen at any of the <code>nH - 1</code>
possible positions inside the Heads throws - similarly for Tails).
</p>
<p>

In the above formulas, <code>choose(n, k)</code> is the binomial coefficient
<code>n</code> choose <code>k</code>. Since this can get really large values
for <code>n</code> up to 1000, we have to be careful with the implementation.
One way is to make the computations using logarithms, and transform back
after the multiplication with all <code>pXY</code>.
An alternative is to compute the inverse problem, i.e., the probability
that the coin throw outcome is not mapped, and then subtract this from 1.0
to get the final result. In this case, instead of computing
<code>(countX() / k) * k</code> (the number of mapped outcomes), we have
to compute <code>countX() % k</code> (the number of unmapped outcomes).
Since <code>k</code> is constant and known at the beginning of the problem,
we can precompute all needed <code>choose(n, m) % k</code> in advance
using the recursive formula for computing the binomial coefficients
(i.e., <code>choose(n, 0) % k = 1</code>, <code>choose(n, n) % k = 1 </code>

and <code>choose(n, m) % k = (choose(n - 1, m - 1) % k + choose(n - 1, m) % k) % k</code>).
</p>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
