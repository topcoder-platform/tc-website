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

<title>2003 TopCoder Open sponsored by Intel&#174; - Online Round 3 Summary</title>

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
        <td width="170" bgcolor="#CCCCCC">
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
                                <td class="statTextLarge" bgcolor="#999999" width="50%" nowrap="nowrap"><font size="3">TCO - Online Round 4 Summary</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, November 5, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p>
Call it nerves.  Call it writers pulling out all the stops.
Call it Round 4 of the TopCoder Open!  Faced with an Easy problem
that would have been a Medium on any other night, and a Medium
problem that would have been a Hard on any other night, 
50 of TopCoder's top coders managed 37 correct
submissions. That's 37 total. On all three problems combined.
</p>

<p>
<b>tjq</b> was first on the scoreboard with a quick submission on the Easy.
But by about the 12 minute mark, Easy submissions were rolling in.  The coders
quickly turned to the Medium and then...nothing.  Silence.  Not even any hopeful
compiles.  Eventually, many programmers began to abandon the Medium and
turn to the Hard.  Finally, 39 minutes into the coding phase, <b>SnapDragon</b>
grabbed the top spot with the first submission on the Medium.  Two minutes later
<b>tomek</b> came out of nowhere to steal the lead.  <b>tomek</b> had
struggled with the Easy, taking 24 minutes to complete it.  But then he
flew through the Medium in an amazing 17 minutes to gain back all the
points he had lost.  And so, with 34 minutes of coding still on the clock, 
the contest
was decided, as not a single Hard submission would later system tests.
Congratulations to <b>tomek</b>, <b>SnapDragon</b>, and the other 14 advancers!
</p>

<p>  
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>WhichData</b> 
</font> 
<A href="java-script:openProblemRating(1933)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 50 (90.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      32 / 45 (71.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tjq</b> for 282.05 points (7 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      202.98 (for 32 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
In this problem, you enumerate all possible nonempty subsets
of the data and calculate the variance of each, keeping the subset
whose variance is closest to the target.
</p>

<p>
There are two easy approaches to generating the subsets: bit masks and
recursion.  To iterate through the subsets using bit masks, you count from 1 to
2^<i>N</i>-1, where <i>N</i> is the number of elements in the data.
Then you treat each index as an <i>N</i>-bit number.  If the
<i>i</i>-th bit of this number is 1, then element <i>i</i> of the data
is in the subset.  If the <i>i</i>-th bit is 0, then element <i>i</i>
is not in the subset.  Usually in these kinds of loops, you count from
0 to 2^<i>N</i>-1, but this time you start at 1 to avoid the
empty set.
</p>

<p>
To enumerate subsets using recursion, you consider the elements one at a
time, trying all the subsets with that element and then trying
all the subsets without that element, as shown in the following pseudocode:
<pre>
  enumerateSubsets(i, currentSet)
    if i == N then return
    otherwise,
      process variance of currentSet + element i
      enumerateSubsets(i+1, currentSet + element i)
      enumerateSubsets(i+1, currentSet)
</pre>
Most coders went for the bitmask solution, but the recursive algorithm had
one compelling advantage for this problem.  Assuming you sort the sample
data first, then it is trivial to make the recursive solution generate
the subsets in lexicographic order.  In fact, the pseudocode above does exactly
that!  With the bitmask version, checking lexicographic order to break
ties is somewhat tricky.
</p>

<p>
The main remaining issue is precision.  If you had a prewritten Fraction
class, this would have been a good time to bring it out.  Otherwise,
you probably used doubles.  When comparing two doubles, you had to treat
them as equal if the difference between them was less than 10^-9.  And
if they were equal, then the tie-breaker rules involving lexicographic order
apply.
</p>

<p>
There was a minor but useful trick that could be used to avoid recomputing 
the variance of each subset from scratch.
The formula for the variance was given as
<pre>
     mean = ( s(0) + s(1) + s(2) + ... + s(n-1) )/n
     varsum = (mean-s(0))^2 + (mean-s(1))^2 + ... + (mean-s(n-1))^2
     variance = varsum/n
</pre>
At first glance, it looks like you can't compute varsum until you know the
mean, and you can't compute the mean until you know the size of the
subset.  But note that
<pre>
     varsum = (mean-s(0))^2 + (mean-s(1))^2 + ... + (mean-s(n-1))^2
            = n*mean^2 - 2*mean*sum + sumOfSquares
</pre>
where
<pre>
     sum           = s(0) + s(1) + ... + s(n-1)
     sumsOfSquares = s(0)^2 + s(1)^2 + ... + s(n-1)^2
</pre>
Therefore,
<pre>
     varsum   = n*mean^2 - 2*mean*sum + sumOfSquares
              = n*(sum/n)^2 - 2*(sum/n)*sum + sumOfSquares
              = sum^2/n - 2*sum^2/n + sumOfSquares
              = sumOfSquares - sum^2/n
</pre>
and
<pre>
     variance = varsum/n
              = sumOfSquares/n - sum^2/n^2
</pre>
Therefore, to calculate the variance, you only need to keep track of
the sum of the elements, the sum of the squares of the elements, and
the number of elements.  This fact is particularly handy in the recursive
formulation, where you use the partial sums to calculate the variance
of one sample and then pass the partial sums on to the recursive calls,
instead of recalculating the variance from scratch each time you want
to process a new set.
</p>

<p>
For an example of the bitmask approach, see the solutions of practically
anybody that passed.
For an example of the recursive approach, see my practice room solution.
</p>

