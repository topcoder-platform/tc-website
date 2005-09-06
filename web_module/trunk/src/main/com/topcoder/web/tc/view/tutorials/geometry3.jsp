<%@  page language="java"  %>
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

            <h2>Geometry Concepts: Using Geometry in TopCoder Problems</h2>

         <p>
         <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
         By&#160;<a class="bodyText" href="/tc?module=MemberProfile&cr=159052"><strong>lbackstrom</strong></a><br />
         <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
         </p>

<p>
<A href="/tc?module=Static&d1=tutorials&d2=geometry2">...read Section 2</A>
<br/><br/>
    <span class="outline1"><a href="#pointinpolygon">PointInPolygon</a></span><br/>
    <span class="outline1"><a href="#tvtower">TVTower</a></span><br/>
    <span class="outline1"><a href="#satellites">Satellites</a></span><br/>
    <span class="outline1"><a href="#more">Further Problems</a></span><br/>
    <br/><a name="pointinpolygon"></a>
        <a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4755&pm=2384">PointInPolygon (SRM 187)</a><br/>
        Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry2#line_line_intersection">Line-Line
            Intersection</a>, <a
            href="/tc?module=Static&d1=tutorials&d2=geometry1#line_point_distance">Line-Point
            Distance</a><br/><br/>
        First off, we can use our <a
            href="/tc?module=Static&d1=tutorials&d2=geometry1#line_point_distance">Line-Point
            Distance</a> code to test for the
        "BOUNDARY" case.  If the distance from any segment to the test point is 0,
        then return "BOUNDARY".  If you didn't have that code pre-written,
        however, it would probably be easier to just check and see if the test point
        is between the minimum and maximum x and y values of the segment.  Since all of
        the segments are vertical or horizontal, this is sufficient, and the
        more general code is not necessary.<br/><br/>

        Next we have to check if a point is in the interior or the exterior.
        Imagine picking a point in the interior and then drawing a ray from that
        point out to infinity in some direction.  Each time the ray crossed the
        boundary of the polygon, it would cross from the interior to the
        exterior, or vice versa.  Therefore, the test point is on the interior
        if, and only if, the ray crosses the boundary an odd number of times.
        In practice, we do not have to draw a raw all the way to infinity.
        Instead, we can just use a very long line segment from the test point to
        a point that is sufficiently far away.  If you pick the far away point
        poorly, you will end up having to deal with cases where the long segment
        touches the boundary of the polygon where two edges meet, or runs
        parallel to an edge of a polygon &mdash; both of which are tricky cases to
        deal with.  The quick and dirty way around this is to pick two large random
        numbers for the endpoint of the segment.  While this might not be the
        most elegant solution to the problem, it works very well in practice.
        The chance of this segment intersecting anything but the interior of an
        edge are so small that you are almost guaranteed to get the right
        answer.  If you are really concerned, you could pick a few different
        random points, and take the most common answer.
        <pre class="code">
