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

<title>Single Round Match 242 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 242</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, May 14, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
In division 1, <b>Petr</b> was in the lead after the coding phase, and
remained  first despite an unsuccessful challenge. The system tests
did not change anything in the top 5, so <b>Petr</b> won the match.
Congratulations to him for his first SRM win and an impressive 200 rating
point increase, that brought him to the top ten after just 5 contests!
Close second came <b>kalinov</b>, and <b>Yarin</b> took the third place.
</p>

<p>
In division 2, newcomer <b>tomekkulczynski</b> took an impressive first
place with over 300 points difference over second placed <b>xnitin</b> and
third placed <b>Biskup</b>.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4564&amp;rd=7217" name="4564">TeamSplit</a></b>
</font>
<A href="Javascript:openProblemRating(4564)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      265 / 279 (94.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      247 / 265 (93.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agray</b> for 248.71 points (2 mins 3 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      215.67 (for 247 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Since the strengths are given in an array in an arbitrary order, we first
sort them in descending order. Now we loop through all elements, and add
each strength alternating to the team strength of team 1 and team 2, beginning
with team 1 (don't forget to initialize team strengths to 0 at the beginning.)
Finally, return the difference of the two team strengths.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4490&amp;rd=7217" name="4490">GuessCard</a></b>
</font>
<A href="Javascript:openProblemRating(4490)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      135 / 279 (48.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      87 / 135 (64.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomekkulczynski</b> for 441.52 points (10 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      241.90 (for 87 correct submissions)
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
      208 / 216 (96.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      148 / 208 (71.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jshute</b> for 237.98 points (6 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      168.86 (for 148 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
With the low constraints for this problem, we can simply solve it by
simulating the procedure given in the problem statement.
</p>

<p>
For this, we can use an <code>int[][] configuration</code>, where we store the
card numbers in the current configuration (we enumerate the cards from 1 up to
<code>(width * length)</code> as in the example in the problem statement),
and a <code>boolean[] possible</code> that represents for each card if it is
a possible solution (in the beginning, all elements of this array are true).
</p>

<p>
Now, we loop through all elements <code>columns[c]</code>, and in each step we:
<ul>
<li>set <code>possible[configuration[i][j]]</code> to <code>false</code>, for all <code>i</code> and all <code>j!=columns[c]</code>.</li>
<li>if this is not the last element in <code>columns</code> rearrange <code>configuration</code>.</li>
</ul>
The rearrangement can be done by &quot;picking up&quot; the cards column
by column as stated in the problem statement, and &quot;putting them down&quot;
row by row, e.g.:
</p>
<pre>
k = 0;
for (j = 0; j &lt; width; j++) {
    for (i = 0; i &lt; height; i++) {
        temp[k] = configuration[i][j];
        k++;
    }
}
k = 0;
for (i = 0; i &lt; height; i++) {
    for (j = 0; j &lt; width; j++) {
        configuration[i][j] = temp[k];
        k++;
    }
}
</pre>

<p>
If at the end of the simulation, only one element of <code>possible[]</code>
is <code>true</code>, return the row in <code>configuration</code>, where
this element can be found.
</p>

<p>
We can significantly optimize the solution, by noticing that the cards that are
possible solutions will always be consecutively put down in each configuration:
</p>
<p>
Let's enumerate the positions in the layout row by row, beginning with 0 -
i.e. position at row <code>i</code> and column <code>j</code> is called
position <code>(i * width + j)</code>. In the beginning of each turn, the
possible solution cards will be in positions <code>start</code> to
<code>stop</code> for some integers <code>start</code> and <code>stop</code>.
When we are now given the information that the solution is in column
<code>column[c]</code>, only those cards will be still possible, that
are in a position of the form <code>(row * width + columns[c])</code>
for some integer <code>row</code>,
and lie in the interval <code>start</code> to <code>stop</code>.
The later condition turns out to be true for <code>row</code> in
the range from <code>startrow = (start - columns[c] + width - 1) / width</code>
to <code>stoprow = (stop - columns[c]) / width</code> (integer divisions!)
<ul>
<li>If this is the last configuration, we return <code>startrow</code> if
    <code>startrow == stoprow</code> or <code>-1</code> if
    <code>startrow != stoprow</code>.</li>
<li>If we have more configurations to do, we calculate from
    <code>startrow</code> and <code>stoprow</code> the
    values of <code>start</code> and <code>stop</code> for the next
    configuration (see code below), and continue with the next
    element in <code>columns[]</code>.</li>
</ul>

<pre>
int start = 0;
int stop = width * height - 1;
for (int c = 0; c &lt; columns.length; c++) {
    int startrow = (start - columns[c] + width - 1) / width;
    int stoprow = (stop - columns[c]) / width;
    if (c + 1 == columns.length) {
        return (startrow == stoprow) ? startrow : (-1);
    }
    start = columns[c] * height + startrow;
    stop = columns[c] * height + stoprow;
}
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4451&amp;rd=7217" name="4451">NumberSplit</a></b>
</font>
<A href="Javascript:openProblemRating(4451)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      24 / 279 (8.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 24 (41.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomekkulczynski</b> for 692.76 points (20 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      525.57 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The first thing to notice here is that the numbers in every step become
smaller. Let's take an example and say we have a five digit number of the form
<code>abcde</code> (<code>a</code>, <code>b</code>, <code>c</code>,
<code>d</code> and <code>e</code> represent the decimal digits of the
number), which we split to produce the successor:
<code>ab * c * de</code>. Here it is always <code>c &lt; 10</code>
and <code>de &lt; 100</code>, so for the successor we have:
<code>ab * c * de &lt; ab * 10 * 100 = ab000 &#8804; abcde</code>.
Similar with any other numbers and splittings.
</p>

<p>
Now we need a way to compute all possible successors, given a given
number. For this we can use the following recursive pseudo-code:
</p>
<pre>
generateSuccessors(int multiplier, int n) {
    add (multiplier * n) to the set of successors
    for (i = 10; i &lt;= n; i *= 10) {
       generateSuccessors(multiplier * (n / i), n % i);
    }
}
</pre>
<p>
We initialize the set of successors to an empty set, and call
<code>generateSuccessors(1, n)</code> (where <code>n</code> is the
number, for which we want to find the successors). Finally, we
remove <code>n</code> from the generated set (since this is not
a successor of <code>n</code> itself, we need to split the given
number to at least two parts for a successor to be valid).
</p>

<p>
To compute the longest possible sequence, starting with the given
<code>start</code>, generate all successors of <code>start</code>
as described above, and for each <code>n</code> in the successor
set compute recursively <code>longestSequence(n)</code>. The return
value is the maximum of all computed values + 1 (if <code>start</code>
is a single digit number, the successors set will be empty, and we
return 1). Note that this would not work if loops in the sequence were
possible, but since each successor is smaller then the original number,
this can not happen. In order to avoid a timeout, we need to memorize in a
buffer all values already computed.
</p>

<p>
Alternatively, we can use dynamic programming, by initializing
<code>longest[i] = 1</code> for all single digit numbers <code>i</code>,
and computing <code>longest[i]</code> from <code>i = 10</code> up to
<code>i = start</code> by adding 1 to the maximum of <code>longest[j]</code>
for all <code>j</code> in the successor set of <code>i</code>.
This works, since all successors of <code>i</code> are smaller than
<code>i</code>. With this solution, we compute the longest sequence for
more numbers than actually needed (many numbers between 1 and
<code>start</code> can not be reached from <code>start</code>) but with the
low constraints this solution was within the time limit.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4450&amp;rd=7217" name="4450">DiceThrows</a></b>
</font>
<A href="Javascript:openProblemRating(4450)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      100 / 216 (46.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      79 / 100 (79.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ploh</b> for 469.69 points (7 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      329.44 (for 79 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
First we use a helper function to compute for each player the probability
that his result is <code>n</code>, for all possible outcomes <code>n</code>.
We can do this by iterating over the number of his throws: For 0 throws,
there is a probability of 1.0 that his result is 0 (all other results have
probability 0.0). If we have the probabilities for each possible outcome
<code>n</code> after <code>i</code> throws stored in an array
<code>probs[n]</code>, then we can compute the probability that the outcome
after <code>i + 1</code> throws is <code>m</code> to be:
<code>newprobs[m] = sum over (j = 1 .. 6) probs[m - sides[j]] / 6.0</code>.
Since <code>sides[j]</code> is always positive, we can do the whole
computation using just one array if we compute <code>probs[]</code>
in each step starting from higher outcomes and going down:
</p>

<pre>
double[] getProbabilities(int numDice, int[] sides) {
    double[] probs = new double[20001];
    // (20000 is the maximum possible outcome with the given constraints.)
    probs[0] = 1.0;
    for (int i = 0; i &lt; numDice; i++) {
        for (int j = 20000; j >= 0; j--) {
            probs[j] = 0.0;
            for (int k = 0; k &lt; 6; k++) {
                if (j - sides[k] >= 0) probs[j] += probs[j - sides[k]] / 6.0;
            }
        }
    }
    return probs;
}
</pre>

<p>
Using this function, we compute <code>probsA[]</code> and <code>probsB[]</code>,
the probabilities for each outcome for the two players. From
<code>probsB[]</code>, we compute <code>probsLowerB[i]</code>, the probability
that the outcome of player B is lower than <code>i</code> for each possible
outcome <code>i</code> iteratively:
</p>
<pre>
probsLowerB[0] = 0.0;
for (int i = 1; i &lt;= 20000; i++) {
    probsLowerB[i] = probsLowerB[i-1] + probs[i-1];
}
</pre>

<p>
The probability for player A to win is then the sum of
<code>probsA[i] * probsLowerB[i]</code> over all possible outcomes
<code>i</code> (i.e. the probability that player A gets the result
<code>i</code> and player B gets a lower result, summed over all
<code>i</code>.)
</p>

<p>
It turned out that the constraints were low enough that in some optimized
cases they also allowed computation of the final result by just iterating
over all possible outcomes <code>i</code> for player A and all possible
outcomes <code>j &lt; i</code> for player B, and adding
<code>probsA[i] * probsB[j]</code>, though this can come too close to the time
limit (e.g. in C++ using <code>vector &lt;double&gt; probsA</code> instead
of <code>double probsA[20001]</code> can cause this solution to time out):
</p>
<pre>
double result = 0.0;
for (int i = 0; i &lt;= 20000; i++) {
    for (int j = 0; j &lt; i; j++) {
        result += probsA[i] * probsB[j];
    }
}
</pre>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4489&amp;rd=7217" name="4489">PolyominoCut</a></b>
</font>
<A href="Javascript:openProblemRating(4489)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      6 / 216 (2.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 6 (100.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 540.04 points (32 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      465.94 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The first thing to do here, is to build a set with all possible
<code>k</code>-polyominoes, ignoring translations (but not rotations
and reflections). We can do this by starting with a
set that contains the only possible monomino (<code>k = 1</code>), and
building recursively the more complex polyominoes; in pseudo-code:
</p>
<pre>
polyominoes[1] = a set containing only a monomino
for (i = 2; i &lt;= k; i++) {
    initialize set polyominoes[i] to an empty set
    for (all p in polyominoes[i-1]) {
        for (all squares s included in p) {
            for (all directions d in up/down/left/right) {
                if (square in direction d from s is not in p) {
                    insert (p extended with the square in direction d from s)
                        into ployominoes[i]
                }
            }
        }
    }
}
</pre>

<p>
For this, we need a data structure to store our polyominoes. It is convenient
here to make a class <code>Polyomino</code> for this, which includes
either a list of the coordinates that the current polyomino occupies,
or an array <code>boolean[][]</code> with those elements set to
<code>true</code> that are occupied by the polyomino. Since we want to ignore
translations, we have to define in our data structure, which polyominoes are
supposed to be equal, in order for them to not be included in the set a second
time (this can be done for example by overriding <code>equals()</code> and
<code>hashCode()</code> in Java, or by overriding <code>operator==</code>
in C++, where we check if one is a translated version of the other.)
</p>

<p>
If we didn't have the requirement that the remaining part of the board
must be connected, we would be almost ready now. We can place each
polyomino <code>p</code> from the set <code>polyominoes[k]</code>
in exactly <code>(width - p.width + 1) * (height - p.height + 1)</code>
positions in the board, where <code>p.width</code> and <code>p.height</code>
are the width and height that the polyomino <code>p</code> occupies
(it is useful to store these also in the <code>Polyomino</code>
data structure while building the polyominoes).
</p>
<p>
Since we have the additional requirement for the board to remain
connected, we have to check this for all possible placements of the polyomino.
The constraints of the board clearly do not allow to check all placements
explicitly (since there can be more than 1.0e9 valid placements, see last
example), but we can easily see that most placements are identical with
respect to if they leave the remaining part connected or disconnected.
We can find out, that there are 9 possible placements that we have to check:
the polyomino being placed somewhere in the center (i.e. leave all edge
and corner squares unoccupied), the polyomino being placed at one of the
sides (up/down/left/right), and the polyomino being placed at one of the
corners (up-left/up-right/down-left/down-right). Since the width and height
of the board were chosen to be larger than <code>k</code>, we don't have
to consider mixed cases (e.g. a polyomino occupying a square in the upper
border and in the lower border). So for each of these 9 cases, we check
if the remaining board is connected, and if yes, we add the number of
positions in the board that are associated with this case:
</p>
<pre>
polyomino in a center position:  (width - p.width - 1) * (height - p.height - 1)
polyomino in up or down side:    (width - p.width - 1)
polyomino in left or right side: (height - p.height - 1)
polyomino in a corner:           1
</pre>
<p>
To check if one positioning of the polyomino is acceptable, we first make
a small board that includes the polyomino in the position we want to check:
start with the polyomino, and augment it with a line of unoccupied cells on the
sides that the polyomino is not supposed to border on (i.e. when checking
the &quot;polyomino in the up side&quot; position, we augment the polyomino
with a line of squares to the left, right and down).
Now we can do a depth first search (or breadth first search) starting in an
unoccupied square. If all unoccupied squares are visited, the position is
acceptable, otherwise we don't count the position. We have to use a small board
for doing the check, since if we used the original board, we would have to
do in the worst case <code>(9 * 2725)</code> depth/breadth first searches in
an 800 times 800 board, which would clearly timeout (2725 is the number of
8-polyominoes).
</p>



                <p>
                <img src="/i/m/gepa_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=310430"><strong>gepa</strong></a><br />
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
