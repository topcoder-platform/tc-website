<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/> 

<title>Single Round Match 219 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins -->
    <td width="170" bgcolor="#FFFFFF">
       <xsl:call-template name="global_left"/>
    </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
    <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
    <td class="bodyText" width="100%">
       <xsl:call-template name="BodyTop">
          <xsl:with-param name="image1">white</xsl:with-param>
          <xsl:with-param name="image">statisticsw</xsl:with-param>
          <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
       </xsl:call-template>

       <table border="0" cellspacing="10" cellpadding="0" width="100%">
       <tr valign="top">
             <td class="bodyText" width="100%">

<!--body contextual links-->
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                   <tr valign="middle">
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 219</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, November 20, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->


<h2>Match summary</h2>

<p>In Division 1, <b>SnapDragon</b> won with a commanding lead, and 
more than 400
points behind were <b>Ulan</b> and <b>Yarin</b> in second and third.  
The easy problem posed
little difficulty for seasoned coders, while the medium and hard 
received a variety of
different solutions, and saw a variety of reasons for many solutions 
not surviving.</p>

<p>Only the top 5 finishers correctly solved all three problems. In 
room 7, <b>natori</b>
earned 5 correct challenges on the medium problem, a feat that far 
surpassed anyone else
in the challenge round.</p>

