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

<title>Single Round Match 231 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 231</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, February 19, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
SRM 231 gave division 2 coders a welcome reprieve from the
difficulties of the last few matches.  	chrbanx, in his
10<sup>th</sup> SRM beat out second place Mojito1 by a comfortable
margin, and solved all three problems in a little over 26 minutes.
The best newcomer was masti who took 8<sup>th</sup> place.<br/><br/>
In division 1, things were not so easy, as many of the medium
submissions fell to challenges, and only one person submitted the hard
problem - unsuccessfully.  Though Ryan had the most points from
the coding phase, benetin pulled out the win with the help of 100
points during the challenge phase vs. Ryan's -25.  PaulJefferys was
also able to pass Ryan, and take second place on challenges, only 4
points behind benetin.
</p>
<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2405&amp;rd=6520" name="2405">GolfScore</a></b>
</font>
<A href="Javascript:openProblemRating(2405)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      281 / 298 (94.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      254 / 281 (90.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Baton</b> for 248.12 points (2 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      205.43 (for 254 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Given the par values of an 18-hole golf course and the score obtained on each hole, expressed in relative terms such as "bogey" and "birdie", we are to compute the total score achieved by a player. There is one scoring phrase that is not relative, namely "hole in one". Coding a successful solution depends partly on dealing with this special case.
</p>
<p>
The other challenge is to find a way of translating the scoring
phrases into their numerical values. The simplest approach is to use
<code>if</code> statements or a <code>switch</code> to check each case
individually. If we see that the phrase is "albatross", for instance,
we know that it means -3 in relation to par, so we can add the par value
less three to the total score. This calls for much typing, however,
and the more we type, the greater the latitude for error.

</p><p>

Consider, instead, that we can look up the scoring phrase in an array
and use its position to directly calculate a numerical value. In this
array, the scoring phrases should be listed in order, say from lowest
to highest as below. We then initialize the total score to zero. When
iterating over the holes, we single out the "hole in one" case and
immediately increment the score by one.

</p><pre>
  public int tally(int[] parValues, String[] scoreSheet) {
    String[] scores = {"triple bogey", "double bogey", "bogey",
                       "par", "birdie", "eagle", "albatross"};
    int tot = 0;
    for (int i = 0, j; i &lt;18; i++) {
      if (scoreSheet[i].equals("hole in one")) {
        tot++;
        continue;
      }

</pre><p>

There are predefined functions in most languages to quickly find an
element in a sorted array, but a <code>for</code> loop will suffice
here. The scoring phrase "triple bogey" is at position 0, and its value
is +3. The scoring phrase "par" is at position 3 with a value of 0. In
general, we can subtract the position of a phrase and add three to obtain
its value.

</p><pre>
      for (j = 0; j &lt;7; j++)
        if (scoreSheet[i].equals(scores[j]))
          break;
      tot += parValues[i]-j+3;
    }
    return tot;
  }
</pre><p>

