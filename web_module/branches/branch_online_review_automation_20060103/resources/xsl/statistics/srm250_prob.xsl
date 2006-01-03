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

<title>Single Round Match 250 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 250</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Thursday, July 7, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
Coders in both divisions stumbled over floating point difficulties today, as most
div 1 easy and div 2 medium submissions failed.  This left lots of opportunities
for challenges, and misof took advantage with a whopping 250 points in the
challenges phase.  This, combined with good times on the medium and hard
problems allowed him to overcome a failed easy problem and take first place,
beating out a number of coders with three correct submissions.  warmingup took
second place without the help of any challenges, while rem was a distant
third.<br/><br/>In division 2 only da_brain_damage solved all three problems,
winning easily.  bcloud, the only other coder to solve the hard problem took
second, while a newcomer, szywrz got third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4566&amp;rd=7225" name="4566">ColorCode</a></b>
</font>
<A href="Javascript:openProblemRating(4566)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      265 / 285 (92.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      242 / 265 (91.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mhykol</b> for 249.34 points (1 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195.45 (for 242 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Whenever you see a problem like this, your first step should be to place all the
string constants in an array.  This will make it easy to convert from a string
to an integer with a simple for loop.  Once you have done this, just convert
each of the three input strings to integers, and perform the appropriate math.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4570&amp;rd=7225" name="4570">LanguageRecognition</a></b>
</font>
<A href="Javascript:openProblemRating(4570)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      183 / 285 (64.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      25 / 183 (13.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>szywrz</b> for 420.54 points (12 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      303.32 (for 25 correct submissions)
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
      215 / 221 (97.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      76 / 215 (35.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>rem</b> for 241.18 points (5 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      197.27 (for 76 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
You need to be a little bit careful dealing with floating point arithmetic.
Since fractions can often not be represented exactly, small errors may creep
into your calculations.  In many settings, this is unimportant, but it becomes a
big deal when you are trying to figure out if two things are equal using
doubles.  As an example, consider adding three thirds.  Clearly, the sum should
be one, but if each third is represented as 0.333333333, then the sum will be
0.999999999, which is slightly off from 1.  This is the sort of problem that
caused so many solutions to fail this problem.<br/><br/> There are a number of
ways to work around this.  The most reliable is to avoid doubles altogether.
Instead, consider representing fractions using two 64 bit integers -- one for
the numerator and one for the denominator.  Then you can check the equality of
two fractions by cross multiplying: a/b == c/d if and only if a*d == c*b.
Unfortunately, this makes the problem more complex, and makes solutions longer.
In many problems, including this one, it suffices to use a small epsilon when
checking for equality.  If two floating point values are less than that epsilon
apart, then consider them equal.  Of course, this can cause other problems: if
your epsilon is too big, you will consider things equal that you oughtn't, while
if it is too small, the opposite is true.  In this problem, it turns out that
the closest two numbers ever get without being equal is about 7E-9, so an
epsilon less than that and greater than about 1E-14 worked well.  If you work
through a bit of the math required for computing the result as a fraction, you
can come up with the lower bound given above.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4589&amp;rd=7225" name="4589">Acronyms</a></b>
</font>
<A href="Javascript:openProblemRating(4589)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      4 / 285 (1.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 4 (50.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>da_brain_damage</b> for 453.41 points (44 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      452.02 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
New lines count as spaces, so the first thing to do is concatenate all the input
elements into one string, inserting spaces.  Once this is done, you can break
the document into sentences by splitting the string up at double spaces (Java's
String.split(s,"  ") works well for this).  Then, you need to find the sequences
meeting the criteria in each of the sentences.  You can do this by scanning the
words in the sentence one at a time.  If you hit an uppercase word that doesn't
start a sentence, it may be the start of an acronym, so start checking ahead to
see how many words you can go before you hit the end of the sentence, or two
consecutive uncapitalized words.  If you find that there is a valid sequence,
then acronize that sequence.  When you do this, be careful to only include words
that start with an uppercase letter.  Also, you must include the non-letter
characters from the end of the last word.  Once you've acronized a sequence,
simply move on to the next word and repeat.  If you find that a word is not part
of any acronym, simply leave it alone.  Once you are done acronizing, put the
sentences back together in one String, with two spaces between sentences and
return the result.  <br/><br/> The hard part, of course, is in the details of
how you do this.  If you use something like an ArrayList for each sentence, it
makes it easier to remove a sequence of words, and insert a single acronym in
their stead.  You will probably also find it easier if you write a function to
extract all capital letters from a word, and also to extract trailing
punctuation.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4571&amp;rd=7225" name="4571">TVWatching</a></b>
</font>
<A href="Javascript:openProblemRating(4571)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      129 / 221 (58.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      50 / 129 (38.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 418.88 points (13 mins 2 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      290.87 (for 50 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Because the schedule wraps around, the best way to solve this problem is to
independently consider each 24 hour period that starts at the beginning of each
show.  With the starting time of the period, you want to find how many minutes
of TV you can watch starting with the show beginning at that time.  To do this,
you can use dynamic programming.  You can compute the maximum number of minutes
watched ending with a particular show, K, provided K doesn't overlap with the
show that starts at the beginning of the period.  You must watch that show K
after some other show, J, that ends before the show K starts.  If you find the
maximum number of minutes that you could watch TV ending at show J for any J
where J ends before K starts, this will give you the maximum number of minutes
of TV you can watch up until the start of K.  Then, you just add the length of K
to get the maximum number of minutes you could watch up to the end of K.
<br/><br/> To make this work properly, you need to make sure you calculate the
values for all valid J before you can calculate it for K.  This can be done by
sorting the shows by start time. </p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4559&amp;rd=7225" name="4559">ConvexPolygons</a></b>
</font>
<A href="Javascript:openProblemRating(4559)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      25 / 221 (11.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 25 (72.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>AdrianKuegel</b> for 948.32 points (6 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      695.95 (for 18 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Coders who took the time to solve last week's problem correctly benefited today.
An easy way to solve this problem uses four common methods: line intersection,
point in polygon, convex hull, and polygon area.  First, find the intersection points between all
the segments in polygons 1 and 2.  These points will be on the edge of the
polygon defined by the intersection.  Next, find all of the vertices that make
up polygon 1 and also inside polygon 2, as well as those that make up polygon 2
and are also inside polygon 1.  At this point, you have found all of the
vertices of the polygon formed by the intersection.  However, unless you did
something fancy, you don't know what order they form the polygon, so you can't
find the area.  To get them ordered, run your convex hull code, and then just
return the area of the resulting polygon.  This, combined with some prewritten
code, was how AdrianKuegel was able to solve the problem in under 7 minutes.  If you aren't familiar with some of
these methods, check out the <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index">education content</a> section of TopCoder.
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
