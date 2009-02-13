<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10796">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516073" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 376</span><br />Wednesday, November 14, 2007
<br /><br />



<h2>Match summary</h2> 

 

<p> 
Div 1 competitors were greeted with a fairly straightforward easy involving train driving and a brutal medium that was a train wreck (with only 21% of submissions correct).  The level of competition was extremely strong, featuring a large number of targeteers and tournament winners.  Entering the challenge phase, <tc-webtag:handle coderId="10574855" context="algorithm"/> was in 22nd place after a fairly late resubmit.  I had pretty much written off his chances, because I do not learn well, but he clawed his way back to the top with 8/9 successful challenges (and a few failed submissions from his competitors).  In the process, he identified every incorrect solution in his room, except the one <tc-webtag:handle coderId="10597114" context="algorithm"/> was able to snatch first.  I suggest we add "system test" to his list of nicknames.</p>

<p>In div II the top 4 were the only ones to solve the hard correctly, with the powerful <tc-webtag:handle coderId="22628875" context="algorithm"/> forcing his way into top spot with fast submissions and three successful challenges.
</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=8378&amp;rd=10796" name="8378">PunctuationCleaner</a></strong> 

</font> 

<A href="Javascript:openProblemRating(8378)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516073" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      458 / 520 (88.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      389 / 458 (84.93%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>ACM_WYX</strong> for 249.75 points (0 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      191.47 (for 389 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Competitors took a few different approaches with this problem.  Perhaps the most straightforward approach is  
to walk through the string character by character, and deal with the excess punctuation as we go.  When we 
encounter non-punctuation characters, we add them to our return string.  When we encounter exclamation points 
or question marks, we do not add them to the return immediately, but instead note their occurence.  Then, 
when the group of punctuation characters ends (when we see a non-punctuation or the end of the string), we 
add in the single '!' or a '?' to mark the group we saw.</p>
 
<p>Alternatively, we could use a generic "replace" function. There's too many possible combinations of '!' and 
'?' characters to do this all in one shot - but we can get the job done by processing the string a number of 
times.  For example, if we repeatedly replace "!!" with "!", we'll eventually convert any number of "!" 
characters into one.  With question marks, we need to replace each of "??", "?!", and "!?" into a single 
question mark.  Because the whole string is only 50 characters, we can simply do all of these replacements 50 
times and be sure we've caught everything.</p>
 
<p><strong>Reader Activity Funtime:</strong> There's also a very tidy solution available using <a 
href="/tc?module=Static&d1=tutorials&d2=regularExpressions">Regular Expressions</a>.  
Try building the two appropriate "replace" commands?  Or, for bonus kudos, can you solve the problem with one 
replace command?  (Hint: I don't know, because I am bad with regular expressions).
</p>

 

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=6555&amp;rd=10796" name="6555">Trainyard</a></strong> 

</font> 

<A href="Javascript:openProblemRating(6555)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516073" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      237 / 520 (45.58%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      107 / 237 (45.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>dwahler</strong> for 436.67 points (11 mins 9 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      262.37 (for 107 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      419 / 437 (95.88%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      297 / 419 (70.88%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Eryx</strong> for 239.28 points (6 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      172.85 (for 297 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem doesn't require anything fancy in terms of algorithms with long names, but did require some care 
to ensure the train wouldn't go "off the tracks", so to speak.  Basically, we find the shortest path to each 
location, and then count how many of those locations are reachable using the amount of fuel given.  A 
breadth-first search would work.  Or Dijkstra, or Bellman-Ford, or Floyd-Warshall.</p>
 
<p>But the simplest approach is probably plain old depth-first search.  Starting at the 'S', recursively explore 
every direction the train can go.  It takes some care to ensure that we only go in directions that follow the 
tracks, but this part should be straightforward.  As part of the recursive call, pass along the amount of 
fuel remaining.  The base case for the recursion is when the fuel reaches 0.  </p>
 
<p>Because the maximum fuel available is only 10, we don't need any further memoization or tricks to ensure this 
will run on time.  In fact, we can get ourselves into trouble if we use a "visited" array to stop processing 
certain paths.  If we mark a certain location as visited when we see it on one path, we can prevent ourselves 
from considering it again as part of a shorter path.  This means we may not reach some locations further down 
that track, leading to a wrong answer.</p>
 
<p><strong>Reader Activity Funtime:</strong> If we had more fuel available, we'd need to use either a better shortest path 
algorithm or do some memoization.  Estimate how many fuel units could be available before the naive solution 
described above fails (using normal TopCoder constraints).
</p>

 

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=8261&amp;rd=10796" name="8261">JollyJumpers</a></strong> 

</font> 

<A href="Javascript:openProblemRating(8261)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516073" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      35 / 520 (6.73%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      4 / 35 (11.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>eminemxh</strong> for 646.75 points (23 mins 56 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      569.32 (for 4 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Once again, we're faced with a number of possible search-based solutions, though in this case we're searching  
through more of an abstract state space than the trainyard above.  In checking some of the test cases before the contest, I found a lot of problem instances were enjoyably tricky, at least as a human whose search algorithms are a little slow.</p>  
 
<p>All of the successful solutions used breadth first search (BFS).  To do a BFS, we start at our initial 
position and explore the states that are one move away, then those that are two moves away,   continuing out 
until there are no reachable positions we haven't looked at. To accomplish this, we store a the list of game 
states we want to evaluate in a queue and process the states in order until the queue is empty.</p>
 
<p>For each state, we need to store two things: the current state of the board, and the score we've received by 
the time we've reached this state.  Each of the 16 squares on the board either has a pawn or doesn't, so we 
can store the state of the board conveniently in a 16 bit number (which makes it easy to memoize).  We track 
score so that we can identify the highest score we've reached and also so that we know whether we need to 
evaluate a position.  It's possible we may reach the same position in multiple different ways with different 
scores.  We only want to evaluate a position again if we're reaching it a better way (that is, with a higher 
score) than we did previously, so for each state we remember the highest score we've reached that state with.</p>

<p>It's worth noting why depth first search (DFS) is more difficult to implement here.  The problem is that we  
need to memo our results in order to run on time, but we also need to avoid cycles while processing.  Suppose 
we're evaluating state A, which can move to state B.  To evaluate state A, we thus need to evaluate state B.  
While evaluating state B, we have to avoid evaluating state A or else we'll have an endless loop.  However, 
suppose the best chain of moves from B is B-&gt;A-&gt;C.  Our evaluation of A will be fine, as we'll eventually try 
A-&gt;C, and A-&gt;B-&gt;A-&gt;C wouldn't do us any good anyways (for this problem).  However, as a side effect of 
calculating the right answer for A we calculate the wrong answer for B and store that in a permanent memo.  
The answer for B is wrong because we avoided considering the best path because it included A.  
The moral of this sad tale is that DFS is often difficult to memoize correctly, and should be used with 
caution when a search can involve cycles.</p>
 
<p><strong>Reader Activity Funtime:</strong> If the cost of moving horizontally was changed to zero, how could we represent state
more efficiently?
</p>

 

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=8045&amp;rd=10796" name="8045">MarbleMachine</a></strong> 

</font> 

<A href="Javascript:openProblemRating(8045)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516073" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      119 / 437 (27.23%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      26 / 119 (21.85%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Petr</strong> for 312.94 points (25 mins 25 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      235.82 (for 26 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Finally we get to a problem with no searching - just a simple simulation of a fairly easy to simulate system. 
 The only reason this is not an Easy is the constraint on <strong>t</strong>: we might need to simulate up to 
100,000,000 moves.</p>
 
<p>There are a number of possible approaches here.  We could simulate the machine over a shorter time and watch 
for patterns (and this is probably the simplest solution, though tricky to get right).  We could try to 
reduce the machine into a simpler one that's faster to simulate.  Actually, I don't know if we could do that. 
 It sounds hard. </p>
 
<p>Anyways, the approach used in the reference solution (and the one I'll describe here) is to aggregate the 
moves into "multiple moves" so that we can simulate time in larger chunks.  If we store the current number of 
marbles on each position as a vector, then the actions of all the devices at each point in time can be 
described as a matrix with one row for each position (meaning, for the largest case, we'll have a 64x64 
matrix because there are at most 64 squares on our grid).  </p>
 
<p>Constructing the matrix for the actions on a given time period is fairly simple.  If the marbles move South 
from location 0,0 to location 0,1, then we simply need to put a 1 in the matrix entry connecting those two 
locations.  If the marbles from a location are dropped, we just end up with all 0s in that location's matrix 
row.  The slightly more difficult case is when we bring in marbles from the central supply.  The simplest way 
to handle this is to add a constant 1 to our vector - and another row and column to our action matrices to 
keep this number at 1.  This number can then be referenced whenever we need to add new marbles to various 
grid locations.</p>
 
<p>To be clear, processing actions as matrices doesn't help by itself.  The benefit is reaped once we start 
combining matrices (by matrix multiplication) so that we can process many moves at once. One problem here is 
that the devices' action sequences are different lengths.  To manage this, we can simply repeat each device's 
sequence out to a length of 60.  As 60 is evenly divisible by all of the possible lengths, this ensures that 
they line up.</p>
 
<p>We can combine these 60 matrices into 1, and thus process 60 time units at a time.  The remainder can be 
processed one by one as we know there will be at most 59 extra to process.  However, 100,000,000 / 60 is 
still probably too big.  To fix this, we simply keep combining groups of 60 together until the denominator in 
that equation becomes sufficiently large.  A clever approach for this part is to repeatedly square the matrix 
and apply it to the vector at appropriate times:</p>
 
<pre>while t&gt;0 { 
       if (t & 1)vector = vector * matrix
       matrix = matrix * matrix  
       t = t / 2
       }</pre>
 
<p>This method of matrix exponentiation is a handy thing to have in your tool belt, and can be used on a variety
of problems.  Once we've applied all our action matrices, all that's left is to read through our vector and find 
the location with the highest number of marbles.</p>
 
<p><strong>Reader Activity Funtime:</strong> Imagine a related problem where you're given the number of marbles at each location 
at t=0 and are asked to find the state at t=-100,000,000.  Under what circumstances is this problem solvable?
</p>

 

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=8288&amp;rd=10796" name="8288">Unjumpers</a></strong> 

</font> 

<A href="Javascript:openProblemRating(8288)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516073" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      51 / 437 (11.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      29 / 51 (56.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Vasyl(alphacom)</strong> for 886.13 points (10 mins 27 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      655.05 (for 29 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The first problem we have to deal with here is the size of the problem space.  There are enough possible layouts that brute-force solution is out of the question, at least it is if we're storing state as 100 bits or as a 100 character string.</p>
 
<p>If we're going to use a search based solution (which is probably the simplest plan) then we have to 
simplify our representation of the state.  A key realization is that pawn positions 3 squares from each other 
are effectively equivalent.  For example, consider spaces numbered {0, 3, 6, 9, etc.}. If we have pawns at 
positions 3 and 9, we could shift them to positions 0 and 3 using the superjump move without disturbing any 
other pawns.  In effect, we don't have to remember exactly where the pawns are, we only have to know how many 
are on positions numbered {0,3,6,9, etc.}, how many are on positions {1,4,7,10, etc.}, and how many are on 
positions {2,5,8,11, etc.}.  We can represent an entire layout with just 3 numbers, making our state space 
much more manageable.  We'll call the numbers A, B, and C.  They have maximums of 34, 33, and 33 
respectively, leaving us with a manageable space of 35*34*34 = 40460 states.</p>
 
<p>From here, we can search adjacent states using our "jump" and "unjump" moves. If A and B are greater than 0, 
we can arrange the pawns such that we can jump an A over a B to become a C.  Thus we subtract 1 from A and B, 
and add one to C.  Similarly, we could unjump a B pawn to produce an A pawn and a C pawn.  There are only 6 
such possible moves, so by using a memoized search we can quickly identify which target states are reachable 
from our start.</p>
 
<p>It takes a bit of a leap of faith to believe that the above solution will always work correctly.  Indeed, if 
we weren't always guaranteed free space then this type of solution wouldn't always work.  If you want to 
follow through the actual moves used, there are more direct solutions available that systematically reduce 
layouts into lexicographically first, canonical forms (of which there are a total of 5, including the empty 
board).  Because all of the moves are reversible, we know that this canonical form will be the same if and 
only if the original layouts are reachable from each other. </p>
 
<p><strong>Reader Activity Funtime:</strong>  Describe an invariant that proves "*.." can never transform into "..*" (see this <a 
href="http://en.wikipedia.org/wiki/Klein_four-group">hint</a> for one approach if you're stuck).</p>

<p><strong>Bonus Activity Funtime:</strong> How would you solve this problem on a 100x100 board (assuming that there is 
sufficient free space on the board, and the moves were extended to work vertically)?  How many canonical 
forms are there in the 2d version?
</p>






<br /><br />


<div class="authorPhoto">
    <img src="/i/m/jmzero_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
