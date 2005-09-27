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

<title>Single Round Match 203 Statistics at TopCoder</title>

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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 203</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Thursday, July 15, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>

It was a damp, gray morning on the East Coast of the United States as
TopCoder's earliest ever single-round match got under way, but the sun
broke through over <b>antimatter</b>'s head and crowned him with a
victorious halo for dispatching the first two Division One problems in a
quarter-hour. At the other end of the world, it was near bedtime in
<b>John Dethridge</b>'s Australian quarters, but he stayed up for a spell
of coding that earned him a distant second. Meanwhile, back in Boston,
<b>jms137</b> misfired but a single neuron in the course of the match,
leading to the measly two keystrokes that compromised his solution to the
third and hardest problem, relegating him to third place.

<p>
</p>

Brand-new contestant <b>JongMan</b> romped through Division Two with
a 300-point win over his nearest competitor, <b>weck</b>. We'll see if
this latest coding ace has the goods to make an impression in the major
league. Rounding out the top three was <b>andro</b>, whose name means,
I think, "man" in ancient Greek. Well done, man.

</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2913&amp;rd=5849"
name="2913">UserName</a></b>
</font>
<A href="Javascript:openProblemRating(2913)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      100 / 113 (88.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      87 / 100 (87.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>JongMan</b> for 243.83 points (4 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201.10 (for 87 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given a list of existing usernames, we are to determine whether a newly
requested username already figures among them. If so, we must append to
it the lowest possible number to make a new username. An overly elaborate
approach would be to look at the existing usernames and start compiling
statistics that can eventually be used to determine the permissible set
of new usernames.

</p>
<p>

A better way is to start by looking at the new username and, if it is
taken, trying out numbers to append to it. The problem specifications
imply that we should start from 1 and progress through the natural
numbers until we've found a new username.

</p>
<p>

<pre>
public String newMember(String[] existingNames, String newName) {
  String name = newName;
  int n = 1;
  while (true) {
    int i;
    for (i = 0; i &lt; existingNames.length; i++)
      if (existingNames[i].compareTo(name) == 0)
        break;
    if (i == existingNames.length)
      break;
    name = newName+n;
    n++;
  }
  return name;
}
</pre>

</p>
<p>