If the scoring phrases were not mapped in arithmetic progression to
their values, we would probably want to use an associative array of some
kind, such as a map or a hash, to look up the integer corresponding to
each string.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3946&amp;rd=6520" name="3946">Stitch</a></b>
</font>
<A href="Javascript:openProblemRating(3946)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      185 / 298 (62.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      153 / 185 (82.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>niphoton</b> for 408.58 points (9 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      254.30 (for 153 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200 / 208 (96.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195 / 200 (97.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>natori</b> for 193.25 points (5 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      149.88 (for 195 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In reality, stitching two images together is a bit more complicated than this problem might
suggest.  If you were to use the algorithm it outlines, the stitched
region would probably look rather blurry, especially in the middle
part where it was closest to an even average.  That said, the problem
was pretty straightforward, and relied mostly on your ability to
handle the indexes.  <br/><br/>The final image has
<tt>w<sub>0</sub>+w<sub>1</sub>-overlap</tt> columns, where
<tt>w<sub>0</sub></tt> and <tt>w<sub>1</sub></tt> are the widths of
the two images.  To find the value a character in the
<tt>i<sup>th</sup></tt> column of the return, you should first check
if <tt>i</tt> is less than <tt>w<sub>0</sub>-overlap</tt> in which
case you just use character <tt>i</tt> from the left bitmap.  Then,
check if <tt>i</tt> is greater than or equal to <tt>w<sub>0</sub></tt>,
in which case you should use character <tt>i-w<sub>0</sub>+overlap</tt> from
the right bitmap.  If neither of those cases are true, the pixel is in
the overlapping region, and you should blend the pixels at
<tt>w<sub>0</sub>-overlap</tt> and <tt>i-w<sub>0</sub>+overlap</tt> from the
left and right bitmaps, respectively.  Just be careful to use floating
point division, and then round the results.  I find that the easiest
way to figure all this out and avoid off-by-one errors is to think
about the degenerative cases where <tt>w<sub>0</sub></tt>,
<tt>w<sub>1</sub></tt>, or overlap is 0.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3945&amp;rd=6520" name="3945">ProgramSchedule</a></b>
</font>
<A href="Javascript:openProblemRating(3945)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      108 / 298 (36.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 108 (58.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>chrbanx</b> for 857.17 points (6 mins 24 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      617.88 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This is a classic sort of greedy problem.  The answer, which many
coders found, is to simply sort the programs by elements of B in
descending order.  That way the ones that have to run longest get
started earliest.  To prove that this is optimal, imagine a different
ordering.  In that ordering there must be an <i>inversion</i> -
a pair of programs in the ordering that are adjacent and whose times
in B are not ordered as the sorting method would order them.  It is
easy to prove that swapping these two programs will not make the total
time any longer.  Therefore, whenever there is an inversion, you can
always swap the inverted programs, and the time will get no worse.
Since swapping things that are out of order is one way to sort them
(bubble sort), we know that by repeatedly swapping inverted elements,
we will eventually get to the sorted list, and the total time will be
no more than it was when we started.  Hence, the other ordering is no
better, and the sorted order is optimal.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3943&amp;rd=6520" name="3943">LargeSignTest</a></b>
</font>
<A href="Javascript:openProblemRating(3943)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      107 / 208 (51.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      51 / 107 (47.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Ryan</b> for 397.14 points (10 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      251.51 (for 51 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Finding the summation is pretty trivial for small inputs.  But with N
up to 1,000,000, the naive algorithm using doubles will run into all
sorts of problems, as doubles can only go up to about 10<sup>300</sup>
- much less than 2<sup>1,000,000</sup>.  Hence, Most coders solved
this problem in one of two ways.  They either used logarithms, or else
cleverly scaled things as they went.  <br/><br/>

To solve the problem with logarithms you need to know 3 basic facts
(log means natural logarithm):
<ul><li>exp(log(a)) = a</li>
    <li>log(a * b) = log(a) + log(b)</li>
    <li>log(a / b) = log(a) - log(b)</li>
</ul>
So, we can calulate log(a!) = log(a) + log((a-1)!) and we can
calculate a choose b as log(a!) - log(b!) - log((a-b)!).  Also, we can
calculate log(2<sup>a</sup>) as a*log(2).  Now, why does this help us?
Because we can use this to safely calculate each term in the
summation, without overflowing or underflowing.  First, find the log of the term:
<pre>
    log((N choose i) / 2<sup>N</sup>) = 
    log(N choose i) - log(2<sup>N</sup>) =
    log(fact(N)) - log(fact(i)) - log(fact(N-i)) - N * log(2)
</pre>
Each of those values is relatively small, but not so small that it
will underflow, and will fit easily within a
double, with a reasonable degree of accuracy.  The largest is
log(fact(N)), but even it is pretty small, compared to
10<sup>300</sup>.
So, now that we've calculated the log of the term, all that remains is
to take exp(x), where x is the above equation.  This gives you the
term in the summation with enough accuracy to solve the
problem by simply adding up all the terms.<br/><br/>

