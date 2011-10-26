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
<tc-webtag:forumLink forumID="505854" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 288</span><br>Wednesday, February 8, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>In Division 1, coders were faced with a fairly easy set, with 30 individuals solving the hard correctly.
Unfortunately, precision issues on the easy caused several of the 250s to fail.  In the end, <b>misof</b>,
<b>ploh</b>, <b>AdrianKuegel</b>, <b>tjq</b>, and <b>John Dethridge</b> took the top five spots.</p>

<p>In Division 2, nearly all submissions passed on the easy.  The medium, identical to the Division 1 easy,
was a slaughterhouse during systesting, for many of the same precision issues.  Ultimately, only 3 coders got
the hard, which proved to be very challenging!  Newbie <b>superzn</b> won the division, with another newbie,

<b>Michael_Rybak</b>, in a fairly distant second.  <b>hungson175</b> took third.</p>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6036&amp;rd=9809" name="6036">AccountBalance</a></b> 
</font> 
<A href="Javascript:openProblemRating(6036)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505854" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      307 / 324 (94.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      301 / 307 (98.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Galeon</b> for 249.41 points (1 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      223.02 (for 301 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem was very straightforward.  You know the starting balance.  You then simply process each transaction
given (the order in which you do it doesn't even matter, really).  If it's a credit, add the money to the account;
for a debit, take the money out.

</p>

<pre>
public int processTransactions (int startingBalance, String[] transactions) {
  int balance = startingBalance;
  for (int i = 0; i < transactions.length; i++) {
    String[] s = transactions[i].split(" ");
    int n = Integer.parseInt(s[1]);
    if (s[0].equals("C"))
      balance += n;
    else
      balance -= n;
  }
  return balance;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5943&amp;rd=9809" name="5943">FindTriangle</a></b> 
</font> 
<A href="Javascript:openProblemRating(5943)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505854" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      163 / 324 (50.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 163 (17.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>xander</b> for 391.98 points (15 mins 51 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      272.24 (for 28 correct submissions) 
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
      261 / 284 (91.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      92 / 261 (35.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>misof</b> for 243.10 points (4 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      171.06 (for 92 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
When you see a problem that involves area of triangles, the first thought is usually "Heron's formula", and in 
general, this is a good line of thinking.  However, floating point precision becomes an issue here.  First,
we recall Heron's formula (which comes in many slight variations):<br />
A = 1/4 * Sqrt((<i>a</i> + <i>b</i> + <i>c</i>) * (<i>a</i> + <i>b</i> - <i>c</i>) * (<i>a</i> + <i>c</i> - <i>b</i>) * (<i>b</i> + <i>c</i> - <i>a</i>))</p>

<p>For this particular problem, one of the easiest cases to catch the bug is when all three points are colinear.
A triangle formed by three colinear points has the area of zero, 
but double imprecision may make your solution to return non-zero values.</p>

<p>One way to avoid this is to check for colinear points before even considering them as a potential largest
triangle.  A downside is that this requires a moderate amount of coding.  
Another (and much safer) option, is to use more precise formula.
As shown <a href="http://mathworld.wolfram.com/TriangleArea.html">here</a>, 
the area of a triangle can be computed as a cross-product of its two sides divided by 2. 
To compute the cross-product, find the vectors representing two sides of the triangle and use <a href="http://mathworld.wolfram.com/CrossProduct.html">this</a> formula
</p>

<p>The only other thing to deal with here was making sure that the points were all the same color, or all different.
There's any number of ways to do this.  Here, I've given each color a point value of 0, 1 and 2.  Summing up the
point values of the three points gives us something to go with... If the sum is divisible by 3, we are all set.</p>

<pre>
/// Parse the input first, saving coordinates to x, y and z, and saving the color to c.
  long best = 0;
  for (int i = 0; i < x.length; i++) 
   for (int j = 0; j < i; j++) 
     for (int k = 0; k < j; k++) 
       if ((c[i] + c[j] + c[k]) % 3 == 0) {
         long dx1 = x[i] - x[j];
         long dy1 = y[i] - y[j];
         long dz1 = z[i] - z[j];
         long dx2 = x[k] - x[j];
         long dy2 = y[k] - y[j];
         long dz2 = z[k] - z[j];            
         long len = (dx1 * dy2 - dx2 * dy1) * (dx1 * dy2 - dx2 * dy1);
         len += (dx1 * dz2 - dx2 * dz1) * (dx1 * dz2 - dx2 * dz1);
         len += (dz1 * dy2 - dz2 * dy1) * (dz1 * dy2 - dz2 * dy1);
         best = Math.max(best, len);
  }
  return Math.sqrt((double)best) / 2.;

</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6030&amp;rd=9809" name="6030">TurnOffLights</a></b> 
</font> 
<A href="Javascript:openProblemRating(6030)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505854" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      49 / 324 (15.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 49 (6.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Michael_Rybak</b> for 722.07 points (19 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      616.72 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>There are a few initial observations that make this problem much simpler to understand and solve.
The first, is that since each light is either on or off, we can represent the state of the board as a bitmask,
namely, the board has exactly 65,536 different states.  Next, note that each button press operation &quot;changes
the state&quot; of one or more buttons.  In bit manipulation world, this means we're dealing with XOR operations.</p>

<p>Now, notice that since we're looking for the fewest number of moves, that should immediately suggest a breadth
first search.  Typically, we implement one using a queue, and exploring each board state as we find more efficient
ways of getting there:</p>

<pre>
/* Bitmask XOR values for the moves that change all surrounding lights */
int[] moves = new int[16]; 

/* As we process different sequences, keep track of the fewest moves to get to each state */
int[] best = new int[65536];

/* A simple queue to keep track of which board states we still need to explore */
int[] next = new int[1000000];
int pos = 0;
int end = 0;

/* Process the board state given by the bitmask n */
public void process(int n)
{
  /* For each button, see what happens if we do the 1-point or 2-point move */
  for (int i = 0; i < 16; i++) {
    int new1 = n ^ moves[i];
    int new2 = n ^ (1 << i);
    /* If this gets us to the next state in fewer moves than we already know how to do,
       then update, and we'll explore that state again later */
    if (best[n] + 1 < best[new1]) {
      best[new1] = best[n] + 1;
      next[end] = new1;
      end++;
    }
    if (best[n] + 2 < best[new2]) {
      best[new2] = best[n] + 2;
      next[end] = new2;
      end++;
    }
  }
}

public int fewestMoves(String[] board) {
  /* First, represent the board as a bitmask */
  int start = 0;
  for (int i = 0; i < 4; i++)
    for (int j = 0; j < 4; j++)
      if (board[i].charAt(j) == '1')
        start |= 1 << (i * 4 + j);
  /* Fill our "best" list with max values */
  for (int i = 0; i < 65536; i++) best[i] = 999999;
  /* Define the bitmasks for 1-point operations */  
  for (int i = 0; i < 16; i++) {
    moves[i] |= 1L << i;
    if (i <= 11) moves[i] |= 1L << (i + 4);
    if (i >= 4) moves[i] |= 1L << (i - 4);
    if (i % 4 > 0) moves[i] |= 1L << (i - 1);
    if (i % 4 < 3) moves[i] |= 1L << (i + 1);
  }
  /* Place our initial board state int the queue for processing */
  best[start] = 0;
  next[end] = start;
  end++;
  /* Run through the queue until we're done */
  while (end > pos) {
    process(next[pos]);
    pos++;
  }
  /* Return the fewest number of moves to reach an empty board */
  return best[0];
}

</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6033&amp;rd=9809" name="6033">CannonBalls</a></b> 
</font> 
<A href="Javascript:openProblemRating(6033)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505854" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      245 / 284 (86.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201 / 245 (82.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>HardCoder</b> for 448.49 points (1 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      342.84 (for 201 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The first thing to see about this problem, and really it's main intent, is that greedy fails.  In many cases, 
the greedy solution is the optimal one, but <i>n</i> = 40 is a good counter-example.  Notice that our stacks of
cannon balls can have 1, 4, 10, 20, 35... cannon balls in them.  A greedy solution would find that
40 = 35 + 4 + 1, or 3 stacks.  But, in reality, 2 stacks of 20 is better.</p>

<p>This in mind, a DP-based, subset-sum type of solution, is probably the next thing to come to mind, and given the
constraints, this works just fine.  This is probably the most common type of solution that was submitted.</p>

<p>Still another way to do it is to work in a recursive fashion, keeping track of the best solution we find,
and essentially "backtracking".  In other words, try starting with the largest pile and working down (greedy), and
see how that goes.  Then, try smaller piles instead, but only so long as it's still possible for us to do better
than our current best solution, and bail out as soon as that's no longer the case.  Since teh greedy solution is
already fairly close to the best solution, this highly pruned brute force approach actually runs in time for
values much higher than the constraints.</p>

<pre>
int[] stacks = new int[2001];

/* n = the number of cannon balls to arrange into stacks
   m = the index of the largest pile to consider
   b = the value to beat, bail out if our result will be worse than this */
public int go(int n, int m, int b) {
  if (n == 0) return 0; // No more cannon balls to stack
  if (m == 1) return n; // With piles of 1, this is trivial
  int best = n; // We know, at worst, we can do piles of 1
  int stop = Math.min(b, best); // bail out threshold
  int s = n / stacks[m]; // Max # of stacks of the largest size
  if (s >= stop)  // If this will push us over our limit, bail out
    return best;
  // Try any number of stacks of the current size
  for (int j = s; j >= 0; j--) {
    best = Math.min(best, j + go(n - j * stacks[m], m - 1, stop - j));  // Recurse
    // If we improved our best, we improved our bailout threshold
    stop = Math.min(stop, best); 
    // 1 is the best we can ever expect to do, no sense going further
    if (best == 1) return best; 
  }
  return best;
}

public int fewestPiles(int n) {
  int a = 1;
  int layer = 0;
  // First, figure out how large each stack is
  for (int i = 1; i <= 2000; i++) {
    layer += i;
    stacks[i] = stacks[i - 1] + layer;
    if (stacks[i] <= n) a = i; // Keep track of the largest stack we need to consider
  }
  // Do it!
  return go(n, a, n);
}

</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6068&amp;rd=9809" name="6068">CountryWar</a></b> 
</font> 
<A href="Javascript:openProblemRating(6068)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505854" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      45 / 284 (15.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      30 / 45 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>misof</b> for 694.65 points (20 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      522.47 (for 30 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>First, we need to parse the input, and determine a number of things: the adjacency for the countries, the
number of armies in each country, and which country is ours.  A subtle detail to pick out from the problem
statement is that, once we start war with a country, we continue battling only that country until the end of
the war.  Thus, the number of armies in each individual territory is not a consideration in our state space.  In
fact, our state space is only which countries we own (a bitmask), and the number of armies we have left.</p>

<p>At each state, we need to choose (optimally) the country to attack next.  To determine our chances of success
when attacking a particular country, we need to know the probability that we'll be left with 1, 2, 3, etc armies
after the battle.  Multiply each value by our chances of success against all remaining countries knowing that we
only have the given number of armies reminaing.  Sum those quantities, and we have our overall expected chances
of winning by first attacking that country.  We just need to pick the best country.</p>

<p>Determining our chances of winning against the other countries with a given number of army units is simply
a matter of (memoized) recursion.  To determine the likelihood of being left with a given number of army units
after a war, we need to simulate (and use Dynamic programming) to calculate out the expected results.  Since
we'll be needing these values frequently as our solution calculates the results, it's best to have a table
created a head of time.  So, prob[attacker][defender][remain] is the probability that a country with <i>attacker</i>
armies, fighting against a country with <i>defender</i> armies, will be left with <i>remain</i> armies at the
end of the war.</p>

<pre>
int tCount;
double[][] dp = new double[65536][21];
double[][][] prob = new double[21][21][21];
int[] enemy = new int[15];
int[] adjacency = new int[15];
int enemyMask = 0;

/* owned = bitmask of what countries we own
   armies = # of armies we have left */
public double go (int owned, int armies) {
  /* If we've already processed this, return it */
  if (dp[owned][armies] >= 0)
    return dp[owned][armies];
  /* If there's no enemies we haven't already taken over, we've won */
  if (((65535 - owned) & enemyMask) == 0)
    return dp[owned][armies] = 1.0;
  double best = 0;
  /* For each country we don't already own, but that we can reach,
     try attacking it, and see which country is optimal to attack next */
  for (int i = 0; i < tCount; i++)
    if ((owned & (1 << i)) == 0 && (adjacency[i] & owned) > 0) {
      double d = 0;
      /* Expectation = Sum of Prob(left with # armies) * 
         prob(winning with that many armies) */
      for (int j = 1; j <= armies; j++)
        d += prob[armies][enemy[i]][j] * go(owned | (1 << i), j);
      best = Math.max(best, d);
    }
  return dp[owned][armies] = best;
}

public double defeatAll(String[] armies) {
  tCount = armies.length;
  int owned = -1;
  int a = 0;
  enemyMask = 0;
  // Initialize our memoization cache
  for (int i = 0; i < (1 << 16); i++)
    for (int j = 0; j < 21; j++)
      dp[i][j] = -1.0;
  // Build our probability table
  for (int ps = 1; ps <= 20; ps++)
    for (int es = 1; es <= 20; es++) {
      double[][] d = new double[ps + 1][es + 1];
      d[ps][es] = 1.0;
      for (int i = ps; i > 0; i--)
        for (int j = es; j > 0; j--) {
          double d1 = (1.0 * i * i) / (1.0 * i * i + j * j + i * j);
          double d2 = 1.0 - d1;
          d[i][j - 1] += d[i][j] * d1;
          d[i - 1][j] += d[i][j] * d2;
        }
      for (int i = 1; i <= ps; i++)
        prob[ps][es][i] = d[i][0];
    }
  // Parse all the data
  // - find our country
  // - determine size of each army
  // - build a bitmask of enemy countries
  // - build an adjacency bitmask for each country
  for (int i = 0; i < armies.length; i++) {
    String[] s = armies[i].split(" ");
    if (s[0].equals("Y")) {
      owned = 1 << i;
      a = Integer.parseInt(s[1]);
    } else {
      enemy[i] = Integer.parseInt(s[1]);
    }
    if (s[0].equals("E")) {
      enemyMask |= 1 << i;
    }
    for (int j = 2; j < s.length; j++)
      adjacency[i] |= 1 << Integer.parseInt(s[j]);  
  }
  // Do it!
  return go(owned, a);
}

</pre><div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
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
