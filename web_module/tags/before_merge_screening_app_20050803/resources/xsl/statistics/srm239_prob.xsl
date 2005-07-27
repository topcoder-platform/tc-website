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

<title>Single Round Match 239 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 239</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Monday, April 18, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
<b>tomek</b> strikes again! Out of the three coders who managed to solve all the problems, <b>tomek</b> took
a comfortable lead of almost 300 points. Ten minutes before the end of the coding phase, he
was the only one to have a submission for the 1000 point problem. <b>Ruberik</b> lighted the 'matches' with
blazing speed and claimed the second spot. <b>Zis</b> came in third, more than 100 points behind <b>Ruberik</b>.
The remaining top ten spots were also taken by reds. The challenge round was quite a trill, especially
for the 'MatchCounting' problem, where 151 challenging attempts had been made. As usually, the system
tests claimed even more solutions. But if you happen to be in the same room with <b>natori</b>, system testing
can become pretty boring. With the help of 325 points he gained from challenges, <b>natori</b> climbed his way
up to the fourth place. <br /><br />

In Division 2, the top performer was <b>wstfgl</b>, followed by <b>Titoz</b> and <b>ILoveYou</b>.  The easy problem was a little
work this time, but in the end most coders managed to solve it. As for the hard, the scores of those who
managed to solve it were quite high, few coders breaking the 900 points barrier. 

</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3556&amp;rd=6538" name="3556">Barbecue</a></b>
</font>
<A href="Javascript:openProblemRating(3556)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      192 / 245 (78.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      138 / 192 (71.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mouryaravi</b> for 298.11 points (2 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200.99 (for 138 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>


This problem can be reduced to a standard "find the <i>max</i> problem", but first you have to build
the array. One idea is to give each person a score and then, exclude the person with the highest score.
One vote received counts towards exclusion more than any number of votes given, so we can do something like: <br /><br />
<pre>
     for (i = 0; i &lt; n; i++) score[i] = 0; 
     for (i = 0; i &lt; voter.length ; i++)  
     {				 
         score[voter[i]]++; score[excluded[i]] += 100;
     }
</pre>

     Then, we just return the index of the person with the highest score. 


<pre>
     maxscore = score[0]; out = 0; 
     for (i = 0; i &lt; n; i++)  
     {
         if(score[i] &gt; maxscore)    
         { 
             maxscore = score[i]; out = i; 
         } 
     }
     return out; 
</pre>



