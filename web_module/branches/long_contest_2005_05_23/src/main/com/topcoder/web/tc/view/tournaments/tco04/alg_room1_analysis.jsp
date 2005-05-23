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
<jsp:param name="tabLev3" value="room1"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>tomek goes to the finals again</p>

		<img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tco04/onsite_photos/shot_room1.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">The returning champ<br/><br/></span>
		</div>

		<a href="/stat?tc?module=MemberProfile&cr=159052"><img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/stat?tc?module=MemberProfile&cr=159052">lbackstrom</a>, <br/>
		<em>TopCoder Member</em><br />
		Thursday, November 11, 2004<br/>
		<br/><br/>
		</p>

		<p>
Antimatter was first to submit for 167.75 out of 175, in  about 5 minutes.  tomek was right on 
his heels though, with 162.25, while the next 3 coders had between 139 and 144.  bstanescu 
skipped to a tricky hard problem, while tomek submitted the medium first, after about 50 
minutes.  It didn't take bstanescu too long to give up on the hard problem, and he went back to 
the medium, submitting it much quicker than tomek, and taking a lead of slightly less than 50 
points.  qsort was next to submit, but was two challenges behind bstanescu.  antimatter also 
submitted the medium, and his impressive score on the first problem put him into third.  When 
the challenge phase started, bstanescu was winning, while tomek was in second, and antimatter 
was in third.
<br/><br/>
RalphFurmaniak was first to submit a challenge, taking down grotmol without reading his code.  
A few minutes later, grotmol went for broke, and challenged everyone's medium.  3/5 of them 
passed, giving him a net of -50 points.  bstanescu, tomek and antimatter all played it safe, 
and at the end of the challenge phase, the top 3 remained unchanged.  However, going into 
system tests, one has to imagine that they were nervous about their medium solution.
<br/><br/>
Yet, their fears were unfounded, as all their medium submissions passed system tests.  However, 
bstanescu's easy was the only problem to fail, and hence, tomek moved on to the finals, while 
bstanescu and antimatter will have to fight back from the wildcard round.
<br/><br/>
<span class=bodySubtitle>Hex</span>
<br/><br/>
The TCO started out with a rather easy problem, rated at only 175 points.  The
first step is to draw the board, once you got that correct, putting in the h's
and v's is pretty easy.  While there were lots of ways to do this, I think that
the simplest is to start by creating a large, empty, char[][], put the
appropriate marks in, and then trim the array down at the end.  Now, while there
are lots of ways to figure out where the marks go, I elected to find the
coordinates in the array of the center of each cell, and then draw the hex around those
coordinates.  The hexagon located at (i,j) has its blank spot at
ch[j*2+i+1][i*2+1].  In relation to this, we can easily calculate where to put
the '/', '\', and '_' characters, as well as the 'h' and 'v' characters.
<br/><br/>
<span class=bodySubtitle>BioScore</span>
<br/><br/>
Since we are dealing with averages, the average score between pairs of sequences
is maximized when the total score between all pairs of characters at all
positions is maximized.  Hence, the first step is to calculate the number of times
each pairs of characters occurs.  We want to fill in the matrix in such a
way that the sum of score(x,y)*count(x,y) is maximized.  To simplify
things, lets assume that we are only working with the lower half of the score
matrix.  We can do this because the matrix must be symmetric.  However, as a
result, the scores that are not along the diagonal count double when considering
that all the scores must sum to 0.
<br/><br/>
From here, there are a lot of different ways to proceed.  One solution is to use
dynamic programming, and calculate the highest score for the first k different
types of pairs, with a score sum of j.  That is, given that the first k (out of
10) entries in the matrix are filled in, and the sum of those k entries is j,
what is the best possible score.  To compute best[k][j], you can use the
following recurrence:
<pre>
    if(k is on diagonal)
        best[k][j] = max<sub>-10&lt;=i&lt;=10</sub>(best[k-1][j-i] + count[k]*i)
    else
        best[k][j] = max<sub>-10&lt;=i&lt;=10</sub>(best[k-1][j-i-i] + count[k]*i)
</pre>
<br/><br/>
Another way to do it is initialize the score matrix to any valid matrix,
and compute the score.  Next, consider each possible change that you could
make (while still maintaining the -10 to +10 range):<br/>
<ul>
    <li>Increasing a non-diagonal entry by 1, while decreasing another non-diagonal
    entry by 1</li>
    <li>Increasing a diagonal entry by 1, while decreasing another diagonal
    entry by 1</li>
    <li>Increasing two diagonal entries (possibly the same one twice) by 1,
    while decreasing non-diagonal entry by 1</li>
</ul>
Pick a change that increases the total score, and try again until you can make
no more improvements.  There are no local minima in this problem which are not
also global minima, so you will end up with the optimal score matrix.<br/><br/>
<br/><br/>
<span class=bodySubtitle>Robbery</span>
<br/><br/>
With the city constrained to be 30*30 or less, there are a total of
31<sup>4</sup> possible pairs of locations for the police and the robbers.
However, while this number is fairly small, writing a solution that works with
the different states is pretty tricky (though possible).  A better solution is
totally independent of city size.  First off, lets define the parity between the
robbers and police to be the manhattan distance between the two, mod 2.
Therefore, if the robbers are at (1,1) and the police are at (2,2), the parity
between them is 0.
<br/><br/>
Now, there are a very limited number of things that the robbers need to
consider doing.  First off, the robbers may just ignore the shortcut, and try to
run away from the police.  If the parity between the police and robbers is 0,
then the police will simply head towards the robbers along the horizontal or
vertical roads each time, with their knowledge of where the robbers will go.
Eventually, the robbers will be cornered, and the police will catch them in one
of the locations adjacent to a corner.  Furthermore, if the police make the
correct choices, every one of their moves will be towards the corner that the
robbers are caught in.  By moving to the position that makes the maximum of the difference in x
coordinates and the difference in y coordinates as small as possible, the police
will never make an unnecessary move.  Hence, the robbers best strategy in this
case is to go the corner that is farthest from the police's initial
position, and that the robbers can get to first.
<br/><br/>
If the parity between the police and robbers is 1, but the robbers still ignore
the shortcut, then the situation is similar.  In this case the robbers will
still get caught in a corner, but the police need to go through the shortcut
before heading to the corner.  Again, the robbers should go to the corner that
it takes the police the longest to reach, but that the robbers can still get to
first.  Things are a little more complicated than this though because the police
may need to make a choice about which way to go through the shortcut before they
know where the robbers are going, and this choice may effect how long it takes
to catch the robbers.  As illustrated by example 4, the police may need
to make a choice about which way to go through the shortcut before the robbers
must commit to which corner they are going to, and hence the police must
determine which of the two choices is best for them, before the robbers decide
which corner to head to.
<br/><br/>
If the robbers can go through the shortcut before the police get there, then it
might be advantageous for them to do so.  The robbers must consider going
through the shortcut in one of the two directions and, as before, heading to the
corner where they are eventually caught.  If the
parity is 0, then the police must also go through the shortcut after the
robbers, and track them down.  If the parity is 1, then the police don't need to
go through the shortcut. As before, if the police need to go through the
shortcut, their choice of which direction to go through it may effect which
corner the robbers head to.
<br/><br/>
Luckily for the competitors, most of these cases were well illustrated by the
examples.  For an alternate solution that takes advantage of the 30x30 limit,
see the solution by lars2520 in the practice room (written by Yarin).
		</p>
            
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
