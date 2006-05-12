<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
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
            
        <p class="bigTitle">mathijs wins Room 3</p>

		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tccc05/onsite_photos/shot_room3.jpg" alt="" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">mathijs wins a close one<br/><br/></span>
		</div>

		<a href="/tc?module=MemberProfile&cr=269554"><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/tc?module=MemberProfile&cr=269554">Yarin</a>, <br/>
		<em>TopCoder Member</em><br />
		Thursday, March 10, 2005<br/>
      introduction by lbackstrom
		<br/><br/>
		</p>

		<p>
dangelo submitted the easy problem first, well before haha.  mathijs, dvickrey and Eryx were all close behind, and as the competitors struggled with the medium problem it became clear that it would be a close race.  cyfra was first to submit the medium, beating out all the other coders by a wide margin.  mathijs submitted it next, followed closely by Eryx and RalphFurmaniak.  The challenge phase proved uneventful, as the one challenge failed.  Going into system tests, 4 coders had submitted 2 problems, but none of them was safe as a failed submission would drop them below the other three.  To the surprise of all in attendence, cyfra failed the easy problem, while mathijs, Eryx, and RalphFurmaniak all passed their two problems.  mathijs had just a few more points, and so he will advance to the finals while Eryx and RalphFurmaniak will have to battle it out in what I'm sure will be a brutal wildcard round.
<br><br>
<h2>VariableDeclaration</h3>

<p>
Blocks within blocks suggests a recursive solution, which is definately the easiest way to solve
this problem. We define a recursive function that identifies all sub-blocks of code and all variables declared
in the current block (excluding sub-blocks). That is, if the input is
</p>

<pre>
{d{{e}{fd}}{e}{df{{a}}}a}"
</pre>

<p>
it should identify the parts
</p>

<pre>
{d{..}{..}{..}a}
</pre>

<p>
In the code above, the variables <tt>a</tt> and <tt>d</tt> have been declared. That means
they are prohibited in the three sub-blocks. For each of these sub-blocks, we recurse
and add a parameter marking the prohibited variables (<tt>a</tt> and <tt>d</tt>).
If a prohibited variable is found declared, then it's a bad declaration. Any such bad declaration is marked off globally
(in a class member). Note that prohibited variables must propagate down when doing further recursive calls.
</p>

<p>
To find the length of the sub-blocks (marked with .. above), we can simply count the number of
left and right brackets - when the number of right brackets equals the number of left brackets,
we're back at the current nesting level.
</p>

<h2>CheckerPolygon</h3>

<p>
The total number of squares potentially enclosed by the polygon is 100 millions, so it is not possible
to loop through all squares (such a loop could only do one or two simple operations without timing out).
Instead we should try to find a solution which only requires a loop in one dimension across the checkerboard.
</p>

<p>
A property of a convex polygon is that is that is has one upper half and one lower half. One approach
is then to count the number of squares entirely below the upper half (down to the edge of the checkerboard)
and the number of squares below, or intersected by, the lower half. See the figure below for which squares
we want to count; the green tinted squares to the left should be included, except those to the right.
</p>

<center><img src="/i/srm/tccc05_room3.gif" /></center>

<p>
There are several ways to find which edges in the polygon belong to the upper and lower half.
One can for instance determine the leftmost and rightmost point, and assign the edges between to
either part. Lines that are vertical can be ignored; they are not interesting.
</p>

<p>
Now we can loop along the x-axis between the left and right endpoint of the polygon, and for each square
determine the lowest point for the upper half of the polygon and the highest point for the lower half of the
polygon. This is done by some simple math (linear interpolation) of the slope of the edges. We must also make sure to round correctly -
when doing the math for the upper half we must round down and for the lower half we must round up.
After the rounding, the coordinate for the lower half might be higher up than for the upper half (since
we round in different directions), so this must be watched out for. Otherwise the difference between
the y-coordinates is the number of squares at this x-coordinate enclose by the polygon. Finding
out how many of these are light and dark squares is a simple matter of parity checking the x- and y-coordinates.
</p>


<h2>CableWoes</h3>

<p>
This problem consists of two parts. The first part is to find out the distance between the given
connections on the polygon. Since we must pull the cable along the wall, it should be fairly obvious that
the positions of the connections can be transformed to positions on a circle with the same perimeter as
the length of the polygon. We can start by picking an arbitrary starting point on the polygon, and then
loop through all edges in the polygon. For each edge we check if any of the connections lies on this edge
(a task made very easy since the lines are always horizontal or vertical). If so, calculate the distance
from the start point to this point and add it to the list of points on the circle.
</p>

<p>
We have now converted the input into a set of positions on a circle with a known perimeter. The actual
pulling of cables along the circle remains. The first thing to observe is that an optimal solution always
exists where all hubs have been placed on existing connections. To realize this,
assume we have found an optimal solution (i.e. were the amount of TP cable is minimized) where a hub is not
on an existing connection (i.e. between two points). This hub would have one or more cables going in both
directions. By moving the hub into the direction with more cables, the total amount of cable would be less
than already used. If the number of cables are the same in both directions, moving the hub won't affect the
total cable length needed.
</p>

<p>
The next thing to notice is that we are facing a minimal spanning tree problem with some
restrictions; obviously, it doesn't really matter which of the connections is the internet
connection since all connections must be reached from each other. The restrictions are that only a
few vertices may have more than one edge (the vertices where one or several hubs have been placed).
Applying restrictions to what otherwise is an ordinary minimal spanning tree problem usually makes the
problem much harder, quite often NP-hard. In this case however, we have a very special graph since all
the vertices lie on the edge of a circle, and the distance between the vertices is the distance along
the perimeter of the circle.
</p>

<p>
Another important thing to realize is than an optimal solution will always have a "gap" between
two points on the circle where no cable is pulled (if we had such a solution, it could be improved
due to overlapping cables). To simplify things, we can then break the circle into a line at all the gaps,
and solve the problem for several (at most 50) linear cases, instead of one circular case. Generally, when
you're dealing with circular structures, you often have to break the circularity into several linear cases.
</p>

<p>
The remainder of the problem is solved with dynamic programming (or memoization). One way to define
the recursive function is to have two parameters specifying the current connection (the connections
will be traversed from left to right along the line from the "broken" circle) and the number of hubs left.
The method should return the minimum cable needed to connect all the remaining connections with the given
number of hubs. Being at a particular connection X, we need to determine how many more connections
after X that should be connected to the same hub as X (either 0, 1, 2 - unless we're at the end of the line,
the last connection is needed to connect another hub). This is done by trying all possibilities; for
each possibility, we use the last connection of the hub as the starting point for the remaining connections
(which are dealt with using a recursive call). The exact location of the hub can either be determined
by looping over the connections it's connected to, or by noticing that it always should be placed
"in the middle".
</p>


        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