</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3543&amp;rd=6538" name="3543">ATaleOfThreeCities</a></b>
</font>
<A href="Javascript:openProblemRating(3543)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      144 / 245 (58.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      112 / 144 (77.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>zylum</b> for 463.42 points (8 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      350.78 (for 112 correct submissions)
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
      210 / 210 (100.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      188 / 210 (89.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>radeye</b> for 247.12 points (3 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      217.27 (for 188 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>


The first thing to do is to determine the optimal distance of connecting a city with another. In order
to do this, you compute the distance between every subway station in one city and every subway station
in the other. Then, you keep the one that is minimal. Here is the function that computes the 'distance'
between two given cities, written in Java: <br /><br />

<pre>
double go(int[] a, int[] b, int[] c, int[] d) 
{ 
    double ret = 1e9; 
    for (int i= 0; i&lt;a.length; i++) 
    {
        for (int j = 0; j&lt;c.length; j++)
        { 
	    double d1 = a[i] - c[j]; 
	    double d2 = b[i] - d[j]; 
	    ret = Math.min(re , Math.sqrt(d1 * d1 + d2 * d2)); 
	}
   } 
   return ret; 
}
</pre>
As there are three cities, you must find the optimal connecting distance between each of them: <br /><br />

<pre>
double d1 = go(ax,ay,bx,by);
double d2 = go(ax,ay,cx,cy); 
double d3 = go(bx,by,cx,cy); 
</pre>

Then, you compare the three distances already found to determine the two whose sum is minimal.<br /><br />

<pre>return Math.min(Math.min(d1+d2,d1+d3),d2+d3);</pre>

Some of the solutions that failed on this problem didn't find this minimum correctly when two of the distances were equal. 

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4481&amp;rd=6538" name="4481">DivisibilityCriteria</a></b>
</font>
<A href="Javascript:openProblemRating(4481)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      44 / 245 (17.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 44 (65.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>prayanks</b> for 959.73 points (5 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      733.71 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>

In this problem you are told a few things you probably know about the usual divisibility properties
of a number when divided by 2, 3 and 7. Then you are asked to find a general template for quickly
assessing whether or not a number is divisible with a given prime, P. This problem may look daunting
at a first glance, but as it can be seen from the first example, the construction of such a 'criterion'
 is not that difficult and you can work your way out from there. But there is an even simpler and more
elegant solution: <br /><br />

<pre>
    int ret[] = new int[N], mult = 1; 
    for (int i = N-1; i &#8805; 0; i--, mult = (mult * 10) % P) 
    {
        ret[i] = mult; 
    }
    return ret; 
</pre>


</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3555&amp;rd=6538" name="3555">MatchCounting</a></b>
</font>
<A href="Javascript:openProblemRating(3555)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      151 / 210 (71.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      80 / 151 (52.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Ruberik</b> for 473.63 points (6 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      279.96 (for 80 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>

This problem proved to be a little unusual, since it required a different set of skills. But as with all
the problems, it is helpful to have an overall look first. <br />
A few observations can be made:<br />
- not all the digits are being used! Take for example the numbers 28 and 58. Both 2 and 5 can
be represented using 5 sticks, so if you are able to represent the number 2, you are also able to
represent the number 5. After a short analysis, you find out that only the numbers 1, 2, 6, 8 and 0 are going to be used.<br />
- numbers 1, 2, 6 and 8 always appear in increasing order from left to right. Take for example the numbers
12 and 21. If 21 cannot be represented, neither can 12. <br />
- the number to return may have up to 19 digits. A digit can use at most 7 matches and you can have 128 matches
at your disposal.<br />
Keeping these in mind, an optimized recursive solution should work. <br /><br />

It is also possible to solve this problem using dynamic programming. You can try all the values for the last
digit (call it x) and then, you have n - matches[x] left for the rest of the number. You now try to minimize
the number that uses all the n- matches[x] matches. <br /><br />


Another interesting approach is to consider a number X and determine the number of matches needed to be able
to represent all the numbers between 1 and X. If there are n or less, you can increase X, otherwise you should
decrease it. This leads us to a binary search algorithm,  see <a href="/stat?c=problem_solution&amp;rm=202645&amp;rd=6538&amp;pm=3555&amp;cr=303185">Cosmin.ro's</a> implementation. <br /><br />


The brute force method times out very quickly, but it may prove very useful as once you have a few more results, 
you can easily look for a pattern and the problem can be reduced to something like this: <br /><br />
<pre>
    long nr=0; 

    digits = n / 7 + 1; 
    prefix = n % 7; 
    if (prefix == 0) nr = 10; 
    if (prefix == 1) nr = 1; 
    if (prefix == 2) nr = 200; 
    if (prefix == 3) nr = 20; 
    if (prefix == 4) nr = 2; 
    if (prefix == 5) nr = 6; 
    if (prefix == 6) nr = 8; 
    while(nr &lt; 1000000000000000000L) nr = nr * 10 + 8; 
    size = 19; 
    while (size &gt; digits) { nr /= 10; size--; } 
    
    return nr; <br />
</pre>

Don't forget that intuition is a powerful weapon... There is no guarantee that a very thoughtful dynamic
programming approach is less error prone than a good guess!

</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4439&amp;rd=6538" name="4439">HiddenTriangles</a></b>
</font>
<A href="Javascript:openProblemRating(4439)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      12 / 210 (5.71%)
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
      <b>tomek</b> for 706.19 points (20 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      548.50 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>

A good observation to make is that with any three given segments, you can form at most one triangle.
From this, the first idea that comes to mind is to iterate through all the possible sets of three segments
and count whether or not it is possible to make a triangle. To do this, you take all the three combinations
of two out of three segments and check their point of intersection. If you get an intersection in all the
cases and the intersection points do not coincide, a triangle has been found! <br />
But ... it may happen that you need more than three segments to find a certain triangle. This is the
trickiest part of the problem and one way to solve this is to 'extend' each segment to its maximum
possible length. This means to merge the segments that have the same orientation and share at least one
point (two segments may have one segment in common or one may even be contained in the other). This
merging process has to be applied until no more merges can be made, otherwise you may miss the cases when
there are a lot of segments lying on the same 'line'. Also, make sure to delete the segments that have been
 used for merging, or you may risk counting the same triangle more than once. <br /><br />

Because of the relatively small constraints, it is also possible to consider a 400*400 grid and take every
possible segment of length 1 to check whether it can be drawn or not from the initial given segments. This
approach is feasible as you know from the problem statement that a segment can either be parallel or form
a 45 degree angle with one of the axes. There are a lot of ways to go from here, see <a href="/stat?c=problem_solution&amp;rm=202641&amp;rd=6538&amp;pm=4439&amp;cr=144400"> tomek's</a> implementation
for a clean solution. <br />
</p>

                <p>
                <img src="/i/m/supernova_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=7371063"><strong>supernova</strong></a><br />
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