<p>Division 2 was championed by a newbie, <b>unChabonSerio</b>, who in 
the process earned
a spot as 14th on the all-time most impressive debut chart... 
congratulations!  A new, soon-to-be
target?  We shall see.  <b>Antoni</b> and <b>titid_gede</b> took 2nd 
and third, while newbies
<b>jmbeverl</b> and <b>kindloaf</b> rounded out the top 5, again a very 
impressive first time
performance.</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3111&amp;rd=5865" 
name="3111">WaiterTipping</a></b>
</font>
<A href="Javascript:openProblemRating(3111)"><img hspace="10" 
border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      205 / 261 (78.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      136 / 205 (66.34%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Sleeve</b> for 248.36 points (2 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      185.96 (for 136 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem wasn't so much about finding a clever solution as much 
as it was about carefully
reading the problem statement, which gives, very clearly, an 
inequality, and asks for the largest
value for which the inequality is satisfied.  A quick look at the 
problem constraints confirm that
brute force searching is indeed feasible.  Perhaps the biggest gotcha 
here was the temptation to
try to "solve" the equation and find the correct result, although the 
last example was intended to
show a case where this reasoning could get a coder in trouble.  Indeed, 
that was probably the 
most common flaw in solutions that did not make it.</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3118&amp;rd=5865" 
name="3118">HealthFood</a></b>
</font>
<A href="Javascript:openProblemRating(3118)"><img hspace="10" 
border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      88 / 261 (33.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      68 / 88 (77.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>koda</b> for 405.02 points (14 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      263.39 (for 68 correct submissions)
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
      170 / 184 (92.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      154 / 170 (90.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 238.67 points (6 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171.82 (for 154 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>The problem of searching/sorting a list of items based upon multiple 
criteria is interesting
not only because of how frequently it comes up in many programmatic 
tasks, but also because of
the variety of ways to approach a solution.  There was an opportunity 
for some of the more seasoned
coders were able to take advantage of standard library code and 
implement a clean and elegant
solution using a custom comparison method (Depending on your language 
of choice, the Java API,
C++ STL, and .NET framework all offer some type of comparer interface 
to work from.)  Nonetheless,
it was still very possible to come up with a good solution, even 
without knowing how to use a custom
comparer.</p>

<p>A fairly clean solution, which does not rely upon a comparer 
interface, has as its cornerstone
in a funcion, isBetter, which takes two indexes, and a diet string, and 
determines if the second
entree is a better fit for the diet plan than the first.  Then, using a 
<pre>switch</pre> or
<pre>select case</pre> statement, compares the two entrees based upon 
the first letter of the
diet plan.  If they are different, it returns the appropriate result, 
else it recurses itself, but
removes the first character from the diet plan description, so that the 
next most important
criteria can be considered.</p>

<p>Once such a function is in place, it is a simple matter of setting 
the selected entree to 0
for each person, then looping over each possible entree to determine if 
it is a better fit for the
diet plan than the one that is already selected.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3114&amp;rd=5865" 
name="3114">PayBill</a></b>
</font>
<A href="Javascript:openProblemRating(3114)"><img hspace="10" 
border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Three: <blockquote><table 
cellspacing="2">
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
      38 / 261 (14.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 38 (26.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>unChabonSerio</b> for 907.98 points (9 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      672.25 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This is a classic subset sum problem.  Coders who quickly saw this, 
and were familiar with
the typical algorithms for approaching such a problem had a 
considerable advantage here.  One small
wrench was that some type of backtracking had to be implemented in 
order to generate the result
required by the problem, e.g. the actual elements that contribute to 
the given sum.</p>

<p>There are two basic approaches to this problem.  The first, which 
inevitably fails due to
timeout on larger test cases, is to try obtain the sum by either 
including or excluding the first
element, and then calling itself recursively with the remainder of the 
set.  Unfortunately, with
the maximum 50 people, this is over 1 quadrillion operations to 
perform.</p>

<p>Instead, a more clever, dynamic programming approach needs to be 
used.  Since each item can only
be up to 10,000, we know that the sum cannot be more than 500,000.  So, 
we simply need a boolean
array of 500,000 elements, where the i-th element represents whether or 
not we can reach the
total i with some subset of the original values.  In code it looks 
something like this:</p>

<pre>
boolean[] canTotal = new boolean[500001];
canTotal[0] = true;
for (int i = 0; i &lt; meals.length; i++)
   for (int j = totalMoney; j &gt;= meals[i]; j--)
      if (canTotal[j - meals[i]]) canTotal[j] = true;
</pre>

<p>But, we also need to keep some kind of backtracking.  We can do this 
with bitmasks, or even
simply an array of 500,000 integers, each indicating the last element 
that had to be added to get
the given total.  Then, at the end, we can just look at the integer 
array to grab the indexes of
those elements that contributed to the total, and construct our result.  
Note here that the
constraints give us that there is exactly one unique solution.  This is 
the saving constraint that
allows us to get away with this method.  If multiple solutions were 
possible, we would need to be
more clever about how we kept track of the desired result.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3117&amp;rd=5865" 
name="3117">TurntableService</a></b>
</font>
<A href="Javascript:openProblemRating(3117)"><img hspace="10" 
border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      83 / 184 (45.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      33 / 83 (39.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Yarin</b> for 451.39 points (9 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      302.07 (for 33 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>Both this problem and the hard were inspired by an actual occurrence 
of a group of people
going out for Chinese food, and sitting at a round table (with a 
turntable in the middle), and
ordering the food only after a long discussion of trying to figure out 
what to order to make
everyone happy.  So, what's a person to do?  Package the whole 
experience into SRM problems,
of course!</p>
<p>This problem is really what's known as a subset covering problem.  
However, the timings given
for moving the turntable add an interesting nuance to the problem, 
because there may be multiple ways
to stop the turntable at, say, 6 different positions, and give everyone 
a chance to serve themselves
a favorite entree.  But, of those several different permutations, some 
ways involve less total
rotation, and hence are faster.  A similar issue is to determine, given 
a set of stop positions,
what is the optimal rotation path to stop at all of those 
positions?</p>
<p>In fact, the optimal path is either to go only in one direction, or 
to start in one direction,
and then go back and continue in the opposite direction for the 
remainder of the stops.  This
observation is a bit subtle at first, but once realized, it isn't 
overly hard to determine the
minimum time it takes to stop at a given set of positions.</p>
<p>There are several reasonable approaches to this problem, one of 
which is a breadth first
search.  The only quirk is that, depending on how the search is coded, 
you might not be able to
stop immediately upon finding a set of stopping points that works, 
because (as explained in the
previous paragraph) another set of the same number of stopping points 
might also work, in less time.
</p>
<p>A solution previously unconsidered was first seen during the actual 
competition, using dynamic
programming on the people who had been served, and the elapsed time; 
the logical thrust that makes it
work properly being that each rotation can only (sometimes) add to the 
people who have been served,
so processing in order by that bitmask is legitimate.</p>
<p>A third possibility is simple brute force.  With a maximum of 15 
people, there are only 32,768
subsets of stopping points.  With reasonably efficient code, it's 
possible to check all of the
possibilities.  One simple optimization is to avoid stopping at any 
location that doesn't give
anyone a favorite.  Each stopping point that can be eliminated cuts the 
number of cases to evaluate
in half.  For each one that satisfies everyone, you simply calculate 
the minimum time to visit
all of those points (as outlined above), and return the minimum of 
those values.</p>
<p>In any case, while this problem was not especially difficult to 
think about how to code a solution,
there were several things to consider, so it was very easy to get 
caught on a subtle flaw,
especially in system testing.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3115&amp;rd=5865" 
name="3115">OrderFood</a></b>
</font>
<A href="Javascript:openProblemRating(3115)"><img hspace="10" 
border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division One - Level Three: <blockquote><table 
cellspacing="2">
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
      33 / 184 (17.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 33 (27.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 844.71 points (12 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      572.18 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>Here is a problem that really is best done by a computer.  For all 
but some of the most trivial
examples, it can actually be difficult to determine simply by looking 
at the inputs, whether or not
a given solution is indeed correct.</p>
<p>At first it seems like the only reasonable approach is to simply try 
the combinations of
different entrees, and see which combinations satisfy the requirements 
of exactly two favorites
for every person.  But, since the constraints offer a maximum of 30 
entrees, it's simple to see
that this will be way too slow on larger test cases.  Any such solution 
is O(2^n), which just
won't cut it.</p>
<p>Next, we try to optimize in a number of ways... don't consider any 
entrees that aren't anyone's
favorite, and stop considering any subset once someone has more than 
two favorites.  This helps,
certainly, but clearly not every possible case will see enough 
optimization in this manner.  We
still need something more efficent.</p>
<p>In this case, the answer the technique of divide and conqueror.  
First divide the entrees into two
groups, with no more than 15 in each.  Now, each group has at most 
32,768 subsets of entrees to
consider.  Now, we build a bitmask for each subset, indicating which 
people have their favorites
satisfied by the given combination of entrees... but the trick here is 
that we need to use 2 bits
for every person (and with 15 people, that's 30 bits, so a 32-bit int 
still does the trick!), so
that we can indicate whether 0, 1 or 2 of their favorites are 
available.</p>
<p>As we perform this calculation for each half of the entrees, we 
store the results in a structure
like a Hashtable, or even just an array (that we sort at the end) will 
do; we maintain the minimum
cost of entrees to obtain each possible bitmask of people's favorites.  
Then, for each resultant
value in the first set, we search for a corresponding value in the 
second set (here is where a
Hashtable, or sorted array that we can binary search, comes into play) 
to complement our bitmask.
For each complementary pair of bitmasks we find, we select the lowest 
total cost.</p>
<p>Implementing the optimizations described in the third paragraph is 
an important step towards
keeping the size of the hashtable or array from getting too large, and 
definitely improves the
overall efficiency of the algorithm.</p>


                <p>
                <img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=10407399"><strong>timmac</strong></a><br />
                <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                </p>
             </td>
          </tr>
       </table>

       <p><br /></p>

    </td>
<!-- Center Column Ends -->

<!-- Gutter -->
    <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
    <td width="170">
       <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
       <xsl:call-template name="public_right_col"/>
    </td>
<!-- Right Column Ends -->

<!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
