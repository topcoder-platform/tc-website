<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>

<jsp:include page="../script.jsp" />
<style type="text/css">
    .code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }

</style>
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
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

            <h2>Geometry Concepts: Line Intersection and its Applications</h2>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<p>
<A href="/tc?module=Static&d1=tutorials&d2=geometry1">...read Section 1</A>
<br/><br/>
<span class="outline1"><a href="#line_line_intersection">Line-Line Intersection</a></span><br/>
<span class="outline2"><a href="#circle">Finding a Circle From 3 Points</a></span><br/>
<span class="outline2"><a href="#reflection">Reflection</a></span><br/>
<span class="outline1"><a href="#rotation">Rotation</a></span><br/>
<span class="outline1"><a href="#convexhull">Convex Hull</a></span>
<br/><br/>
In the previous section we saw how to use vectors to solve geometry problems.
Now we are going to learn how to use some basic linear algebra to do line
intersection, and then apply line intersection to a couple of other problems.
<br/>
<br/><a name="line_line_intersection"></a>
<span class="bodySubtitle">Line-Line Intersection</span><br/>
One of the most
common tasks you will find in geometry problems is line intersection.  Despite
the fact that it is so common, a lot of coders still have trouble with
it.  The first question is, what form are we given our lines in, and what form
would we like them in?  Ideally, each of our lines will be in the form
<tt>Ax+By=C</tt>, where A, B and C are the numbers which define the line.
However, we are rarely given lines in this format, but we can easily generate
such an equation from two points.  Say we are given two different points,
(x<sub>1</sub>, y<sub>1</sub>) and (x<sub>2</sub>, y<sub>2</sub>), and want to
find A, B and C for the equation above.  We can do so by setting <br/>
<tt>A = x<sub>1</sub>-x<sub>2</sub><br/>
B = y<sub>2</sub>-y<sub>1</sub><br/>
C = A*x<sub>1</sub>+B*y<sub>1</sub><br/></tt>
Regardless of how the lines are specified, you should be able to generate two
different points along the line, and then generate A, B and C.  Now, lets say
that you have lines, given by the equations:<br/>
<tt>A<sub>1</sub>x + B<sub>1</sub>y = C<sub>1</sub><br/>
    A<sub>2</sub>x + B<sub>2</sub>y = C<sub>2</sub><br/> </tt>
To find the point at which the two lines intersect, we simply need to solve the
two equations for the two unknowns, x and y.
<pre class=code>
    double det = A<sub>1</sub>*B<sub>2</sub> - A<sub>2</sub>*B<sub>1</sub>
    if(det == 0){
        <font color="blue">//Lines are parallel</font>
    }else{
        double x = (B<sub>2</sub>*C<sub>1</sub> - B<sub>1</sub>*C<sub>2</sub>)/det
        double y = (A<sub>1</sub>*C<sub>2</sub> - A<sub>2</sub>*C<sub>1</sub>)/det
    }
</pre>
To see where this comes from, consider multiplying the top equation by
B<sub>2</sub>, and the bottom equation by B<sub>1</sub>.  This gives you<br/>
<tt>A<sub>1</sub>B<sub>2</sub>x + B<sub>1</sub>B<sub>2</sub>y = B<sub>2</sub>C<sub>1</sub><br/>
    A<sub>2</sub>B<sub>1</sub>x + B<sub>1</sub>B<sub>2</sub>y = B<sub>1</sub>C<sub>2</sub><br/></tt>
Now, subtract the bottom equation from the top equation to get<br/>
<tt>A<sub>1</sub>B<sub>2</sub>x - A<sub>2</sub>B<sub>1</sub>x = B<sub>2</sub>C<sub>1</sub> - B<sub>1</sub>C<sub>2</sub><br/></tt>
Finally, divide both sides by <tt>A<sub>1</sub>B<sub>2</sub> -
A<sub>2</sub>B<sub>1</sub></tt>, and you get the equation for x.  The
equation for y can be derived similarly.
<br/><br/>
This gives you the location of the intersection of two lines, but what if you
have line segments, not lines.  In this case, you need to make sure that the
point you found is on both of the line segments.  If your line segment goes from
<tt>(x<sub>1</sub>,y<sub>1</sub>)</tt> to
<tt>(x<sub>2</sub>,y<sub>2</sub>)</tt>, then to check if (x,y) is on that
segment, you just need to check that <tt>min(x<sub>1</sub>,x<sub>2</sub>)
    &le; x &le; max(x<sub>1</sub>,x<sub>2</sub>)</tt>, and do the same thing for
