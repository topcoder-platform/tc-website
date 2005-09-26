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
<jsp:param name="tabLev3" value="room1"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
            
        <p class="bigTitle">tomek takes Room 1</p>

		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tccc05/onsite_photos/shot_room1.jpg" alt="" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">One very happy finalist<br/><br/></span>
		</div>

		<a href="/tc?module=MemberProfile&cr=159052"><img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/tc?module=MemberProfile&cr=159052">lbackstrom</a>, <br/>
		<em>TopCoder Member</em><br />
		Thursday, March 10, 2005<br/>
		<br/><br/>
		</p>

		<p>
The competitors got off to a slow start on a tricky easy problem. Before long though, many of them had moved on to the medium problem. misof and tomek were the first two to submit it, and they moved on to a hard problem with plenty of time to spare.  Eventually, they both submitted the third problem, and tomek had the lead over misof going into the challenge phase.  ante was in third place, as the only other competitor to submit all three problems.  Despite a flurry of challenges during the challenge phase, only one of them was successful, but it was significant in that it gave misof the lead over tomek going into system tests.  That lead turned out to be short lived though, as only tomek's medium survived testing.  In the end, tomek won as expected, and misof and ante moved on to the wildcard round.
<br><br>
<h1>Buoyancy</h1>
There are 4 different cases to think about.  The object may be either
less dense than water, or more dense than water, and it may either
rest on the bottom and stick out of the water, or not.  Rather than
coding for each of the four cases separately though, we can solve the
problem with only two cases.  First, calculate the amount of water
that the object can displace.  This is equal to the minimum of its
volume and its weight.  Then, determine if the object will rest on the
bottom or not, and return the appropriate value:
<pre>
    double displace = objWt &gt; objHt ? objHt : objWt;
    if(wid*len*waterHt/(wid*len-1)&gt;displace){
        return waterHt+displace/wid/len;
    }else{
        return wid*len*waterHt/(wid*len-1);
    }
</pre>

<h1>Symbolic</h1>
There were two aspects to this problem.  The first thing you had to
deal with was precision.  The input is a string with up to 19
digits after the decimal point, and even long double in C++ won't cut
it.  However, the operations are fairly simple to code yourself, and
you can just work with numbers as strings.  Once you do that, its
simply a matter of simulating the itinerary of the input.  As long as
the simulated itinerary agrees with the input itinerary, just continue
the simulation.  Once you get to the first disagreement, you need to
either return -1 or 1.  Which of these you return depends just on the
number of 1's in the input itinerary up to an including the
disagreement.  If the number is 0 modulus 2, return 1, otherwise
return -1.  This works because when the number is 0 modulus 2, it
means that a larger starting value gives a larger value at the point
of disagreement.
<br/><br/>

<h1>Disaster</h1>
This problem required a combination of a graph algorithm with a little
bit of calculus.  The expected amount of corn delivered along a
particular route is the product of the amount of corn, the goodnesses
of the segments of the route, and (1-b*load)<sup>len</sup>, where len is
the number of segments in the route.  We can compute the maximal
goodness for a route from 0 to j of length k with some fairly simply
dynamic programming:
<pre>
    double[] best = new double[g.length];
    best[0] = 1;
    double ret = 0;
    for(int k = 1; k&lt;=50; k++){
        double[] next = new double[best.length];
        for(int i = 0; i&lt;g.length; i++){
            for(int j = 0; j&lt;g.length; j++){
                next[j] = Math.max(next[j],best[i] * g[i][j]);
            }
        }
        best = next;
        //best holds the maximal probability for a route to each
        //vertex of length k
    }
</pre>
Once we know the maximal probability of a route to city 1 of length
k, we can use calculus to find the best load.  The expected amount of
corn delivered is:
<pre>
    expected(load) = load * best[1] * (1-b*load)<sup>k</sup>
</pre>
Taking the derivative of this and solving for 0 gives us the maxima.
If you chug through the equations, you'll find that load = 1/(b+b*k).

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
