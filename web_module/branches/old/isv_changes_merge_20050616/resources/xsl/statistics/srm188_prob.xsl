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

<title>Single Round Match 188 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 188</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Thursday, March 25, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
SRM 188 had a host of difficult problems, testing coders' skills with a
surprisingly tricky precision problem, parsing and formatting tasks, and
a recursive graph problem that hurt many people's brains.
<b>radeye</b> had the Division-I lead after the coding phase, finishing
all three problems in 55 minutes.
After picking up 50 points in the challenge phase and surviving the system
tests, he held on to his lead to finish with 1268 points, over 300 points
ahead of second-place finisher <b>bladerunner</b>.
<b>wleite</b>'s three successful challenges were enough to catapult himself
to a third-place finish, with <b>SnapDragon</b> and <b>Eryx</b> rounding out
the top five.
Only three solutions (from <b>radeye</b>, <b>bladerunner</b>, and
<b>hauser</b>) of the eight submitted for the 1000-point problem passed
the system tests.
</p>
<p>
In Division-II, <b>dzetkulict</b> finished with 1146 points, and even with
a failed challenge, managed to secure a 15-point lead over second-place
finisher <b>Hilary.Duff</b>.
Filling out the rest of the top five positions were <b>tmyklebu</b>,
<b>Vovka</b>, and <b>Ascription</b>, all with correct solutions to all
three problems.  In all, 19 Division-II coders finished the 1000-point problem.
</p>
 