y.  You must be careful about double precision issues though.  If your point is
right on the edge of the segment, or if the segment is horizontal or vertical, a
simple comparison might be problematic.  In these cases, you can either do your
comparisons with some tolerance, or else use a fraction class.<br/>
<br/><a name="circle"></a>
<span class="bodySubtitle">Finding a Circle From 3 Points</span><br/>
Given 3 points which are not colinear (all on the same line) those three points
uniquely define a circle.  But, how do you find the center and radius of that
circle?  This task turns out to be a simple application of line intersection.
We want to find the perpendicular bisectors of XY and YZ, and then find the
intersection of those two bisectors.  This gives us the center of the circle.
<div align=center><img src="/i/education/geometry06.png"/></div>
To find the perpendicular bisector of XY, find the line from X to Y, in the form
<tt>Ax+By=C</tt>.  A line perpendicular to this line will be given by the
equation <tt>-Bx+Ay=D</tt>, for some D.  To find D for the particular line we
are interested in, find the midpoint between X and Y by taking the midpoint of
the x and y components independently.  Then, substitute those values into the
equation to find D.  If we do the same thing for Y and Z, we end up with two
equations for two lines, and we can find their intersections as described
above.<br/>
<br/><a name="reflection"></a>
<span class="bodySubtitle">Reflection</span><br/>
Reflecting a point across a line requires the same techniques as finding a
circle from 3 points.  First, notice that the distance from X to the line of
reflection is the same as the distance from X' to the line of reflection.  Also
note that the line between X and X' is perpendicular to the line of reflection.
Now, if the line of reflection is given as <tt>Ax+By=C</tt>, then we already
know how to find a line perpendicular to it: <tt>-Bx+Ay=D</tt>.  To find D, we
simply plug in the coordinates for X.  Now, we can find the intersection of the
two lines at Y, and then find <tt>X' = Y - (X - Y)</tt>.
<div align=center><img src="/i/education/geometry07.png"/></div>
<br/><a name="rotation"></a>
<span class="bodySubtitle">Rotation</span><br/>
Rotation doesn't really fit in with line intersection, but I felt that it would
be good to group it with reflection.  In fact, another way to find the reflected
point is to rotate the original point 180 degrees about Y.<br/><br/>Imagine that
we want to rotate one point around another, counterclockwise by
&theta; degrees.  For simplicity, lets assume that we are rotating about the
origin.  In this case, we can find that <tt>x' = x Cos(&theta;) - y
    Sin(&theta;)</tt> and <tt>y' = x Sin(&theta;) + y Cos(&theta;)</tt>.  If we
are rotating about a point other than the origin, we can account for this by
shifting our coordinate system so that the origin is at the point of rotation, doing the rotation with the above formulas, and
then shifting the coordinate system back to where it started.<br/>
<br/><a name="convexhull"></a>
<span class="bodySubtitle">Convex Hull</span><br/>
A convex hull of a set of points is the smallest convex polygon that contains
every one of the points.  It is defined by a subset of all the points in the
original set.  One way to think about a convex hull is to imagine that each of
the points is a peg sticking up out of a board.  Take a rubber band and stretch
it around all of the points.  The polygon formed by the rubber band is a convex
hull.  There are many different algorithms that can be used to find the convex
hull of a set of points.  In this article, I'm just going to describe one of
them, which is fast enough for most purposes, but is quite slow compared to some
of the other algorithms.
<div align=center><img src="/i/education/geometry08.png"/></div>
First, loop through all of your points and find the leftmost point.  If there is
a tie, pick the highest point.  You know for certain that this point will be on
the convex hull, so we'll start with it.  From here, we are going to move
clockwise around the edge of the hull, picking the points on the hull, one
at a time.  Eventually, we will get back to the start point.  In order to find
the next point around the hull, we will make use of <a
    href="/tc?module=Static&d1=tutorials&d2=geometry1#cross_product">cross products</a>.  First, we will pick
