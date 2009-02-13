<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="wildcard"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

        <p class=pageTitle>snewman is back in the battle</p>

		<img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tco04/onsite_photos/shot_wildcard.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">snewman breathes a sigh of relief<br/><br/></span>
		</div>

		<a href="/stat?tc?module=MemberProfile&cr=159052"><img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/stat?tc?module=MemberProfile&cr=159052">lbackstrom</a>, <br/>
		<em>TopCoder Member</em><br />
		Friday, November 12, 2004<br/>
		<br/><br/>
		</p>
<p>
As in the TCCC, the wildcard round was extremely close.  John Dethridge, antimatter and snewman start off extremely close after each submitting the easy problem within a minute of each other.  The remaining three coders weren't too far behind, with the sixth submission coming in after 13 minutes.  The medium problem proved to be quite difficult for everyone though, and only antimatter, monsoon, and snewman were able to submit it in time.  bstanescu skipped the medium problem after solving the easy, and went straight to the hard problem.  John Dethridge also moved on the hard problem without solving the medium, but then went back to the medium.  With about 15 minutes remaining in the coding phase, bstanescu submitted the hard problem and maintained his lead till the end of the coding phase.
<br/><br/>
However, his solution used randomness and hill climbing, so there were no guarantees it would pass, even if everything else was correct.  During the challenge phase, no one was able to wade through the longish medium and hard submissions, and going into systests, the top four were bstanescu, antimatter, snewman, and monsoon.  As the results came up, it was revealed that snewman was the only coder to solve two problems, and hence he will join tomek, SnapDragon and reid in the finals - meaning that the top four seeds have all advanced.
<br/><br/>
<span class=bodySubtitle>CubeSum</span>
<br/><Br/>
In this problem, we want to count the number of ways to pick four perfect
cubes such that the sum of the four cubes is N, where N is at most 100 million.
The most obvious solution is to write four nested loops that try all possible
summations:
<pre>
    int ret = 0;
    for(int i = 0; i*i*i &lt;= N; i++)
        for(int j = i; j*j*j + i*i*i &lt;= N; j++)
            for(int k = j; k*k*k + j*j*j + i*i*i &lt;= N; k++)
                for(int l = k; l*l*l + k*k*k + j*j*j + i*i*i &lt;= N; l++){
                    if(i*i*i+j*j*j+k*k*k+l*l*l == N)cnt++;
                }
    return cnt;
</pre>
However, this solution is much too slow to pass the larger cases.  One obvious
optimization that we can make is to compute the value of l, rather than looping
to find it:
<pre>
    int ret = 0;
    for(int i = 0; i*i*i &lt;= N; i++)
        for(int j = i; j*j*j + i*i*i &lt;= N; j++)
            for(int k = j; k*k*k + j*j*j + i*i*i &lt;= N; k++){
                int l = cubeRoot(N-i*i*i-j*j*j-k*k*k);
                if(i*i*i+j*j*j+k*k*k+l*l*l == N)cnt++;
            }
    return cnt;
</pre>
Now, when N is 100 million, this solution requires that the innermost loop be
executed approximately 12 million times.  Hence, the key to a solution that runs
in time is to make the cubeRoot function fast.  There are a number of ways to do
this, but perhaps the simplest is to store all 465 perfect cubes less than 100
million in an array, and then perform a binary search.  Alternatively, you could
do a binary search for the cube root itself.  There are also other methods that will
converge faster than a binary search, but they are not necessary.
<br/><br/>
A more complicated solution, with a significantly better runtime requires that
we precompute all the numbers that can be found as the sum of two perfect cubes.
Once we have our list, we sort it, and can quickly find all the pairs of integers in the
list that add up to N:
<pre>
    int p1 = 0, p2 = list.length-1;
    while(p1&lt;=p2){
        if(p1+p2&lt;N){
            p1++
        }else if (p1+p2&gt;N){
            p2--;
        }else{
            p1++;
            p2--;
        }
    }
</pre>
The trick, of course, is what to do once we find two numbers in our list that
add up to N.  I'll leave the details of that as an excercise to the reader
(following this approach, a solution can easy handle N = 1 billion).
<br/><br/>
<span class=bodySubtitle>LeftmostDerviation</span>
<br/><br/>
Usually, when dealing with context free grammars, there are a limited number of
derivations that are allowed.  In this problem, however, you can make any
derivation you like, so long as you are replacing the leftmost
non-terminal.
<br/><br/>
The first thing to note is that, since we are after the fewest number of
derivations, we should never replace a non-terminal with a string containing
another non-terminal, unless doing so causes us to end up at the finish string.
If there is no way to replace the non-terminal and end at the finish string,
then any non-terminals we insert will simply have to be replaced by another,
superfluous derivation.
<br/><br/>
So, assuming that we aren't inserting any non-terminals, we want to know how
many terminals to derive from the leftmost non-terminal.  To do this, we first
find all the contiguous terminals following the leftmost non-terminal.
Since these symbols can't be replaced, they need to match symbols in final once
we've replaced the leftmost non-terminal.  Furthermore, in order to find the
lexicographically first derivation, we want to derive the fewest terminals
possible, so that the first non-terminal appears earlier in the string.  Hence,
we insert as few characters as possible so that the terminals to the right of
the replaced non-terminal line up.
<br/><br/>
We continue in this way, replacing the leftmost non-terminal with the fewest
terminals possible or with a sequence that gives us final.  Eventually, we'll
finish the derivation, or find that it is impossible.
<br/><br/>
<span class=bodySubtitle>Supply</span>
<br/><br/>
It is tempting to try to use the geometric nature of this problem to your
advantage.  However, I couldn't come up with any way to do so.  Instead, I
considered placing the store at each of the 121 potential locations, and applied
the standard algorithm used for finding a minimum weight bipartite matching.
The algorithm is farily straightforward:

<pre>
    Find any valid matching
    while(true){
        search for a sequence of edges
            (u<sub>0</sub>,v<sub>0</sub>), ..., (u<sub>k</sub>,v<sub>k</sub>)
            such that replacing this sequence with
            (u<sub>0</sub>,v<sub>1</sub>), ..., (u<sub>k-1</sub>,v<sub>k</sub>), (u<sub>k</sub>,v<sub>0</sub>)
            reduces the total cost.
        if(no such sequence exists)break
    }
</pre>
Finding a valid matching is trivial in this case, since there are edges from
every factory to every store.  Finding a sequence of edges can be done using a
brute force, recursive algorithm, since there are typically not that many edges in
use.
<br/><br/>
However, we have to run this algorithm for each possible location of the new
factory, so we need to be a little bit careful about timeout.  There are a
number of different ways to optimize this algorithm.  One way is to make your
search for valid sequences more efficient (using Bellman-Ford, for instance).  However, a simpler way to ensure
your algorithm runs quickly is to maintain the same matching as you move the
location of a factory, and to only move the factory a distance of 1 each time
(either by spiraling, or with an S shaped curve).  This way, you never have to
do very much work to adjust your matching to make it minimum weight.
<p>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
