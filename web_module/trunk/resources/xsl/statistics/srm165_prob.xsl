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

<title>Single Round Match 165 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 165</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, September 23, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p>
<b>SnapDragon</b> won again, surprising to no one, but it was by no means a 
sure thing.  <b>SnapDragon</b> finished all three problems first, but a
few minutes later <b>WishingBone</b> snuck into the lead with an exceptionally
fast time on the Hard.  In the challenge phase, <b>SnapDragon</b> spotted
a flaw in a competitor's code, but <b>wleite</b> beat him to the challenge by
five seconds, denying <b>SnapDragon</b> 50 points that would have propelled him
into first place.  It looked like <b>WishingBone</b> would eke out the
victory until his Hard problem timed out during system tests.  Division 1
also witnessed the end of an amazing streak by <b>Tomek</b>, who had
until now submitted all three problems in every contest he had entered.
</p>

<p>
In Division 2, there were lots of high scores after the coding phase, but
challenges and system tests claimed all but two of the submitted
Hard problems.  Newcomer <b>moggy</b> won in his debut, with
<b>vavadera</b> close behind.
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>BritishCoins</b>
</font><A href="Javascript:openProblemRating(1862)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      222 / 230 (96.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212 / 222 (95.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>pinting</b> for 249.81 points (0 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231.07 (for 212 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
There are 12 pennies in a shilling and 20 shillings in a
pound, so there are 12*20 = 240 pennies in a pound.  One simple way to
convert pennies into the larger denominations is to use two loops, one
to convert pennies to pounds and one to convert the remaining pennies 
to shillings.
<pre>
  int pounds = 0, shillings = 0;
  while (pence &gt;= 240) {
    pounds++;
    pence -= 240;
  }
  while (pence &gt;= 12) {
    shillings++;
    pence -= 12;
  }
  return new int[]{ pounds, shillings, pence };
</pre>
We can accomplish the same thing without any loops by using integer division and mod.
<pre>
  int pounds = pence / 240;
  pence = pence % 240;

  int shillings = pence / 12;
  pence = pence % 12;

  return new int[]{ pounds, shillings, pence };
</pre>
Alternatively, we can write all the math in a single line as
<pre>
  return new int[]{ pence/240, (pence%240)/12, pence%12 };
</pre>
</p> 

