<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
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
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco06/onsite_photos/shot_room3.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">tomek wins Room 3</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="505963" message="Discuss this match" /><br>
Thursday, May 4, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
Semifinal round 3 proved to be the most exciting so far with tight
races and a slew of challenges.   The match started out slowly with many 
competitors taking over half an hour to submit the easy problem.  The
medium problem didn't prove much easier and it was about an hour
before anyone had two submissions.  John Dethridge tried to skip the
medium after he submitted the easy, but he quickly gave up, and went
back, getting the fastest time on the medium.  Going into the
challenge phase, John Dethridge had the lead, followed by ploh,
tomek, and halyvin, each less than a challenge away.  
<br><br>
The challenges phase yielded no fewer than 16 challenges, 6 of which
were successful.  With 2 of the successful challenges, tomek moved up
into first place, while ploh and John Dethridge both dropped 25
points.  The system testing phase proved uneventful by comparison, and
the top 6 remained unchanged: tomek and JD move on to the finals,
while ploh, reid, liympanda, and JongMan will have to fight it out in 
the wildcard round.</p>

<h1>TaylorAlgebra</h1>
by <tc-webtag:handle coderId="251317" context="algorithm"/>
<br><br>
As done in Apostol's wonderful calculus text, we define the nth Taylor operator (it takes a
function and produces the corresponding finite Taylor series).  This problem explores how
derivatives and integrals interact with the Taylor operator (and requires no knowledge of
calculus).  To solve the task at hand, we recursively descend into the given nested formula keeping
track of the number of D's and I's we have accumulated, and cancelling appropriately (no sense in
having both D's and I's).  Upon finding
a T, we compute the maximum number of D's (or I's) that can be pushed deeper without violating the
numeric constraints.  When we hit the deepest nesting level of the expression, we are left with an
'f'.  As we climb out of our recursive calls, we construct the return value by surrounding the
current formula with the correct number of D's, I's, and T's that were accumulated at that level (of
the recursion).

<h1>ModelRailroad</h1>
by <tc-webtag:handle coderId="277659" context="algorithm"/>
<br><br>
This problem has two parts:  calculating the number of
configurations, and handling the symmetry.  Consider
the number of consecutive straight sections as we go around
the circle as six numbers a, b, c, d, e, and f.  In order
for the loop to be closed, a+b must equal d+e, and b+c must
equal e+f.  These two equations also imply a third, that
c+d=f+a.  Using these equations, we can set any four of
the variables (say, a, b, c, and d) and compute the other
two.  Thus one possible solution is to iterate over all
possible values for a, b, c, and d, compute the other two,
and if they are nonnegative, consider it a found configuration.
This runs too slowly.
<br><br>
We can eliminate one of the loops by giving only a, b, and
c values, and then computing the range of values d can take
on that would result in a valid configuration.  These
equations can be calcuated by considering the equations
above, keeping d as a variable, and solving them for
e and f nonnegative, and the sum of all six numbers less
than straight.  The lower bound on d is the greater of
0 and a-c, and the upper bounds on d is the lesser of
a+b and n-a-2*(b+c).  Sum up the count of all possible
configurations, and call this n1.
<br><br>
This lets us enumerate all configurations ignoring symmetry.
To handle symmetry, we calculate in addition to the above
number the count of positions that have 6-symmetry (all six
60 degree rotations are identical); 3-symmetry (all three
120 degree rotations are identical), and 2-symmetry (both
180 degree rotations are identical).  We call these values
n6, n3, and n2, respectively.  Each of these can be
calculated very quickly because the number of free variables
is reduced to 1, 2, and 3, respectively.
<br><br>
To calculate the final answer, consider that every position
whose greatest symmetry is 1-symmetry has been counted six
times in n1 and no times in any of n2, n3, or n6.  Every
position whose greatest symmetry is 2-symmetry has been
counted three times in n1 and three times in n2.  Every
position whose greatest symmetry is 3-symmetry has been
counted twice in n1 and twice in n3.  Every position
that exhibits 6-symmetry has been counted once in each
of n1, n2, n3, and n6.  If sn is the number of positions
that have a greatest symmetry of n, then we have the following
equations:
<pre>
n1 = 6 * s1 + 3 * s2 + 2 * s3 + s6
n2 = 3 * s2 + s6
n3 = 2 * s3 + s6
n6 = s6
</pre>
The answer we desire is s1+s2+s3+s6, and we can easily solve
these equations to find that that answer is simply
(n1+2*n2+3*n3+2*n6)/6.


<h1>CompressedStringSearch</h1>
by <tc-webtag:handle coderId="277659" context="algorithm"/>
<br><br>
Operating on compressed representations of data is frequently key to
high-performance algorithms.  Sparse matrices and Binary Decision Diagrams
are just two examples of common data structures that are just compressed
representations of more natural formats.  Indeed, memoization itself
simply compresses the expression graph.  It is no surprise, then, that
memoization is key to this problem.
<br><br>
The first step to the solution of this problem is to ignore the
compression, and just consider calculating a string match by walking
the haystack character by character.  At any given point, the state
is the maximum number of characters in the needle that have been
successfully matched.  For every new character in haystack we see,
we calculate the next state based on the current state and the
new character.  When we reach a state that indicates we have
matched all characters, we have found our match.
<br><br>
Because of needles like "aabab" and input like "aabaabab", we cannot
simply start over at the beginning of needle every time we find a
mismatched character.  Instead, when we find a mismatch, we want
to find out the longest prefix of needle that is a suffix of the
part of haystack we have examined so far.
There are many ways to compute this state machine.  Perhaps the easiest
is to simply use a loop like the following:
<pre>
      for (int i=0; i&lt;needle.length(); i++) {
         String p = needle.substring(0, i) ;
         char c = needle.charAt(i) ;
         for (int j=0; j+i&lt;=needle.length(); j++)
            if (needle.substring(j, j+i).equals(p))
               nextState[j+i][c] = (i+1) ;
      }
</pre>
This works great so long as we have no compression.  As it turns
out, it is easy to add compression too; just consider a character
that represents a compressed string as another character, and
calculate what the next state is for a given input state.
With the potential of compressed strings representing huge
haystacks, this may seem to run too slow, but memoization makes
it easily run in time.
<br><br>
The only remaining complication is remembering the offset where
we found the needle.  To do this we simply calculate how many
total uncompressed characters we have consumed, and when we find
a match, return that value less the length of the needle.  In
order to keep the code clean, we can use an exception to return
the final match position.  Note that we can memoize both length
and search easily.
<pre>
   long length(char a) { // memoize this for speed
      if (!inDictionary(a))
         return 1 ;
      long r = 0 ;
      for (char c : expansion(a))
         r += length(c) ;
      return r ;
   }
   int search(String haystack, long pos, int state) throws Found {
      for (char c : haystack) {
         if (state == needle.length())
            throw new Found(pos-needle.length()) ;
         if (not_calculated(nextState[state][c]))
            nextState[state][c] = search(expansion(c), pos, state) ;
         state = nextState[state][c] ;
         pos += length(c) ;
      }
      if (state == needle.length())
         throw new Found(pos-needle.length()) ;
   }
</pre>
The rest is straightforward; if we get an exception indicating
the string was found, we extract the found position from that
exception and return it; otherwise, we return -1.
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
