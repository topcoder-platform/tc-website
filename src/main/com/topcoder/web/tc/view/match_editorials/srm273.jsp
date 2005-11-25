<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505787" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 273</span><br>Monday, November 21, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This match featured an exciting competition with versatile problems, great challenging opportunities and cool iPods.
<br><br>

In Div1, the top scores were quite impressive. Out of the 14 coders who solved all three problems, <b> Petr </b> was 
a clear winner with a score of 1483.76. With this victory, he raised his rating once more, at an all-time best of 3457. The 
yellow coder <b> soul-net</b> did also have an outstanding performance, taking the second place.  <b> Andrew_Lazarev </b>
came in the third, followed by  <b> sjelkjd </b> and <b> rem </b>.
 <br> As <b>Petr</b>, <b>Eryx </b>and <b>ploh</b> preferred to hide in room 6 for the ultimate target confrontation, coders 
of different colors took over the other rooms. The most notable of them, <b>lucab</b>, who won room 1, has boosted 
his rating with 552 points. 
<br>The challenge phase was bitter sweet. Many coders, some of them new to challenging, experienced the joy of unleashing
 an arsenal of successful challenges. This, of course, came at the cost of those who lost their submissions. As system testing 
finished the job, only a little more than half the total number of submissions in Div1 were still standing.

<br><br>
In Div2, there were 17 coders who solved all three problems. The first place was taken by <b> Minny </b>. He was 
followed by <b>slavejovanovski</b>, <b> colesbury</b>, <b> alberto </b> and the newcomer <b> edans. </b>
</p>



