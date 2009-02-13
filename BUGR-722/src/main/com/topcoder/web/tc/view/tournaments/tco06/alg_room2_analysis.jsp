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
<jsp:param name="tabLev3" value="room2"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco06/onsite_photos/shot_room2.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">misof wins Room 2</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="505962" message="Discuss this match" /><br>
Wednesday, May 3, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
The fact that only 7 submissions were successful in round 1 was not
enough to deter the round 2 competitors from the tried and true
strategy of solving the easy problem first.  Only nicka81 tried a
different strategy, skipping to the medium problem first.
<br><br>
But, this easy proved quite a bit more manageable than round one's,
and 3 competitors submitted it in the first 10 minutes.  After half an hour, all
but 3 of the competitors had submitted the easy problem, and Eryx and kalinov
had submitted the medium.
<br><br>
The mediums continued to roll in for the next 15 minutes when kalinov
submitted the hard problem with 40 minutes left to go.  gevak was next
to submit the hard with 30 minutes to go, but he skipped the medium,
so he was a distance second.  Furthermore, he found a bug in his hard
submission, and resubmitted for only 300 points, leaving him in 6th at
the end of the coding phase.  With three minutes to go, misof
submitted the hard problem, putting him in second place, far behind
kalinov.  
<br><br>
The challenge phase proved quite eventful.  First, natori took down
w_'s medium.  A couple of unsuccessful challenges followed.  Then,
about 5 minutes in, nicka81 took down all three hard submissions in
rapid fire.  This left Eryx in the lead with the fastest easy and
medium submissions, followed closely by nicka81.  kalinov, misof,
juwenjie, and andrewzta were in 3rd through 6th going into the system
tests.
<br><br>
While the system tests were not so brutal as those of round 1, they
knocked Eryx and kalinov out of the tournament, and sent nicka81 to
the wildcard round.  misof and fuwenjie survived them though, and
advanced to the finals.
</p>

<%-- EASY --%>
<h1>Alignment</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
This is a classic dynamic programming problem.  To solve it, we need
to compute the cost to align the first i characters of A with the
first j characters of B given that either a) the i<sup>th</sup>
character of A was aligned with the j<sup>th</sup> characters of B, b)
the i<sup>th</sup> character of A is aligned with a '-', or c) the
j<sup>th</sup> character of B is aligned with a '-'.<br><br>
To compute these values, we use the following simple recurrences (and of course
the correct base cases), where 0
represents case (a), 1 represents case (b), and 2 represents case (c):
<pre>
if(A[i] == B[j]){
    cost[i][j][0] = min(cost[i-1][j-1][0..2])
}
cost[i][j][1] = min(cost[i-1][j][0]+x+1,cost[i-1][j][1]+1,cost[i-1][j][2]+x+1)
cost[i][j][2] = min(cost[i][j-1][0]+x+1,cost[i][j-1][2]+1,cost[i][j-1][1]+x+1)
</pre>


<%-- MEDIUM --%>
<h1>FactCount</h1>
by <tc-webtag:handle coderId="159544" context="algorithm"/>
<br><br>
The facts here can be modeled as the edges in a directed graph in which each vertex is one of the uppercase letters. Edges can be loops (have the same vertex both as source and target of the edge).
<br><br>
At first the following greedy strategy comes to mind:  just throw out any edge for which there is an alternative path. Repeat until there is no superfluous edge. Example 2 shows that this will not work since for that case the minimum set of edges must include an edge that was inferred from known but was not contained in it. That suggests the strategy of completing the graph to include all inferable facts and then eliminating superfluous edges one by one -- but Example 2 shows that it still matters which superfluous edges you eliminate.
<br><br>
The problem (as is frequently the case with graph problems) stems from the existence of cycles. So we can start by eliminating the cycles in the following way. Break the vertices into equivalence classes where vertices are equivalent if there is a cycle that contains both of them (some vertices are not in any equivalence class, and, because of loops, some vertices are an equivalence class by themselves). If an equivalence class contains n vertices then we must have exactly n edges in our minimal set to describe that.  Now we can treat each equivalence class as a single vertex and the resulting graph has no cycles. We can apply our greedy strategy to that graph to find how many additional edges are needed.
<br><br>
Since the graph has no more than 26 vertices we can maintain it using a 26 x 26 Boolean array.
<br><br>
The resulting algorithm becomes:
<pre>
for each pair of vertices i,j with an edge from  i to j
   remove the edge
   if there is a path from j to i  //(do a depth-first search)
      mark j and mark i  (as being in an equivalence class)
      restore the edge from i to j
   else if there is still a path from i to j
      //do nothing: leave the superfluous edge removed
   else
      restore the edge from i to j and count it. //this edge is needed
//now add the number of edges needed for the equivalence classes
return the count plus the number of marked vertices
</pre>


<%-- HARD --%>
<h1>InverseSoundex</h1>
by <tc-webtag:handle coderId="7390467" context="algorithm"/>
<br><br>
It takes some time to get familiar with the problem and develop some sense of what's going on. We need to think backwards i.e. given a Soundex code, we are trying to count possible original strings. The given code says something about what the original string looked like; it says that certain classes of characters must appear in a certain order. The bulk of the problem is counting in how many ways we can fill the rest in. Here are a few observations to help us with that: 
<br><br>
The first letter of the string is always fixed (the one given in the code). It may be a vowel, H or W. 
H and W characters may be inserted arbitrarily in the string; they have no effect on the resulting code. For example, both BFV and BHFWHV yield a single 1 in the resulting code. 
Vowels can act as delimiters between 2 runs of the same digit, but don't appear in the resulting code. For example, BBB compresses to 1, but BBAAB compresses to 11. 
Related to the previous, if the input code contains a zero followed by a different digit, the answer is surely zero. 
If the code doesn't end in a zero (it did not get padded in step 6) and a string already yields the entire code, then appending whatever string to it doesn't change the code (it will have gotten truncated in step 6). 
<br><br>
With that in mind, there are several different approaches to the solving the problem, one of which is easier to get right than the others (read: the others are way too easy to get wrong). We can almost ignore the first letter, counting strings that result in the three given digits.
<br><br>
Consider the function f(len, prev, where), the number of ways of finishing the string, if we still have to place len more characters, the code of the previous character was prev and we've already generated where of the three digits needed. With these three values as our state, it is possible to construct a dynamic programming solution. The base case is when len=0, where we need to check if we've constructed the entire code (the result is either one or zero). Calculating the value of f(len, prev, where) involves adding every possible character and seeing which state it takes us to: 
<br><br>
Adding H or W requires us to calculate f(len-1, prev, where). <br>
Adding a vowel uses f(len-1, 0, where). <br>
Adding a character with the same code as the previous uses f(len-1, prev, where). <br>
Otherwise, we may only add character C if it has the right phonetic code (dictated by the value of where), and that takes us to f(len-1, code(C), where+1). 
<br><br>
There are a few more subtleties to the implementation, such as handling the first character when it is a vowel, trailing zeros and the padding/truncating in step 6, but this is the basic idea.
<br><br>
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