The other approach requires a bit less math, but a bit more
cleverness, in my opinion.  Since the denominator is a constant, we
can factor it out, and take the summation of just the numerator, and
then divide at the end.  We can also divide as we are calculating the
summation, provided we are careful about how we do it.  One important
observation to this approach is that a term in the summation is
related to the previous term.  Working out a bit of simple algebra, we
find the following recurrence, where f(i) is the i<sup>th</sup>
numerator:
<pre>
    f(i) = f(i-1) * (N-i+1) / i
</pre>
Now, we know that we have to divide by 2 a total of N times (the
2<sup>N</sup>).  So, lets simply start taking the summation of the
numerator, and when the numbers start to get very big, divide by 2 to
keep things reasonable.  When we divide the current sum by 2, we also
divide f(i) by 2, so that everything has been divided by 2 the same
number of times.  Once we are done with the summation, we will
probably have to divide by 2 some more, so that we have done so N time
in total:
<pre>
    double f = 1, ret = 1, k = 0;
    for (int i = 1; i &lt;= Math.min(K,N-K); i++) {
        ret += f = f * (N-i+1) / i;
        while( ret &gt; 2) {
            ret /= 2;
            f /= 2;
            k++;
        }
    } 
    while ( k++ &lt; N-1 ) ret /= 2;
</pre>

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3942&amp;rd=6520" name="3942">Mixture</a></b>
</font>
<A href="Javascript:openProblemRating(3942)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      1 / 208 (0.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 1 (0.00%)
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
If you know what linear programming is, this problem was a rather
elementary application of that.  However, solving a
linear programming problem is quite hard, and the algorithm is pretty
complicated.  Luckily, there is another way that only requires you
know how to solve a system of linear equations.<br/><br/>
A linear equation is an equality of the form
<pre>
    Ax+By+Cz+... = D
</pre>
where A, B, C, and D are constants, and x, y and z are variables.  A
system of linear equations is just a bunch of these.  If you have
enough linear equations, you can often solve them and find the values
of the variables.  For example, consider the following two equations:
<pre>
    5x + 3y = 13              (1)
    7x + 2y = 16              (2)
</pre>
The only values of x and y that satisfy both equalities are 2 and 1,
respectively.  But how do we find these values programatically?  First
off, notice that you can always multiply both sides of an equality by
a constant, and it will not change the equality.  Furthermore, you can
subtract one equation from another equation.
<pre>
 5x + 3y                    = 13            (1)
 7x + 2y                    = 16            (2)
 x + (3/5) y                = 13/5          (3) divide both sides of (1) by 5
 (7x - 7x) + (2y - (21/5)y) = 16 - (91/5)   (4) multiply both sides of (1) by 7 and subtract the result from (2)
 (-11/5)y                   = -(11/5)       (5) simply (4)
 y                          = 1             (6) divide boh sides of (5) by -11/5
 x + (3/5) y - (3/5) y      = 13/5 - 3/5    (7) subtract 3/5 times (6) from (3)
 x                          = 2             (8) simplify (7)
</pre>
You can apply the same basic technique to an arbitrary number of
linear equations.  The idea is that you are iteratively removing a
single variable from every equation except one.  Typically, this is
done by storing the equations in a matrix, where each row in the
matrix represents a single equation.  For example, the above system
would be stored in the matrix as:
<pre>
    5 3 13
    7 2 16
</pre>
Once the equations are in a matrix, you can solve them like this:
<pre>
    for(int i = 0; i&lt;min(ROWS,COLS-1); i++){
        select a row j where M[j][i] != 0
        for(int k = COLS-1; k&gt;=i; k--)M[j][k] = M[j][k] / M[j][i];
        for(int k = 0; k&lt;ROWS; k++){
            if(k!=j){
                for(int m = COLS; m&gt;=i; m--){
                    M[k][m] = M[k][m] - M[j][m] * M[k][i];
                }
            }
        }
    }
    sort the rows in the order they were selected

    the answer is in the last column of M, 
        if using it as the answer gives the correct result