an unused point, and set the next point, N, to that point.
Next, we will iterate through each unused points, X, and if
<tt>(X-P) x (N-P)</tt> (where P is the previous point)
is negative, we will set N to X.  After we have
iterated through each point, we will end up with the next point on the convex
hull.  See the diagram below for an illustration of how the algorithm works.
We start with P as the leftmost point.  Now, say that we have N and X as shown in
the leftmost frame.  In this case the cross product will be negative, so we will
set N = X, and there will be no other unused points that make the cross product
negative, and hence we will advance, setting P = N.  Now, in the next frame, we
will end up setting N = X again, since the cross product here will be negative.
However, we aren't done yet because there is still another point that will make the
cross product negative, as shown in the final frame.
<div align=center><img src="/i/education/geometry09.png"/></div>
The basic idea here is that we are using the cross product to find the point
which is furthest counterclockwise from our current position at P.  While this
may seem fairly straightforward, it becomes a little bit tricky when dealing
with colinear points.  If you have no colinear points on the hull, then the code is very
straightforward.
<pre class="code">
    convexHull(point[] X){
        int N = lengthof(X);
        int p = 0;
        <font color="blue">//First find the leftmost point</font>
        for(int i = 1; i&lt;N; i++){
            if(X[i] &lt; X[p])
                p = i;
        }
        int start = p;
        do{
            int n = -1;
            for(int i = 0; i&lt;N; i++){

                <font color="blue">//Don't go back to the same point you came from</font>
                if(i == p)continue;

                <font color="blue">//If there is no N yet, set it to i</font>
                if(n == -1)n = i;
                int cross = (X[i] - X[p]) x (X[n] - X[p]);

                if(cross &lt; 0){
                    <font color="blue">//As described above, set N=X</font>
                    n = i;
                }
            }
            p = n;
        }while(start!=p);
    }
</pre>
Once we start to deal with colinear points, things get trickier.  Right away we
have to change our method signature to take a boolean specifying whether to
include all of the colinear points, or only the necessary ones.
<pre class="code">
    <font color="blue">//If onEdge is true, use as many points as possible for
    //the convex hull, otherwise as few as possible.</font>
    convexHull(point[] X, boolean onEdge){
        int N = lengthof(X);
        int p = 0;
        boolean[] used = new boolean[N];
        <font color="blue">//First find the leftmost point</font>
        for(int i = 1; i&lt;N; i++){
            if(X[i] &lt; X[p])
                p = i;
        }
        int start = p;
        do{
            int n = -1;
            int dist = onEdge?INF:0;
            for(int i = 0; i&lt;N; i++){
                <font color="blue">//X[i] is the X in the discussion</font>

                <font color="blue">//Don't go back to the same point you came from</font>
                if(i==p)continue;

                <font color="blue">//Don't go to a visited point</font>
                if(used[i])continue;

                <font color="blue">//If there is no N yet, set it to X</font>
                if(n == -1)n = i;
                int cross = (X[i] - X[p]) x (X[n] - X[p]);

                <font color="blue">//d is the distance from P to X</font>
                int d = (X[i] - X[p]) &sdot; (X[i] - X[p]);
                if(cross &lt; 0){
                    <font color="blue">//As described above, set N=X</font>
                    n = i;
                    dist = d;
                }else if(cross == 0){
                    <font color="blue">//In this case, both N and X are in the
                    //same direction.  If onEdge is true, pick the
                    //closest one, otherwise pick the farthest one.</font>
                    if(onEdge &amp;&amp; d &lt; dist){
                        dist = d;
                        n = i;
                    }else if(!onEdge &amp;&amp; d &gt; dist){
                        dist = d;
                        n = i;
                    }
                }
            }
            p = n;
            used[p] = true;
        }while(start!=p);
    }
</pre>
<br/><br/>
<A href="/tc?module=Static&d1=tutorials&d2=geometry3">...continue to Section 3</A>
</p>


        </div>
        <p><br/></p>
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
