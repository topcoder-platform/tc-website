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
<tc-webtag:forumLink forumID="505790" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 276</span><br>Thursday, December 8, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>In Division 1, <b>misof</b> took the lead in the coding phase, with the first correct submission on the 1000,
and held that lead all the way through.  <b>Per</b>, <b>krijgertje</b>, <b>Petr</b>, and <b>ploh</b> rounded out
the top 5.  Challenge phase and system testing were a bloodbath, especially on the 500 and 1000, with success rates
of 44.96% and 18.92%, respectively.</p>

<p>In Division 2, <b>ACRush</b>, <b>forcey</b>, and <b>LittleWhite</b> lead the pack.  The 500 point problem proved
to be painful for many coders, with only a 28.33% success rate.</p>

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5927&amp;rd=8073" name="5927">TestCurve</a></b> 
</font> 
<A href="Javascript:openProblemRating(5927)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505790" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
  414 / 446 (92.83%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  317 / 414 (76.57%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  <b>kgd314</b> for 249.08 points (1 mins 44 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  220.50 (for 317 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>There are two basic steps to this problem, find the maximum score, and then scale all of the other scores based
upon the maximum.  We are given that at least one score is greater than zero, so we don't have to check for that
specifically.  To convert each score, we calculate final = 100 * raw / max.  Since integer division truncates (rounds
down), it meets the requirements of the problem.
</p>

<pre>
public int[] determineGrades (int[] scores) {
 int max = 0;
 for (int i = 0; i < scores.length; i++)
  max = Math.max(max, scores[i]);
 int[] ret = new int[scores.length];
 for (int i = 0; i < scores.length; i++)
  ret[i] = 100 * scores[i] / max;
 return ret;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5945&amp;rd=8073" name="5945">VolumeDiscount</a></b> 
</font> 
<A href="Javascript:openProblemRating(5945)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505790" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
  240 / 446 (53.81%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  68 / 240 (28.33%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  <b>forcey</b> for 489.79 points (4 mins 7 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  319.90 (for 68 correct submissions) 
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
  370 / 396 (93.43%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  257 / 370 (69.46%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  <b>antimatter</b> for 247.74 points (2 mins 43 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  207.76 (for 257 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>This problem was designed with the intent that it could be solved in several different ways, depending on the
coder.  More seasoned coders identified a problem that could be solved as a small-scale knapsack or 
subset sum problem, and wrote a dynamic programming solution.</p>
<p>Alternately, brute force, if written carefully, could work.  The key here was to identify and test the worst
possible case before being confident that a brute force solution would not time out.  One method is to loop through
variables q1, q2, etc, indicating the quantity of each bundle to purchase.  Anytime the total quantity meets or
exceeds the number we want to buy, see if the cost is better than the best cost found so far.  An important
optimization to make this work is to only loop through 4 bundles, and calculate the quantity of the 5th that's
needed.  An alternate approach is straightforward recursion.  If you want to buy <i>n</i> units, find the best
way to buy <i>n</i>-<i>q1</i>, <i>n</i>-<i>q2</i>, etc, and add the cost of the last bundle.</p>

<p>In the example brute-force looping shown below, note that it is treated like there are always five packages
available; by default, they have 101 units and cost 999999, basically indicating an infinity value.</p>

<pre>
public int bestDeal (String[] priceList, int quantity) {
 int[] qty = new int[5];
 int[] cost = new int[5];
 for (int i = 0; i < priceList.length; i++) {
  String[] s = priceList[i].split(" ");
  qty[i] = Integer.parseInt(s[0]);
  cost[i] = Integer.parseInt(s[1]);
 }
 for (int i = priceList.length; i < 5; i++) {
  qty[i] = 101;
  cost[i] = 999999;
 }
 int best = 999999999;
 for (int a = 0; a <= 1 + quantity / qty[0]; a++)
   for (int b = 0; b <= 1 + quantity / qty[1]; b++)
   for (int c = 0; c <= 1 + quantity / qty[2]; c++)
   for (int d = 0; d <= 1 + quantity / qty[3]; d++) {
     int e = (quantity - a * qty[0] - b * qty[1] - c * qty[2] - d * qty[3] + qty[4] - 1) / qty[4];
     if (e < 0) e = 0;
     best = Math.min(best, a * cost[0] + b * cost[1] + c * cost[2] + d * cost[3] + e * cost[4]);
   }
 return best;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5942&amp;rd=8073" name="5942">FunctionDependency</a></b> 
</font> 
<A href="Javascript:openProblemRating(5942)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505790" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
  102 / 446 (22.87%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  56 / 102 (54.90%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  <b>forcey</b> for 902.27 points (9 mins 33 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  643.16 (for 56 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>If we reword the instructions a bit, the solution is a little more obvious: "Of all functions that have not
yet been scripted, but for which all dependencies have already been scripted, find the one that comes first
alphabetically."  Okay, this suggests the approach we should take.</p>
<p>First we set up some way of keeping track of what dependencies each function has, probably either a two
dimensional boolean array, or possibly with bitmasks.  Next, we loop through our functions to find the one
that comes first alphabetically, and which has no dependencies remaining.  After looping, record the function
we found, and remove it from the dependencies of the remaining functions.  Lather, rinse, repeat.</p>

<pre>
public String[] scriptingOrder (String[] funcs, String[] depends)
{
 long[] d = new long[funcs.length];
 boolean[] b = new boolean[funcs.length];
 for (int i = 0; i < depends.length; i++)
 {
  d[i] = 0;
  if (depends[i].length() > 0)
  {
   String[] s = depends[i].split(" ");
   for (int j = 0; j < s.length; j++)
    d[i] |= 1L << Integer.parseInt(s[j]);
  }
 }
 ArrayList ret = new ArrayList();
 while (ret.size() < funcs.length)
 {
  String next = "";
  int k = -1;
  for (int i = 0; i < funcs.length; i++)
   if (!b[i] && d[i] == 0 && (k == -1 || funcs[i].compareTo(next) < 0))
   {
    next = funcs[i];
    k = i;
   }
  if (k == -1)
   return new String[0];
  b[k] = true;
  ret.add(funcs[k]);
  for (int i = 0; i < funcs.length; i++)
   if ((d[i] & (1L << k)) > 0)
    d[i] -= 1L << k;
 }
 return (String[])ret.toArray(new String[0]);
}

</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4634&amp;rd=8073" name="4634">TestingCar</a></b> 
</font> 
<A href="Javascript:openProblemRating(4634)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505790" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
  129 / 396 (32.58%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  58 / 129 (44.96%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  <b>zjq</b> for 445.34 points (10 mins 12 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  266.44 (for 58 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>Credit goes to <b>OlexiyO</b> for writing this fun and interesting problem.</p>

<p>First, we understand from the problem that each constraint limits our speed on a certain interval.  Because our
acceleration is limited, each constraint also imposes a limit on our speed before and after the interval (since we
may have to slow down before the interval starts, and are limited in how fast we can accelerate following the
interval).  Imagining a graph of time versus max speed, each constraint is a horseshoe-shaped figure on our graph.
Our maximum speed at any given time is the minimum of the values defined by any of the constraints.  Finally,
add in the special constraint that we have speed 0 at time zero, and can only accelerate linearly from there.</p>

<p>So, how do we find the maximum speed between 0 and <i>duration</i>?  One way, that obviously will work, is to
find all of the "interesting" points (those points where two "constraint graphs" intersect), and evaluate the max
speed at each of those times, and keep the best one we find.  But, as fair warning, this can get messy to code.</p>

<p>An alternate approach is to first imagine scaling our graph in the x direction by a factor <i>acceleration</i>.
What this does for us is ensures that all of our diagonal lines have a slope of 1.  Thus, all intersection points
will be at lattice points, or midway between then.  If we scale our x and y by a factor of 2, then all interesting
points are at lattice points.  Since our maximum values for <i>duration</i> and <i>acceleration</i> are 1000 and 25,
we are searching on x from 0 to 50,000, in the worst case.</p>

<p>If we setup an array for the max speed at each value of x, then apply the constraints one at a time, for the
entire range of x values, lowering the maximum at each point when necessary, then we are left with a graph
of the max speed over all constraints, for each possible x value.  Then, we find the highest max value, divide by 2
(to unscale our y value) and return the result.</p>

<pre>
public double maximalSpeed (String[] restrictions, int duration, int acceleration) 
{
 int[] max = new int[duration * acceleration * 2 + 1];
 for (int i = 0; i < max.length; i++)
  max[i] = i;
 for (int j = 0; j < restrictions.length; j++)
 {
  String[] s = restrictions[j].split(" ");
  int speed = Integer.parseInt(s[0]) * 2;
  int time = Integer.parseInt(s[1]) * acceleration * 2;
  int dur = Integer.parseInt(s[2]) * acceleration * 2;
  for (int i = 0; i <= Math.min(time, duration * acceleration * 2); i++)
   max[i] = Math.min(max[i], speed + time - i);
  for (int i = time; i <= Math.min(time + dur, duration * acceleration * 2); i++)
   max[i] = Math.min(max[i], speed);
  for (int i = time + dur; i <= duration * acceleration * 2; i++)
   max[i] = Math.min(max[i], speed + i - time - dur);
 }
 int ret = 0;
 for (int i = 0; i < max.length; i++)
  ret = Math.max(ret, max[i]);
 return 0.5 * ret;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5934&amp;rd=8073" name="5934">ForceTest</a></b> 
</font> 
<A href="Javascript:openProblemRating(5934)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505790" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
  37 / 396 (9.34%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Success Rate</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  7 / 37 (18.92%) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>High Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Per</b> for 749.58 points (17 mins 42 secs) 
  </td> 
  </tr> 
  <tr> 
  <td class="bodyText" style="background: #eee;"> 
  <b>Average Score</b> 
  </td> 
  <td class="bodyText" style="background: #eee;"> 
  589.16 (for 7 correct submissions) 
  </td> 
  </tr> 
</table></blockquote> 
<p>There is a classic riddle that goes something like "You have two eggs, and want to determine the minimum dropping
height that will cause them to break.  If you know the breaking height is less than 10, what is the fewest number of
tests you can do to conclusively determine the breaking height?"  In and of itself, this problem, and even the more
generalized form of it, is fairly straightforward dynamic programming on range of heights and number of eggs.  Adding
in the complication that one might be defective adds a lot to the level of difficulty.</p>

<p>First, we need to think about our state space.  At any given point in our testing, we will know three basic
things: the range of forces we still need to check, the number of units we have left to test, and possibly some
information about a possible reject.  Notice here that checking forces 1-10 is the basically the same as checking
forces 11-20, in that it takes exactly the same number of tests.</p>

<p>Initially, we know nothing about a reject unit.  So, our first break must only be considered a "possible reject".
Any time we have a failure, and have already identified a possible reject, we know that, in the worst case, the
higher breaking force will break a non-defective unit.  If two different units break at the same force, we know
that force breaks a good unit, but we do not know if the reject was identified.  If ever we have a passed test
at a force greater than a failure force for another unit, then we know for certain the failed unit was a reject.</p>

<p>In any given state space, we need to imagine testing at each possible force 1...n.  For each force, determine
the number of remaining tests that would be required if the first test either passes or fails.  We want to test using
the force that gives us the lowest worst case scenario.  A memoized recursive implementation makes sense for this.</p>

<p>We implement a few important base cases to complete our solution.  If we have already identied the reject, and
have only a single (good) test unit left, we must test for every force in range, starting bottom up.  If we do
not yet know where the reject is, and have exactly two units left, we must again start bottom up, and re-test
at the force where we first observe a failure.  If ever we only have a single unit but have not yet identified the
reject, we cannot determine the breaking force, and thus return an infinity value.</p>

<p>My example code is much longer than it needs to be, to be overly clear about what is known about the possible
defective unit:</p>

<pre>
// Memoization cache
int[][] cacheNoDefect = new int[MAX_FORCE + 1][MAX_UNITS + 1];
boolean[][] seenNoDefect = new boolean[MAX_FORCE + 1][MAX_UNITS + 1];
int[][][] cachePossibleDefect = new int[MAX_FORCE + 1][MAX_FORCE + 1][MAX_UNITS + 1];
boolean[][][] seenPossibleDefect = new boolean[MAX_FORCE + 1][MAX_FORCE + 1][MAX_UNITS + 1];
int[][] cacheUnknown = new int[MAX_FORCE + 1][MAX_UNITS + 1];
boolean[][] seenUnknown = new boolean[MAX_FORCE + 1][MAX_UNITS + 1];

// When we have already isolated the defect
public int fewestTestsNoDefect (int maxForce, int testUnits)
{
 if (seenNoDefect[maxForce][testUnits])
  return cacheNoDefect[maxForce][testUnits];
 int ret = 999999999;
 if (maxForce == 0)
  ret = 0;
 else if (testUnits == 1)
  ret = maxForce;
 else if (testUnits >= 2)
  for (int i = 1; i <= maxForce; i++)
  {
   int breaks = fewestTestsNoDefect(i - 1, testUnits - 1);
   int works = fewestTestsNoDefect(maxForce - i, testUnits);
   ret = Math.min(ret, 1 + Math.max(breaks, works));
  }
 seenNoDefect[maxForce][testUnits] = true;
 return cacheNoDefect[maxForce][testUnits] = ret;
}

// We have not yet isolated the defect, but we have a failure
public int fewestTestsPossibleDefect (int maxForce, int testUnits, int possibleDefect)
{
 if (seenPossibleDefect[maxForce][possibleDefect][testUnits])
  return cachePossibleDefect[maxForce][possibleDefect][testUnits];
 int ret = 999999999;
 if (maxForce == 1)
  ret = 1;
 else if (testUnits == 1 && possibleDefect == 1)
  ret = maxForce;
 else if (testUnits > 1)
  for (int i = 1; i <= maxForce; i++)
  {
   if (i < possibleDefect) 
   {
    int works = fewestTestsPossibleDefect(maxForce - i, testUnits, possibleDefect - i);
    int breaks = fewestTestsPossibleDefect(possibleDefect - 1, testUnits - 1, i);
    ret = Math.min(ret, 1 + Math.max(works, breaks));
   }
   else if (i > possibleDefect)
   {
    int works = fewestTestsNoDefect(maxForce - i, testUnits);
    int breaks = fewestTestsPossibleDefect(i - 1, testUnits - 1, possibleDefect);
    ret = Math.min(ret, 1 + Math.max(works, breaks));
   }
   else
   {
    int works = fewestTestsNoDefect(maxForce - i, testUnits);
    int breaks = fewestTests(i - 1, testUnits - 1);
    ret = Math.min(ret, 1 + Math.max(works, breaks));
   }
  }
 seenPossibleDefect[maxForce][possibleDefect][testUnits] = true;
 return cachePossibleDefect[maxForce][possibleDefect][testUnits] = ret;
}

// We don't yet know anything about the failure
public int fewestTests (int maxForce, int testUnits)
{
 if (seenUnknown[maxForce][testUnits])
  return cacheUnknown[maxForce][testUnits];
 int ret = 999999999;
 if (maxForce == 0 && testUnits >= 2)
  ret = 0;
 else if (testUnits >= 2)
  for (int i = 1; i <= maxForce; i++) 
  {
   int breaks = fewestTestsPossibleDefect (maxForce, testUnits - 1, i);
   int works = fewestTests (maxForce - i, testUnits);
   ret = Math.min(ret, 1 + Math.max(breaks, works));
  }
 seenUnknown[maxForce][testUnits] = true;
 return cacheUnknown[maxForce][testUnits] = ret;
}
</pre>




  <img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
  By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
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
