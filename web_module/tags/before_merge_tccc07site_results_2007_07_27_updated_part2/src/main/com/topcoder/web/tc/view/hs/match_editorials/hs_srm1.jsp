<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

<tc-webtag:forumLink forumID="506023" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 1</span><br>Monday, June 5, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Much more than just another typical match, this marked the first in a new series of contests for high school students.
Congratulations to everyone who joined in this historic match!</p>
<p>
In a close race, <b>Burunduk1</b> from the Russian Federation won the match, thanks to
fast submissions (that took him to the third place after Coding Phase) and to two successful challenges that
gave him the points he needed to overtake the other top scorers. He was followed closely by <b>Zuza</b> from Croatia, who scored
the fastest 1,000-point submission, with <b>Weiqi</b> from China close behind.
<p>
But there were many more than the top three coders in this match. 
Welcome to all the new members that have joined in to compete in the high school competitions.
In this first round, almost 100 coders from 24 countries participated, with about 40% of them newcomers who joined in to compete in the TCHS.
</p>

<p>
Now, how did you feel the match?
Did you like it?
Do you still hear your overclocked heart beating at the rhythm of your keystrokes?
Did you stay awake for three more hours discussing or debugging your solutions? 
There's a lot to learn and explore while you wait for the next contest:
</p>

<ul>
<li> Use the Forums <a href="http://forums.topcoder.com/?module=Main"></a> to learn from other coders, discuss solutions, and ask for advice. 
There are always active members willing to help, and you can learn a lot quickly.</li>
<li> There are several <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=alg_index">Educational Articles</a>
  that will help you learn techniques and concepts that you can 
  apply in the next contest and in your educational or professional life.</li>
<li> The advice you will hear most often, of course, is: <b>practice</b>! You can log in to the Arena practice rooms anytime. 
</li>
</ul>
<p>
Now, let us discuss the match problems:</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6474&amp;rd=10022" name="6474">SpeedRadar</a></b>

</font>

