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
<jsp:param name="tabLev3" value="room3"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>reid takes the hard problem on his way to the finals</p>

		<img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tco04/onsite_photos/shot_room3.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">Welcome to the finals reid<br/><br/></span>
		</div>

		<a href="/stat?tc?module=MemberProfile&cr=287269"><img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/stat?tc?module=MemberProfile&cr=287269">legakis</a>, <br/>
		<em>TopCoder Member</em><br />
		Thursday, November 11, 2004<br/>
		introduction by lbackstrom
		<br/><br/>
		</p>
<p>
The last event of the day was semifinal round 3.  haha was the first to submit, solving the 200 point problem in about 7 minutes. snewman was right on his tail though, submitting about 1 minute later.  Three other coders submitted within 10 minutes, and they all moved on to the medium.  reid was quickest, but snewman made it a race, getting 0.08 fewer points on the first two problems.
<br/><br/>
After an hour of coding, snewman became the first coder of the event to submit all three problems, giving him a total of over 1100 points.  reid opened the hard later though, and the audience watched with baited breath as reid's potential score slowly ticked down below snewman, and then to 50 points below snewman's score before he submitted, a hair over 50 points behind.
<br/><br/>
At this point, snewman controlled his own destiny, as the problems didn't give much opportunity for challenging.  However, his solution wasn't quite fast enough on the medium, and so reid advanced to the finals, once again.
<br/><br/>
Tomorrow, bstanescu, antimatter, monsoon, John Dethridge, snewman, and haha will vie for the final spot in the finals, where tomek, SnapDragon, and reid are waiting.
<br/><br/>
<span class=bodySubtitle>Unblur</span>

<p>
This problem would be considerably more difficult if it were not for this
key simplifying restriction:
"All pixels in the top and bottom rows and left and right columns of the
original image will be black."
With this restriction, pixel (1,1) in the source image is the only pixel
that contributes to pixel (0,0) in the blurred image.
Therefore, the only possible values for pixel (0,0) in the blurred image
are 0 and 1.  If it is 0, then pixel (1,1) in the source is black, and if
it is 1, then pixel (1,1) in the source is white.
</p>
<p>
Once you have determined the value of a pixel in the source, you can subtract
its contribution to the blurred image and move on to the next pixel.
After the contribution from source pixel (1,1) has been subtracted from the
blurred image, then pixel (2,1) in the source image is the only remaining pixel
that contributes to pixel (1,0) in the blurred image.
</p>
<p>
You can calculate the value of the source pixels one at a time, working from
left-to-right and top-to-bottom, simply by looking at the blurred pixel to
the upper-left and then subtracting 1 from the 3x3 around the pixel if it
is white.  In pseudocode, given a blurred image <b>B</b> of
size <b>W</b> x <b>H</b>:
</p>
<p>
<pre>
    create source image <b>S</b> of size <b>W</b> x <b>H</b>
    initialize <b>S</b> to all black
    for y = 1 to <b>H</b>-2               // skipping top and bottom rows
        for x = 1 to <b>W</b>-2           // skipping left and right columns
	    if <b>B</b>[x-1,y-1] == 1 {   // only possible values are 0 and 1
	        set <b>S</b>[x,y] to white
		subtract 1 from 3x3 region of <b>B</b> centered at (x,y)
	    }
    return <b>S</b>
</pre>
</p>

<span class=bodySubtitle>Spanning</span>
<p>
The relatively small constraints on the input size make this problem amenable
to a brute force solution, with a couple simple optimizations to keep the
running time down.  The basic strategy is: for each subset of edges,
compute the shortest path between all pairs of nodes.  Of those pairs that have
a largest distance less than or equal to the given threshold, keep track
of the minimum cost.
</p>
<p>
The all-pairs shortest path problem can be solved by running Dijkstra's
algorithm from each node, or by using the Floyd-Warshall algorithm.
With a maximum of 10 nodes, these algorithms run very quickly.
</p>
<p>
One important optimization is to prune branches of the search that cannot
possibly connect all nodes.  For example, if there are N nodes, you know
that you must use at least N-1 edges.
Another optimization,
if you build the graph recursively by considering each edge in order
and either adding it or not,
is to incrementally update your all-pairs shortest path solution
after you add each edge.
You can also prune branches where the cost of the edges you have already
added exceeds the smallest cost you have found so far.
</p>

<span class=bodySubtitle>SureThing</span>
<p>
The key to this problem is given in the example at the end of the problem
statement: "Notice that you don't care if your first guess is right or wrong."
This is not a probability problem -- it is a math and logic problem.
If you make the optimal wager at every step, you never care if any of your
guesses are right or wrong.
</p>
<p>
Consider the case with 1 blue and 2 red marbles.  You guess that the next
marble will be red, but need to compute how much to wager.  For now, let's
call your wager <i>x</i> (where <i>x</i> is a fraction of your bankroll).
You know that if you guess correctly, you will have (1+<i>x</i>) times
what you started with, and be able to double that one more time, ending up
with 2*(1+<i>x</i>).  If you guess incorrectly, you will have (1-<i>x</i>)
times what you started with, but be able to double that twice, ending up
with 4*(1-<i>x</i>).  The optimal value of <i>x</i> is the value that
maximizes the minimum of these two equations, and this optimal value
is where they intersect.  (Any other value of <i>x</i> would decrease one
of the equations, lowering the minimum.)  So, to find the optimal value,
you set the equations equal to each other and solve for <i>x</i>.  In this
case, you get <i>x</i> = 1/3.
</p>
<p>
Notice that I assumed above that we should guess that the next marble
will be red, without explanation.
If we instead guess that the next marble will be blue, we will get <i>x</i>
= -1/3, indicating that we assumed the wrong color.
It is always the case that you want to guess that the next marble will
be whatever color is most plentiful among the remaining marbles.
If there is a tie it does not matter, because your wager will end up being
zero.
</p>
<p>
Computing your wager is just as easy when there are more than two colors
of marbles.  This is because you only have to equate two equations: the
equation if your guess is correct, and the equation for the worst case
(which is when the second most plentiful color of marble is removed from
the bag.)
</p>
<p>
Now, the problem can be solved recursively with memoization.
Given a set of colors of marbles <b>M</b>, sort the set.
Then create a set <b>W</b> for the the winning case (with 1 subtracted from
the highest element of <b>M</b>)
and a set <b>L</b> for the worst losing case (with 1 subtracted from
the second-highest element of <b>M</b>).
Call your function recursively on <b>W</b> and <b>L</b>, to compute how
much you can win in either of those cases.
Calling these results <i>w</i> and <i>l</i> respectively,
you then compute the amount
of your wager for <b>M</b> by solving the following equation for <i>x</i>:
</p>
<blockquote>
<i>w</i> * (1 + <i>x</i>) = <i>l</i> * (1 - <i>x</i>)
</blockquote>
<p>
Once you have <i>x</i>, you can plug it in to either side of the equation
to compute how much money you can guarantee yourself to end up with starting
at state <b>M</b>.
</p>
<p>
The base case for the recursion is when <b>M</b> contains only 1 non-zero
number.  In this case, the value is simply 2 raised to the power of that
number, because you can double your money that many times.
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
