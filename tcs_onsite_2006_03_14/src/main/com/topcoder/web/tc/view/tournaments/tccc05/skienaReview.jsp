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
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="skiena"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
            
         <p class="bigTitle">TCCC05 in Review, by Steven Skiena, PhD</p>
As a programming contest maven (which is Yiddish for "self-proclaimed
expert"), I found attending the finals of the TopCoder Collegiate Challenge
a very interesting experience.
<br><br>
I was extremely impressed with the caliber of the students who made
the finals.   Obviously they were all great hackers, but they were also a
much more interesting, accomplished,  and well-rounded gang than I could
have expected.   In particular, I was amazed that the winner of the
algorithms competition, Mathijs Vogelzang, was a medical student. 
Several of the other finalists were math and physics students, and most
of the students I talked to were pursuing advanced degrees.  I particularly
recall interesting discussions on the Australian economy with John Dethridge
and the state-of-the-art in natural language processing with David Vickrey,
<br><br>
I have been asked to comment on the three problems appearing in
the final round.    The Level One problem concerned counting how many
strings could be formed on a three-letter alphabet avoiding two forbidden
strings S1 and S2 as substrings.   The input lengths are clearly too large
to permit a construct-and-test solution.   Instead, one must use dynamic
programming, where the state reflects the number of strings of a given
length ending in the last i characters of S1 and last j characters of S2.
That both mathijs and tomek could get this working correctly with so much
time pressure is an impressive feat.
<br><br>
The Level Two problem concerned finding the comparison plan for
minimum cost sorting of files under an unusual cost function.   Readers of
Knuth, volume 3 on optimum sorting (pages 181-195) will recall that finding
such optimal comparison plans require enumerating through partial orders.
The number of partial orders on up to six elements is a large number, and
hence the key to this problem is doing this efficiently enough.  Attempting
this problem requires considerable courage (I called it something different
during my talk..) because it is hard to be certain that it will complete
in time.  This was a very tough problem.
<br><br>
The Level Three problem asked for the optimal evaluation strategy
to bound the maximal value of a unimodal function.   This problem was a little
dirty, in that there was a very simple solution based on Fibonacci numbers
if you saw it.   Indeed, if you go to Knuth, volume 3 on Fibonacci search
(pages 414-416) it describes a Fibonaccian search procedure that can be
used for this problem.
<br><br>
That two of these problems have solutions at least inspired by good
old Knuth should be a lesson to TopCoder contestants -- spend some time with
his wonderful old books.  You can ignore the assembly language, but enjoy
the problems and ideas which always seems to pop up in amazing places.
<br><br>
Steven Skiena<br>
Dept. of Computer Science<br>
SUNY Stony Brook
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