</pre>
Note that if we fail to find a value of j during an iteration of our
loop it means that if the equation can be solved, it may be solved
with any value of the j<sup>th</sup> variable, and so there is more
than one solution.  Also, when there are less variables than rows, we
can not be sure that the above steps will yield a solution, as there
may be no solution.  Hence, you need to double check the answer (the
last column) before assuming it is correct.<br/><br/>

In our problem, the set of linear equations follow easily from the
text.  For each chemical there is an equation, and each variable
represents the amount of a mixture to purchase.  However, this doesn't
quite solve our problem.  Very often, some of the values of the
variables are negative when you solve the system of equations, and we
can't purchase a negative amount of a mixture.  Furthermore, it is
likely that there is more than one way to solve the problem, and we
want to find the cheapest.  To solve both of these problems at once,
you need to think about the form of all the possible solutions.  Every
solution to the system of equations can be found by starting with the
solution that you need to return, and then increasing the amount of
some of the mixtures, while decreasing the amount of some of the other
mixtures.  We can represent this with vectors.  For example, if
there are 3 mixtures and we could increase the amount of the first mixture by 1 while
decreasing the amount of the second mixture by 2, and obtain the same
result, this would be represented as a vector [1 -2 0].  If one
solution to the problem were [2 3 1], then the general solution would
have the form [2 3 1] + x*[1 -2 0], for some x.  In fact, the solution
will always by of the from C + x<sub>1</sub>*v<sub>1</sub> +
x<sub>2</sub>*v<sub>2</sub> + ... where C represents
one solution, and each v<sub>i</sub> is a vector, while x<sub>i</sub>
is an arbitrary variable.<br/><br/>

How does all this help us find the right solution?  Well, associated
with each of the v<sub>i</sub>'s above is a cost, cost<sub>i</sub>.
This cost is positive if a positive value of x<sub>1</sub> will
increase the cost in relation to the solution C, and negative (or 0)
otherwise.  Notice that if cost<sub>i</sub> is positive, we want to
make x<sub>i</sub> as negative as possible.  On the other hand, if
cost<sub>i</sub> is negative, we want to make x<sub>i</sub> as large
as possible.  However, once we have a valid solution where the amounts
of each mixture are non-negative, we can only increase the values of
x<sub>i</sub> so far before increasing them any further would
result in negative amounts of mixtures.  The point at which we must
stop increasing (or decreasing) x<sub>i</sub> is when we are no longer
purchasing any of one of the mixtures, whose quantity we would have to
decrease.  So, in general, the optimal solution will be found when
changing any of the x<sub>i</sub> values would either increase the
cost or make the purchase amount of a mixture negative.  
<br/><br/>
Finally, this brings us to our algorithm.  Rather than worrying about
all the x<sub>i</sub>s and v<sub>i</sub>s, we can just try all
possible subsets of mixtures, and start solving our system of
equations using just those mixtures.  We know that if an x<sub>i</sub>
is important to the solution, then it will completely eliminate at
least one mixture from the solution.  By doing this elimination
ourselves, in an outer loop, we no longer need to bother with
x<sub>i</sub>, as the x<sub>i</sub> is not part of the solution when
the zeroed mixture is not part of the subset.  So, the final algorithm is:

<pre>
    cost = INF
    foreach subset of mixtures
        construct system of linear equations from subset
        solve system
        if there is exactly one solution
            cost = min(cost, cost of that solution)
        end
    end
    return cost
</pre>
As far as the runtime goes, there are at most 2^N subsets, and the
algorithm to solve the systems of equations takes N^3, so the total
runtime is O(2^N*N^3), plenty small for N=10.  One final note about
precision: you don't need to do anything fancy, as the terms in the
matrix start out small enough that using an epsilon of around 1E-11
for all your calculations will make things work out fine.  If you were
really concerned, you could use a fraction class, and the numerator
and denominator would never overflow a 64 bit integer.
</p>

                <p>
                <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
