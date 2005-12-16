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

<title>Single Round Match 168 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 168</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, October 21, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
The points flew fast and furious... Until coders ran up against some very
difficult problems, which made this set one of the harder ones in recent times.
I had at least two people curse me for writing a difficult set and two people
praise me for it, so I don't know what the real verdict is, but here's what
happened anyways.  For the most part, many of the Division 1 and Division 2
coders noticed a trick which made the Division 1 Easy/Division 2 Medium
trivial.  However, the set was packed with two 1100 point problems, which
successfully stumped all but a handful of coders.
</p>

<p>
Going into the challenge phase, the top 4 coders, separated by only 1
point apiece, were <b>WishingBone</b>, <b>snewman</b>, <b>radeye</b>, and
<b>SnapDragon</b>.  Following with just 11 points less than <b>SnapDragon</b>
was <b>dgarthur</b>.  <b>radeye</b> removed himself from his position by
unsuccessfully challenging a faulty level 2 solution, and <b>SnapDragon</b>
propelled himself to the lead with a successful challenge.  However, the
systests were unkind to most of the level 3 solutions, as only 3 out of 8
passed, leaving <b>SnapDragon</b>, <b>snewman</b>, and <b>WishingBone</b> as
the top 3.  In Division 2, newcomer <b>BEHiker57W</b> dominated, getting and
keeping a raw score of 1622.77.  Four of the top five were newcomers, the only
exception being <b>bchanged</b>, who regained a seat in division 1 for the next
SRM.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>StairClimb</b> 
</font> 
<A href="Javascript:openProblemRating(1937)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      280 / 302 (92.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      260 / 280 (92.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kromm</b> for 247.97 points (2 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220.37 (for 260 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Ever jump 2 stairs at a time?  How about 5?  Well, if you're the person in this
problem, it is possible.  The easiest way to solve this problem is to run a
simulation, taking your strides one at a time until you get to the top.  Some
code which does this looks like this:
</p>

<pre>
int fastest(vector&lt;int&gt; flights, int stridesPerStep)
{
  int ret = 0;
  for(int i = 0; i &lt; flights.size(); i++)
  {
    while(flights[i] &gt; 0)
    {
      flights[i] -= stridesPerStep;
      ret++;
    }
    ret += 2; // 2 strides to turn at the landing
  }
  return ret - 2; // subtract 2 because no need to turn at the upper landing
}
</pre>

