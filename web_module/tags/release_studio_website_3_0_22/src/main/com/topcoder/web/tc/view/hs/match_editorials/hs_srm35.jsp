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
    <A href="/tc?module=HSRoundOverview&rd=10771&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516561" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 35</span><br>Saturday, July 21, 2007
<br><br>

<h2>Match summary</h2> 



 

<p>The easy problem proved to be fairly straightforward for most coders.  The medium posed a little
more difficulty, although noticing a few tricks made the problem simpler.  Though there were a 
handful of submissions, it turned out the hard was just a bit complicated, and none of the five
submissions survived.</p>

<p>In the end, good times on the first two problems, and a handful of challenges were the secret to
doing well this match.  <tc-webtag:handle coderId="14767863" context="hs_algorithm"/>, <tc-webtag:handle coderId="22627975" context="hs_algorithm"/>, and <tc-webtag:handle coderId="20785529" context="hs_algorithm"/> took the top three slots.</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8037&amp;rd=10771" name="8037">NamesList</a></b> 

</font> 

<A href="Javascript:openProblemRating(8037)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516561" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      49 / 53 (92.45%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      35 / 49 (71.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>mirosuaf</b> for 248.61 points (2 mins 7 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      214.47 (for 35 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>This is a fairly straightforward task of just looking at the <i>k</i>-th character of each
name (among those that have at least <i>k</i> characters), and keeping track of how many
times each letter appears.  Then, return the one that appears the most times.</p>

<pre>
public String popularInitial(String[] names, int k) {
    int[] count = new int[256];
    for (int i = 0; i < names.length; i++)
        if (names[i].length() >= k)
            count[names[i].charAt(k - 1)]++;
    int best = 0;
    String res = "";
    for (char c = 'A'; c <= 'Z'; c++)
        if (count[c] > best) {
            best = count[c];
            res = "" + c;
        }
    return res;
}
</pre>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8036&amp;rd=10771" name="8036">PaperGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(8036)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516561" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      27 / 53 (50.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      17 / 27 (62.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>mirosuaf</b> for 479.55 points (5 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      339.17 (for 17 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>Several coders quickly jumped at this problem using Dynamic Programming, or recursion with
memoization.  The idea is to try dividing the paper at each possible location, and then count
the maximum number of moves that could be made on either resulting piece.  Indeed, this works,
but there's a simpler solution, although it requires a bit of insight on the problem.</p>

<p>First, it's useful to check if we're in a forbidden state at the beginning.  If we are, then
there's nothing we can do.  Also, if the forbidden size is 2, then (except for a 1x1 paper) it's
impossible to divide the paper without eventually having a piece with a side length of 2.  Now that
we've taken care of those "special" cases, let's consider the more general case.</p>

<p>Notice, first and foremost, that the most moves we can make is 1 plus the most moves we can 
make on either resulting piece (after whatever cut we decided to make).  So, we only ever need
to consider the piece that has more remaining moves, namely, the larger of the two pieces.  In
other words, after each move, we want one of the remaining pieces to be as large as possible.</p>

<p>So, the best thing to do is to cut off 1-unit wide strips, then when we're down to a single
strip, cut off 1x1 squares one at a time.  The only thing to check is that if we're about to cut
off a single strip, and that would leave us a forbidden size, then we instead have to cut of a 
2-unit wide strip.  With this in mind, we can calculate the number of moves in closed form, with
no DP required.</p>

<pre>
public int mostMoves (int width, int height, int forbidden) {
    if (width == 1 && height == 1)
        return 0;
    if (forbidden == 2 || forbidden == height || forbidden == width)
        return -1;
    int ret = 0;
    if (height > 1) {
        ret += height - 2;
        if (height < forbidden) ret++;
    }
    if (width > 1) {
        ret += width - 2;
        if (width < forbidden) ret++;
    }
    return ret;
}
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8039&amp;rd=10771" name="8039">PaperScraps</a></b> 

</font> 

<A href="Javascript:openProblemRating(8039)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516561" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      5 / 53 (9.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      0 / 5 (0.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>null</b> for null points (NONE) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      No correct submissions 

    </td> 

  </tr> 

</table></blockquote> 

<p>Apparently this one was troublesome for coders.  In reality, all that was required was a brute
force approach.  But what exactly did we have to brute force through?  Well, we have two pieces of
paper, and each can be flipped or rotated, meaning there are 8 possible orientations for each paper.</p>

<p>Then, we know that they can be adjacent, or partially/fully overlapping.  If we fix the location
of the first piece on a grid at (0,0), and allow the second piece to be at any location from (0,0) to
(5,5), that covers all possible full/partial overlaps and adjacencies.</p>

<p>So, we have 8 orientiations of each piece, and 36 placements, so there are 8 * 8 * 36 = 2304
possible resulting grids.  For each of those, we find the largest rectangle, and return the largest
of those.  This last part requires either a bit of pruning/optimization, or some minor algorithmic
trickery, but is a fairly well known problem.</p>

<pre>
boolean[][][][] paper = new boolean[2][8][5][5];

public int biggestRectangle(String[] paper1, String[] paper2) {
  
  // Represent our two scraps of paper
  for (int i = 0; i < paper1.length; i++)
    for (int j = 0; j < paper1[i].length(); j++)
      paper[0][0][i][j] = paper1[i].charAt(j) == 'X';
  for (int i = 0; i < paper2.length; i++)
    for (int j = 0; j < paper2[i].length(); j++)
      paper[1][0][i][j] = paper2[i].charAt(j) == 'X';
  
  // Represent the rotations
  for (int k = 0; k <= 1; k++)
    for (int r = 1; r <= 3; r++)
      for (int i = 0; i < 5; i++)
        for (int j = 0; j < 5; j++)
          paper[k][r][i][j] = paper[k][r - 1][j][4 - i];
  
  // Represent the flips
  for (int k = 0; k <= 1; k++)
    for (int r = 0; r <= 3; r++)
      for (int i = 0; i < 5; i++)
        for (int j = 0; j < 5; j++)
          paper[k][r + 4][i][j] = paper[k][r][4 - i][j];  
  
  // Try each possible arrangement, and find the biggest area it yields
  int best = 0;
  for (int r1 = 0; r1 <= 7; r1++) for (int r2 = 0; r2 <= 7; r2++)
    for (int x = 0; x <= 5; x++) for (int y = 0; y <= 5; y++) {
      boolean[][] grid = new boolean[10][10];
      for (int i = 0; i < 5; i++) for (int j = 0; j < 5; j++) {
        grid[i][j] |= paper[0][r1][i][j];      
        grid[x + i][y + j] |= paper[1][r2][i][j];
      }
      for (int xx = 0; xx < 10; xx++) for (int yy = 0; yy < 10; yy++)
        if (grid[xx][yy]) {
          boolean[][] fill = new boolean[10 - xx][10 - yy];
          fill[0][0] = true;
          int test = 1;
          for (int i = 1; i < 10 - xx; i++)
            if (fill[i - 1][0] && grid[xx + i][yy]) {
              fill[i][0] = true;
              test = Math.max(test, i + 1);
            }
          for (int j = 1; j < 10 - yy; j++)
            if (fill[0][j - 1] && grid[xx][yy + j]) {
              fill[0][j] = true;
              test = Math.max(test, j + 1);
            }
          for (int i = 1; i < 10 - xx; i++) for (int j = 1; j < 10 - yy; j++)
            if (fill[i - 1][j] && fill[i][j - 1] && grid[xx + i][yy + j]) {
              fill[i][j] = true;
              test = Math.max(test, (i + 1) * (j + 1));
            }
          if (test > best) best = test;
        }
    }
  return best;
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
