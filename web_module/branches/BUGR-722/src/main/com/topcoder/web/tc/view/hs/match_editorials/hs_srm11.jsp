<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

<tc-webtag:forumLink forumID="506033" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 11</span><br>Monday, August 14, 2006
<br><br>

<h2>Match summary</h2>


<p>This match proved to be fairly simple, especially on the first two problems, which most coders
solved very quickly.  The third, a classic TC-style DP problem, required a bit more thinking and
planning, and as such had less submissions.</p>

<p>Top honors go to <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>, who won in part due to
some success in the challenge phase.  In second was
<tc-webtag:handle coderId="14886245" context="hs_algorithm"/>, who offered solid scores on all three problems.
After some tough luck in the challenge phase, would-be winner
<tc-webtag:handle coderId="15600321" context="hs_algorithm"/> finished third.
<tc-webtag:handle coderId="10399429" context="hs_algorithm"/> and
<tc-webtag:handle coderId="12005484" context="hs_algorithm"/> rounded out the top five.  Congratulations
to all 18 competitors who correctly solved all three problems.</p>


<H1>

The Problems

</H1>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6388&amp;rd=10063" name="6388">CityBuses</a></b>

</font>

<A href="Javascript:openProblemRating(6388)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506033" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      111 / 122 (90.98%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      89 / 111 (80.18%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>sluga</b> for 248.94 points (1 mins 51 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      227.38 (for 89 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>The big thing to see here is that on a maximum (50x50) sized grid, even a brute force solution checking
all possible starting and ending points will run in time.  The basic thrust of the solution: For each
possible pair of points, if both are a bus stop, see if that distance is longer than the greatest distance
found so far:</p>

<pre>
public int maximumFare (String[] blocks) {
   int best = 0;
   for (int i = 0; i < blocks.length; i++) for (int j = 0; j < blocks[i].length(); j++)
      for (int x = 0; x < blocks.length; x++) for (int y = 0; y < blocks[x].length(); y++)
         if (blocks[i].charAt(j) == 'B' && blocks[x].charAt(y) == 'B')
            best = Math.max(best, Math.abs(x - i) + Math.abs(y - j));
   return best;
}
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6615&amp;rd=10063" name="6615">LineOfSight</a></b>

</font>

<A href="Javascript:openProblemRating(6615)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506033" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      99 / 122 (81.15%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      69 / 99 (69.70%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mateuszek</b> for 486.40 points (4 mins 46 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      383.08 (for 69 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>Similar to the first problem, we can again note that on a 50x50 board, a brute force solution, checking
all possible (legal) positions for placing your rook, is feasible to run in time.  The first thing to do
is to determine where the potential legal moves are.  A two-dimensional boolean array works well.</p>

<p>Then, we can loop through all positions on the board and, for each legal position, determine how many
legal positions would remain if we made our move on that square.  Keeping track of the move that leaves
the fewest number of legal squares, we have a solution that looks like this:</p>

<pre>
public int bestPosition (String[] board) {
   int best = 2501;
   boolean[][] unsafe = new boolean[board.length][board[0].length()];
   for (int i = 0; i < board.length; i++) for (int j = 0; j < board[i].length(); j++)
      if (board[i].charAt(j) == 'X')
         for (int x = 0; x < board.length; x++) for (int y = 0; y < board[x].length(); y++)
            if (i == x || j == y)
               unsafe[x][y] = true;
   for (int i = 0; i < board.length; i++) for (int j = 0; j < board[i].length(); j++)
      if (!unsafe[i][j]) {
         int test = 0;
         for (int x = 0; x < board.length; x++) for (int y = 0; y < board[x].length(); y++)
            if (i != x && j != y && !unsafe[x][y])
               test++;
         best = Math.min(best, test);
      }
   if (best > 2500) return -1;
   return best;
}
</pre>

<p>The above solution was fairly simple to think up.  However, a few key observations can lead to a simpler
solution.  An interesting fact about this problem is that  it doesn't matter where you place your rook.  If there
are any legal moves available to you, the number of remaining moves will be the same no matter which
one you choose.  Remember that a legal move is a square where there are no other rooks in that column, and
no other rooks in that row.  Let <em>row</em> = the # of rows that don't have a rook,
and <em>col</em> = the # of columns that don't have a rook.  Then, if either is 0, there are no moves
available, so we should return -1.  Otherwise, we know that after we place our rook, there will be
<em>row</em>-1 rows and <em>col</em>-1 columns available, thus there will be 
(<em>row</em>-1)*(<em>col</em>-1) squares available.  The following was written by 
<tc-webtag:handle coderId="15545604" context="hs_algorithm"/>:

<pre>
public int bestPosition(String[] board) {
   int N = board.length;
   int W = board[0].length();
   boolean[] rok = new boolean[N]; Arrays.fill(rok, true);
   boolean[] cok = new boolean[W]; Arrays.fill(cok, true);
   for (int i = 0; i < N; i++) for (int j = 0; j < W; j++) {
      rok[i] &= (board[i].charAt(j) == '.');
      cok[j] &= (board[i].charAt(j) == '.');
   }
   int r = 0;
   for (int i = 0; i < N; i++) if (rok[i]) r++;
   int c = 0;
   for (int i = 0; i < W; i++) if (cok[i]) c++;
   return (r * c == 0) ? -1 : (r - 1) * (c - 1);
}
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5913&amp;rd=10063" name="5913">StringBeads</a></b>

</font>

<A href="Javascript:openProblemRating(5913)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506033" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      40 / 122 (32.79%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      19 / 40 (47.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>MB__</b> for 929.66 points (7 mins 56 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      596.35 (for 19 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>In a TopCoder sense, this problem is classic Dynamic Programming.  First, imagine we are physically
stringing the beads.  Any time we go to place a bead, we need to look at our string to see which two
beads we last placed, and make sure that whatever we place next is a different color than either of those
two.  This lends itself to a good definition of our state space: the number of each color bead remaining to
be strung, and the colors of the last two beads.</p>

<p>Coders mostly used either a straight DP approach with an array to store the values of the subproblems,
or a recursive (memoized, of course!) solution that utilized some type of hashtable to store the
partial results.  For the straight DP approach, it may be helpful to think of every case as having five
different color beads, with the possibility that there are 0 beads of the last two colors.  My solution
below uses this approach.</p>

<p>As a side note, the constraint about there being a total of no more than 35 beads may have seemed 
odd at first glance.  In fact, this was to ensure that the return value could fit (with room to spare) into
a 64-bit integer.</p>

<p>There are several interesting things one might notice about this problem.  One is that, for cases with
three colors, the largest and smallest quantity of any single color can differ by at most one, or else there
is no way to string the beads (fairly simple to demonstrate, but left as an exercise to the reader).</p>

<pre>
public long numWays (int[] beads) {
   int[] b = new int[5];
   for (int i = 0; i < beads.length; i++) b[i] = beads[i];
   for (int i = beads.length; i < 5; i++) b[i] = 0;
   long[][][][][][][] dp = new long[b[0] + 1][b[1] + 1][b[2] + 1][b[3] + 1][b[4] + 1][5][5];
   dp[1][1][0][0][0][0][1] = 1;
   dp[1][1][0][0][0][1][0] = 1;
   dp[1][0][1][0][0][0][2] = 1;
   dp[1][0][1][0][0][2][0] = 1;
   dp[0][1][1][0][0][2][1] = 1;
   dp[0][1][1][0][0][1][2] = 1;
   if (beads.length > 3) {
      dp[1][0][0][1][0][0][3] = 1;
      dp[1][0][0][1][0][3][0] = 1;
      dp[0][1][0][1][0][1][3] = 1;
      dp[0][1][0][1][0][3][1] = 1;
      dp[0][0][1][1][0][2][3] = 1;
      dp[0][0][1][1][0][3][2] = 1;
   }
   if (beads.length > 4) {
      dp[1][0][0][0][1][0][4] = 1;
      dp[1][0][0][0][1][4][0] = 1;
      dp[0][1][0][0][1][1][4] = 1;
      dp[0][1][0][0][1][4][1] = 1;
      dp[0][0][1][0][1][2][4] = 1;
      dp[0][0][1][0][1][4][2] = 1;
      dp[0][0][0][1][1][3][4] = 1;
      dp[0][0][0][1][1][4][3] = 1;
   }
   for (int v = 0; v <= b[0]; v++) for (int w = 0; w <= b[1]; w++) for (int x = 0; x <= b[2]; x++)
      for (int y = 0; y <= b[3]; y++) for (int z = 0; z <= b[4]; z++) {
         for (int i = 0; i < 5; i++) for (int j = 0; j < 5; j++) {
            if (v > 0 && i != 0 && j != 0) dp[v][w][x][y][z][j][0] += dp[v - 1][w][x][y][z][i][j];
            if (w > 0 && i != 1 && j != 1) dp[v][w][x][y][z][j][1] += dp[v][w - 1][x][y][z][i][j];
            if (x > 0 && i != 2 && j != 2) dp[v][w][x][y][z][j][2] += dp[v][w][x - 1][y][z][i][j];
            if (y > 0 && i != 3 && j != 3) dp[v][w][x][y][z][j][3] += dp[v][w][x][y - 1][z][i][j];
            if (z > 0 && i != 4 && j != 4) dp[v][w][x][y][z][j][4] += dp[v][w][x][y][z - 1][i][j];
         }
      }
   long ret = 0;
   for (int i = 0; i < 5; i++) for (int j = 0; j < 5; j++)
      ret += dp[b[0]][b[1]][b[2]][b[3]][b[4]][i][j];
   return ret;
}
</pre>


<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />    <em>TopCoder Member</em>
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