<A href="Javascript:openProblemRating(6474)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506023" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Level One: <blockquote><table cellspacing="2">

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

      91 / 95 (95.79%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      84 / 91 (92.31%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>sluga</b> for 246.65 points (3 mins 19 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      220.99 (for 84 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The task for this problem is easily defined as: 
<ul>
<li> if more than 10% of the readings are infringements (less than <tt>minLimit</tt> or greater than <tt>maxLimit</tt>),
  return 0.0.</li>
<li> otherwise, return the average of readings within the limits
</ul>

Then we can iterate over the readings, counting the number of infringements and
summing up the non-infringing speeds (to calculate the average). 
The following Java code implements this idea:
<pre>
  int inf = 0, sum = 0;
  for (int i=0; i<readings.length; i++ ){
    // within legal limits
    if (readings[i]&#8805;minLimit &amp;&amp; readings[i]&#8804;maxLimit) 
      sum += readings[i];
    else // infringement
      inf++;
  }
  // over 10% of readings are speed infringements
  if (inf>readings.length/10) 
    return 0.0;
  // return the average of non-infringing readings
  else 
    return (double)sum/(readings.length-inf);
</pre>

<p>Almost all possible errors (like checking for "<" instead of "&#8804;" in the speed limits, or
  the opposite with respect to the 10% of non-infringing readings) were shown in at least 
  one example. 
  Coders that failed this solution might want to test all given examples before submitting their
  solutions. Frequently, a problem is not completely understood until you read and interpret
  completely the examples; 
  and many errors can be caught by testing them. If you're new to TopCoder, you might
  want to try competing with one of the existing <a href="/tc?module=Static&d1=applet&d2=plugins">plugins</a>: 
  some of them write the class and method headers and will test the given examples by themselves,
saving valuable coding time and, more importantly, catching some errors before your submission.</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5902&amp;rd=10022" name="5902">SymbolFrequency</a></b>

</font>

<A href="Javascript:openProblemRating(5902)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506023" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Level Two: <blockquote><table cellspacing="2">

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

      66 / 95 (69.47%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      60 / 66 (90.91%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Burunduk1</b> for 447.54 points (9 mins 57 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      325.12 (for 60 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
In this problem we must compute a variance of values occurring in a text with respect to
some expected values, as defined in several possible tables. 
Then, the least of these values must be returned.
Let us split the problem in three simpler tasks to show the solution. 
First, reading the text counting the number of occurrences of each letter:
<pre>
  int total = 0, cnt[] = new int[26];
  for (int i=0; i&lt;text.length; i++) {
    for (int j=0; j&lt;text[i].length(); j++) {
      char c = text[i].charAt(j); 
      if (c&#8805;'a' &amp;&amp; c&#8804;'z') {
        cnt[c-'a']++;
        total++;
      }
    }
  }
</pre>
We are using <tt>total</tt> and <tt>cnt</tt> in the following code. 
Now, for each of the 26 lowercase letters, each table defines a percentage that determine the expected count in the text.
The tables given are limited to 16 letters, and the rest must be assumed to have 0% of expected occurrence.
The second part in this solution will be parsing the given tables to an appropriate representation. 
If we do this for each of the tables, and compute the deviation of the text with respect to it, we must just
return the minimum computed value. The following code implements this part of the problem (the function <tt>deviation</tt>
is defined below):
</p>
<pre>
  double bestdev = -1.0;
  for (int i=0; i&lt;frequencies.length; i++) {
    // create a table to store expected percentages,
    int expected[] = new int[cnt.length];
    // parse the values given in the table,
    for (int j=0; j&lt;frequencies[i].length()/3; j++) {
      int letter = frequencies[i].charAt(j*3)-A;
      int exp = (frequencies[i].charAt(j*3+1)-'0')*10+frequencies[i].charAt(j*3+2)-'0';
      // ... and store each percentage in the table
      expected[letter] = exp;
    }
    // with the parsed table, compute its deviation with respect to the text
    double dev = deviation(expected, cnt, total);
    if (bestdev<0 || bestdev>dev) 
      bestdev = dev;
   }
</pre>
</p>

<p>
The only missing code is the actual computation of deviation values. This can be done easily
just implementing the definition given in the statement:
<pre>
  double deviation(int[] exp, int[] act, int total) {
    // exp represents the expected percentages; act are the actual 
    // occurrences and total the number of letters in the text
    double dev = 0.0;
    for (int i=0; i&lt;exp.length; i++) {
       double x=act[i]-exp[i]/100.0*total;
       dev += x*x;
    }
    return dev;
  }
</pre>
And we are done. The variable <tt>bestdev</tt> is the value to return in the main function.
</p>

<p>
A concern that might (or will) arise when computing a solution with floating-point arithmetic is
whether the precision is enough to represent all handled values, and if errors can propagate
through computations and end up as a big precision error in the returned value. 
Though this is not the case as this solution handles only small values, it should be a point to consider
in future matches. 
The reader is encourage to
follow <a href="/tc?module=Static&d1=tutorials&d2=integersReals">this article</a> to get an idea
of where and why floating point arithmetic can fail in a contest.</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6441&amp;rd=10022" name="6441">TroytownKeeper</a></b>

</font>

<A href="Javascript:openProblemRating(6441)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506023" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Level Three: <blockquote><table cellspacing="2">

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

      49 / 95 (51.58%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      37 / 49 (75.51%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Zuza</b> for 961.17 points (5 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      676.22 (for 37 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem features one of the favorite subjects of algorithm contest problems: labyrinths! 
Everyone who has ever tried a programming contest has come across ascii-represented 
labyrinths with variety of tasks to solve.
The majority, and this is not an exception, include as one task to 'walk' within the rooms or empty 
spaces. This can't be done by just looking at the values of the cells and their neighbors, 
but actually traveling across the maze is needed. 
This problem required to count the number of 'visible' walls that need to be painted -- ie., 
calculating which empty spaces (floor cells) are 'reachable' and then counting the number of walls
neighboring those cells.
</p>

<p>
This is a perfect example to introduce search techniques like 
<a href="http://en.wikipedia.org/wiki/Depth-first_search" target="_blank">Depth-First Search (DFS)</a> and
<a href="http://en.wikipedia.org/wiki/Breadth_first_search" target="_blank">Breadth-First Search (BFS)</a>.
We will use the former in this solution, though either of them is equally suited for this problem.
The following function will be called from a starting position, and call itself on every neighboring
cell. During the recursive calls the cells visited will be marked, for several reasons: to avoid 
infinite recursion, to remember later which cells are reachable and to compute the number of walls.
We are also using the trick of adding a 'border' to the given map, to guarantee that: a) we can 
reach all reachable parts of the maze from a single starting point (any border cell), 
and b) exterior walls (border cases) require no special attention, as they now have an empty
cell as a neighbor.
</p>
<p>
Declaring:
<pre>
  int rows, cols;
  boolean[][] data, visited;
</pre>
as instance variables in our class, we can define the function the search function:
<pre>
  void dfs(int x, int y) {
    if (x &lt; 0 || y &lt; 0 || x &#8805; rows || y &#8805; cols || data[x][y] || visited[x][y]) return;
    visited[x][y] = true;
    dfs(x + 1, y); dfs(x - 1, y); dfs(x, y - 1); dfs(x, y + 1);
  }
</pre>
which, if called from (0,0) from instance, will mark each reachable cell in <tt>visited</tt> matrix.
Now the rest of the solution is just to prepare the input (add the border), invoke the DFS, and count 
the number of 'visible' walls:
<pre>
  public int limeLiters(String[] maze) {
    rows = maze.length + 2; 
    cols = maze[0].length() + 2; 
    data = new boolean[rows][cols]; 
    visited = new boolean[rows][cols];
    // construct a new maze with an added empty border
    for (int i = 0; i &lt; rows - 2; i++) 
      for (int j = 0; j &lt; cols - 2; j++) 
        data[i + 1][j + 1] = (maze[i].charAt(j) == '#');
    dfs(0, 0); // will mark reachable floor spaces
    // now if two neighboring cells have different visited[][] value, one
    // if a wall block and the other a reachable floor: count as a wall to paint
    int ans = 0;
    for (int i = 0; i &lt; rows; i++) 
      for (int j = 0; j &lt; cols - 1; j++) 
        if (visited[i][j] ^ visited[i][j + 1]) ans++;
    for (int i = 0; i &lt; rows - 1; i++) 
      for (int j = 0; j &lt; cols; j++) 
        if (visited[i][j] ^ visited[i + 1][j]) ans++;
    return ans;
  }
</pre>
</p>


<div class="authorPhoto">
    <img src="/i/m/ged_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10505830" context="algorithm"/><br />
	<em>TopCoder Member</em>
</div>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