String testPoint(verts, x, y){
    int N = lengthof(verts);
    int cnt = 0;
    double x2 = random()*1000+1000;
    double y2 = random()*1000+1000;
    for(int i = 0; i&lt;N; i++){
        if(distPointToSegment(verts[i],verts[(i+1)%N],x,y) == 0)
            return "BOUNDARY";
        if(segmentsIntersect((verts[i],verts[(i+1)%N],{x,y},{x2,y2}))
            cnt++;
    }
    if(cnt%2 == 0)return "EXTERIOR";
    else return "INTERIOR";
}
        </pre>

        <br/><br/><a name="tvtower"></a>
            <a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4735&pm=2260">TVTower(SRM 183)</a><br/>
            Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry2#circle">Finding a Circle From 3 Points</a><br/><br/>
In problems like this, the first thing to figure out is what sort of solutions
might work.  In this case, we want to know what sort of circles we should
consider.  If a circle only has two points on it, then, in most cases, we can
make a slightly smaller circle, that still has those two points on it.  The only
exception to this is when the two points are exactly opposite each other on the
circle.  Three points, on the other hand, uniquely define a circle, so if there
are three points on the edge of a circle, we cannot make it slightly smaller,
and still have all three of them on the circle.  Therefore, we want to consider
two different types of circles: those with two points exactly opposite each
other, and those with three points on the circle.  Finding the center of the first
type of circle is trivial &mdash; it is simply halfway between the two points.
For the other case, we can use the method for <a href="/tc?module=Static&d1=tutorials&d2=geometry2#circle">Finding a Circle From 3 Points</a>.
Once we find the center of a potential circle, it is then trivial to find the
minimum radius.
<pre class="code">
int[] x, y;
int N;
double best = 1e9;
void check(double cx, double cy){
    double max = 0;
    for(int i = 0; i&lt; N; i++){
        max = max(max,dist(cx,cy,x[i],y[i]));
    }
    best = min(best,max);
}
double minRadius(int[] x, int[] y){
    this.x = x;
    this.y = y;
    N = lengthof(x);
    if(N==1)return 0;
    for(int i = 0; i&lt;N; i++){
        for(int j = i+1; j&lt;N; j++){
            double cx = (x[i]+x[j])/2.0;
            double cy = (y[i]+y[j])/2.0;
            check(cx,cy);
            for(int k = j+1; k&lt;N; k++){
                <font color="blue">//center gives the center of the circle with
                //(x[i],y[i]), (x[j],y[j]), and (x[k],y[k]) on
                //the edge of the circle.</font>
                double[] c = center(i,j,k);
                check(c[0],c[1]);
            }
        }
    }
    return best;
}
</pre>
<br/><br/><a name="satellites"></a>
            <a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4720&pm=1812">Satellites (SRM 180)</a><br/>
            Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry1#line_point_distance">Line-Point Distance</a><br/><br/>

This problem actually requires an extension of the Line-Point Distance method
discussed previously.  It is the same basic principle, but the formula for the
<a href="/tc?module=Static&d1=tutorials&d2=geometry1#cross_product">cross product</a> is a bit different in
three dimensions.<br/><br/>
The first step here is to convert from spherical coordinates into (x,y,z)
triples, where the center of the earth is at the origin.
<pre class=code>
    double x = sin(lng/180*PI)*cos(lat/180*PI)*alt;
    double y = cos(lng/180*PI)*cos(lat/180*PI)*alt;
    double z = sin(lat/180*PI)*alt;
</pre>
Now, we want to take the cross product of two 3-D vectors.  As I mentioned
earlier, the cross product of two vectors is actually a vector, and this comes
into play when working in three dimensions.  Given vectors
<tt>(x<sub>1</sub>,y<sub>1</sub>,z<sub>1</sub>)</tt> and <tt>(x<sub>2</sub>,y<sub>2</sub>,z<sub>2</sub>)</tt>
the cross product is defined as the vector <tt>(i,j,k)</tt> where
<pre class=code>
    i = y<sub>1</sub>z<sub>2</sub> - y<sub>2</sub>z<sub>1</sub>;
    j = x<sub>2</sub>z<sub>1</sub> - x<sub>1</sub>z<sub>2</sub>;
    k = x<sub>1</sub>y<sub>2</sub> - x<sub>2</sub>y<sub>1</sub>;
</pre>
Notice that if z<sub>1</sub> = z<sub>2</sub> = 0, then i and j are 0, and k is equal to the cross
product we used earlier.  In three dimensions, the cross product is still
related to the area of the parallelogram with two sides from the two vectors.
In this case, the area of the parallelogram is the norm of the vector:
<tt>sqrt(i*i+j*j+k*k)</tt>.<br/><br/>

Hence, as before, we can determine the distance from a point (the center of the
earth) to a line (the line from a satellite to a rocket).  However,
the closest point on the line segment between a satellite and a rocket may be
one of the end points of the segment, not the closest point on the line.  As before, we can use the dot product to check this.
However, there is another way which is somewhat simpler to code.  Say that you
have two vectors originating at the origin, S and R, going to the satellite and
the rocket, and that |X| represents the norm of a vector X.  <br/>Then, the
closest point to the origin is R if
<tt>|R|<sup>2</sup> + |R-S|<sup>2</sup> &le; |S|<sup>2</sup></tt> and it is S if
<tt>|S|<sup>2</sup> + |R-S|<sup>2</sup> &le; |R|<sup>2</sup></tt><br/>
Naturally, this trick works in two dimensions also.
        <br/><br/><a name="more"></a>
<span class="bodySubtitle">Further Problems</span><br/>
Once you think you've got a handle on the three problems above, you can give
these ones a shot.  You should be able to solve all of them with the methods
I've outlined, and a little bit of cleverness.  I've arranged them in what I
believe to ascending order of difficulty.<br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4635&pm=1660">ConvexPolygon (SRM 166)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry1#polygon_area">Polygon Area</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=5000&pm=1359">Surveyor (TCCC '04 Qual 1)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry1#polygon_area">Polygon Area</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4372&pm=996">Travel (TCI '02)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry1#dot_product">Dot Product</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=52&pm=180">Parachuter (TCI '01 Round 3)</a><br/>
Requires: <a href="#pointinpolygon">Point In Polygon</a>, <a href="/tc?module=Static&d1=tutorials&d2=geometry2#line_line_intersection">Line-Line Intersection</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4750&pm=2411">PuckShot (SRM 186)</a><br/>
Requires: <a href="#pointinpolygon">Point In Polygon</a>, <a href="/tc?module=Static&d1=tutorials&d2=geometry2#line_line_intersection">Line-Line Intersection</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4670&pm=1960">ElectronicScarecrows (SRM 173)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry2#convexhull">Convex Hull</a>, <a href="/index?t=features&c=feat_040104">Dynamic Programming</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4375&pm=1008">Mirrors (TCI '02 Finals)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry2#reflection">Reflection</a>, <a href="/tc?module=Static&d1=tutorials&d2=geometry2#line_line_intersection">Line-Line Intersection</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4355&pm=924">Symmetry (TCI '02 Round 4)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry2#reflection">Reflection</a>, <a href="/tc?module=Static&d1=tutorials&d2=geometry2#line_line_intersection">Line-Line Intersection</a><br/><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4690&pm=1140">Warehouse (SRM 177)</a><br/>
Requires: <a href="/tc?module=Static&d1=tutorials&d2=geometry1#line_point_distance">Line-Point Distance</a>, <a href="/tc?module=Static&d1=tutorials&d2=geometry2#line_line_intersection">Line-Line Intersection</a><br/><br/>


The following problems all require geometry, and the topics discussed in this
article will be useful.  However, they all require some additional skills.  If
you got stuck on them, the editorials are a good place to look for a bit of
help.  If you are still stuck, there has yet to be a problem related question on the
<a href="/rtables/index.jsp">round tables</a> that went unanswered.<br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=5872&pm=2887">DogWoods (SRM 201)</a><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=5861&pm=2867">ShortCut (SRM 215)</a><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4780&pm=2451">SquarePoints (SRM 192)</a><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4464&pm=1142">Tether (TCCC '03 W/MW Regional)</a><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=5849&pm=2247">TurfRoller (SRM 203)</a><br/>
<a class="bodySubtitle" href="/tc?module=ProblemDetail&rd=4685&pm=2014">Watchtower (SRM 176)</a><br/>
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