<font size="+2"> 
<b>NumberGuesser</b> 
</font> 
<A href="Javascript:openProblemRating(1869)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      116 / 302 (38.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      88 / 116 (75.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>BjarkeDahlEbert</b> for 484.37 points (5 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      304.50 (for 88 correct submissions) 
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
      165 / 202 (81.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      144 / 165 (87.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>connect4</b> for 248.74 points (2 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      191.58 (for 144 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
When I first encountered this trick, I immediately thought of a non-trivial
solution to this problem.  I later was shown a somewhat trivial solution to
this problem, but the math to prove it is difficult, so I'll go over the
non-trivial solution first.  The easiest way to think about this problem is to
do it backwards.  There are two numbers x and y which have the same group of
non-zero digits.  When you subtract them you get z.  If you remove a digit from
z, you get the input.  So if we think about getting back to z from the input,
you insert a digit.  If we try all digits 1 - 9 at all 4 locations, there are
only 4 * 9 or 36 different possible values for z.  Now, we can modify the
formula from:
</p>
<pre>
y - x = z
</pre>
<p>
to
</p>
<pre>
y = x + z
</pre>

<p>
If we loop through all the possibilities for z, and all the possibilities for
x, we can calculate the answer for y.  When we have x and y, we just check to
see if they have the same group of digits.  Here is some C++ code which does
the trick:
</p>

<pre>
bool digitsMatch(int x, int y)
{
  vector&lt;int&gt; ndigits(10);
  while(x)
  {
    if(x % 10)
      ndigits[x % 10]++;
    x /= 10;
  }
  while(y)
  {
    if(y % 10)
      ndigits[y % 10]--;
    y /= 10;
  }
  for(int i = 0; i &lt; ndigits.size(); i++)
    if(ndigits[i] != 0)
      return false;
  return true;
}
</pre>

<p>
Now, the trivial solution.  If we assume there is a function DS, which calculates the digit sum of an integer, the answer is simply 9 - DS(leftOver) % 9.
However, the math to prove this is certainly non-trivial.  Despite this fact,
many coders either already knew this solution, guessed it correctly, or proved
it out during the contest (<b>BEHiker57W</b> is one of the provers), which
lead to a lot of very quick solutions.  In any case, here is a proof, compiled
from notes from <b>BEHiker57W</b>, <b>AdminBrett</b>, and <b>lars2520</b>
(Forgive me for the informal proof, but math proofs are not my thing):
</p>

<p>
First, we prove that any number subtracted from another number with the same
group of digits is divisible by 9.  To do this we break up a number x into
its digits and powers of 10.  For example, abcd becomes a*1000 + b*100 + c*10
+ d*1.  If we now swap two digits, like a and b, we can achieve this by
subtracting the current terms for a and b, and adding back new terms with the
correct multipliers.  So our number would now be abcd - 1000a + 100a - 100b +
1000b.  Now, we note that any time you subtract 10^n from 10^m, you get a
multiple of 9.  For example 1000 - 1 = 999, 1000 - 10 == 990, etc.  So
basically, the difference between the two numbers is a multiple of 9.  If you
move around all the digits, you get some number d as the difference between
the two numbers, where d is a multiple of 9.
</p>

<p>
Most people remember from early math that any number that is a multiple of 9
has digits that add up to be a multiple of 9.  For those who need proof, here
it is:
</p>

<p>
We must prove that DS(n + 1) % 9 is the same as (DS(n) + 1) % 9.  In order to
do this, we prove that the digit sum goes up by 1 (mod 9) every time you add 1
to a number.  In the cases where the least significant digit of n is not 9,
this is trivially true, since the digit sum always goes up by 1.  However, when
the least significant digit in n IS 9, then the least significant digit goes
down by 9, and the next digit goes up by 1.  If we are looking for the mod 9
result, however, this is a net change of 1, since the -9 does not affect the DS
(mod 9).  This is true no matter how many digits are wrapped from 9 to 0.  So
for any number n, we now can prove DS(n) % 9 == n % 9.  We can prove this by
reducing DS(n) to DS(n - 1) + 1, DS(n - 2) + 2, etc. until we get DS(n - n) +
n.  Since DS(n - n) is 0, the only thing that is left is the n on the outside.
</p>

<p>
Now, to apply that to a multiple of 9, DS(9*x) % 9 == (9*x) % 9 = 0.
Therefore, the digits in a multiple of 9 must add up to a multiple of 9.
</p>

<p>
To summarize, for the trivial solution, all you need to realize is that the
difference between the two numbers is a multiple of 9, and therefore its digits
add up to a multiple of 9.  To fix the 3 remaining digits into a 4 digit
multiple of 9, you just add a digit which makes the digit sum a multiple of 9.
Hence the solution 9 - DS(leftOver) % 9.  The reason you can't remove a 0 from
the number is because then it is unclear whether a 9 or a 0 was removed, since
the digit sum of the remaining number is still 0 % 9 in either case.  That is
why 0 was not allowed to be removed when running the algorithm.
</p> 

<font size="+2"> 
<b>WindowWasher</b> 
</font> 
<A href="Javascript:openProblemRating(1919)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      46 / 302 (15.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 46 (34.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>BEHiker57W</b> for 894.79 points (14 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      657.07 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
WindowWasher was solvable with two methods: greedy or dynamic programming.
I'll outline the greedy solution, and leave the DP solution as an exercise to
the reader.  For the simple greedy solution, we can increment the time by 1
until all the windows could have been washed by the team (note that the initial
placement of the workers can be determined after the best time is determined so
that everyone in the team washes the appropriate number of columns).  For
example, the following loop would work:
</p>

<pre>
for(int i = 0; ; i++)
{
  int columnsWashed = 0;
  for(int j = 0; j &lt; washTimes.length; j++)
    columnsWashed += i / (washTimes[j] * height);
  if (columnsWashed &gt;= width)
    return i;
}
</pre>

<p>
However, the maximum return value is 1 billion, which is too many iterations to
run such a solution.  To fix this, we note that there are many times during the
loop where the <i>columnsWashed</i> from one value of <i>i</i> is the same as
the value from the previous <i>i</i>.  Therefore, we realize that we only need
to worry about times where a column is just barely finished.  For this, we keep
a list of when each worker is going to finish his next column.  Then, we only
check times where the next column gets finished.  In this manner, we reduce the
outer loop to at most <i>width</i> iterations.  The code now becomes: 
</p>

<pre>
int[] next = new int[washTimes.length];
int i = 0;
while(true)
{
  int columnsWashed = 0;
  int nexti = Integer.MAX_VALUE;
  for(int j = 0; j &lt; washTimes.length; j++)
  {
    columnsWashed += i / (washTimes[j] * height);
    if(next[j] == i)
      next[j] += washTimes[j] * height;
    nexti = Math.min(nexti, next[j]);
  }
  if (columnsWashed &gt;= width)
    return i;
  i = nexti;
}
</pre> 

<font size="+2"> 
<b>DirectoryTree</b> 
</font> 
<A href="Javascript:openProblemRating(1874)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      107 / 202 (52.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      85 / 107 (79.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>snewman</b> for 436.88 points (11 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      269.98 (for 85 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This was a bear for most people, but still a very straightforward problem to
solve.  There were essentially 2 ways to solve it.  The first is an iterative
solution which outputs the lines, and then goes back to draw the vertical bar
characters afterwards.  In this solution, you first sort the strings
alphabetically.  Luckily, slash comes before the alphabet in ASCII, so the sort
basically sorts the files in the order you want to output them.  Then for each
element in the array, you compare the directory of the current element to the
directory of the previous element.  You find out how many parent directories
they have in common, and add that many double spaces to a string.  Then you add
the "+-", and the directory/file name they do not have in common.  Then, you
add the rest of the string by splitting it into non-slash names and adding two
more spaces for each successive name.  Finally, after all is done, we work our
way backwards up the result to add the vertical bars.  To do this, for each
space character in the current string, if the character below it is a vertical
bar or a '+', then change the character to a vertical bar.  For a somewhat more
complex version of this, see the writer's code in the practice room.
</p>

<p>
For the more straightforward and less error-prone solution, we actually
replicate the directory structure in a tree.  So each tree node has two
members: a name, and a list of nodes which are its children.  To add each file
to the tree is pretty trivial, simply split the string into it's non-slash
names, and traverse the tree in the order of the names, adding directories when
necessary.  A file is represented as a directory with no children.  Finally, we
can either sort the names after adding them, or sort the entire string list
from the beginning as in the iterative solution.  Then, outputting can be done
in order, with no need to fix up the strings afterwards with vertical bars.
Since we know which files/directories are the last in a directory, we know when
to stop printing the vertical bars for each column.  See <b>SnapDragon</b>'s
contest solution for a good example of this type.
</p> 

<font size="+2"> 
<b>ParkingLot</b> 
</font> 
<A href="Javascript:openProblemRating(1678)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      8 / 202 (3.96%) 
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
      <b>WishingBone</b> for 493.56 points (45 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      470.77 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Only 3 people got this problem, and it is not hard to see why.  It almost seems
impossible for each car to know where every other car is going to go, and to
only go to the spot where it knows it will take.  However, there are a few
subtle nuances which make the problem solvable.  First, yours is the only car
which picks a spot with the walk ahead in mind.  Second, if two cars get to a
spot simultaneously, there is a well defined ordering which would not exist in
the real world.  Many people fretted over how the other cars know where your
car goes since it doesn't follow the standard pattern, but we shall see that
this doesn't really matter.  We solve the problem in three steps:
</p>

<p>
Step 1, figure out which spots are achievable from each car, saving how long it
took to get there, and ignoring the fact that the spots could already be taken.
In this step, we save a list of parking spots and distances for each car, and
sort them in order first by distance, then by Y position, then by X position.
This step takes at most 2500 iterations per car, since you can use a simple BFS
to find the spots.  Sorting the list can take at most n lg(n), where n is the
number of spots achievable.  We also do this with your car, since at this
point, there is no difference between your car and the others.
</p>

<p>
Step 2, we figure out who gets what spot.  If we iterate over the cars in
increasing assigned numbers, then we do not have to worry about ties because
they will work themselves out naturally.  First, we find the minimum time of
all the cars which have not yet parked at which any car will reach a parking
spot.  Now, for all cars whose next spot is achieved at the minimum time who
haven't parked, see if they get that spot.  We do this by iterating over the
cars in the prioritized order, and if a spot isn't taken, take it.  If the car
got to a spot at the minimum time, then remove that spot from the front of its
list.  The only exception is your car.  For your car, you may eventually take
another spot because it is better.  So we just save that location and the
distance to get to it into another list and do not mark the spot as taken.  If
that spot turns out to be the best, then you will take that spot, and it
doesn't matter where another car who wanted that spot will go.  If it is not
the best spot, that car will take the spot (because we didn't mark it as
taken), and we continue the search.
</p>

<p>
Step 3, we have marked all spots that your car can take with the minimum time
it takes to get there.  To get the fastest distance to the entrance, we do a
BFS, but this time, we do it backwards, starting at the entrance.  When a BFS
frontier node hits a parking spot that you could get to, you add the BFS
distance to the saved distance and minimize that value.  Note that in this BFS,
we can travel through all squares except for the obstacle squares.
</p>

<p>
At the end, you either can or cannot get to the entrance, and if you can, you
have the minimum time it took to get there.
</p> 



                        <p>
                        <img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=273217"><strong>schveiguy</strong></a><br />
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

