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
<jsp:param name="tabLev3" value="room3"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotRoom3.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">Petr wins Room 3</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="506183" message="Discuss this match" /><br>
Thursday, November 16, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br /><br />
Coders started out strong on day 2, with <tc-webtag:handle coderId="10574855" context="algorithm"/> leading the pack and submitting the easy problem after 9 minutes.  He and <tc-webtag:handle coderId="8355516" context="algorithm"/> both made short work on of the medium problem, though <tc-webtag:handle coderId="10574855" context="algorithm"/> found a bug and had to resubmit his.  The hard problem proved difficult for everyone but <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="251074" context="algorithm"/>, each of whom scored over 700 points on it.

<p>The challenge phase proved very exciting as <tc-webtag:handle coderId="10574855" context="algorithm"/> extended his already substantial lead with six successful challenges.  As long as his hard submission held up, he was ensured a spot in the finals.  While the system tests managed to take down two of the remaining hard submissions, neither of them was <tc-webtag:handle coderId="10574855" context="algorithm"/>'s and so he coasted into the finals.  In second, <tc-webtag:handle coderId="251074" context="algorithm"/> was the the only other coder to solve the hard problem successfully.  <tc-webtag:handle coderId="8355516" context="algorithm"/>, <tc-webtag:handle coderId="263396" context="algorithm"/>, <tc-webtag:handle coderId="15805598" context="algorithm"/>, and <tc-webtag:handle coderId="8365685" context="algorithm"/> will
all get a second chanced later today.</p>

<h1>CodeSet</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>

<p>Competitors should have been familiar with many of the concepts in this problem.  Prefix-free encodings can be represented as a binary
tree, where the leaves are the codes.  Thus, the number of valid codes
of size <tt>k</tt> is just the number of binary trees with labeled
leaves.  Coders with a strong math background will immediately
recognize that this value can be computed in closed form using Catalan
numbers.</p>
<p>However, the fact that we must include our favorite bit string throws
a wrench in this simple elegant solution, and now we need to do a bit
of dynamic programming to get the answer.  First, we note that the
number of binary trees with <tt>k</tt> leaves, <tt>C<sub>k</sub></tt> 
can be computed as the sum from <tt>i=1</tt> to <tt>k-1</tt> of
<tt>C<sub>i</sub>*C<sub>k-i</sub></tt>.  This works because we can
think of installing a split at the root dividing the leaves into
groups of size <tt>i</tt> and <tt>k-i</tt>.  Now, to figure things out
including the favorite, we can think of our favorite sequence as just
being a sequence of zeros.  Then, when we compute the sum mentioned
above, we need to add another parameter, the length of the sequence of
zeros that must be included.  This value will either be an integer, or
null, where null indicates that the sequence of zeros has gone down
another path, so it doesn't apply.  So, in the case where this
parameter is not null, our recurrence changes to
compute <tt>C<sub>k,j</sub></tt>, where j is the length of the
sequence of zeros that must be included, by taking the sum over
<tt>i</tt> of <tt>C<sub>i,j-1</sub>*C<sub>k-i,null</sub></tt>.  In other words,
we send the sequence of zeros down the left branch, which
trims off the leading zero, hence reducing j by 1.  The computation of
<tt>C<sub>k,null</sub></tt> is as discussed for the case where we
don't need to worry about the favorite.  The last thing to think about
are the base cases, but these are straightforward, and can be seen in
the code below.
<pre>
int[][] a = new int[100][100];
int go(int n, int k){
	if(n == 1) return k &lt;= 0 ? 1 : 0;
	else if(n&lt;1 || k == 0)return 0;
	if(a[n][k+1]&gt;0)return a[n][k+1];
	int ret = 0;
	for(int i= 1; i&lt;n; i++){
		ret += go(i,k==-1?-1:k-1)*go(n-i,-1);
	}
	return a[n][k+1]=ret;
}
public int numSets(int n, String favorite){
	return go(n,favorite.length());
}
</pre></p>