<font size="+2"> 
<b>ParallelSpeedup</b> 
</font><A href="Javascript:openProblemRating(1866)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      178 / 230 (77.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      87 / 178 (48.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>pinting</b> for 493.00 points (3 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      296.54 (for 87 correct submissions) 
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
      151 / 156 (96.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      121 / 151 (80.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ZorbaTHut</b> for 246.44 points (3 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.07 (for 121 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Assume that there are <tt>p</tt> processors.  Then there are <tt>p*(p-1)/2</tt>
pairs of processors, so the communications between the various pairs take a
total of <tt>overhead*p*(p-1)/2</tt> milliseconds.  If the tasks can be
distributed evenly among the processors, then every processor gets
<tt>k/p</tt> tasks.  Otherwise, some processors get one extra task.  
Therefore the total time required is either
<pre>
    k/p + overhead*p*(p-1)/2     (if p divides evenly into k)
</pre>
or
<pre>
    1+k/p + overhead*p*(p-1)/2   (otherwise)
</pre>
We can combine these two cases into a single formula by guaranteeing that 
the division <tt>k/p</tt> rounds up instead of down, as in
<pre>
    (k+p-1)/p + overhead*p*(p-1)/2
</pre>
</p>

<p>
To find the optimal number of processors, we loop through different
values of <tt>p</tt>, keeping track of which value yields the fastest
running time.  It makes sense to start at 1 and count upwards, but
when can we stop?
</p>

<p>
Clearly, we will never use more than <tt>k</tt> processors, so one simple
strategy is to loop from 1 to <tt>k</tt>.  However, as <tt>k</tt> gets large,
the calculation of <tt>p*(p-1)/2</tt> starts to overflow 32-bit
integers, so we would have to be careful to use 64-bit integers.
</p>

<p>
A more efficient alternative that works with 32-bit integers is to stop as soon
as the communications overhead exceeds <tt>k</tt>.  For example, if we have
1000000 tasks, we will never choose a number of tasks where the communications
overhead is more than 1000000 milliseconds.  <b>ZorbaTHut</b> used a variation 
of this reasoning to place an upper limit of 1000 on the loop.
</p>

<p>
An even more efficient alternative depends on the fact that the curve
of running times versus number of processors is concave.  In other words,
it slopes downward until it reaches the minimum, and then slopes upward 
forever.  Therefore, we can exit the loop as soon as the running time in
one iteration is greater than the running time in the previous iteration.
See, for example, <b>Yarin</b>'s and <b>ChristopherH</b>'s solutions.
</p> 

<font size="+2"> 
<b>ShortPalindromes</b> 
</font><A href="Javascript:openProblemRating(1861)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1150 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 230 (9.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 22 (9.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vavadera</b> for 568.18 points (38 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      562.50 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
A key observation is that, to make the shortest possible palindrome out 
of <b>base</b>, you should never add letters to <i>both</i> the front and back 
of the string.  If you were to do so, then you could make an even shorter 
palindrome by removing the first and last characters that you added.
Therefore, the shortest palindrome that you can make out of <b>base</b> must
either start with the first letter of <b>base</b> or end with the
last letter of <b>base</b> (or both, if the first and last letters of
<b>base</b> are the same).
</p>

<p>
It is easy to turn this observation into a recursive algorithm:
<pre>
  shortest(base)
      if base is already a palindrome then
          return base
      if base has the form A...A then
          return A + shortest(...) + A
      if base has the form A...B then
          return min(A + shortest(...B) + A,
                     B + shortest(A...) + B)
</pre>
where <tt>min</tt> chooses the shorter of the two strings, or the 
lexicographically earliest if the strings have the same length.
Unfortunately, a naive implementation of this algorithm might take exponential time,
because a call on a string of size <i>n</i> can result in two calls on strings
of size <i>n</i>-1.  Such an implementation would be likely to time out on
strings of size 25.
</p>

<p>
The second key observation is to notice that the above algorithm can end 
up calling <tt>shortest</tt> multiple times on the same substring, but 
that it never calls <tt>shortest</tt> on a string that is not a substring 
of the original <b>base</b>.  The first property suggests that memoization
might be a good idea, whereas the second property hints at dynamic programming.
Either will work.
</p>

<p>
To apply memoization, we modify <tt>shortest</tt> to remember which strings
it has already been called on, and the answer for each.  Then 
<tt>shortest</tt> begins by checking whether it has seen the current
argument before.  If so, it looks up the answer in a table.  Otherwise,
it computes the answer as above, but makes the recursive calls to
the new, memoizing version of <tt>shortest</tt>.  Once it is done, it
saves the new answer in the table.
</p>

<p>
To apply dynamic programming, we make a table of all the possible
substrings of <b>base</b>.  Then we process the entries of the
table from shortest to longest.    For each entry, we compute the
shortest palindrome of that entry using the above rules, except that we
replace the recursive calls with lookups in the table.
See newcomer <b>moggy</b>'s solution for a nice example of this approach.
</p>

<font size="+2"> 
<b>ContinuedFractions</b> 
</font><A href="Javascript:openProblemRating(1630)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      85 / 156 (54.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      79 / 85 (92.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tjq</b> for 503.85 points (12 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      332.64 (for 79 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
If you are math phobic, this problem probably gave you a severe case of
the heebie jeebies.  Even if you are comfortable with math, you may
have been uncomfortable with this problem because it was deliberately
written to test a slightly different skill from most TopCoder problems.
Usually, contest problems ask you either to come up with an algorithm
from scratch or to use an algorithm that is clearly specified.  
This problem asked you to use a particular algorithm, but did not specify
how that algorithm works.  Intead, you were asked to generalize the 
algorithm from some sample 
calculations, which is something that happens frequently in real life.
</p>

<p>
The algorithm begins by finding the integer part of the square root, 
which is easily done by a loop:
<pre>
  int root = 0;
  while (root*root &lt;= n) root++;
  root--;
</pre>
<tt>root</tt> becomes the first element of the answer.  The remainder is
the fraction <tt>(sqrt(n)-root)/1</tt>.  We next begin a loop in
which we process remainders of the form <tt>(sqrt(n)-d)/m</tt> until
we get back to <tt>(sqrt(n)-root)/1</tt>.
</p>

<p>
At each stage, we must convert the fraction <tt>(sqrt(n)-d)/m</tt> into
the form 
<pre>
             1
    -------------------
    q + (sqrt(n)-d')/m'
</pre>
where <tt>q</tt> is a positive integer and the remainder 
<tt>(sqrt(n)-d')/m'</tt> is between 0 and 1.
</p>

<p>
The sample calculations went through the following steps:
<pre>
    sqrt(n)-d        1                   1           
    --------- = ----------- = -----------------------
        m            m              m      sqrt(n)+d 
                 ---------     --------- * --------- 
                 sqrt(n)-d     sqrt(n)-d   sqrt(n)+d 

                       1                 1
              = ----------------- = -----------
                 m * (sqrt(n)+d)     sqrt(n)+d
                 ---------------     ---------
                     n - d*d         (n-d*d)/m
</pre>
At this point, we can simplify <tt>(n-d*d)/m</tt> to get <tt>m'</tt>.
There is no obvious reason to expect that <tt>n-d*d</tt> will always
be divisible by <tt>m</tt>, except that the problem statement implies that
this will be the case.
</p>

<p>
Next, we need to massage <tt>(sqrt(n)+d)/m'</tt> into the form
<tt>q + (sqrt(n)-d')/m'</tt>, where <tt>q</tt> is an integer and
<tt>(sqrt(n)-d')/m'</tt> is between 0 and 1.  This can be accomplished
by setting <tt>q = (root+d)/m'</tt> and <tt>d' = q*m' - d</tt>.
</p>

<p>
Altogether, then, our main loop looks like
<pre>
  repeat
      m' = (n - d*d) / m
      q  = (root + d) / m'
      d' = q*m' - d
      add q to output list
      d = d'
      m = m'
  until d == root and m == 1
</pre>
</p>

<p>
An interesting fact about these periodic continued fractions is that
the last element is always twice the first element.  Therefore an
alternative test for the ending condition is
<pre>
  repeat
      ....
  until q == 2*root
</pre>
</p>

<p>
An even more intriguing fact about these periodic continue fractions,
albeit one that is ultimately useless for the problem, is that, if
you remove the first and last elements from the periodic continued fraction,
then the remaining elements form a palindrome.
For example, the periodic continued fraction for the
square root of 158 is
<pre>
     { 12,  1,  1,  3,  12,  3,  1,  1,  24 }
</pre>
The last  element (24) is twice the first element (12), and 
the remaining elements
(1, 1, 3, 12, 3, 1, 1) form a palindrome.
</p>

<font size="+2"> 
<b>Scheduling</b> 
</font><A href="Javascript:openProblemRating(1879)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      13 / 156 (8.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 13 (53.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 666.74 points (22 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      563.28 (for 7 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem looks scary at first, but the constraints keep it reasonable.
What at first seems like it will require some heavy duty graph theory in
the end requires nothing fancier than memoization, a staple of
Division 1 Hard problems.
</p> 

<p>
We define a recursive function
<pre>
    solve(tasks,cur,delay)
</pre>
that computes the minimum time needed to complete the set of tasks, 
assuming
that the task <tt>cur</tt> is currently executing and that it has 
<tt>delay</tt> units of time to go.  If no tasks are executing, 
then <tt>cur</tt> will be -1 and  <tt>delay</tt> will be 0.  The
initial call will be to <tt>solve(<i>allPossibleTasks</i>,-1,0)</tt>.
</p>

<p>
There are three main cases:
<ul>
<li> There are no more tasks to run.  Then we are done as soon as the 
     current task finishes.</li>
<li> The best move is to start a task right now.  Loop through all
     tasks that are eligible to start and try each one, keeping
     track of the minimum time achieved.  A task is eligible to run if
     all the tasks it depends on have completed.</li>
<li> The best move is to sit idle until the current task finishes.
     This happens when the next task that we want to run depends on
     the current task.</li>
</ul>
Notice that it never makes sense to sit idle until some time between
now and when the current task finishes, because any task we could start
then, we could just as easily start now.
</p>

<p>
In pseudocode, <tt>solve</tt> is
<pre>
  solve(tasks,cur,delay)
      if tasks is empty then return delay

      best = 999999999
      for each t in tasks
          if t is eligible to run then
              if time[t] &gt; delay then
                  total = delay + solve(tasks-{t},t,time[t]-delay)
              else
                  total = time[t] + solve(tasks-{t},cur,delay-time[t])
              best = min(best,total)

      if cur != -1 then
          total = delay + solve(tasks,-1,0)
          best = min(best,total)

      return best
</pre>
</p>

<p>
Unfortunately, this algorithm is too slow as written because it tries the
tasks in every possible order.  There are a maximum of 12 tasks, but there
are trillions of ways to order those 12 tasks.  Notice, however,
that we make many calls to <tt>solve</tt> with the same arguments.  For
example, suppose tasks 1-4 are all eligible to start immediately and all run in
the same amount of time.  Then we will try running 1&amp;2 together followed
by 3&amp;4, 1&amp;3 together followed by 2&amp;4, and so on.  Each of
these patterns will eventually make a call to <tt>solve({5,...,12},-1,0)</tt>.
We can save time by caching the value of 
<tt>solve({5,...,12},-1,0)</tt> in a table the first
time it is called, and looking it up each subsequent time instead of
recomputing it.  This technique is called <i>memoization</i>.
</p>

<p>
We modify <tt>solve</tt> to check the table at the beginning and
save the minimum time in the table at the end.  The lines
marked with stars are new but the rest of <tt>solve</tt> is unchanged.
<pre>
  solve(tasks,cur,delay)
      if tasks is empty then return delay

  *   combine tasks, cur, and delay into a single key
  *   lookup that key in a table
  *   if it's there, grab its associated value and return it

      <i>compute best as in the previous version</i>

  *   save key and best in the table
      return best
</pre>
</p>

<p>
One final issue is how to represent the set of remaining tasks 
(or, alternatively, the set of completed tasks).  Most people used
bitmasks, but this was not crucial.
</p>


                        <p>
                        <!--<img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />-->
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

