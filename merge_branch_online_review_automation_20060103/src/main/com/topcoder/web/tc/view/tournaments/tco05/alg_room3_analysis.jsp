<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room3"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco05/onsite_photos/shot_room3.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p>
<span class="bigTitle">misof wins Room 3</span>
<br><br>
<img src="/i/m/FogleBird_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<tc-webtag:forumLink forumID="505778" message="Discuss this match" /><br>
Thursday, October 13, 2005<br>
Introduction by <tc-webtag:handle coderId="160049" context="algorithm"/>
<br><br><br>
Everyone can go home feeling content after the Room 3 portion of the on-site finals here at the 2005 TopCoder Open.  Each of the sixteen competitors submitted a correct 250-point solution, leaving each of them with a positive final score.  The relatively easy 250 left plenty of time for thirteen of the coders to submit the 500-point problem.  However, only three of them ended up passing - four were brought down during the challenge phase and the rest during system tests.  Finally, misof was the only one to submit the difficult 1000-point problem.  He seemed rather excited as his solution passed system tests, keeping him in 1st place for the room.  He and nicka81 will advance to the finals tomorrow.  ivan_metelsky, antimatter, marian, and kalmakka will move on to the wildcard round for a second chance to make it into the final championship round.  Good luck!
</p>


<h1>ModeProbability</h1>
by <tc-webtag:handle coderId="251317" context="algorithm"/>
<br><br>
Here we must compute the probability that a given number will occur most frequently.  The friendly
constraints guarantee there will be at most 5 different values, and at most 15 numbers generated.
Looping through all possible counts for each value, we see there are at most C(19,4)=3876 (read "19
choose 4") ways to choose the values.  If we only consider the ways where the required number occurs
most frequently, there are even fewer possibilities to consider.  For each set of counts, we can
compute the probability of that set occurring.  First, fix a particular ordering of the multiset we
have chosen (a multiset is a collection of values with different counts).  To compute the
probability of that ordering, we multiply the probability of getting each value.  For example, if
<pre>
<b>probs</b> = {20,30,50}
</pre>
and we are considering the multiset
<pre>
M = { 0 with count 2, 1 with count 1, 2 with count 3 }
</pre>
with fixed ordering &lt;2,0,1,0,2,2&gt;, then the associated probability is
<pre>
P = .5*.2*.3*.2*.5*.5
</pre>
Conveniently, any ordering of these 6 values will occur with the same probability, so the total
probability for this set of counts can be computed by multiplying P by the number of orderings of
these values.  This count is

<pre>
C = 6!/(2!*1!*3!) = 60
</pre>
6! represents the number of ways to order 6 distinct objects.  The denominator accounts for the
duplicates.  This formula is called a <a href="http://mathworld.wolfram.com/MultinomialCoefficient.html">
multinomial coefficient</a>.  To complete the task at hand, we sum all of the C*P values 
(for each possible set of counts), and get our final result.

<h1>Conference</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
It is useful to think about what happens when n = 1: there is only 1 person and he wants to attend as many meetings as possible. In this case, a simple greedy algorithm is correct. First go to the meeting that gets out earliest. Then, among meetings that are still options, go the the one that gets out earliest, and so on. By always picking the meeting that gets out earliest, you maximize your potential to go to future meetings.
<br><br>
It turns out that you can extend this to the case where n > 1. By having someone go to the meeting that gets out earliest, you maximize that person's ability to go to future meetings. As long as you iteratively assign the meetings, always picking the one that ends earliest out of your available options, you'll end up covering the most meetings possible. All that remains is to figure out which meetings are still possible, given that some meetings have already been selected. 
<br><br>
One way to do this is to assign people to meetings as the meetings are selected. Number the people from 1 to n, and whenever you select a meeting, assign it to the person who is done with other meetings latest, but doesn't have a conflict with that meeting. If you do this, you will always assign the meetings to people in such a way that you are maximizing the ability of the group to go to future meetings. Then, during the execution of your algorithm, a meeting is an option if and only if there is some person who doesn't have any conflict with it, assuming that you assign meetings in order by ending time.
<br><br>
Note that one incorrect way to do this (which cost many coders), is to simply count the number of conflicts that each meeting has with previously assigned meetings.  While this is temptingly simple, it has the unfortunate property that it fails.  Image a meeting from 8-9, 9-10 and 8:30-11, and two people.  We examine the meetings in order by end time, and find that we can go to both of the first two meetings. Now, we look at the 8:30-11 meeting and see that it conflicts with two previously assigned meetings.  Hence, we erroneously conclude that we can't go to the third meeting also.

<h1>DiscCover</h1>
by <tc-webtag:handle coderId="310430" context="algorithm"/>
<br><br>
It is easier here to solve the inverse problem, i.e., what is
the maximum radius of a disc that we can cover with <b>numDiscs</b>
unit discs (radius 1.0). If we have found that, we can scale
the solution to the given <b>discRadius</b>, and deduce
thus the minimum radius we need for the small discs.
<p>
Let's call the maximum radius of a disc that we can cover
using n unit discs <code>maxRadius(n)</code>. We use dynamic
programming to compute <code>maxRadius(n)</code> beginning
with n=0 (<code>maxRadius(0)=0</code>) and going up to

<b>numDiscs</b>. In order to compute <code>maxRadius(n)</code>,
we iterate over the number of discs, m, that are used to
cover the outermost ring in the optimal solution. Since
n-m discs can cover a disc of maximum radius
<code>maxRadius(n-m)</code> (which we have computed in
previous steps), this will be the inner radius of the outer
most ring that we need to cover with the m remaining unit discs.
So we need to place the m discs at an optimal distance
x from the center (at the vertices of an m-gon as described in
the problem statement), such that the ring covered has the
maximum possible outer radius, but still covering the
circle with radius <code>maxRadius(n-m)</code> (how this is
done is explained later). Choosing the value for m
that maximizes the outer radius gives us finally
<code>maxRadius(n)</code>. Noticing that each ring except the
innermost one has to be covered by at least 3 rings helps
avoiding to handle special cases for m=2 or m=1.
In pseudo-code we have:
</p>
<pre>
double minRadius(double discRadius, int numDiscs) {
    double[] maxRadius = new double[numDiscs + 1];
    maxRadius[0] = 0.0;
    maxRadius[1] = 1.0; // just one disc
    maxRadius[2] = 1.0; // a second disc does not help much
    for (int n = 3; n <= numDiscs; n++) {
        // We initialize first maxRadius[n] to the worst value we
        // know that we can achieve.
        maxRadius[n] = maxRadius[n - 1]
        for (int m = 3; m <= n; m++) {
            // addRing(double r0, int m) returns the maximum radius
            // we can cover if we already have a disc with radius r0
            // covered and add m discs covering an additional ring
            // (see below for implementation details).
            double rnext = addRing(maxRadius[n - m], m);
            if (rnext > maxRadius[n]) {
                maxRadius[n] = rnext;
            }
        }
    }
    // With numDiscs discs of radius 1.0 we can cover a disc of radius maxRadius[numDiscs]
    // So, we can cover a disc of radius discRadius using numDiscs discs of radius:
    return discRadius / maxRadius[numDiscs];
}

</pre>
<p>
Now remains the hard part, implementing the function <code>addRing(r0, m)</code>,
which computes the optimal way to place m&gt;2 unit discs around the already covered
disc with radius r0. As described in the problem statement, we place
the m discs centered at the vertices of a regular m-gon, let's say at
a distance x from the center. In the figure below, A and B are the
centers of two neighbouring of the m unit discs we place. Since
we have a regular polygon, the angle AOB (O is the center of the
original disc) will be equal to (2 * PI / m); in the following we
call 'a' half of this angle, i.e., a = PI / m. Since the m unit discs
have to cover at least the circle at distance r0 from O, the point
M (the middle of the arc between OA and OB) will have to be covered
by the disc centered at A or B (since these are the discs closest to M),
i.e., x must be choosen such that AM <= 1.0. This gives us an upper
bound for x (see figure for details):
</p>
<div align="center"><img src="/i/srm/tco05_r2_1.png" alt="" border="0"/></div>
<p>
Note that if the term under the square root is negative, i.e.,
r0 * sin(a) > 1.0, we can not cover the circle r0 with only m
additional discs, so we just return r0.
</p>
<div align="center"><img src="/i/srm/tco05_r2_2.png" alt="" border="0"/></div>
<p>
If we place the discs at a distance x, we cover a ring up to an
outer radius (see figure):
</p>
<div align="center"><img src="/i/srm/tco05_r2_3.png" alt="" border="0"/></div>
<p>
We want to find the x that maximises this, so the derivative
of this term must be set to 0 (to ensure that this is actually
a maximum we need to also check the second derivative, but
this turns out to be always negative, so we do indeed have a maximum):
</p>
<div align="center"><img src="/i/srm/tco05_r2_4.png" alt="" border="0"/></div>
<p>
If this is within the limit given above for x, then this is
the value we need to take for x, otherwise we have to use
the maximum allowed x value as given above. Using the formula
for r<sub>out</sub> we can finally return the radius of the disc we can
cover with m discs additional to the already covered r0 disc.
</p>
<p>
In total, we end up with the following code (in Java)
for <code>addRing(r0, m)</code>
<pre>
double addRing(double r0, int m) {
    double a = Math.PI / m;
    double z = 1.0 - r0 * r0 * Math.sin(a) * Math.sin(a);
    if (z < 0) return r0;
    double xmax = r0 * Math.cos(a) + Math.sqrt(z);
    double x = Math.cos(a) / Math.sin(a);
    if (x > xmax) x = xmax;
    return x * Math.cos(a) + Math.sqrt(1.0 - x * x * Math.sin(a) * Math.sin(a));
}

</pre>


        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
