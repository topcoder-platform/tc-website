<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room1"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotRoom1b.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">Ying wins Room 1</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="506181" message="Discuss this match" /><br>
Wednesday, November 15, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
The TCCC kicked off this morning in San Diego with an exciting first round.  Most competitors were able to submit the easy problem relatively quickly, with <tc-webtag:handle coderId="19849563" context="algorithm"/> leading the pack.  The medium problem, however, proved to be the hardest of the set, and the competitors who didn't skip it had a rough time after their easy.  This left <tc-webtag:handle coderId="19849563" context="algorithm"/> in good shape, as one of the few competitors with the savvy to recall that a 600 point medium is often harder than a 900 point hard.  Before anyone had made significant progress on the medium, he submitted his hard for almost 700 points.  Other competitors eventually solved or gave up on the medium problem, though in the end none of those who submitted it passed system tests.  While he didn't know it, this left <tc-webtag:handle coderId="19849563" context="algorithm"/> in good shape going into the system tests, with the highest score on both the easy and hard problems.<br/><br/>
<br><br>
However, the failed mediums presented an opportunity for a competitor who was clever enough and bold enough to take advantage.  That competitor was <tc-webtag:handle coderId="10157606" context="algorithm"/>, with +225 in the challenge phase, enough to overcome <tc-webtag:handle coderId="19849563" context="algorithm"/> and ensure him a victory, assuming his problems held up.  Thus, going into the system tests, it appeared that <tc-webtag:handle coderId="10157606" context="algorithm"/> and <tc-webtag:handle coderId="19849563" context="algorithm"/> would advance to the finals, while <tc-webtag:handle coderId="260835" context="algorithm"/>, <tc-webtag:handle coderId="9927526" context="algorithm"/>, <tc-webtag:handle coderId="7459080" context="algorithm"/>, and <tc-webtag:handle coderId="144400" context="algorithm"/> would move on to the wildcard round.  However, shocking everyone, <tc-webtag:handle coderId="144400" context="algorithm"/>'s hard submission timed out, leaving him in 7<sup>th</sup>, and putting <tc-webtag:handle coderId="15094447" context="algorithm"/> in the wildcard round.
<br><br>
Congratulations to all the advancers, and good look in the next round!
<br><br>
<h1>Coherency</h1>
by <tc-webtag:handle coderId="159544" context="algorithm"/>
<p>First we might as well sort the given sequence. If any adjacent values differ by more than maxjump, the answer is 0.
</p>
<p>
The crucial values (articulation points?)  are the ones whose 2 neighbors differ by more than maxjump. Any sequence that visits a crucial point without first visiting either all of the values greater than it, or all the values less than it, cannot visit all the values without having too big a jump. So a non-jumping sequence cannot start at a crucial value or anywhere between 2 crucial values.
</p>
<p>
On the other hand, if we start at a value below the lowest crucial value (or at a value higher than the largest crucial value) we can successfully construct a non-jumping sequence by decreasing down to the lowest value skipping one value each time, and then finishing the sequence by increasing to the next available value at each step.
</p>
<p>
So the possible places to start are anywhere below the smallest crucial value, or anywhere above the greatest crucial value. So:
</p>
<p>
sort the sequence
if any adjacent pair differs by more than maxjump, return 0
find vlo and vhi the lowest and highest crucial values
if there was no crucial value, return the number of distinct values in the sequence
return number of distinct values less than vlo + number of distinct values greater than vhi
</p>

