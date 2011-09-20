<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="summary"/>
        <jsp:param name="tabLev3" value="wildcard"/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>cyfra wins the Wildcard round!</span></h1>
            <p><img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
            <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518017">Discuss this match</A><br />Thursday, November 1, 2007<br />Introduction by <tc-webtag:handle coderId="303644" context="algorithm"/></p>
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/shotR4.jpg"></p>
            <br /><br />
            
            <p><strong><tc-webtag:handle coderId="2057853" context="algorithm"/> has provided yet another excellent <a target="_blank" href="http://www.topcoder.com/wiki/display/tccc07/2007/11/01/Algorithm+Wild+Card">play-by-play</a>.  Be sure to check out the action from the Wildcard round.</strong></p>


            
<br /><br />
<p>by <tc-webtag:handle coderId="8357090" context="algorithm"/></p>

<h2>RandomWalks</h2>

<p>
Each time we want to make a new move, at least one of four directions is available.
Thus the expected number of random attempts necessary to find a good direction is at most four.
As we have to simulate at most 200,000 steps, this tells us that we'll need to check roughly 800,000 attempts to make a step.
</p>

<p>
The first possible approach is to use some balanced data structure to store the segments of the generated path so far. The simplest way how to implement this is to represent each segment by four integers -- the coordinates of both endpoints. Now, to check whether our next step is allowed, we simply check whether our data structure already contains the segment that corresponds to the move we want to make.
</p>

<p>
A relevant part of C++ code:
</p>

<pre>
typedef pair&lt;int,int&gt; PII;
typedef pair&lt;PII,PII&gt; edge;
set&lt;edge&gt; used;

// ...

while (1) {
  int d = nextDir();
  int nx = x + dx[d];
  int ny = y + dy[d];
  edge E( PII(x,y), PII(nx,ny) );

  if (used.find(E) == used.end()) {
    used.insert( edge( PII(x,y), PII(nx,ny)) );
    used.insert( edge( PII(nx,ny), PII(x,y)) );
    x=nx; y=ny;
    path += directions[d];
    if (path.size() &gt; 200000) break;
    if (x==0 &amp;&amp; y==0) break;
  }
}
</pre>

<p>
The second possible approach was to allocate a large two-dimensional array, and to "draw" the path right into the array. Should the path leave the array, return an empty string.
</p>

<p>
At the first sight, such a solution should not work. It would seem that we would need an array that is 100,000 long in each dimension, and that goes far above the memory limit. However, there is one important issue -- our path is random. It is extremely improbable that a closed path of less than 200,000 steps should leave very far from the origin.
</p>

<p>
In fact, for our problem an array reaching from -600 to 600 in each direction was sufficient.
Of course, in a contest one should allocate as much as fits the memory limit, just to be on the safe side.
</p>

<h2>Overhang</h2>

<p>
How to pick the beam where it is best to attach the load? We will try all possibilities and pick the best one.
</p>

<p>
Once we decided which beam carries the weight, we have to distribute the remaining ones so that our beam is as far to the right as possible. We will show that this can be done in a greedy fashion.
</p>

<p>
First, consider the beams above our beam. The only two things that
matter: First, they have
to form a stable configuration. Second, their total center of mass must be above our beam, but we want it to be as far to the left as possible.
</p>

<p>
We will simply place these beams so that their centers are exactly above the left end of our beam. This configuration is obviously stable, and its center of mass is exactly at the left end of the beam that carries the load. (Thus counterbalancing the load as much as possible.) </p>

<p>
Now we include our beam and the load into the configuration. We can compute its current center of mass, and treat it just like a beam with the total weight of all current beams and center at that position.
</p>

<p>
What remains is to add the beams below our beam. We will add these beams one at a time, each time computing their optimal placement. The point is that in each step we want to move the total center of mass as far to the left as possible -- we gain nothing by making a suboptimal choice at some point, it won't help us later. Thus each time we are adding a new beam, we want to place it as far to the left as possible. The leftmost valid position is when the right end of the beam coincides with the current center of mass.
</p>

<p>
After we placed all the beams, we have to place the entire structure on the rooftop so that its current center of mass will be exactly on the edge of the roof.
</p>

<h2>Polygon</h2>

<p>
Coordinate compression is probably the easiest way how to solve this task.
</p>

<p>
Take the X coordinates of all vertices, sort them and remove duplicates.
Let the
resulting sequence be x<sub>1</sub>, x<sub>2</sub>, ..., x<sub>k</sub>.
</p>

<p>
Now, these are the only X coordinates where something interesting happens.
If, say, x<sub>2</sub>=47 and x<sub>3</sub>=59, we can be sure that the columns
48 to 58 are all exactly equal.
</p>

<p>
We can now split all the lattice points inside the polygon into 2k-1
groups:
one for each x coordinate where some vertices lie, and one for each group of columns in between these coordinates. For each group, we can easily compute how many lattice points does each column of the group contain.
</p>

<p>
(For columns that don't contain a vertex we just take all horizontal edges that pass through the given group of columns, sort them according to their Y coordinate, and sum the lengths of intervals between edges at even and odd positions. For columns with vertices one has to take vertical edges into account, but the idea remains the same) </p>

<p>
Now, given K, we can use a simple linear search to find the exact X coordinate where the K-th point is. Moreover, we can compute its order in this column as (K minus (total number of points in previous columns)).
</p>

<p>
We are left with a one-dimensional version of the original problem, and that can easily be solved in a similar way.
</p>


            
            

        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>