<h1>CCWTurning</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>

<p>It turns out that a brute force solution will solve this problem with
plenty of time to spare.  In other words, for each segment in the
path, branch on all possible point we could put the next point.  It's
not hard to convince yourself that there will be at most 2 points.
However, 2<sup>30</sup> is too big, and so we need to work a bit
harder to convince ourselves that the brute force method will indeed
run fast enough.  Consider two adjacent segment lengths,
<tt>p<sub>i</sub></tt> and <tt>p<sub>i+1</sub></tt>.  If
<tt>p<sub>i+1</sub> %le; p<sub>i</sub></tt>, then there is only one
place we can put the end point of <tt>p<sub>i+1</sub></tt> (try
drawing a circle with a directed chord and you'll quickly convince
yourself).  This leaves the case where <tt>p<sub>i+1</sub> &gt;
p<sub>i</sub></tt>.  In this case, there are indeed two places we
could potentially put the endpoint of <tt>p<sub>i+1</sub></tt>.
However, if <tt>p<sub>i+2</sub> &gt; p<sub>i+1</sub></tt>, then one of
these two placements will lead to a dead end.  Furthermore, if
<tt>p<sub>i+2</sub> &le; p<sub>i+1</sub></tt>, there is only one
choice.  In other words, when we branch two ways, only one of those
two ways can branch again.<p/>
<p>Once you convince yourself that things will be fast enough, its just a
bit of geometry to implement everything.</p>  

<h1>Repeated Addition</h1>
by <tc-webtag:handle coderId="7390467" context="algorithm"/>

<p>Start off by aligning the rightmost (least significant) digits of
the number we're adding to and X.</p>

<p>Let N be the number written on paper. Observe that, when doing long
addition, the carry-over between digits is either 0 or 1. Consider how
N<sub>i</sub> (digit i of N, with digit 0 being the least significant)
changes when X is added once, depending on X<sub>i</sub> (the
corresponding digit in X):</p>

<ul>

<li>If X<sub>i</sub> is 0, then N<sub>i</sub> changes only when there
is carry-over from the previous digit.</li>

<li>If X<sub>i</sub> is between 1 and 8, then N<sub>i</sub> always
changes.</li>

<li>If X<sub>i</sub> is 9, then N<sub>i</sub> changes unless there is
carry-over from the previous digit.</li>

</ul>

<p>Knowing that we will be doing exactly (B-A)/X additions, the only
unknowns in the list above are the amounts of carry-over between
digits. If we knew carry<sub>i</sub>, the total amount of carry-over
coming out of position i when doing all the additions, we could
calculate the exact number of times each of the digits changes:</p>

<ul>

<li>If X<sub>i</sub> is 0, then N<sub>i</sub> changes
carry<sub>i-1</sub> times.</li>

<li>If X<sub>i</sub> is between 1 and 8, then N<sub>i</sub> changes
(B-A)/X*X times.</li>

<li>If X<sub>i</sub> is 9, then N<sub>i</sub> changes
(B-A)/X*X &ndash; carry<sub>i-1</sub> times.</li>

</ul>

<p>For a single position, carry-over is generated when the digit
in that position passes the boundary between 9 and 0. If we write the
total amount that is added to a position, the amount of carry-over is
obtained by dropping the least significant digit of that total. For
example, if we start off at 0 and add 7 sixteen times, we will have
totalled 112; the digit itself will be 2 and will have will generated
carry-over 11 (of 16) times. We also have to account for carry-over
from the previous digit. The final formula for the total amount of
carry-over generated in position i is carry<sub>i</sub> =
floor((A<sub>i</sub> + (B-A)/X*X<sub>i</sub> + carry<sub>i-1</sub>) /
10).</p>

<p>The final quirk in the problem was to handle newly appearing digits
as not changing.</p>
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
