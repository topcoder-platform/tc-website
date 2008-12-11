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
<jsp:param name="tabLev3" value="finals"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotAlgorithm.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">Petr is the new Algorithm Champion</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="506185" message="Discuss this match" /><br>
Friday, November 17, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>


This year's final round was bigger and better than any before.  With TopCoders <tc-webtag:handle coderId="270505" context="algorithm"/> and <tc-webtag:handle coderId="154754" context="algorithm"/> along with ESPN's Jeremy Schaap
being broadcast live by AOL, this year's competition was more exciting and accessible than in the past.  Members online were able to watch live as <tc-webtag:handle coderId="10574855" context="algorithm"/> chewed his pencil, trying to come up with good challenges.  But, on to the results.

<p>After breezing through his semifinal round, <tc-webtag:handle coderId="10574855" context="algorithm"/> was a strong favorite to win it all, especially considering the fact that <tc-webtag:handle coderId="144400" context="algorithm"/> had been knocked out.  But <tc-webtag:handle coderId="19849563" context="algorithm"/> has been on a roll recently, and he certainly wouldn't lay down easily.</p>

<p>However, it was <tc-webtag:handle coderId="10574855" context="algorithm"/> who struck first, submitting the easy problem first, and then finishing his medium before anyone else.  A number of other competitors were also able to submit their medium problems, and many were within striking distance in the challenge phase.  However, <tc-webtag:handle coderId="10574855" context="algorithm"/> was not done, and he submitted the hard problem, making him a strong favorite going into the challenge phase.</p>

<p>Unlike previous rounds, the challenge phase proved uneventful, as no submissions went down (though not for lack of flawed solutions).  The system tests were not so kind, though, as they knocked <tc-webtag:handle coderId="8355516" context="algorithm"/> and <tc-webtag:handle coderId="10157606" context="algorithm"/> out of second and third, as well as taking down <tc-webtag:handle coderId="10574855" context="algorithm"/>'s hard.  However, his scores on the first two problems would prove high enough, as he narrowly defeated second place <tc-webtag:handle coderId="19849563" context="algorithm"/>, and third place defending champ <tc-webtag:handle coderId="262056" context="algorithm"/>.  Congratulations to all the finalists, and especially <tc-webtag:handle coderId="10574855" context="algorithm"/>.</p>

<h1>Triominoes</h1>
by <tc-webtag:handle coderId="15231364" context="algorithm"/>

<p>This problem was about testing the pruning abilities of TCCC finalists. There were many possible solutions, all of which were some kind of bruteforce or backtracking with some pruning.</p>

<p>The first thing to notice is that you can see a hexagon as 6 ordered pieces. Instead of avoiding repetitions, it's easier to count every ordered list of 6 pieces that match (i.e., can be properly arranged according to the game rules) and then simply divide the final result by 6. Trying every possible list was too much, because we have n<sup>6</sup> selections and also 3<sup>6</sup> possible rotations for the pieces.</p>

<p>I'll describe only two possible approaches that lead to a short concise code:</p>

<p>1. Do not generate everything. A not-so-brute force is enough.</p>

<p>Instead of placing 6 pieces in each of the 3 rotations and test, just place 3 pieces in alternate spots and their rotations. You can see that after placing these 3 pieces, the other 3 are fixed, so we only need to test if they belong to the set. Since we can do each check in log(n) time (by having the pieces in a clever sorted structure, which most languages have embedded) the overall time of this approach is n<sup>3</sup>*3<sup>3</sup>*3*log(n), which fits perfectly for n less than or equal to 50.</p>

<p>But, beware! Avoid trying rotations of triples and also ban out hexagons that use the same piece more than once. This two little details could easily make you miss all the points (and probably give someone in your room a good +50 in the challenge phase).</p>

<p>2. Backtracking, cut as soon as you can.</p>

<p>After you place the first piece, if you want to continue placing them in order, then you can just stop if the i<sup>th</sup> piece does not match the (i+1)<sup>th</sup> one. Since there are at most 7 pieces that match another piece (because two of the numbers on the piece are fixed), you have a search tree that has n possibilities as the root and then "only" 7<sup>5</sup> nodes (there are 5 pieces left after placing the first one), for an overall number of nodes of n*5<sup>7</sup> that was also good enough to fit on time.</p>

<p>There were more prunings that could be used or added to each of these approaches, but were more complicated to think of and code quickly.</p>


<h1>TurtleGraphics</h1>
by <tc-webtag:handle coderId="277659" context="algorithm"/>

<p>This problem has two parts: parsing the command expression into the basic moves and operations combining these moves, and executing the moves themselves.  Direct simulation won't be fast enough because the total number of actual moves can get quite large.</p>

<p>Parsing the command expression itself is trivially done with a recursive descent parser, with two mutually recursive subroutines. One, getTerm(), is responsible for obtaining a single command, or a complex command in parentheses, and handling the repeat count. The other, getSequence(), is responsible for handling a concatenation of terms.  In this code, we are returning a type Val representing some "evaluation" of an expression of commands.</p>