<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2366&amp;rd=4760">MagicSquare</a></b>
</font>
<A href="Javascript:openProblemRating(2366)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      189 / 205 (92.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171 / 189 (90.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>fame</b> for 244.35 points (4 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      204.11 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem presented the coders with too much information.
They were given a 3x3 magic square with one number missing, and asked to
return the missing number.
With only one number missing, there are still two complete rows and two
complete columns.
One only had to identity one complete row or column to compute the magic sum.
Subtracting the other two numbers from either the row or column with the
missing number from this magic sum revealed the answer.
For particularly efficient implementations, see the solutions of
<b>fame</b> and <b>dzetkulict</b>.
</p>
<p>
An alternative solution is to simply try all numbers from 1 to 100 in
the missing spot, and test if the resulting square is magic.
This was the technique used by <b>tmyklebu</b>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2386&amp;rd=4760">Percents</a></b>
</font>
<A href="Javascript:openProblemRating(2386)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      112 / 205 (54.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 112 (20.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dzetkulict</b> for 445.68 points (10 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      297.31 (for 23 correct submissions)
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
      155 / 165 (93.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      71 / 155 (45.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>fiasco</b> for 248.91 points (1 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195.27 (for 71 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was the ambush of the evening, with only 45.81% of Division-I
and 20.54% of Division-II submissions passing.
If you wish to see the inspiration for this problem, look no further than
the statistics immediately above this paragraph...
Coders were asked to identify the minimum possible denominator of a fraction
that could result in the given percentage, rounded to two decimal places.
Rounding correctly was the key to solving this problem.
Many coders used floating-point arithmetic, and by doing so, they were just
begging to run in to precision issues.
</p>
<p>
The problem is, floating-point numbers do not represent all real numbers
exactly.
Bullet-proof solutions to problems like this require integer arithmetic.
The dangerous way to round the fraction a/b to the nearest integer is:
</p>
<pre>
    int c = floor( (double) a / (double) b + 0.5);
</pre>
<p>
This involves a floating-point divide and a floating-point addition,
each which will approximate the value you may expect, but not equal it
exactly.
However, notice what we can do with a little algebraic manipulation, putting
the terms over a common denominator:
</p>
<pre>
    int c = floor( (double) (2*a + b) / (double) 2*b );
</pre>
<p>
This result is precisely what you get with integer division:
</p>
<pre>
    int c = (2*a + b) / 2*b;
</pre>
<p>
No floating-point arithmetic, no precision errors, just the correct result
every time.  The above formula can be made to round to the nearest hundredth
of a percent by first multiplying the numerator by 100, and again by 100 to
convert from a fraction to a percentage.
To turn this into a complete solution, test each denominator starting at 1.
Estimate the numerator (as hinted in the nodes of the problem statement),
compute the rounded percentage, and compare it to the given value.
If they match, return that denominator.
</p>
<p>
Here is <b>radeye</b>'s elegant solution:
</p>
<pre>
    public class Percents {
      public int minSamples(String percent) {
        int i, j, k ;
        int t = (int)Math.floor(0.2+100*Double.parseDouble(percent.substring(0, 5))) ;
        for (i=1; i&lt;=10000; i++) {
          int f = t * i / 10000 ;
          if ((20000 *  f      + i) / (2 * i) == t ||
              (20000 * (f + 1) + i) / (2 * i) == t)
            return i ;
        }
        return -1 ;
      }
    }
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2418&amp;rd=4760">PolynomialMultiplier</a></b>
</font>
<A href="Javascript:openProblemRating(2418)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      26 / 205 (12.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      19 / 26 (73.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tmyklebu</b> for 718.56 points (19 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      518.49 (for 19 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was more an exercise in parsing and formatting output than
a math problem.
Coders were asked to parse two polynomials, multiply them together,
simplify the product, and output the result.
</p>
<p>
Successful solutions to this problem stored the polynomial as an array
of integers, with each element representing the coefficient of a particular
power of <i>x</i>.
Terms in each polynomial were parsed one by one to determine the coefficient
and power, and the array element indexed by the power of each term was
incremented by the corresponding coefficient.
</p>
<p>
Multiplying these two polynomials can be done with two nested loops,
multiplying the coefficients of each pair of powers in the two arrays.
The products are stored in a third array, indexed by the sum of the two powers.
Storing the polynomials in this fashion takes care of the simplifying step.
</p>
<p>
The polynomial is returned by looping over all values in the array (from
greatest to least), and outputting the non-zero terms according to the
formatting instructions.
Care must be taken to identify the correct case in order to format the
the result properly.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2361&amp;rd=4760">Partial</a></b>
</font>
<A href="Javascript:openProblemRating(2361)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      71 / 165 (43.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      45 / 71 (63.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 371.25 points (18 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      245.60 (for 45 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem, similar to the Division-II hard, was more an exercise in
parsing and output formatting than a math problem.
Coders were asked to parse a function of 3 variables, compute a mixed
partial derivative of that function, and then output the result according
to specific formatting instructions.
</p>
<p>
Successful solutions to this problem stored the function as a 3-dimensional
array of coefficients, with the three indices corresponding to the powers
of <i>x</i>, <i>y</i>, and <i>z</i>.
Parsing the function involved first separating the string by the " + "
strings to identify each term, and then separating the terms by the '*'
character to identify each factor.
Looping over each factor, the powers of variables present in the term
are accumulated, along with a coefficient if present.
Variables not appearing in the term have a power of zero, and if no
constant factor is present, the coefficient is 1.
The coefficient of each term is added to the array element indexed by
the three powers.
</p>
<p>
Computing the required partial derivatives is straightforward.
For each term in the array, multiply the coefficient by the power of the
selected variable and store the result in a new array with the index
of the selected power decremented by one.
Multiplying by zero takes care of removing terms that are eliminated
as the result of differentiating.
</p>
<p>
Outputting the terms in the correct order can be done with 3 nested loops:
first over all possible degrees (from greatest to least), then over powers
of <i>x</i> (from greatest to least), and finally over powers of <i>y</i>
(also from greatest to least).  Note that there is no need to loop over
<i>z</i>, as it is fixed by the degree, <i>x</i>, and <i>y</i>.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2365&amp;rd=4760">RecursiveGraph</a></b>
</font>
<A href="Javascript:openProblemRating(2365)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      8 / 165 (4.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 8 (37.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>radeye</b> for 654.72 points (23 mins 24 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      513.72 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
RecursiveGraph stumped many coders, with only eight submitting solutions,
and only three of those surviving the challenge phase and system tests.
This problem asked coders to find the shortest path through a graph with
an infinite number of nodes and edges, defined recursively.
The graph contains up to 9 copies of itself, with edges connecting top-level
nodes to nodes in the recursive copies.
The graph was defined solely in terms of top-level edges and edges connecting
to its children.
Several coders had trouble wrapping their brain around the problem,
not fully realizing the distinction between multiple child graphs replicated
at a given level, and recursive copies appearing at successively deeper levels.
</p>
<p>
If anyone is still confused, I would encourage them to go over the example
in the problem with a pencil and paper, and see how the graph in the figure is
defined by just 5 edges.
</p>
<p>
Fortunately, we don't need to consider an infinite number of nodes and edges,
because the weights of the edges are divided by two (and rounded down) at
each level.
With a maximum weight of 1000 at the top-level, all recursive copies below
the 10th level have only zero-weight edges.
This is the key to the solution of this problem.
The first step is to find the connectivity of all nodes in the graph, and use
this to "flatten" all levels of the graph after level 10.
At this stage, we just want to determine, for each node, which nodes it
can reach.  Note that in the graph { "A A1 1", "B B1 1" }, there is no
path from A to B, regardless of how far down you recurse.
</p>
<p>
Once you've found the connectivity, the shortest path can be determined by
working up from the bottom.
First compute the weights of the edges at level 10 (where all weights are
either 0 or 1), and insert the connectivity graph in place of all
recursive copies.  Compute the distance between each pair of nodes,
and insert <i>these</i> results in place of the children in level 9.
Continue in this fashion, using the solution at each level in place
of the recursive copies in the level above until you reach the top.
At each level, you need only consider 100 nodes, the 10 nodes for that
level and the 9*10 nodes of its children.
</p>
<p>
The deepest graph in the system tests recurses down 19 levels deep:
</p>
<pre>
    edges = { "A A1 0", "J J1 0",
              "A B1 1000", "B C1 1000", "C D1 1000", "D E1 1000", "E F1 1000",
              "F G1 1000", "G H1 1000", "H I1 1000", "I J1 1000" }
    start = 'A'
    end = 'J'
</pre>
<p>
The shortest path first travels down the "A A1 0" edges 10 times to get to the
realm of zero-weight edges.  It then follows the "A B1 1000", "B C1 1000", etc.
edges to make its way to node J, recursing one level deeper at each step.
It then follows nineteen "J J1 0" edges back up to the top.
The length of this path is zero.
</p>
<p>
The problem statement contained a potentially misleading constraint that
the solution should return -1 if the shortest path is greater than one
billion.  I don't believe a path greater than 10 million is possible, but
without being able to prove this, this constraint was left in.  I would
be interested in hearing from anyone who proves a lower-bound on this
problem.
</p>



                        <p>
                        <img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=287269"><strong>legakis</strong></a><br />
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