<font size="+2"> 
<b>Jewelry</b> 
</font> 
<A href="java-script:openProblemRating(1166)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      7 / 50 (14.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 7 (71.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 378.97 points (17 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      286.10 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
At first glance, this problem appears to be a straightforward
variation on the knapsack theme.  As <b>lars</b> announced in his
trademark fashion, "It's TRIVIAL!"  You would expect a crowd as
well-versed in dynamic programming as this one to breeze through the
problem. Ah, but there was a twist!  The treatment of equal elements
gave folks fits.
</p>

<p>
Without equal elements, the problem could be solved as follows:
<pre>
  sort the elements in increasing order
  count = 0
  for each i from 1 .. # of elements do
    // assume element i is Bob's highest valued item
    waysBelow = ways to make sums using elements below i
    waysAbove = ways to make sums using elements above i
    for each sum s from element i upto max do
      count += waysBelow[s - element i] * waysAbove[s]
  return count
</pre>
Given <i>K</i> elements 1..<i>K</i>, you can calculate the number of ways to
make various sums of those values using a typical knapsack
algorithm:
<pre>
  initialize array ways[0..Max] to all zeros
  ways[0] = 1
  for each i from 1 upto K do
    for each sum s from max downto element i do
      ways[s] += ways[s - element i]
</pre>
At the end of these loops, <tt>ways[s]</tt> contains the number of ways
to choose elements that sum to <tt>s</tt>.
</p>

<p>
Equal elements complicate the picture because we can no longer guarantee
that Bob's elements are all to the left of Frank's elements in the sorted
list.  However, the only exceptions occur when Bob and Frank take
elements of equal value.  In each such case, we need to consider all the
different ways that Bob and Frank can exchange their equal elements.  
Fortunately, the changes to the overall algorithm are relatively minor.
</p>

<p>
We now need to process the elements group by group instead of element by element,
where each group contains equal elements.
Suppose there are <i>G</i> equal elements in a group.  For
each size <i>g</i> between 1 and <i>G</i>, we calculate how many distributions
there are in which Bob gets <i>g</i> items from this group.  Then we multiply
by Choose(<i>G</i>,<i>g</i>) to account for the different ways to pick
<i>g</i> elements out of the group.  Altogether, the final algorithm looks
like
<pre>
  sort the elements in increasing order
  count = 0
  for each group of equal elements do
    i = first index of group
    G = size of group
    waysBelow = ways to make sums using elements below i
    for each g from 1 to G do
      waysAbove = ways to make sums using elements above i+g-1
      for each sum s from g * element i upto max do
        count += Choose(G,g) * waysBelow[s - g * element i] * waysAbove[s]
  return count
</pre>
</p>

<font size="+2"> 
<b>Clue</b> 
</font> 
<A href="java-script:openProblemRating(1836)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      6 / 50 (12.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 6 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      n/a
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
"No correct submissions." That's not something you see
very often in TopCoder, especially in a match involving coders like
<b>SnapDragon</b>, <b>tomek</b>, and <b>snewman</b>.  And you wouldn't
have seen it in this match either if folks hadn't spent so much time working
on the previous problem.
</p>

<p>
There are two basic approaches you can take to this problem.  First,
you can try to use logical reasoning and trace through the implications
of each guess.  I tried this, but 2 1/2; hours later, I was still
hacking away, with no end in sight.  I'm eager to see somebody submit
a complete deductive solution in the practice room!
</p>

<p>
Or you can try brute force.  Check all possible combinations of cards and
rule out any combinations that are inconsistent with one or more of
the guesses.  First, you have to convince yourself that this is feasible.
There are at most 6*6*9 = 324 ways to assign the secret cards and 
Choose(12,6) = 12!/6!6! = 924 ways to assign the remaining cards.  
So there are at most 324 * 924 ~ 300000 ways to deal the
cards.  For each deal, you have to check at most 50 guesses for consistency,
so you have to check at most 300000 * 50 = 15 million guesses.  This is just
barely possible within the 8 second time limit, but only if you use
a very efficient representation of guesses, such as bitmasks.  If you
use something like strings to represent the guesses, you're doomed.  However,
you don't really need to check all 6*6*9 ways to assign the secret cards, 
because
you can immediately rule out any combination that includes one or more
cards from player 1's hand.  That leaves less than 6 million guesses to check,
which is easily possible using bitmasks.
</p>

<p>
Many other optimizations are conceivable.  Of these, the most useful is
to skip any combination of three secret cards in which the three cards
have already been determined to be part of the result as parts of
other combinations.  For example, if you already know that the 
secret cards could have been S1-W2-L3 or S3-W2-L1, then you don't
need to test whether the secret cards could have been S3-W2-L3 because
those cards will all be in the final result even if that particular
combination is not allowed.
</p>


<p>
To check that a particular guess is consistent with a deal, you need
to check four things:
<ul>
<li> If responder is 0, make sure the two non-guesser players don't have
     one of the guessed cards.</li>
<li> If responder is the player on guesser's right, make sure the player
     on guesser's left doesn't have one of the guessed cards.</li>
<li> If responder is not 0, make sure responder actually has one of
     the guessed cards.</li>
<li> If the response is not "N0", make sure the responder actually
     has the card that was shown.</li>
</ul>
If all of these tests are satisfied, then the guess is consistent with the
deal.  All four of these tests are easy to code using bitmasks&#8212;see my
solution in the practice room.
</p>

                        <p>
<!--                        <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />-->
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