<pre>
Val getTerm() {
   Val a ;
   if (nextChar() == '(') {
      skip() ;
      a = getSequence() ;
      skip() ;
   } else { // must be letter
      switch (nextChar()) { 
case 'F': a = F ; break ;
case 'U': a = U ; break ;
case 'D': a = L ; break ;
   ...
      }
   }
   if (isDigit(nextChar())
      a = repeat(a, nextChar() - '0') ;
   return a ;
}
Val getSequence() { 
   Val a = getTerm() ;
   while (moreCharacters()) {
      Val b = getTerm() ;
      a = concat(a, b) ;
   }
   return a ;
}
</pre>

<p>What should type Val contain?  It needs to contain the current direction the turtle is pointing, and a vector in three dimensions describing the motion of that command.  So, for instance, we might use something like:</p>

<pre>
class Val {
   Vector3D head, shell, rightFlipper ; 
   Vector3D motion ;
}
</pre>

<p>With head, shell, and rightFlipper containing the direction that the turtle's head, shell, and right flipper point (unit vectors in three orthogonal directions) at the end of the movement, the three of these together represent the turtle's current orientation. The motion field contains the total translation the turtle went through.</p>

<p>With this sort of representation, the movements themselves are simple to describe.  The 'U' movement has the turtle taking the original shell vector and assigning it to the head vector, and taking the original head vector and assigning its negative to the shell vector.  (The turtle turns toward the direction his shell is pointing, and his shell ends up pointing opposite the direction his head originally pointed.)  The other turn commands are similar.  The 'F' command simply adds the current head vector to the current motion vector. </p>

<p>The Val class depends, however, on the initial direction that the turtle is pointing.  One way to handle this is to create a vector of 24 Vals, one for each possible initial orientation the turtle might  have.  Then, you can look up which Val to use based on the initial orientation of the turtle.</p>

<p>No matter what our representation, we have two operations to implement:  concatenate (perform one command, then the second), and multiplication (perform a given, possibly complex, command some number of times).  To concatenate two vectors of Vals, represented by a and b, we simply iterate over all possible orientations, looking up the initial orientation in the vector a to get the orientation after executing a, and using that to look up the appropriate entry in b, and then adding the translation from the Val from a to the translation from the Val from b to get the overall translation from the result.  We also obtain the orientation from the result from the final orientation from b.</p>

<p>Multiplication then is just repeated concatenation.  Because we have a concise (constant space) representation of a complex command, there is no need to use any fancy tricks to speed up the multiplication; repeated concatenation works fine.</p>

<p>As it turns out, there is a very concise matrix form for all of the above operations.  Val can simply be a 4x4 matrix.  The first column of the matrix corresponds to the x direction, the second column to the y direction, and the third column to the z direction.  The fourth column is 0 for a direction vector, and 1 for a translation vector.  The first row represents the  direction the head points, the second row represents the direction the shell points, the third row represents the direction the right flipper points, and the fourth row represents the overall translation so far.</p>

<p>With this representation, each primitive command is just a simple matrix.  (Consider the 'U' command, that just flips the first and second rows, negating one of them; this operation is just the matrix:</p>

<pre>
[ 0 1 0 0]
[-1 0 0 0]
[ 0 0 1 0]
[ 0 0 0 1]
</pre>

<p>Similarly, the 'F' command simply is the identity matrix but with an additional entry to add the current head row to the translation row:</p>

<pre>
[1 0 0 0]
[0 1 0 0]
[0 0 1 0]
[1 0 0 1]
</pre>

<p>With this model, concatenation is simply matrix multiplication. After performing a sequence of operations through matrix multiplication, we can read off the x, y, and z oordinates directly from the first three elements of the fourth row.</p>



<h1>BuffetLine</h1>
by <tc-webtag:handle coderId="287269" context="algorithm"/>

<p>This problem can be solved recursively with memoization, although the state must be encoded carefully in order to keep the runtime and memory requirements under control.</p>

<p>The key is to realize that if you split the people in line into two groups, the first group and the second group, the order of people in the second group depends <i>only</i> on the positions of the <i>last</i> person in the first group. It does not depend on the order of people in the first group, or what the people before the last person did. So we can write a recursive function that takes 2 parameters:</p>

<ul><li>a list of all the people remaining to be placed in line</li>
<li>a description of where the last person already placed in line is at
every time</li></ul>

<p>The function can then simply loop over each person remaining to be placed, compute where that person will be at every time (which depends only on where the previous person was), and call itself with that person's positions and that person removed from the list of people to be placed in line.</p>

<p>To speed up this solution with memoization, we must encode these two parameters in a relatively small number of bits. The first parameter is easy -- we can just represent the list of people as a P-bit bitmask (where P is the number of people). The second parameter is more tricky. Realize that any person will never stay in front of a food item for more than 10 seconds. Therefore, we can encode a person's complete path through the line with an F-bit bitmask (where F is the total number of food items), where each bit indicates if the person stayed in front of a food item for 0 or 10 seconds. The 2<sup>P+F</sup> state space is only about 1 million with the constraints
imposed on P and F by the problem statement.</p>
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
