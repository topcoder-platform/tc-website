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

<title>Single Round Match 251 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 251</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Tuesday, July 12, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
In division 1, Eryx led the coding phase, followed by misof, tomek and
krijgertje.  However, the challenge phase turned out to be important as tomek
gained 150 points, and took first place.  misof and krijgertje got 75 and 25,
giving them second and third, respectively.  Eryx, with no challenges, was
forced to settle for fouth.<br/><br/>
In division 2, many C++ coders failed the easy problem, but not bvs, you won
easily.  In second place, bungle's good scores on the medium and hard made up
for his failed easy submission.  Rounding out the top three was zmast3r.
</p>
<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4496&amp;rd=7226" name="4496">Elections</a></b>
</font>
<A href="Javascript:openProblemRating(4496)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      231 / 249 (92.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      133 / 231 (57.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Protean</b> for 243.93 points (4 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      195.49 (for 133 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Usually, it's the C++ coder who get away with things that Java and C# users
can't, in regards to floating point arithmetic.  This problem was an exception
to that, with many C++ coders failing because of the way they compared
doubles.<br/><br/>
In Java, C# and VB, you can expect a division of two numbers to always give you
the same 64-bit double precision floating point value.  Hence, in these
languages, it was safe to simple do something like:
<pre>
    if(ones/(ones+twos) &lt; lowestRatio){
        ...
    }

</pre>
When you do the division, <tt>ones/(ones+twos)</tt>, you are guaranteed
(assuming the numbers stay reasonably small) to get the same thing as the
division <tt>(x*ones)/(x*(ones+twos))</tt>, for some integer x.  This is true in
C++ also; but the result of a floating point operation is a long double with 80
bits, not just a double.  Therefore, when <tt>lowestRatio</tt> is a double, which
has been cast (implicitly) from a long double, and you compare it to the
original long double, they may not be equal.  To get a better understanding,
think about the ratio 2/3.  The long double has more precision, so it will
represent the fraction as something like 0.666667, while the double may only
represent it as 0.66667.  When you do the division, you get the long double, but
then you store it in a regular double, so lowestRatio may take on the value
0.66667.  Now, when you get another element of the input, that also has two
thirds ones, you compare the long double from the division directly to the
double, and get something like:
<pre>
    if(0.666667 &lt; 0.66667){
        ...
    }
