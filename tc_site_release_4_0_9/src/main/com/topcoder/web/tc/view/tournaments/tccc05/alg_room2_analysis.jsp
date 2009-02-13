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
<jsp:param name="tabLev3" value="room2"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
            
        <p class="bigTitle">ploh wins Room 2</p>

		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tccc05/onsite_photos/shot_room2.jpg" alt="" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">ploh after his victory in Room 2<br/><br/></span>
		</div>

		<a href="/tc?module=MemberProfile&cr=159052"><img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/tc?module=MemberProfile&cr=159052">lbackstrom</a>, <br/>
		<em>TopCoder Member</em><br />
		Thursday, March 10, 2005<br/>
		<br/><br/>
		</p>

		<p>
Im2Good, the only Java coder in the round, started out fastest submitting the first two problems in 25 minutes.  He was also the first to submit the third problem, but ploh and overwise were faster, and overtook Im2Good when they submitted.  John Dethridge, the favorite to win, ended up in fourth place going into the challenge phase.  During the challenge phase, no one was able to find any bugs, so ploh retained the lead going into the system tests.  As the tests rolled out, overwise and AdrianKuegel failed their hard problems, while Im2Good failed the medium.  ploh's submissions all survived though, and he beat second place John Dethridge by a wide margin. Im2Good was the only other coder to solve the hard problem, so he will also move on to the wildcard round.
<br><br>
<h1>Shouting</h1>
For a given shouting distance, we can compute whether everyone can
reach everyone else in O(N^3) with Floyd-Warshall.  There are
N*(N-1)/2 pairwise distances between the different points.  Trying
each of those distances as the shouting distance will result in an
O(N^5) algorithm, which should run in time for N=50.
<br/><br/>
<h1>Switching</h1>
To compute the fewest switches that could occur overall, you can solve
the subproblem of determining the fewest switches that could occur up
to the end of a particular tick, given that a particular process is
running at the end of the tick.  To compute this you can
use dynamic programming.  For a particular tick, compute the number of
processes that recorded that tick.  Then, if process i is going to be
the process that runs last at the current tick there are three cases
to consider: 
<ul><li>Process i was running at the end of the previous tick</li><li>A
process that recorded the current tick was running at the end of
the previous tick</li><li>A process that did not record the current tick
was running at the end of the previous tick.  
</li></ul>

These three cases
require n, n-1 and n switches, respectively, where n is the number of
processes that record the tick.  There is a special case
when there is only one process that runs during the current tick, and
it was also the last process running during the previous tick.
<br/><br/>
<h1>ChartError</h1>
One way to compute the minimum chart error is to try bar_values that
minimize the error between a pair of bars of particular sizes.  The
bar_value that gives the overall minimum will be one of the bar_values
that minimizes the error for a pair of bars.  If we pick a bar_value
of x, the error for a particular bar is abs(x*c-val[i]), where c is
the number of 'X's in the bar.  To find the values of x and c, you
simply iterate over the the total number of 'X's in the pair of bars.
The value of x is (val[i]+val[j])/k, where k is the number of bars in
the pair of bars.  See ploh's solution for a simple implementation of
this.
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
