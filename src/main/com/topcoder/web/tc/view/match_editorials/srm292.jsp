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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505858" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 292</span><br>Monday, March 6, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Despite SnapDragon's statement that he is out of practice, he won the Division 1 quite easily.
Egor took second, especially thanks to his excellent time on the medium problem, and
misof went home with bronze.
</p>

<p>
The Division 1 problem set was one of the easier ones, with 24 coders getting all three problems
right.
</p>

<p>
Also the Division 2 problem set seemed to be pretty well balanced, with 16 coders solving the
whole set. The top two places were taken by newcomers, ihi and Bel_Vit, rlblaster was third.
We will be seeing them in Division 1 next time.
</p>


<H1>

The Problems

</H1>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5931&amp;rd=9813"
name="5931">FowlRoad</a></b>

</font>

<A href="Javascript:openProblemRating(5931)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505858" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      332 / 374 (88.77%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      262 / 332 (78.92%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Nitz</b> for 245.18 points (3 mins 59 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      195.34 (for 262 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
First of all, note that we may ignore the x coordinate of the chicken. 
The fact whether a segment of the path crosses the road depends only on 
the y coordinates of its endpoints.
</p>

<p>
Now, we may simplify the situation even more by subtracting roadY from
all the coordinates in the chicken's path. With the new coordinates, 
we are interested in how many times the chicken crosses the x axis.
</p>

<p>
We can count this in a simple loop. All we have to do is to keep track
of the side we were on, i.e., whether our last non-zero y coordinate
was positive or negative.
</p>

<p>
Note that we may forget all the zeroes completely. For example, both the
sequences { 3, 0, -2, 0, -3, -4, 0, 7 } and { 3, -2, -3, -4, 7 } cross
the x axis twice.
</p>

<p>
C++ code:
</p>

<pre>
  int crossings(int roadY, vector &lt;int&gt; bobX, vector &lt;int&gt; bobY) {
    int res = 0;

    // compute the shifted coordinates
    // at the same time, throw out all zeroes
    vector&lt;int&gt; newY;
    for (unsigned i=0; i&lt;bobY.size(); i++)
      if (bobY[i] != roadY)
        newY.push_back( bobY[i]-roadY );

    // now count the number of times we cross the x axis
    for (unsigned i=1; i&lt;newY.size(); i++)
      if (newY[i] * newY[i-1] &lt; 0) res++;

    return res;
  }
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4512&amp;rd=9813"
name="4512">Abacus</a></b>

</font>

<A href="Javascript:openProblemRating(4512)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505858"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      285 / 374 (76.20%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      200 / 285 (70.18%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>250710</b> for 482.42 points (5 mins 27 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      329.29 (for 200 correct submissions)

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

      355 / 360 (98.61%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      331 / 355 (93.24%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tomek</b> for 246.41 points (3 mins 26 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      214.07 (for 331 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
In this problem, there wasn't really anything to think about. The only problem was
implementing the conversions between numbers and their graphical representation.
</p>

<p>
For the conversion in one direction we may use the index of the first dash in the
string. 
</p>

<p>
For the conversion in the other direction, it may be convenient to split it into 
two steps: first, split the number into digits, and then use the digits to 
generate the rows of the abacus.
</p>

<p>
C++ code:
</p>

<pre>
  vector &lt;string&gt; add(vector &lt;string&gt; original, int val) {

    // convert the abacus into a number
    int number = 0;
    for (unsigned i=0; i&lt;original.size(); i++) {
      int digit = 9 - original[i].find("-");
      number = 10*number + digit;
    }

    // add the requested value
    number += val;

    // convert the new number into digits
    vector&lt;int&gt; digits;
    for (unsigned i=0; i&lt;original.size(); i++) {
      digits.push_back( number % 10 );
      number /= 10;
    }

    // bring the most significant digits to the beginning
    reverse( digits.begin(), digits.end() );

    // and create the new abacus
    vector &lt;string&gt; res( original.size() );
    for (unsigned i=0; i&lt;original.size(); i++) {
      res[i] += string( 9-digits[i], 'o' );
      res[i] += string( 3, '-' );
      res[i] += string( digits[i], 'o' );
    }

    return res;
  }
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4513&amp;rd=9813"
name="4513">SysFailure</a></b>

</font>

<A href="Javascript:openProblemRating(4513)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505858"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      54 / 374 (14.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      28 / 54 (51.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tomek_cn</b> for 814.00 points (14 mins 16 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      559.27 (for 28 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The first step we can do to make our life easier is to pad the input array &ndash; if we surround
it by zeroes, we won't have to worry about checking for the array's bounds when looking for clusters
of ones.
</p>

<p>
In C++ this can be done as follows:
</p>

<pre>
  int R, C; // number of rows and columns

  int critical(int n, vector &lt;string&gt; state) {

    R = state.size(), C = state[0].size();

    state.insert(state.begin(), string(C,'0'));
    state.insert(state.end(),   string(C,'0'));
    for (int r=0; r&lt;R+2; r++) state[r] = '0'+state[r]+'0';

    // now the original array has coords [1..R] x [1..C]
    
    // ... the rest of the code ...
  }
</pre>

<p>
The next logical step is to write a function that, given a map of the system, finds the size of the 
largest connected cluster of components. 
</p>

<p>
This function can be implemented as a breadth/depth-first search in a graph, where the vertices are
active components (ones in the matrix) and two vertices are connected if and only if they are
adjacent.
</p>

<p>
C++ code of this function, implemented using BFS:
</p>

<pre>
  int R, C; // as above

  // it's often useful to use constants to store valid moves
  int dx[] = { -1, 0, 1, -1, 1, -1, 0, 1 };
  int dy[] = { -1, -1, -1, 0, 0, 1, 1, 1 };

  int getLargest(vector&lt;string&gt; state) {
    int maxSize = 0;

    // traverse a matrix
    // each time we encounter a '1', we have a new cluster
    // run BFS to find its size and change all its '1's into '0's
    
    for (int r=1; r&lt;=R; r++) for (int c=1; c&lt;=C; c++)
      if (state[r][c]=='1') {
      
        int thisSize = 1;
        state[r][c]='0';

        queue&lt;int&gt; Q;
        Q.push(r); Q.push(c);

        while (!Q.empty()) {
          // get the next vertex out of the queue
          int x = Q.front(); Q.pop();
          int y = Q.front(); Q.pop();

          // process its neighbors
          for (int d=0; d&lt;8; d++) {
            int nx = x + dx[d];
            int ny = y + dy[d];

            // [nx,ny] are the coordinates of our neighbor in direction d
            // note that thanks to the padding [nx,ny] are always valid
            
            if (state[nx][ny]=='1') {
              state[nx][ny]='0';
              thisSize++;
              Q.push(nx); Q.push(ny);
            }
          }
        }

        maxSize = max(maxSize, thisSize);
      }
    return maxSize;
  }
</pre>

<p>
Now, using this function, solving the task is simple. If already in the input configuration
all the clusters are too small, return -1. Otherwise, process the active components one 
by one, each time turn it off, check how the maximal cluster size changed, and turn it 
back on.
</p>

<pre>
  int critical(int n, vector &lt;string&gt; state) {
    // ... we already saw a part of this function ...
    
    int orig = getLargest(state);
    if (orig &lt; n) return -1;

    int res = 0;

    for (int r=1; r&lt;=R; r++) for (int c=1; c&lt;=C; c++)
      if (state[r][c]=='1') {
        state[r][c]='0';
        int after = getLargest(state);
        if (after &lt; n) res++;
        state[r][c]='1';
      }

    return res;
  }
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6016&amp;rd=9813"
name="6016">BobTrouble</a></b>

</font>

<A href="Javascript:openProblemRating(6016)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505858"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      178 / 360 (49.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      71 / 178 (39.89%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Egor</b> for 457.60 points (8 mins 48 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      276.60 (for 71 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem stumped me for a while. I had to convince myself that a greedy approach 
will really work here. Let's start analysing this problem by drawing a few images.
</p>

<p>
Imagine a valid hierarchy tree, for example the one in the following image:
</p>

<div align="center">
<img src="/i/srm/srm292_1.png">
</div>

<p>
Now, the problem statement basically says the following: If somebody's boss is BOB, we
may choose which of the BOBs it will be. The crucial observation leading to a solution
is: <i>We can choose the same BOB for all employees.</i>
</p>

<p>
Why is this so? Suppose that we have a valid solution, and there is more than one BOB
having some direct employees. Select any two such BOBs. If one of them is higher
in the hierarchy than the other, we may move all employees of the "lower BOB" 
directly to the "higher BOB". The graph will clearly remain acyclic. 
The other situation is even simpler, if neither of the BOBs is reachable from the
other, we may transfer the employees either way. 
</p>

<p>
Using a finite number of such transformations we will always arrive into a situation
when, except for at most one BOB, no BOBs have direct employees. 
</p>

<p>
As an example, we can transform the above hierarchy into this one:
</p>

<div align="center">
<img src="/i/srm/srm292_2.png">
</div>

<p>
Let's repeat the result proved above: IF there is a valid solution, THEN there is one such
that all employees whose boss is BOB are the direct employees of one and the same BOB.
Thus we can check all posibilities for which BOB this is, and each time check whether
the resulting graph is acyclic.
</p>

<p>
Once we find a valid hierarchy, we can count the number of bosses and output it. 
If no choice of the "king BOB" leads to a valid hierarchy, return -1.
</p>

<p>
As a curiosity, note that the problem could be solved without even mentioning
the string "BOB" in your code. See <a
href="http://www.topcoder.com/stat?c=problem_solution&rm=247827&rd=9813&pm=6016&cr=14970299">Egor's
solution</a> as an example. The solution simply builds the hierarchy tree by doing a breadth-first
search from *. This will automatically enforce that the "topmost" BOB is inserted into the
hierarchy first, and all (some BOB)'s employees will later be inserted as his employees.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4434&amp;rd=9813"
name="4434">LongBlob</a></b>

</font>

<A href="Javascript:openProblemRating(4434)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505858"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      99 / 360 (27.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      76 / 99 (76.77%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>kalinov</b> for 932.43 points (7 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      650.03 (for 76 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
We can rephrase the problem as follows: Given a grid, find a path such that:
</p>

<ul>
<li>in each step, we can move one square in any of the four directions</li>
<li>the total number of '1'-squares on the path mustn't exceed 4</li>
<li>the ends of the path are as far apart (in Euclidean metrics) as possible</li>
</ul>

<p>
(As a hidden catch, note that the path may both start and end on a '1'-square.)
</p>

<p>
Now we clearly have a graph problem. What exactly is the graph? The squares will
be vertices of the graph, edges will connect neighboring squares. 
If we want to enter a '1'-square, first we have to "turn it off". Therefore 
the "length" of an edge entering a square will be zero if the square is '0', 
one if the square is '1'. 
</p>

<p>
Suppose we want a path that begins in the square [ax,ay] and ends in the square [bx,by].
How to check whether these squares can be connected by a valid path? Simply find the
shortest path from [ax,ay] to [bx,by] in the graph constructed above. The length of
this path (plus 1 if the starting square is a '1'-square) is the smallest possible number 
of '1's on a path from [ax,ay] to [bx,by]. 
</p>

<p>
In the SRM, I used Dijkstra's shortest path algorithm to compute the all-pairs shortest
paths. Somewhat surprisingly, Floyd-Warshall's algorithm is fast enough, and leads to a
pretty short implementation.
</p>

<pre>
int dr[] = { -1, 1, 0, 0 };
int dc[] = { 0, 0, -1, 1 };

int dist[32][32][32][32];

double maxLength(vector &lt;string&gt; image) {

 int R = image.size(), C = image[0].size();

 // initialize the distance matrix to (0 or infinity)
 memset(dist,0,sizeof(dist));

 for (int ri=0; ri &lt; R; ri++)
   for (int ci=0; ci &lt; C; ci++)
     for (int rj=0; rj &lt; R; rj++)
       for (int cj=0; cj &lt; C; cj++)
         if (ri!=rj || ci!=cj)
           dist[ri][ci][rj][cj] = 123456;

 // for each vertex, set the lengths of edges into its neighbors
 for (int ri=0; ri &lt; R; ri++)
   for (int ci=0; ci &lt; C; ci++)
     for (int d=0; d&lt;4; d++) {
       int rj = ri + dr[d], cj = ci + dc[d];
       if (rj&lt;0 || rj&gt;=R || cj&lt;0 || cj&gt;=C) continue;
       dist[ri][ci][rj][cj] = (image[rj][cj]-'0');
     }

 // Floyd-Warshall
 for (int rk=0; rk &lt; R; rk++)
   for (int ck=0; ck &lt; C; ck++)
     for (int ri=0; ri &lt; R; ri++)
       for (int ci=0; ci &lt; C; ci++)
         for (int rj=0; rj &lt; R; rj++)
           for (int cj=0; cj &lt; C; cj++)
             dist[ri][ci][rj][cj] &lt;?= 
               dist[ri][ci][rk][ck] + dist[rk][ck][rj][cj];

 // process all pairs of vertices
 // if there is a valid path between them, update the result
 double res = 0.0;

 for (int ri=0; ri &lt; R; ri++)
   for (int ci=0; ci &lt; C; ci++)
     for (int rj=0; rj &lt; R; rj++)
       for (int cj=0; cj &lt; C; cj++)
         if ( (image[ri][ci]-'0') + dist[ri][ci][rj][cj] &lt;= 4)
           res &gt;?= hypot( double(ri-rj), double(ci-cj) );

 return res;
}
</pre><div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