<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&pm=5879&rd=8070" name="5879">AimToTen</a></b>
</font>
<A href="Javascript:openProblemRating(5879)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505787" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      314 / 334 (94.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      290 / 314 (92.36%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Tisho</b> for 249.62 points (1 mins 6 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      220.05 (for 290 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The solution to this problem is straightforward. One could compute the average of the current grades and, in case it is lower 
than 9.5, add a grade of 10 and repeat this whole process.  Some coders used a trick to avoid  the possible inconveniences 
caused by double operations. They took the grades in the input array one by one and computed the number of 10's needed 
to get an average of 9.5 with each of them. Summing these up, we get the final answer. This can be implemented in the 
following way:


<pre>
public int need(int[] marks) {
  int n = marks.length;
  int score = 0;
  for (int i = 0; i &lt; n; i++) score = score + (10 - marks[i]) * 2 - 1;
  return Math.max(0, score);
}
</pre>

 
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&pm=5895&rd=8070" name="5895">FallingCoconuts</a></b>

</font>

<A href="Javascript:openProblemRating(5895)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505787" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      101 / 334 (30.24%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      54 / 101 (53.47%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Minny</b> for 370.92 points (18 mins 8 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      254.70 (for 54 correct submissions)

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

      318 / 352 (90.34%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      242 / 318 (76.10%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 238.05 points (6 mins 25 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      183.64 (for 242 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>


In this problem there are no shortcuts, you basically need to simulate the whole process. You start with the first coconut, 
determine its correct landing position, continue with the second, the third and so on.  The most convenient representation 
for the already fallen coconuts is a matrix, or an array of Strings. As for the current falling coconut, you check it's 
neighbours to see whether it falls or slides in one direction or another. You continue to do 
so until the coconut reaches a place where it will not slide any further. C++ code follows:

<pre>

vector<string> harvest(vector&lt;int> drops) { 
    vector&lt;int> data(100, 0);
    for (int i = 0; i < drops.size(); i++) 
        Drop(data, drops[i] + 25);
    int first = 0; 
    for (; first < data.size(); first++) 
        if (data[first] > 0) break;
    int last = data.size(); 
    for (; last >= 0 ; last--) 
        if (data[last - 1] > 0) break;
    vector&lt;string> result(*max_element(data.begin(), data.end()), string(last - first, '-'));
    for (int i = first; i < last; i++) 
        for (int j = 0; j < data[i]; j++) 
            result[j][i - first] = 'O';
    return result;
    }
    void Drop(vector&lt;int>& data, int position) {
        if (data[position + 1] < data[w]) {Drop(data, position + 1); return;}
        if (data[position - 1] < data[w]) {Drop(data, position - 1); return;}
        data[position]++;
   }

</pre>
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&pm=4526&rd=8070" name="4526">PrisonCells</a></b>

</font>

<A href="Javascript:openProblemRating(4526)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505787" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      78 / 334 (23.35%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      40 / 78 (51.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Luffy_</b> for 905.00 points (9 mins 24 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      621.71 (for 40 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Although the constraints here are small, you can still time out if you are not too careful. There are a lot of ways to solve this 
problem, but you can do it very easily by just making a few observations.
<br> - First of all, if there are too many prisoners, it is pretty obvious that you cannot place them all such that every one of the  
distances is greater than 1.  If you take the prison cells as squares on a chessboard, you can be sure that the minimum
distance is at least 2 as long as you can place the prisoners in squares of the same color. If there are more prisoners than 
white squares or black squares, you should simply return 1.
<br>-  By studying example 2 more carefully, another observation can be made.  In this example you have to place 4 prisoners 
on a 4 * 4 grid. The answer is 3, but  it becomes pretty obvious that you cannot place any more prisoners, without decreasing 
the minimal distance. And  because 4 * 4 is the highest possible input we can deduct that for 5 prisoners or more, the 
minimum distance is at most 2.
<br> - Finally, if there are 4 or less prisoners to place, the most intuitive solution is to place them on the edge of the grid. This 
can be proven by applying the properties of Manhattan distance. 


<div align="center">
<img src="/i/srm/srm273_1.jpg" alt="" border="0">
</div>

As the picture above suggests, the shortest path between two prisoners is a walk through the cells on the edge of the grid. 
As there are n + n + m + m - 4 such cells, the minimum distance is just the number of cells divided by the number of 
prisoners.
<br><br>

The observations above translate in the following code:
<pre> 
public int scatter (int n, int m, int nr) {
    if (nr * 2 &gt; n * m + 1) return 1;
    if (nr &gt; 4) return 2;
    return (n + n + m + m - 4) / nr;
 }
</pre>

<br><br>
This problem can be brute-forced by checking all 2<sup>m*n</sup> possible cases (each cell can be either free or
occupied). If total number of occupied cells is equal to <b>nr</b>, we compute the minimal distance between two
prisoners and return the maximal result among all cases.
 
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&pm=5893&rd=8070" name="5893">SnakeTurbo</a></b>

</font>

<A href="Javascript:openProblemRating(5893)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505787" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      183 / 352 (51.99%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      52 / 183 (28.42%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Im2Good</b> for 453.84 points (9 mins 15 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      319.91 (for 52 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem can be solved using the Dynamic Programming technique. A first observation to make is that it only makes 
sense to turn around when you encounter an orb. Using this, we can define a <b>move</b> as a travel between two orbs. 
To simplify coding,  we can add two more orbs, one at startPosition and one at endPosition. Then, we could use the fact that 
an orb cannot be reached, unless all the other orbs between startPosition and that particular orb have been reached. Thus, if 
we know the number of moves we made to reach an orb, we also know what other orbs have been reached. 
<br><br>
Let's consider the following example: 
<br> startPosition = 50
<br>endPosition = 100
<br>orbs = {10, 20, 30, 40, 60, 70, 80, 90}
<br> If we want to reach the orb at location 30 in 5 moves, we also need to reach the orbs at locations 40, 60, 70 and 80, 
respectively (the orb at location 20, as well as the orb at location 90, are unreachable in this case). 
<br><br>
The minimum amount of time to reach an orb equals the minimum amount of time to reach the previous orb + the time 
needed to travel between these last two orbs. In the previous example, we can find the shortest time to reach the orb 
at location 30 in 5 moves by looking at the shortest time needed to reach the orb at location 40 in 4 moves and the orb at 
location 80 in 4 moves (in the second case the orb at location 40 is reached before the orb at location 80). 
<br><br>
One way to represent the solution is to declare two matrices tl and tr, where tl[i][j] denotes the amount of time we need to 
reach the i-th orb to the left of startPosition in j moves and tr[i][j] denotes the amount of time we need to reach the i-th orb to 
the right of startPosition in j moves. In the code below I first built and sorted the two matrices, after which I determined for 
each orb the time needed to reach it in a certain amount of moves. In the end, I took the minimum of the times needed to 
reach the orb at endPosition.
<br><br>
Another way of solving this problem is memoization. 

<pre>
public double finishTime (int start, int end, int[] orbs) {
  double tl[][] = new double[100][100]; 
  double tr[][] = new double[100][100];
  int left[] = new int[100]; 
  // here we will store the orbs to the left of startPosition, sorted in descending order
  int right[] = new int[100]; 
  // here we will store the orbs to the right of startPosition, sorted in ascending order
  int n = orbs.length;
  int nl = 0; // the number of orbs to the left of startPosition
  int nr = 0; // the number of orbs to the right of startPosition

   // We also add an orb at endPosition, which is put either in left[], 
   // or right[], according to its relative position from startPosition.
   tr[nr] = 2000000001; nr++; // sentinel to the right
   tl[nl] = -1000000001; nl++; // sentinel to the left
 

  
  for (int i = 0; i <= n; i++) tl[i][0] = tr[i][0] = 1000000002;
  double uT = 0.5;
  tl[0][0] = uT * Math.abs(start - left[0]);
  tr[0][0] = uT * Math.abs(start - right[0]);


  for (int k = 1; k <= n + 8 ; k++) {
   for (int i = 0; i <= k; i++) {
    int j = k - i - 1; tl[i][k] = tr[i][k] = 1000000002;
    if (i < nl && j < nr) {
     if (j >= 0) tl[i][k] = Math.min (tl[i][k], tr[j][k - 1] + uT * Math.abs(left[i] - right[j]));
     if (i > 0) tl[i][k] = Math.min (tl[i][k], tl[i-1][k-1] + uT * Math.abs(left[i] - left[i-1]));
    } 
    if (i < nr && j < nl) {
     if (j >= 0) tr[i][k] = Math.min (tr[i][k], tl[j][k - 1] + uT * Math.abs(right[i] - left[j]));
     if (i > 0) tr[i][k] = Math.min (tr[i][k], tr[i-1][k-1] + uT * Math.abs(right[i] - right[i-1]));
    } 
   }
   uT /= 2;
  }
   
  // We now look at the orb we placed in endPosition and check in which move we obtained the best result.
 }
}
</pre>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&pm=5878&rd=8070" name="5878">RobotCollision</a></b>

</font>

<A href="Javascript:openProblemRating(5878)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505787" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      900

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      79 / 352 (22.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      40 / 79 (50.63%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 712.14 points (15 mins 28 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      508.27 (for 40 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The easiest way to solve this problem is to take into account every possible start position for the first robot and every possible start position for the 
second robot. Because the room limits are large (100 * 100),  we must restrict our search to the cases when the robots start close enough to 
produce a collision. Fortunately, each robot can receive at most 10 commands, so we only need to check the starting coordinates that are at most 
20 units in Manhattan distance away from each other:
<br><br>
<div align="center">
<img src="/i/srm/srm273_2.jpg" alt="" border="0">
</div>
<br>




In the figure  above, the red dot in the middle denotes the starting position of the first robot, Robbie. If Speedy doesn't start in one of the yellow 
squares, there won't be the possibility of a collision. The algorithm below also reduces the maximum needed distance between robots to 
produce a collision, as they move. For example, if there are only 5 more move commands to be executed, the robots need to be not more than 
10 units in Manhattan distance away from each other.

<pre>
public boolean frontal (char dir1, char dir2) {
 if (dir1 == 'U' &amp;&amp; dir2 == 'D') return true;
 if (dir1 == 'D' &amp;&amp; dir2 == 'U') return true;
 if (dir1 == 'L' &amp;&amp; dir2 == 'R') return true;
 if (dir1 == 'R' &amp;&amp; dir2 == 'L') return true;
 return false;
}

boolean regularity (int px, int py, int n, int m) {
 return (px &gt;= 20 &amp;&amp; px &lt; n - 20 &amp;&amp; py &gt;= 20 &amp;&amp; py &lt; m - 20); 
}

public double probability (int n, int m, String c1, String c2) {
 double prob = 0;
 boolean regular = false;
 int intake = 0;
 
 for (int i = 0; i &lt; n; i++) {
  for (int j = 0; j &lt; m; j++) {
   if (!regular || !regularity(i, j, n, m)) {
    for (int ii = i - 20; ii &lt;= i + 20; ii++) {
     for (int jj = j - 20 + Math.abs(i - ii); jj &lt;= j + 20 - Math.abs(i - ii); jj++) {
      if (ii &lt; n &amp;&amp; jj &lt; m &amp;&amp; ii &gt;= 0 &amp;&amp; jj &gt;= 0) {
       int px1 = i, py1 = j, px2 = ii, py2 = jj, collision = 0;
	   if (px1 == px2 &amp;&amp; py1 == py2) collision = 1; // they start from the same point
       for (int k = 0; k &lt; c1.length(); k++) {
        if (Math.abs(px1 - px2) + Math.abs(py1 - py2) &gt; 2 * (c1.length() - k)) break;
		// <b>Move Robbie here</b>
	    if (px1 == px2 &amp;&amp; py1 == py2 &amp;&amp; frontal(c1.charAt(k), c2.charAt(k)) ) collision = 1; 
   // frontal collision
		// <b>Move Speedy here</b>
	    if (px1 == px2 &amp;&amp; py1 == py2) collision = 1; // they end up in the same point
	   }
       if (collision == 1) { 
        prob = prob + 1;
        if (regularity(i, j, n, m)) intake++;
       }
	   if (regularity(i, j, n, m)) regular = true;
      }
     }
    }
   } else prob = prob + (double) intake; 
  }
 }    
 return (double) prob / (double) (n * m * n * m);
}
}
</pre>

<br>
You can significantly optimize your solution using the following observation. For every cell, compute the probability of a collision if Robbie starts
from that cell. You can easily prove that this probability is the same for all cells further than 20 units from any border. Therefore you don't need to compute this
probability for every such cell, instead you can compute it only once and multiply by the number of such cells.
</p>

      <img src="/i/m/supernova_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="7371063" context="algorithm"/><br />
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