The above code uses the inefficient method of linear search to
locate existing usernames, but it will do for the small problem
instances we are dealing with. For more serious input sizes, you
would want to use something much faster, such as binary search or
hashing. You might like to study the documentation for the Java classes <a
href="http://java.sun.com/j2se/1.4.2/docs/api/java/util/Arrays.html">Arrays</a>
and <a
href="http://java.sun.com/j2se/1.4.2/docs/api/java/util/HashSet.html">HashSet</a>
to prepare for future problems of this kind.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2911&amp;rd=5849"
name="2911">MatchMaking</a></b>
</font>
<A href="Javascript:openProblemRating(2911)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      59 / 113 (52.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      43 / 59 (72.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>JongMan</b> for 539.21 points (9 mins 45 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      355.33 (for 43 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      325
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 114 (92.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      90 / 106 (84.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 309.84 points (6 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      241.89 (for 90 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

The gist of this tedious problem statement is that we must find the
lexicographically least woman's name, consider the men with whom she has
the greatest number of answers in common, and take the lexicographically
least of the men's names. The number of common answers can be found by
a pairwise comparison of the characters in each answer string.

</p>
<p>

As for lexicographic ordering, Java's <code>compareTo</code> function
and the C library's <code>strcmp</code> are wise to it. Heaven help you
if you don't know your language's built-in facility for lexicographic
comparison. You would lose precious seconds or minutes coding up a
recursive function or some kind of loop to carry out this task.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2912&amp;rd=5849"
name="2912">UnLinker</a></b>
</font>
<A href="Javascript:openProblemRating(2912)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      12 / 113 (10.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 12 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>JongMan</b> for 678.70 points (17 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      493.82 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

Given a simple definition of weblinks, we are to replace each weblink
in a piece of text with a numbered tag. The chief difficulty consists in
identifying the spans of text that constitute weblinks. The hard way to go
about this is to write a function that, starting from a given point in the
text, looks for the longest substring that matches the weblink definition.

</p>
<p>

We would start by checking for the substring <code>http://</code>,
optionally followed by the <code>www.</code> substring. If that failed,
we would check for <code>www.</code> alone. If one of these prefixes
matched, we would start looking just beyond it for the longest substring
that looks like a domain. So if we found at least one valid character
(letter, numeral, or period), we would continue scanning to the end of
the longest such sequence of characters. Finally, we would look for one
of the five permitted suffixes. If one of them were present, we would
know that the span of text stretching from the start of the prefix to
the end of the suffix was a weblink as defined in the text.

</p>
<p>

So, yes, we could do all this work ourselves, which would amount to
coding a finite automaton by hand. Then again, high-level languages
such as Java offer a formalism called the regular expression, or regex
for short, that lets us express finite automata in a compact form and
make the compiler do all the dirty work. If you're not already familiar
with regex syntax, you should read up on it at earliest convenience.
Any good computational-theory textbook will do, or, in a pinch, the
<a href="http://www.python.org/doc/current/lib/re-syntax.html">Python
reference</a>.

</p>
<p>

Among the many possible ways to write the weblink pattern as a regex,
we might choose the following.

</p>
<p>

<pre>
public String clean(String text) {
  Pattern p = Pattern.compile(
    "((http://)?www[.]|http://)([a-zA-Z0-9.]+)[.](com|org|edu|info|tv)");
}
</pre>

</p>
<p>

After compiling the regex, we repeatedly apply it to the text and
substitute for each matching span a tag made with the help of the loop
counter.

</p>
<p>

<pre>
  int i = 0;
  while (true) {
    i++;
    String s = "OMIT"+i;
    Matcher m = p.matcher(text);
    boolean b = m.find();
    if (!b)
      break;
    text = text.substring(0, m.start()) + s + text.substring(m.end());
  }
  return text;
</pre>

</p>
<p>

There are more concise ways to accomplish
the above, as you will find after perusing the <a
href="http://java.sun.com/j2se/1.4.2/docs/api/java/util/regex/Pattern.html">
Java specifications</a> and trying your hand at some examples. The next
time a text pattern like this shows up in TopCoder or in a real-life
problem, you'll be ready with the right tools.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2910&amp;rd=5849"
name="2910">TinSoldiers</a></b>
</font>
<A href="Javascript:openProblemRating(2910)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      69 / 114 (60.53%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      50 / 69 (72.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 462.73 points (8 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      312.94 (for 50 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given a number of military ranks and the number of soldiers in each
rank, we are to calculate the number of ways these soldiers can be
lined up, not counting reflected configurations. Since this number can
range into the billions, we don't have enough time to generate all the
permutations one by one. But we must also be careful in calculating the
number directly. Although the final result is guaranteed to fit into a
32-bit integer, we should carry out the intermediate calculations using
64-bit variables in order to avoid overflow along the way.

</p>
<p>

If the total number of soldiers is N and the number of soldiers
in the highest rank is n0, then the number of ways to place
these soldiers in the line-up is <code>C(N, n0)</code>,
pronounced "N choose n0". Any combinatorics primer will tell
you, if you don't know already, that <code>C(N, n0)</code> is
<code>N!/((N-n0)!*n0!)</code>. (For a quick technical summary, consult
the <a href="http://mathworld.wolfram.com/Combination.html">Mathworld
article</a>.) Another way to write this is the following.

</p>
<p>

<pre>
C(N, n0) = N*(N-1)*(N-2)*...*(N-n0+1) / (n0*(n0-1)*(n0-2)*...*1)
</pre>

</p>
<p>

We can code up a Java function to compute this number with a pair of
<code>while</code> loops.

</p>
<p>

<pre>
long C(long m, long n) {
  long tot = 1;
  long i = m;
  while (i &gt; m-n)
    tot *= i--;
  i = n;
  while (i &gt; 1)
    tot /= i--;
  return tot;
}
</pre>

</p>
<p>

After placing the highest-ranked soldiers, we want to place those
of the second-highest rank, who number, let us say, n1. This can be
done in <code>C(N-n0, n1)</code> ways. For the next rank, there are
<code>C(N-n0-n1, n2)</code> ways, and so forth. The product of all
these combinations is the total number of permutations of the soldiers,
or the number of line-ups including reflections.

</p>
<p>

The Java code below computes the number of permutations and assigns
it to <code>tot</code>. In the meantime, the variable <code>odd</code>
tells us how many ranks have an odd number of soldiers.

</p>
<p>

<pre>
long doit(int rankCounts[]) {
  long tot = 1, sym = 0, Np = 0, N, odd = 0;
  int i;
  for (i = 0; i &lt; rankCounts.length; i++) {
    Np += rankCounts[i];
    odd += rankCounts[i]%2;
  }
  for (N = Np, i = 1; i &lt; rankCounts.length; N -= rankCounts[i], i++)
    tot *= C(N, rankCounts[i]);
</pre>

</p>
<p>

How do we calculate the number of reflected permutations? A nice way to
go about it is to find the number of palindromes, which are line-ups
that look the same forward and backward, meaning that they have no
reflection. This will tell us, by negation, how many permutations are
indeed reflected.

<p>
</p>

Palindromic line-ups are possible only if the number of ranks containing
an odd number of soldiers is zero or one. Consider what would happen if
two or more ranks contained an odd number of soldiers: at least one rank
would have a different number of soldiers in each half of the line-up.
Supposing there are no odd-numbered ranks, or only a single one whose odd
man out stands in the center, the number of palindromes is the number
of ways in which one half of the line-up can be constituted. This can
be calculated in the same way as the total number of line-ups, but using
half the number of soldiers.

</p>
<p>

<pre>
  if (Np%2 == odd) {
    sym = 1;
    N = Np/2;
    for (i = 1; i &lt; rankCounts.length; N -= rankCounts[i]/2, i++)
      sym *= C(N, rankCounts[i]/2);
  }
  return (tot+sym)/2;
}
</pre>

</p>
<p>

Half the original permutations were reflected, except for the ones that
were palindromic, so we divide <code>tot</code> by two and add back to
it half of <code>sym</code> to obtain the final result.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2247&amp;rd=5849"
name="2247">TurfRoller</a></b>
</font>
<A href="Javascript:openProblemRating(2247)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      3 / 114 (2.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 3 (0.00%)
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


<p>

The friendly neighborhood raccoons have agreed to cover a rectangular
lawn with rectangular turf strips laid at a specific angle. Our job is
merely to calculate the minimum number of turf strips required. Since
the problem stipulates that the strips' shorter edges are laid precisely
end-to-end, their longer edges must form a series of parallel lines
separated by the breadth of the turf strips. It is also implied that the
placement of a single turf strip, for instance at the top left corner,
determines the placement of all remaining turf strips. It may appear
at first sight that an optimal layout will result if the upper edge
of the top-left turf strip intersects the top-left corner of the lawn,
but the second test case shows that this is not so.

</p>
<p>

A talented geometer will perhaps see a way to analytically calculate the
optimal placement of the top-left turf strip. Given the coarse precision
constraints of the problem, however, a numerical approach will do. We
can start by fitting a turf strip tightly to the top-left corner of
the lawn and calculating the number of pieces in the resulting layout,
then nudging the top-left turf strip upward by a small increment and
repeating the calculation. After we've nudged the layout enough times to
return it to the original configuration, our final answer is the minimum
number of turf strips over all iterations.

</p>
<p>

<center>
<img  src="/i/srm/srm203_stripes.png" border="0"/>
</center>

</p>
<p>

In a given iteration, once the top-left turf strip has decided the
placement of the rows, we can push the leftmost turf strip within
each row tightly against the left border of the lawn without loss of
optimality. Now we can calculate the length of the whole row and divide
by the length of a single turf strip, rounding up to the nearest integer,
to find the number of pieces in this row. The length of the row, in turn,
can be determined by trigonometrically locating a few crucial points
along the lawn border and considering the distances they span.

</p>
<p>

The diagram below illustrates these points for the first test case. Recall
that we have a 60-by-90 lawn, with 60-by-25 turf strips laid at an angle
of 39 degrees. Suppose that we lay the top-left turf strip flush against
the top-left corner. The stretch of lawn that must be covered by this
turf row stretches from a point on the left border, marked <b>0</b>, to
a point on the top border, also marked <b>0</b>. If we consider that the
bottom-left corner of the lawn is the origin of a Cartesian coordinate
system, then the line running through the <b>0</b>-points intercepts the
y-axis, where x=0, at y=90-25/cos(39&#186;). (We're denoting the angles
in degrees here, but they should be converted to radians before being
passed to standard math functions.) Furthermore, this line intercepts
the top edge, where y=60, at x=(25/cos(39&#186;))/tan(39&#186;). As long
as the turf row intercepts only the left and top borders of the lawn,
the distance between these two points is exactly the length of the row.

</p>
<p>

In the next row, the leftmost turf strip cuts through the left border
at a point 90-25/cos(39&#186;) below the previous y-intercept. At the
right end, however, the furthest extent of the turf row intersects
the top-right corner of the lawn. It would be incorrect to take the
right <b>2</b>-point as the furthest extent of the second row. We can
discover such cases systematically on the following principle. If a turf
row's bottom edge intersects the right border while the previous row's
bottom edge intersects the top border, then the salient point must be
the top-right corner.

</p> <p>

<center>
<img src="/i/srm/srm203_intersections.png" border="0"/>
</center>

</p>
<p>

At the left end of the turf row, similarly, the salient point falls on the
bottom-left corner if the bottom edge intersects the bottom lawn border
while the previous row's bottom edge intersects the left border. In all
other cases, we need only consider the intersection of the edge itself.
Notice that the y-intercepts of each line are spaced at intervals of
25/cos(39&#186;) starting from the top. This fact, together with the
knowledge that the slope of each line is 39 degrees, is sufficient to
calculate the intersections at all borders.

</p>
<p>

It is vital to observe that in turf rows where one extremity is marked
by a corner of the lawn, the distance between the two points is longer
than the length of the row. In our example, this is the case with point
pairs <b>1</b> and <b>2</b>. The remedy is to project the span onto a
line angled at 39 degrees. By considering the triangle formed by the
span and the bottom edge of the nearest turf strip, we see that this
projection can be accomplished by taking the cosine of the difference
between 39 degrees and the angle of the span. This latter is just the
arctangent of its slope.

</p>
<p>

Before launching into any trigonometry, we can check for the special
cases where turf strips are laid at right angles to the lawn. In such
cases, we can compute the answer with integer division, as in the Java
code below. Otherwise, we promote the input parameters to floating-point
numbers and start the heavy lifting.

</p>
<p>

<pre>
  if (stripAngle == 0 || stripAngle == 90) {
    int t = lawnWidth;
    if (stripAngle == 90) {
    lawnWidth = lawnHeight;
    lawnHeight = t;
    }
    t = lawnWidth/stripLength + (lawnWidth%stripLength==0 ? 0 : 1);
    t *= lawnHeight/stripBreadth + (lawnHeight%stripBreadth==0 ? 0 : 1);
    return t;
  }
  return doit(lawnWidth, lawnHeight, Math.toRadians(stripAngle),
    stripLength, stripBreadth);
</pre>

</p>
<p>

In the following solution, we nudge the layout by an increment of 0.05
at each iteration. Further below, we shall refer to the loop counter
<code>i</code> when we need to calculate the total amount by which the
turf rows have been nudged upward.

</p>
<p>

<pre>
int doit(double w, double h, double a, double l, double b) {
  double left_x, left_y, right_x, right_y, dy, dx, S, D;
  int min = -1, ct, i = 0, n = 0;
  while (true) {
    double nudge = (n++)*0.05;
    if (nudge &gt; b/Math.cos(a))
      break;
    ct = i = 0;
</pre>

</p>
<p>

The coordinates of the left point of intersection for the current turf row
are called <code>left_x</code> and <code>left_y</code>, while those for
the right point are <code>right_x</code> and <code>right_y</code>. We
continue iterating and computing successive pairs of points until
<code>left_x</code> falls beyond the right lawn border, where x=w.

</p>
<p>

<pre>
    while (true) {
      left_x = 0.0;
      left_y = h - (++i)*b/Math.cos(a) + nudge;
      if (left_y &lt; 0) {
        left_y = 0;
        left_x = h - (i-1)*b/Math.cos(a) + nudge &gt;= 0.0 ? 0.0
          : (-h + (i-1)*b/Math.cos(a) - nudge)/Math.tan(a);
        if (left_x &gt; w)
          break;
      }
</pre>

</p>
<p>

In the above code, our first guess for the value of <code>left_y</code> is
the y-intercept of the current turf row's bottom edge. If the y-intercept
falls below the the bottom lawn border, we compute the actual point
of intersection between the turf row's bottom edge and the bottom
border. Next, we check whether this is the first such intersection we
have computed. If so, we use the bottom-left corner instead.

Similar reasoning applies in the calculation of the right point, shown
below. The difference is that our first guess lies on the top lawn border,
where y=h, and our second on the right border, where x=w.

</p>
<p>

<pre>
      right_y = h;
      right_x = (i*b/Math.cos(a) - nudge)/Math.tan(a);
      if (right_x &gt; w) {
        right_x = w;
        right_y = ((i-1)*b/Math.cos(a) - nudge)/Math.tan(a) &lt;= w ? h
          : h - (i-1)*b/Math.cos(a) + nudge + w*Math.tan(a);
      }
</pre>

</p>
<p>

We now consider the line segment defined by the left and right
points. Its rise and run are computed below as <code>dy</code> and
<code>dx</code>. Its length is <code>D</code>, but the length of its
projection onto a line of angle <code>a</code> is <code>S</code>, which
is precisely the length of the current turf row.

</p>
<p>

<pre>
      dy = right_y - left_y;
      dx = right_x - left_x;
      D = Math.sqrt(dy*dy + dx*dx);
      S = D*Math.cos(Math.atan(dy/dx)-a);
      ct += (int) (Math.ceil(S/l));
    }
</pre>

</p>
<p>

All that remains is to keep track of the minimum turf-strip count
between nudges.

</p>
<p>

<pre>
    if (min == -1 || ct &lt; min)
      min = ct;
  }
  return min;
}
</pre>

</p>
<p>

Raccoons are good at landscaping, but the trigonometry is best left
to humans.

</p>

                     <p>
                     <img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=273434"><strong>Eeyore</strong></a><br />
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