<h1>Architects</h1>
by <tc-webtag:handle coderId="159544" context="algorithm"/>
<br><br>
<p>
Originally this problem was going to be to design a building with smooth sides whose cross-sections could support the weight above them. It's a nice problem, but a little too easy to solve analytically as a differential equation problem instead of using approximation techniques.
</p>
<p> 
So this is a discrete version of that problem. Rectangular sections of a building are represented by boxes, stacked one on top of another.  They each have a height of 10, and each box must have the same width/length proportions as the given size of the bottom box.
</p>
<p>
The sizes must satisfy two constraints (the overhang rule and the strength rule), and the goal is to maximize the size of the roof.  This suggests that we should choose the box sizes from the known bottom box up, but this approach is too hard because the constraints for a box depend on the boxes above it, not the ones below it.
</p>
<p>
So the key is to recognize that we can easily solve the reverse problem: given the roof size we can construct the building from the top down trying to minimize the size of the bottom box. The greedy strategy of choosing the smallest possible box solves that problem. And it is clear that the bigger the starting roof size, the bigger will be the size of the bottom box. So we can use bisection to find the roof size that corresponds to the desired size of the bottom box.
</p>
<p>
The pseudocode for solving the problem of minimizing the bottom size given some roof_area would be
<pre>
top box area = roof_area;
for each box down
    minO = smallest allowed so previous box doesn't overhang too much
            if(this is bottom box)
                  minS = smallest area that will support all previous boxes
            else
                  minS = smallest area that will support itself + all previous boxes
            this box area = maximum(minO, minS)
</pre>
</p>
<p>
The full (horizontal) diagonal of a box is the diagonal of the bottom box times the square root of the ratios of its area to the area of the bottom box. The overhang from a box with area Aj on top of a box with area Ak is half the difference in their diagonals. Solving algebraically, we get that the overhang is 50 when 
50 = .5* sqrt( (w*w+l*l)/(w*l) ) * ( sqrt(Aj) - sqrt(Ak) )
 where w and l are the given width and length of the bottom box.  So minO is either 0 (when Aj has a diagonal less than 100) or  minO is (sqrt(Aj) - mess)2 where mess is a fixed number.

minS (except for the bottom box) is calculated from the equation   minS*K = minS*10 + sum_of_previous_volumes.  Thus minS = sum_of_previous_volumes / (K-10) provided that K>10.
</p>
<p>
Now putting it all together, we first take care of the special case n=1. In that case there is only one box whose size is given.

If K<10 then no box (other than the bottom box) can support its own volume so the answer is -1. If K=10 the only possible solution is when n=2 and the top box can be as big as the given bottom box.

Finally we do bisection starting with lo=0 and hi = 10^99   (overkill, since the overhang rule by itself makes it impossible for the roof to be too big). Bisecting 1000 times will reduce the gap between lo and hi to 10^-200  or the machine accuracy and doing it this way guarantees that you won't get in an infinite loop with machine accuracy issues.
</p>

<h1>Amazing</h1>
by <tc-webtag:handle coderId="277659" context="algorithm"/>
<br><br>
<p>
Exhaustive search won't quite work.  Ten trips, with eleven endpoints,
each of which can be any of ten cities, gives an overall count of 
10^11 routes to evaluate.  If it were just five trips, we could do it.
So we need a way to do each half of the trip separately, and then
somehow combine the two searches to get a final answer.
</p><p> 
Let us say we have a list of all possible 5-trip solutions, weighted
appropriately for the first half, and a second list of all possible
5-trip solutions, weighted appropriately for the second half.
Can we somehow find the best pair of solutions from these lists 
without enumerating them all?  Absolutely.  All we need to do is
scan the lists with two pointers, at every step keeping the total
as close to our target as possible.  The following elegant code
does that, given a target and sorted arrays a and b: 
</p>
<pre>
int i = 0 ;
int j = b.length - 1 ;
int best = Math.abs(a[i] + b[j] - target) ;
while (true) {
   value = a[i] + b[j] ;
   best = Math.min(best, Math.abs(value-target)) ;
   if (value < target && i+1 < a.length)
      i++ ;
   else if (j > 0)
      j-- ;
   else
      break ;
}
</pre>
<p>
It essentially iterates over one array, tracking the value in the other 
array that takes us closest to the target.  At each step it uses the
information on whether it is too high or too low to decide which
pointer to advance.  When it can no longer improve the result, it
exits.
</p><p>
Only two minor complications remain.  The trips must be joinable;
the first half must end in the same city the second half starts.
In order to handle this, we simply wrap an outer loop around the 
whole algorithm that iterates over the possible cities, and requires
that the first half end at the first city and the second half start
at the second city.
</p><p>
Dealing with the difficulty factors is straightforward; the weight at 
trip i is simply factor^i.
</p>






        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
