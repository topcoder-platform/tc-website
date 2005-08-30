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

<title>Single Round Match 224 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 224</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Wednesday, December 22, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
In Division 1, only four people solved the Medium and a mostly different four 
solved the Hard.  <b>ploh</b> dominated as the only coder to
submit all three problems.  When all three of his programs passed 
system tests, <b>ploh</b> led second-place <b>pparys</b> by almost 500 points.
</p>

<p>
In Division 2, newcomer <b>fluffy_</b> was also the only coder to 
solve all three problems, in an impressive debut just shy of the list of
all-time top debuts.  <b>Mg9H</b>, the only other coder to solve the Hard, took second.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3452&amp;rd=5870"
name="3452">InsideOut</a></b> 
</font> 
<A href="Javascript:openProblemRating(3452)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      190 / 198 (95.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187 / 190 (98.42%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Sartak</b> for 248.27 points (2 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217.74 (for 187 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem is a simplified form of my favorite "hand-waving"
argument.  How do you swap the left and right sides of an array?
You use three separate reversal steps, like <i>this</i>.  
[Hold your hands up with both thumbs pointing left.  Your right thumb
should be touching your left pinky.  Now, rotate your left hand 
so your thumbs are together (Reversal #1).  Then rotate
your right hand so your thumb is pointing right (Reversal #2).
Finally, rotate both hands as a single unit around the pivot point
formed by your left thumb and your right pinky, until both thumbs are
again pointing left (Reversal #3).  Notice that your hands are now in
their original orientations, but that they have swapped places.]
</p>

<p>
For this problem, we needed to do the first two reversal steps, but
not the third.  In other words, the final answer is something like
<pre>
    return reverse(line[0..n/2-1]) + reverse(line[n/2..n-1]);
</pre>
where <tt>n</tt> is the length of the string.  See <b>csfalcon</b>'s and <b>mukund</b>'s solutions for nice examples of this approach.
Alternatively, we can do the whole thing with one reversal step if we
pre-swap the left and right sides.
<pre>
    return reverse(line[n/2..n-1] + line[0..n/2-1]);
</pre>
</p>

<p>
Now, how do you reverse a string <tt>S</tt>?  If it's not built into your 
language,
you could do something like
<pre>
    T = "";
    for (i = 0; i &lt; S.length; i++)
       T = S[i] + T;
    S = T;
</pre>
but repeated concatenations are slow.  A faster
method is
<pre>
    lo = 0;
    hi = S.length;
    while lo &lt; hi do
       swap(S[lo++], S[hi--]);
</pre>
</p>

<p>
One further remark on the "hand-waving" algorithm.
Besides making a great demonstration, it really is a practical
algorithm for swapping the two sides of an array.  There are easier
ways to do it when the two sides are of equal size, as they were in
this problem, but when the two sides are of different sizes, the 
"hand-waving" algorithm is the way to go.
</p>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=1948&amp;rd=5870"
name="1948">TwoTurtledoves</a></b> 
</font> 
<A href="Javascript:openProblemRating(1948)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      156 / 198 (78.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      127 / 156 (81.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ahri</b> for 491.48 points (3 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      352.30 (for 127 correct submissions) 
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
      167 / 168 (99.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      155 / 167 (92.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>jshute</b> for 249.06 points (1 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207.42 (for 155 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem was easy to solve with two loops, one counting up the
days and one counting down the types of presents within the day.
<pre>
    int count = 0;
    for (int day = 1; ; day++) {
       for (int type = day; type &gt; 0; type--) {
          count += type;
          if (count &gt;= n) return type;
       }
    }
</pre>
For example, <b>Ryan</b> has a nice implementation of this approach.
These loops run quite fast, even for very large <tt>n</tt>, 
but you might have been scared off by the fact that
<tt>n</tt> could range up to 1 billion.  In that case, you probably
tried to process all the presents for a single day with a formula
instead of with a loop.  How many presents do I give my true love on
day D?  This is just the sum from 1 to D, which, if you remember the
famous story about Gauss, you'll recall is D*(D+1)/2.  You could use
this formula to quickly count up the days until you reach the last
day, and only then count down the types of presents within the last
day.
<pre>
    int count = 0;
    int day = 1;
    while (count + day*(day+1)/2 &lt; n) {
       count += day*(day+1)/2;
       day++;
    }
    for (int type = day; ; type--) {
       count += type;
       if (count &gt;= n) return type;
    }
</pre>
Again we have two loops, but this time they are not nested.
See <b>Larry</b>'s solution for a clean implementation of this approach.  
<b>ColinMacLeod</b> implemented a minor variation in which he computes the sum on the fly instead of using the formula.
</p>

<p>
For a really impressive example of mathematical overkill, see <b>jms137</b>'s solution.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3035&amp;rd=5870"
name="3035">ParenReduction</a></b> 
</font> 
<A href="Javascript:openProblemRating(3035)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">

  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 198 (5.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 10 (20.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Mg9H</b> for 581.82 points (34 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      516.22 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
There were two parts to this problem: first parsing the original
expression (most likely into a binary tree usually called an
<i>abstract syntax tree</i>) and then "pretty-printing"
the tree back into a string.  Parsing was best done recursively.
Because the original expression was fully
parenthesized, finding the next operator at each step is a matter of 
counting parentheses.  The recursive algorithm is
<pre>
    if the string is a single letter then
       build a leaf node out of the single letter
    else
       strip off the opening and closing parentheses
       find the only operator <i>not</i> enclosed in parentheses
       parse the substring to the left of the operator
       parse the substring to the right of the operator
       build a tree node from the operator and the two subtrees built
          by the recursive calls
</pre>
</p>

<p>
Unparsing boils down to figuring out how each operator behaves when it
is the left or right child of each other operator.  For example, a '*'
needs parentheses only if it is either the left child of a '^' or the
right child of a '^' or '/'.  You could build a 5-by-5-by-2 table of
booleans describing whether or not parentheses are required in each
possible configuration, or equivalently use a giant series of
if-statements to accomplish the same thing.
</p>

<p>
A simpler approach uses the idea of precedence levels.  The five
operators have three different precedence levels.  Addition and
subtraction have precedence level 1, multiplication and division have
precedence level 2, and exponentiation has precedence level 3.  
In addition, it will be convenient to allow 4 as an artificial
precedence level.  Now, when printing a particular expression, we will
include a precedence level.  Operators below that
precedence level will require parentheses, operators at or above that
precedence level will not.  In pseudocode, this algorithm can be
written as
<pre>
    function show(expr, level) is
       if expr is a leaf node then
          return expr.letter
       else
          if expr.op == '^' then
             leftLevel  = 4
             rightLevel = 3
          if expr.op == '*' then
             leftLevel  = 2
             rightLevel = 2
          if expr.op == '/' then
             leftLevel  = 2
             rightLevel = 3
          if expr.op == '+' then
             leftLevel  = 1
             rightLevel = 1
          if expr.op == '-' then
             leftLevel  = 1
             rightLevel = 2

          left  = show(expr.left, leftLevel)
          right = show(expr.right, rightLevel)

          p = precedence level of expr.op
          if p &gt; level then
             return left + expr.op + right
          else
             return '(' + left + expr.op + right + ')'
</pre>
Notice how the associative operators (multiplication and addition)
use the same precedence level for both recursive calls, while the
right- and left-associative operators increase the precedence level
for one of their recursive calls.  The initial call to <tt>show</tt> uses 
precedence level 1 so that the overall expression is not surrounded by 
parentheses.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2347&amp;rd=5870"
name="2347">Rationalization</a></b> 
</font> 
<A href="Javascript:openProblemRating(2347)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 168 (14.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 24 (16.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Vedensky</b> for 261.96 points (48 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      244.36 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
We have up to 110 possible numbers to tweak, and each can be increased
by one, decreased by one, or left alone, so there are 3^110 possible
combinations to consider.  Obviously, this is far too many for a purely
brute-force solution.  We can cut down on the search space 
by recognizing that we never want to decrease one of the desired
alternative's scores or increase one of the other athernative's
scores, so really there are only 3^10*2^100 possible combinations.
</p>

<p>
Now, 3^10 is only about 60000, so it is feasible to brute-force all
possible combinations of weights, as long as we come up with a smarter
way to handle the individual scores.  The easiest way to generate all the
weights is with recursion.
<pre>
    function doWeights(i, numTweaks) is
       if i == weights.length then <i>...process the scores...</i>
       else
          doWeights(i+1, numTweaks)
          if weights[i] &lt; 9 then
             weights[i]++
             doWeights(i+1,numTweaks+1)
             weights[i]--
          if weights[i] &gt; 1 then
             weights[i]--
             doWeights(i+1,numTweaks+1)
             weights[i]++
</pre>
If you prefer iteration, you can loop from 0 to 3^W-1, where W is the 
number of weights.  Then consider the digits of each number in base 3.
If the i-th digit is D, then add D-1 to the i-th weight.
</p>

<p>
Now, for each configuration of weights, we need to find the minimum
number of scores that need to be tweaked.  This can be done greedily.
Consider a particular alternative's scores in the various categories.
If we are going to tweak any of them, we might as well tweak the one
with the largest weight first.  If we want to tweak a second one, we
might as well tweak the one with the second largest weight, and so on.
Thus, by sorting the weights&#8212;or, rather, by sorting the
<i>indices</i> of the weights&#8212;we can easily generate a table
<tt>optimal[i][j]</tt> of the best score that can be achieved
by alternative i using exactly j tweaks.  One catch is that
"optimal" for the desired alternative means as big as
possible, and for all other alternatives means as small as possible.
</p>

<p>
Given this table, we can loop through the possible numbers of tweaks to
the desired alternative, and for
each one loop through all the other alternatives to find the minimum
number of tweaks to that alternative for the desired alternative
to beat it.  If we ever hit an alternative that can't be beat, then we
can stop looking at the other alternatives.
<pre>
    for (num1 = 0; num1 &lt;= W; num1++)
       total = numTweaks + num1
       for (i = 0; i &lt; scores.length; i++)
          if i == desired then continue
          for (num2 = 0; num2 &lt;= W; num2++)
             if optimal[desired][num1] &gt; optimal[i][num2] then
                total += num2
                if total &gt; bestSoFar then continue outer loop
                else continue middle loop
          // <i>desired can't beat alternative i</i>
          continue outer loop
       bestSoFar = min(bestSoFar, total)
</pre>
<b>ploh</b> implemented essentially this algorithm.
</p>

<p>
Dynamic programming can also be used to find the optimal scores for
each alternative, as in <b>evgeni</b>'s solution, but this is slower
than the greedy approach.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3455&amp;rd=5870"
name="3455">ArithSeq</a></b> 
</font> 
<A href="Javascript:openProblemRating(3455)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      10 / 168 (5.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 10 (40.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ploh</b> for 683.33 points (17 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      490.82 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
I hope most people turned away from their keyboards and started
scribbling on paper when they opened this problem, because solving it
requires some insight into the structure of the set.  Remember that
the set was generated by the pattern keep 1, drop 1, keep 2, drop 2,
keep 3, drop 3, etc.  Where does block K (the block generated by 
"keep K") begin and end?  To see where it begins, notice
that it is preceded by 1+2+...+(K-1) kept numbers and 1+2+...+(K-1) 
dropped numbers.  Again recalling the story about Gauss, we see that block 
K must begin at K*(K-1)+1.  Therefore it must end at K*(K-1)+K = K*K.
So an easy test to determine whether a number X is in the set is
<pre>
    function inSet(X) is
       K = ceiling(sqrt(X))
       return X &gt; K*(K-1)
</pre>
As an aside on the problem-writing process, I was mildly dismayed to
realize that square roots of double-precision floating point numbers
yielded enough precision to handle the numbers in this problem (up to
about 670 billion).  Old-timers may remember that I was once famously 
burned by the
combination of long integers and double-precision square roots, so I
had certainly intended folks to work only with longs on this problem.
</p>

<p>
Now, let M be the total size of the desired sequence, DELTA*(N-1)+1.
We know that the arithmetic sequence will fit in block M, which begins
at M*(M-1) + 1, so that value yields a good default answer.
(Incidentally, this is the reason for the constraints.  The default
answer for the maximum inputs is 8410000002900000001, which is within
a few percent of the maximum positive 64-bit integer.  In fact,
however, the default answer will never be used when DELTA is much
larger than N.)
</p>

<p>
Assuming we start at 1 and search upwards, when can we be sure that no
better answer than the default answer is possible?  In other words,
when should we stop looking and just return the default answer?  As
soon as the
<i>end</i> point of the candidate sequence passes the last value in
block DELTA, because then the sequence would have to cross a block of
DELTA missing numbers, but the gap between numbers in the sequence is only
DELTA-1 wide.  In fact, a slightly tighter analysis shows that the
end point of the candidate sequence can't pass the <i>first</i> value
of block DELTA.
</p>

<p>
Ok, so this tells us when we can quit looking and just return the
default value, but for large DELTA, this still only cuts the size of the search
space down from about 10^20 to about 10^16&#8212;still far too large
to search exhaustively.  We need a way to step through the search space 
faster than one unit at a time.
</p>

<p>
Suppose we are checking a particular candidate sequence and
discover that one of the numbers in that sequence falls in between two
blocks.  Then we can skip ahead by the distance between that number
and the start of the next block.  The blocks we are dealing with can be 
quite large, so this can mean skipping ahead by a huge distance each step.
</p>

<p>
In pseudocode, this algorithm might be written
<pre>
    function minStart(n,delta) is
       skip = 1
       length = delta*(n-1)+1
       limit = delta*(delta-1)+1 // <i>limit can be improved</i>
       for (i = 1; i &lt;= limit; i += skip)
          for (j = i + length - 1; j &gt;= i; j -= delta)
             k = ceiling(sqrt(j))
             if j &lt;= k*(k-1) then
                skip = k*(k-1)+1 - j
                break
          if j &lt; i then // <i>found a valid sequence</i>
             return i
       return length*(length-1)+1 // <i>the default answer</i>
</pre>
Note that the inner loop counts backwards instead of forwards.  This is
in the hope that numbers at the end of the sequence will generate
bigger skips than numbers at the beginning of the sequence.
</p>

<p>
See my solution in the practice room for a faster algorithm that doesn't use 
<tt>sqrt</tt> at all, but instead uses only integer arithmetic.
</p>

                <p>
                <img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=299177"><strong>vorthys</strong></a><br />
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
