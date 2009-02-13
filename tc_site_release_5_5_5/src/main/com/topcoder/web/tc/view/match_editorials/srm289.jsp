<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505855" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 289</span><br>Tuesday, February 14, 2006
<br><br>

<span class="bigTitle">Match summary</span>
<p>
In both Division 1 and 2, coders faced tricky problems. At the end of the coding phase, Division 1 ended with <b>bmerry</b> at first place followed by <b>John Dethridge</b> in
second place. In a challenge fight these two coders managed to swap positions a couple of times. After the system tests,
with four coders solving the hard correctly, the top five positions were taken by <b>bmerry</b>, <b>asaveljevs</b> (the only coder who got all three problems correctly),
<b>kalinov</b>, <b>rem</b> and <b>John Dethridge</b>.</p>


<p>In Division 2, only two coders solved the hard one, both newcomers, and got the first two spots, <b>br</b> and <b>StanleyNguyen</b>.
<b>King_Bette</b>, <b>kgd314</b> and <b>aminallam</b> followed them in a very close race. Welcome all of them to Division 1.</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5915&amp;rd=9810" name="5915">ObjectFall</a></b>
</font>
<A href="Javascript:openProblemRating(5915)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505855" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      290 / 349 (83.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      225 / 290 (77.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>Providence</b> for 291.13 points (4 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      201.26 (for 225 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The easiest way of solving this problem is to iterate from the starting y-position down to 0 and at each y-coordinate
checking if the object hits some obstacle, updating its x-position and its delay. C++ code follows:
</p>

<pre>
   int t = 0;
   for (int cy = y; cy>0; cy--) {
      for (int i = 0 ; i < obstacles.size(); i++) {
         int y1 = atoi(obstacles[i].c_str());
         int x1 = atoi(obstacles[i].c_str()+4);
         int x2 = atoi(obstacles[i].c_str()+8);
         if (cy == y1 && x >= x1 && x <= x2) {
            x = x2;
            t+=5;
            break;
         }
      }
   }
   return y+t;
</pre>

<p>A more efficient approach is first to store each obstacle in an array of 1000 positions and then iterate from y down to 0,
checking for each y-coordinate if there is an obstacle there. You can see <a href="http://www.topcoder.com/stat?c=problem_solution&rm=247627&rd=9810&pm=5915&cr=20721845">Galeon's solution</a> using this idea.
A very detailed explanation of a one-liner solution can be found in the <a href="http://forums.topcoder.com/?module=Message&messageID=527111">forums</a>.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5911&amp;rd=9810" name="5911">FallingBall</a></b>
</font>
<A href="Javascript:openProblemRating(5911)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505855" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      500
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      84 / 349 (24.07%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 84 (27.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>br</b> for 383.89 points (16 mins 43 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      258.76 (for 23 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      250
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      266 / 294 (90.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      176 / 266 (66.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 239.20 points (6 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      170.99 (for 176 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem can be solved with different approaches. Experienced coders used some flavor of dynamic programming to solve it. However, there is
an easy-to-think solution that can be used:</p>

<p>First of all we have to think how many paths reach each cell. The first cell, (0,0), can be reached with only one path.
In the second row, both cells have only one way to be reached: the ball either falls left from the upper cell, or it falls right.
In the third row, the middle cell can be accessed in two ways: either from its upper-left cell or its upper-right one. In general a given cell can be reached only by the two cells above it. Then the number of ways to reach a cell is the sum of the ways of reaching those two cells. Following this reasoning we can fill the whole triangle. This triangle of numbers is known as the <a href="http://mathworld.wolfram.com/PascalsTriangle.html">
Pascal's triangle</a>. Although each cell <i>(r,c)</i> in this triangle can be calculated with the combinatorial number: <i>choose(r,c)</i>, the easiest way to do it is to have the whole triangle in memory and calculate each cell with the sums explained before. Let's identify each cell in this triangle as P[r][c].</p>

<p>
The first question to answer is if the numbers in this triangle will overflow. It can be easily seen that each row of the triangle
sums a power of 2, and in particular the sum of the numbers in the i-th row is 2^i. Then all the numbers in the bottom row
will add up to 2^29, and they fit perfectly in a C++ int or similar. But, will the number of paths overflow? There are 2^n different paths in a triangle with n rows, therefore the result number will be less than that, so we are fine.</p>
<p>
Once we have this triangle set the solution is straightforward. Let's first order the cells from the top to the bottom of the triangle.
Then to move from one cell to the next one we have to do the following: let's call (deltar, deltac) to the difference between the
current cell and the next one, then there are P[deltar][deltac] ways to move between them. But take into account that
if (deltar,deltac) lies out of the triangle (for example, with a deltac greater than the deltar), then the second cell is unreachable from the current cell, and the answer must be 0.</p>
<p>The previous affirmation deals not only with duplicated cells, because the deltas between them would be (0,0), but also with more than one cell in the same row or with cells far apart from each other that cannot be connected in a path.</p>

<p>Finally the answer of the program is the multiplication of all these movements and the remaining ways of reaching the bottom line from the last cell (which is 2^(the remaining number of rows) ). C++ code follows:</p>


<pre>
      /// Create the Pascal's triangle and store it in P
      /// Parse the input and store it in an vector of pairs rc
      sort(rc.begin(),rc.end());
      int cr = 0;
      int cc = 0;
      int ret = 1;
      for(int i = 0; i < rc.size(); i++) {
         if (rc[i].second < cc || rc[i].second > (rc[i].first - cr) + cc)
            return 0;
         ret = ret * P[rc[i].first - cr][rc[i].second - cc];
         cr = rc[i].first;
         cc = rc[i].second;
      }
      return ret << (n-cr-1);

</pre>
<p>For a clean implementation of this idea see <a href="http://www.topcoder.com/stat?c=problem_solution&rm=247611&rd=9810&pm=5911&cr=10574855">Petr's solution</a>.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5920&amp;rd=9810" name="5920">GreenWave</a></b>
</font>
<A href="Javascript:openProblemRating(5920)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505855" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1000
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 349 (1.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 6 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>StanleyNguyen</b> for 621.23 points (25 mins 45 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      593.76 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem is a combination of a simulation problem with a brute force search. Once we know the duration of the first
red light for each traffic light, the simulation can be implemented. But in order to start a simulation,
we need first to know the duration of the first red light for each traffic light. There are at most 5 traffic lights and each one can
have its first red light duration up to 5 seconds. That gives 5^5 = 3125 possible combinations. If the simulation is fast enough, a brute force search on these durations can be done.</p>
<p>A first approximation to simulate the movements could be using an array of 300 positions as the road, but this will may easily lead to time out. The simulation can be simplified using the following facts: The cars enter the road one at a time from the one with the lower index and they cannot overtake each other. Then, the cars will be always ordered in the same way within the road. At each step the cars begin to move starting with the car with the lowest index, which is still in the road, and continue to move in their index order. Using this we could do the simulation using one array for the current car's position. Note that this array will always be in decreasing order, because the i-th car has always entered the road before the i+1-th car it will ever be in a greater position. </p>

<p>The simulation step goes as follows: each car tries to move one position at a time until it gets blocked by the next car or a red traffic light. When a car that has not entered the road tries to move, it checks if it can move to position 0, and this step is over. </p>

<p> The remaining thing to see is if this simulation would time out. An upper bound of the time limit could be calculated as follows:
A car cannot be delayed more than 15 seconds by the traffic lights. Then, if a car is very slow (speed 1) it will take 500 (the maximum road length) + 15 (the delay) seconds to leave the road. The state of the traffic lights will cycle every ten seconds then, at most ten seconds later, the next car will travel in the same way as the first one. The final number is 515 + 10 * (each of the remaining cars) steps of simulation. That gives a maximum of 605 seconds. In each step all the cars should be iterated given a total number of iteration as: 3125 (the different traffic lights situations) * 605 (steps of simulations) * 10 (the number of cars to iterate in each step) = 18906250, which is an acceptable number to deal with in two seconds.

</p>
<pre>
   //generate all possible combinations of the first red light
   //duration for each semaphore and store it in vector delays
   //pos is the vector with the current position for each car
   //-1 indicates that the car has not yet entered the road.
   vector<int> pos(speeds.size(),-1);
   //while not all the cars are leaved the road
   while (done < speeds.size()) {
      for (int i = done; i < speeds.size(); i++) {
         //if the current car has not entered the road tries to do it.
         if (pos[i] == -1) {
            if (i == 0 || pos[i-1] > 0)
               pos[i] = 0;
            break;
         }
         // look for the next position to move
         int want = pos[i] + speeds[i];
         for (int s = pos[i]; s <= want; s++) {
            // the car gets blocked by the previous car
            if (i > 0 && s == pos[i-1]) { 
               want = s-1;
               break;
            }
            for (int k = 0; k < lights.size(); k++) {
               //thereIsTL(s) answers true if there is 
               //a traffic light at position s.
               //the function isRed uses t, the current time, 
               //s the desired position, and the delays
               //of each traffic light to check if the traffic 
               //light at position s is red.
               if (thereIsTL(s) && isRed(t,s,delays) {
                  want = s;
                  break;
               }
            }
         }
         pos[i] = want; //the car moves.
         if (pos[i] >= L) {
            // If the car has leaved the road, mark it:
            pos[i] = 1000;
            done++;
         }
      }
      t++;
   }
   //return the minimum time obtained with all the combinations of delays
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5903&amp;rd=9810" name="5903">CMajor</a></b>
</font>
<A href="Javascript:openProblemRating(5903)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505855" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      500
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      105 / 294 (35.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      71 / 105 (67.62%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 420.64 points (12 mins 51 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      270.32 (for 71 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
The number of fragments may give us a clue of what kind of solution can be used. There are too many fragments to go 
with all permutations, but it is small enough to check every subset. Keeping this in mind we can think on a solution.
</p>
<p>
First of all, let's simplify the problem reducing each segment to its allowed initial and end notes. For example,
the fragment "2 3 -1", could be reduced to "G->B,C->E", meaning that it could be played either starting on a G and ending in a B,
or starting from a C and ending on a E. Lets use a matrix go[F][N] to indicate where the fragment F ends if it played starting
from a note N, or -1 if it cannot be used there. This can be done iterating over all the fragments, and all the possible
start notes.
</p>

<p>From this point we can solve the problem using a function F(S, N) which returns the maximum number of fragments that can be appended using the fragments in the set S and starting on the note N. This function can be done trying with each
fragment x in S that can be played on N (that is: go[x][N] != -1), and calling recursively with the set (S-x) and go[x][N] as
the starting note for the remaining melody. This function will be called at most with 2^19 * 7 different parameters and therefore it can be memoized.</p>
<p>Once the function is done, the answer to the problem is the maximum result of F(S,C), called with all the possible notes and the whole set of fragments. The function F can be implemented in C++ as follows, using a mask of bits to represent a subset and, of course, memoized:</p>

<pre>
   int F(int c, int msk) {
      char & r = memo[c][msk];
      if (r != -1)
         return r;
      int ma = 0;
      for(int i = 0; i < n; i++) if (msk & (1 << i)) if (go[i][c] >=0 )
            ma = max(ma,1+F(go[i][c],msk ^ (1 << i)));
      return r=ma;
    }

</pre>
<p>Some coders had problems calculating the actual offset for each fragment modulus 12. 
There were negative jumps giving negative offsets, and it is well known that the modulus operator (%) has to be used carefully with negative numbers.</p>
<p>For a fully dynamic programmed solution, see <a href="http://www.topcoder.com/stat?c=problem_solution&rm=247612&rd=9810&pm=5903&cr=251074">bmerry's one</a>.</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5904&amp;rd=9810" name="5904">ShrinkingPills</a></b>
</font>
<A href="Javascript:openProblemRating(5904)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505855" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1000
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      24 / 294 (8.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 24 (16.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>bmerry</b> for 809.41 points (14 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      619.71 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This is a typical BFS problem, where we have to decide which elements conform the state of the search.
At a first glance there are 100 (your current height) * 10 (the available pills) * 200 (the doors' height) * 48*48 (the position
in the lab) possible states of search. But that is way too much states to work in time, therefore we need to reduce the search space.
</p>

<p>First of all, we need to realize that the door height can be eliminated from the state. Suppose that in the search you
reach some state that has been visited before but with the doors more opened, we know for sure that you cannot improve that time
with the door closer to the floor than before. Then this new state can be ignored.</p>
<p>
Another possible optimization is to replace your current height with the time elapsed since you took the last pill. 
This will decrease the search space for all <b>pspeed</b>s less than 1, and, if <b>pspeed</b> is 1, having more than 1 pill is never needed (proving this is left to the reader).

</p>
<p>
With these changes applied, the space search is significantly reduced and a simple BFS works. Sample code follows:
fine:</p>

<pre>
   //let v a vector of pending states
   //set s as the initial state
   int time = 0;
   v.push_back(s);
   while (v.size()) {
      vector<st> nv;
      for(int k = 0; k < v.size(); k++) {
         //set cst as the current state:
         cst = v[k];
         if (lab[cst.r][cst.c] == 'E') // check if we are done
            return time;
         for(int d = 0; d < 5; d++) {
            //iterate twice if a pill can be taken,
            // when t == 0, do not take pill
            // when t == 1, try to take one.
            for(int t = 0; t < (cst.height == 100 && cst.pills)?2:1; t++) {
               // if already shrinking, keep doing it.
               int nh = cst.height - pspeed*(cst.height<100?1:t); 
               //if the height reaches zero or less, all backs to normality
               if (nh <= 0) 
                   nh = 100;
               //calculate possible next position
               int nr = cst.r+dr[d];
               int nc = cst.c+dc[d];
               if (lab[nr][nc] == '#')
                  continue;
               // if next position is a door but opened enough
               // or if it is an empty square...
               if  (( lab[nr][nc] == 'X' && (door-(time+1)*dspeed) >= nh)
                   || lab[nr][nc] == ' '
                   || lab[nr][nc] == 'E'
                   || lab[nr][nc] == '@') {
                  //create next state and move
                  st nst = cst;
                  nst.c = nc;
                  nst.r = nr;
                  nst.height = nh;
                  nst.pills -= t;
                  // check if it was visited before.
                  if (!isVisited(nst)) {
                     setVisited(nst);
                     nv.push_back(nst);
                  }
               }
            }

         }
      }
      time++;
      v = nv;
   }
   return -1;

</pre><div class="authorPhoto">
    <img src="/i/m/esteban_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10505845" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
    <jsp:include page="../public_right.jsp">
     <jsp:param name="level1" value="privatelabel"/>
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