</pre>
This evaluates to true, and you end up using the higher index among tied
elements, rather than the lower one.  One solution to this is to simply make
sure that you do all your comparisons in the same precision.  Alternatively, you
can use an epsilon, or else avoid floating point numbers altogether.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4624&amp;rd=7226" name="4624">SMS</a></b>
</font>
<A href="Javascript:openProblemRating(4624)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      188 / 249 (75.50%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      61 / 188 (32.45%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bvs</b> for 447.11 points (10 mins 0 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      302.92 (for 61 correct submissions)
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
      216 / 221 (97.74%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      153 / 216 (70.83%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 247.72 points (2 mins 43 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      187.41 (for 153 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The best solution to this problem is to use a regular expression to replace
groups of vowels surrounded by consonants.  This approach allowed m00tz and
Im2Good to take first and second place on this problem.  Alternatively, you
could write some actual code that looks for vowels which have a consonant before
a space or edge of string in both directions.  Just loop over all the characters
and when you find a vowel, loop both forward and backward to find the next
consonant.  If you find the consonant before a space in both directions, remove
the vowel.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4590&amp;rd=7226" name="4590">OneMoreRectangle</a></b>
</font>
<A href="Javascript:openProblemRating(4590)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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

      63 / 249 (25.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 63 (15.87%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bvs</b> for 832.14 points (13 mins 19 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      538.62 (for 10 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
If you try all possible locations of the rectangle you are supposed to place,
your solution will surely timeout.  However, there is a simple way to figure out
which locations to consider.  If your rectange covers some number group of
previous rectangles, consider whether you might be able to slide it a little bit
in the +x and +y direction.  If none of the covered rectangles have the same
lower x coordinate as your rectangle, you can do so without decreasing the
number of rectangles covered.  The same thing goes for the y coordinate.
Eventually, you will have slid it as far as it will go, and both of its lower x
and y coordinates will be the same as some of the covered rectangles (not
necessarily the same ones for x and y).  Thinking about it this way, its clear
that you need only consider locations for your rectangle where the lower x and y
coordinate are the same as the lower x and y coordinates of some existing
rectangles.  
<pre>
 int ret = 0;
 for(int i = 0; i&lt;r.length; i++){
   for(int j = 0; j&lt;r.length; j++){
     int c1 = 0, c2 = 0;
     for(int k = 0; k&lt;r.length; k++){
       if(r[i][0]&lt;=r[k][0] &amp;&amp; r[j][1]&lt;=r[k][1] &amp;&amp; 
             r[i][0]+qa&gt;=r[k][2] &amp;&amp; r[j][1]+qb&gt;=r[k][3]) c1++;
       if(r[i][0]&lt;=r[k][0] &amp;&amp; r[j][1]&lt;=r[k][1] &amp;&amp; 
             r[i][0]+qb&gt;=r[k][2] &amp;&amp; r[j][1]+qa&gt;=r[k][3]) c2++;
     }
     ret = Math.max(ret,Math.max(c1,c2));
   }
 }
 return ret;


</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4573&amp;rd=7226" name="4573">DominoesGame</a></b>
</font>
<A href="Javascript:openProblemRating(4573)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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

      106 / 221 (47.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      84 / 106 (79.25%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 431.97 points (11 mins 39 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      262.41 (for 84 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
The input constraints are small enough that a simple brute force approach to
this problem works fine.  Many coders chose to play it safe and memoize, caching
the return value of their recursive function for a particular left and right
valid, along with which dominoes were used, but this was unnecessary.  Instead,
just write a single recursive function that takes the some information about the
left and right most dominoes, along with the set of dominoes which has been used
(or is available).  The only information you need about the dominoes on the end
is whether or not they are doubles, and what the outermost value is.  Then, just
see which dominoes, if any, can be added on either end, and recurse.  You can
either keep a running score as you do the recursion, in which case you find the
final score for a particular game at the bottom of the recursive call tree, or
your method could return the best score from the rest of the game, in which case
you find the optimum at the root of the call tree.  I choose the latter approach
because it makes things easier in case you decide you have to memoize after all.

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4625&amp;rd=7226" name="4625">MusicCompilation</a></b>
</font>
<A href="Javascript:openProblemRating(4625)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      63 / 221 (28.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      57 / 63 (90.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cyfra</b> for 946.70 points (6 mins 49 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      755.00 (for 57 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
With 800 songs, there are way to many orderings to consider anywhere near all
of them.  That should be your first clue that perhaps there is some trick or
greedy approach to solving this problem.  The first thing to think about is the
distance metric (which turns out to be a terrible way to achieve its desired
goal).  Notice that, for a particular artist, the total distance contributed by
all of that artist's songs is really just the distance from the first to the last
song.  The ones in the middle don't matter, since moving them left or
right increases one distance, while decreasing another.  This suggests that, for
each artist with more than one song, you should put one of that artist's songs
towards the end, and one of them towards the beginning, and throw the rest into
some middle section which is between all of the beginning and ending songs from
all artists.  Artists with one song don't contribute to the distance themselves,
so there songs should go in the middle section to increase the distance
contributed by other artists.<br/><br/>Now, you just need to figure out exactly what order to put the
beginning, middle and ending songs in.  Notice that if you have a particular
order, and swap two songs in the beginning section, the distance contributed by
one artist will go up, but the distance from the other will go down by the same
amount.  Similarly, the order of the ending section has no affect on the total
distance.  We already know that the middle ordering doesn't matter, so we can
just sort each of the sections alphabetically, and we will get the return we
want.<br/><br/>
</p>

                <p>
                <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
