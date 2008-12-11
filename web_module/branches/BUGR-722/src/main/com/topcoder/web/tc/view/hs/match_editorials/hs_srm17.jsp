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
    <A href="/tc?module=HSRoundOverview&rd=10069&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506039" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 17</span><br>Monday, October 23, 2006
<br><br>

<h2>Match summary</h2>

 

<p>

TCHS SRM 17 proved to be quite difficult, making for a very exciting challenge phase as half of the medium submissions alone were successfully challenged.  
Looking to the top of the field, <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> won his third TCHS match thanks to the fastest time on the easy problem and deceptively difficult medium problem, regaining his red color.
Finishing second with the help of a challenge was <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>, who now sports a shiny red color for the first time in his TCHS career.
Rounding out the top 5 were <tc-webtag:handle coderId="22652634" context="hs_algorithm"/> who won 25 challenge points, <tc-webtag:handle coderId="22652504" context="hs_algorithm"/> who although failing the medium problem was helped by 75 points in challenges as well as the high score on the hard problem,
and <tc-webtag:handle coderId="15117368" context="algorithm"/> who also gained 75 points in challenges.

</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/tc?module=HSProblemStatement&pm=6791&rd=10069" name="6791">BisquareSums</a></b>

</font>

<A href="javascript:void openProblemRating(6791)" src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A href="http://forums.topcoder.com/?module=ThreadList&forumID=506039" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      78 / 88 (88.64%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      59 / 78 (75.64%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Zuza</b> for 249.76 points (0 mins 53 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      229.24 (for 59 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem was rather straightforward, as most failures were caused by trivial implementation errors.  The first thing to notice is that the constraints 
on this problem are low enough that we can iterate through all possible integers between <b>low</b> and <b>high</b>, and test each one to see if it can be represented as a bisquare.  
However, there is an easier way to solve this problem.  We can simply iterate through all pairs of integers x and y between <b>low</b> and <b>high</b>, and check if <b>low</b> &le; x<sup>2</sup> + y<sup>2</sup> &le; <b>high</b>.
However, we must be careful not to count the same bisquare twice.  To account for this, we can flag each bisquare in a boolean array, making sure to count each bisquare only once.
This simple algorithm can be implemented in Java as follows:<br>
<pre>
    int getSums(int low, int high) {
        int ret = 0;
        boolean vis[] = new boolean[high + 1];
        for(int i = 0; i * i <= high; i++) {
            for(int j = i; j * j + i * i <= high; j++) {
                int res = i * i + j * j;
                if (res >= low && !vis[res]) {
                    vis[res] = true;
                    ret++;
                }
            }
        }
        return ret;
    }
}
</pre>

</p>

 

<font size="+2">

<b><a href="/tc?module=HSProblemStatement&pm=3453&rd=10069" name="3453">ScrabFortune</a></b>

</font>

<A href="javascript:void openProblemRating(3453)" src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A href="http://forums.topcoder.com/?module=ThreadList&forumID=506039" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      50 / 88 (56.82%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      13 / 50 (26.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Zuza</b> for 396.68 points (15 mins 21 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      251.54 (for 13 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem looks quite simple at first, but a quick glance at example 3 tells us otherwise.  That being said, there are two main ways to solve this problem: the <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=dynProg">dynamic programming</a>
approach and the <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=greedyAlg">greedy</a> approach.  Most coders opted to take the dynamic programming route, so we'll investigate this solution first.<br><br>

The first thing we should look for in a DP algorithm is a <a href="http://en.wikipedia.org/wiki/Recurrence_relation">recurrence relation</a>.  How can we define a problem in terms of its subproblems?  First, let us consider what our state space should be.  In other words,
for any problem, how can we <i>uniquely</i> and completely define that problem, such that we can easily define its subproblems the same way?  In this case, it makes sense for our state space to be a pair of integers
representing an index in <b>pool</b> (which should be sorted alphabetically) and how many letters have been revealed so far.  Here, our base case is when our index is the size of <b>pool</b>, since there are no letters left to use.
Now, there are two possibilities for this base case.  
Either the number of letters revealed so far will allow us to win the game, or it will not.  If not, we return "IMPOSSIBLE"; otherwise we can return the empty string, since no more letters are needed to win the game.<br><br>

Now that we have our state space and base case, we can finally define our recurrence relation.  First, assume that we haven't yet arrived at a base case.  Then, given an index of <b>pool</b> and a number of
letters that have been revealed so far, we have two choices to make.  We can either select the current letter, thus (possibly) revealing part of the board, or ignore the current letter hoping to find a shorter solution later.  For each subproblem in our state space,
we take the best of these two possibilities.  Thus, if we take idx to be the current index of <b>pool</b>, revealed to be the total number of letters revealed so far, and rev[idx] to be the number of letters that
selecting <b>pool</b>[idx] will reveal, our recurrence relation F(idx, revealed) can be defined as follows (note that our final result will be F(0,0)):

<pre>
F(idx, revealed) = best(F(idx + 1, revealed + rev[idx]) + pool[idx], F(idx + 1, revealed))    if idx < pool.length
F(idx, revealed) = ""                                        if idx == pool.length and revealed >= threshold
F(idx, revealed) = "IMPOSSIBLE"                                    if idx == pool.length and revealed < threshold
</pre><br>
Here, we can define our best function in pseudocode as follows:
<pre>
String best(String a, String b) {
    if (a == "IMPOSSIBLE")
        return b;
    else if (b == "IMPOSSIBLE")
        return a;
    else if (a.length != b.length)
        return (a.length < b.length) ? a : b;
    else return (a < b) ? a : b;
}
</pre>

For a full implementation of this algorithm, take a look at <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=15117368&rd=10069&pm=3453">msg555's solution</a>, which cleverly reduces the letter pool down to using bitmasks.<br><br>

While coming up with the aforementioned algorithm may not be much trouble for seasoned coders who are familiar with dynamic programming, coming up with the correct greedy algorithm gave many coders a difficult time.  First, we can't just greedily
take the most used letter on the board repeatedly, as per example 3 this may not yield an alphabetically smallest solution.  The correct algorithm uses a two-pronged greedy approach.  First, we 
find the length of the shortest (but not necessarily smallest alphabetically) solution by repeatedly taking the most frequently appearing letter.  Then we can iterate through each unique letter in <b>pool</b> in alphabetical order,
and for each one ask the question: 
"If I use this letter in combination with my (initially empty) partial solution, can I still arrive at a shortest solution?".  This question can be answered by using a modified version of the algorithm above.  
First, we use all letters in our partial solution, as well as the letter that we're investigating.  Then, for the rest of the problem, we choose the most frequently appearing letter
until we arrive at a solution.  This algorithm correctly finds the shortest solution possible, such that you <i>must</i> use the letters in your partial solution in conjunction with the letter you're investigating.<br>
<br>

Thus, iterating through each letter of <b>pool</b> in alphabetical order, and adding that letter to our result if using the letter yields a shortest solution will always arrive at the alphabetically first solution among all
shortest solutions.  Here's an implementation of this algorithm in Java:
<pre>
    char[] pool;
    int[] reveal;
    //Given a sequence of letters that have already been used, compute the length of the shortest possible solution.
    int solve(String sofar, int left, int threshold) {
        int ret = sofar.length();
        while (left > threshold) {
            int best = 0, position = 0;
            //Find the most frequently appearing letter that hasn't yet been used.
            for (int i = 0; i < pool.length; i++)
                if (sofar.indexOf(pool[i]) == -1 && reveal[i] > best) {
                    best = reveal[i];
                    position = i;
                }
            if (best == 0) {
                return -1;
            }
            left -= reveal[position];
            sofar += pool[position];
            ret++;
        }
        return ret;
    }
        
    String getMin(String _pool, String[] board, int threshold) {
        pool = _pool.toCharArray();
        Arrays.sort(pool);
        reveal = new int[pool.length];
        int left=0;

        //Count how many times each letter in pool appears in board.
        for (int i = 0; i < board.length; i++) {
            left += board[i].length();
            for (int j = 0; j < board[i].length(); j++) {
                for (int k = 0; k < pool.length; k++) {
                    if (board[i].charAt(j) == pool[k]) {
                        reveal[k]++;
                    }
                }
            }
        }
        //Compute the shortest possible solution.
        int shortest = solve("", left, threshold);
        if (shortest == -1) {
            return "IMPOSSIBLE";
        }
        String ret = "";
        for (int i = 0; i < pool.length; i++) {
            if (ret.indexOf(pool[i]) == -1) {
                //If using this letter yields any shortest solution, use it.
                int res = solve(ret + pool[i], left - reveal[i], threshold);
                if (res !=- 1 && res == shortest) {
                    ret += pool[i];
                    left -= reveal[i];
                }
            }
        }
        return ret;
    }
</pre>
</p>

<font size="+2">

<b><a href="/tc?module=HSProblemStatement&pm=3454&rd=10069" name="3454">MinePut</a></b>

</font>

<A href="javascript:void openProblemRating(3454)" src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A href="http://forums.topcoder.com/?module=ThreadList&forumID=506039" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      21 / 88 (23.86%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      17 / 21 (80.95%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Achtung-Achtung</b> for 858.37 points (11 mins 57 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      614.35 (for 17 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

As with the medium, coders took two different approaches for solving this problem.  The first solution uses <a href="http://en.wikipedia.org/wiki/Backtracking">backtracking</a>.  In other words, we recursively try to put a mine in each spot, making sure that
the resulting board is valid after each move, and figure out the maximum number of mines that we can place this way.  Pseudocode for this algorithm looks something like this:
<pre>
    recurse(int row, int column, int minesPlaced) {
        if (col == numCols) {
            col = 0;
            row++;
        }
        //We'ved iterated through the entire board, so return.
        if (row == numRows) {
            ret = max(ret, minesPlaced);
            return;
        }
        //See if we can place a mine in this cell.
        if (freeSquare(row, column) && canPlaceMine(row, column) ) {
            //Try placing the mine to see what happens.
            placeMine(row, column);
            recurse(row, column + 1, minesPlaced + 1);
            //Undo this change so that we can look at other possibilities later - ie "backtrack".
            unPlaceMine(row, column);
        }
        //We should also try not placing a mine here in case this is the optimal choice.
        recurse(row, column + 1, minePlaced);
    }
</pre>

Note that we need to be careful while checking to see if we can place a mine in a square, as well as updating the board to ensure that we don't timeout.  To determine if we can place a mine in a certain cell, we only need to make sure that the 
neighbors of that cell will allow for at least one mine to be placed adjacent to them.  Then when we place the mine, we can decrease the number of mines that may be placed around each of the cell's neighbors.
Pseudocode for canPlaceMine and placeMine follows (unPlaceMine is similar to placeMine):
<pre>
    bool canPlaceMine(int row, int col) {
        for (each cell c adjacent to (row,col))
            if (maxMines[c] == 0)
                return false;
        return true;
    }
    
    placeMine(int row, int col) {
        for (each cell c adjacent to (row,col))
            maxMines[c]--;
    }
</pre>

For a complete implementation of this algorithm, take a look at <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22641901&rd=10069&pm=3454">nima.ahmadi's solution</a>.<br><br>

The second approach taken during the contest was to simply generate all subsets of the board using <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=integersReals">bitmasks</a>.  That is, we generate each possible subset of cells of <b>board</b>, and check each one to verify that it is valid.  To make 
it feasible to use a single bitmask for all rows, there's a trick that we can use that transforms a single integer into (row,column) form and vice-versa.  Since there are numCols columns in each row, then the jth column of the ith row can be uniquely represented 
as B = i * numCols + j.  Thus, to get an integer in this canonical form to its corresponding (row,column) representation, we have row = B / numCols and col = B % numCols. Using some of our pseudocode above, the algorithm looks something like this:
<pre>
    int solve() {
        int N = totalCells(board);
        int bestAnswer = 0;
        for (int i = 1; i < (1 << N); i++) {
            bool valid = true;
            int nMines = 0;
            for (int j = 0; j < N; j++) {
                if (i & (1 << j) ) {
                    nMines++;
                    int row = N / numCols;
                    int column = N % numCols;
                    //Make sure that there is actually a mine.
                    if (board[row][column] != '.') {
                        valid = false;
                        break;
                    }
                    //If there is any mine we cannot place, then the board is invalid.
                    if (canPlaceMine(row, column) == false) {
                        valid = false;
                        break;
                    } else placeMine(row, column);
                }
            }
            if (valid)
                bestAnswer = max(ret, nMines);
        }
        return bestAnswer;
    }
</pre>

You can see a complete implementation of this algorithm by looking at <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=21468741&rd=10069&pm=3454">Burunduk3's solution</a>.

</p>

 
<div class="authorPhoto">
    <img src="/i/m/eleusive_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8369955" context="algorithm"/><br />    <em>TopCoder Member</em>
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
