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

<title>Single Round Match 208 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 208</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Wednesday, August 18, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
With the TopCoder Open only a few weeks off, familiar faces are beginning to resurface in order to
regain their competition form.  snewman, who only started competing again recently,  doesn't seem to
need much practice.  He placed second in a relatively tight race.  kalinov, the eventual winner,
earned 300 points during one of the most vicious challenge phases in recent history.  38 competitors
submitted the Div 1 Hard, but only 12 were correct.  In Division 2, newcomers rem and martinp534 came
out on top, besting all of the Div 2 veterans.  We wish them good luck in Division 1.
</p>
<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1728&amp;rd=5854" name="1728">ImageDithering</a></b>
</font>
<A href="Javascript:openProblemRating(1728)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
     174 / 199 (87.44%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     169 / 174 (97.13%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>ahri</b> for 249.59 points (1 mins 9 secs)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     213.30 (for 169 correct submissions)
   </td>
  </tr>
</table></blockquote>
<p>
In this problem we must count how many times the characters in a given string occur in a collection
of strings.  To accomplish this, we loop over each character of the collection and test for
membership in the given string.  Java code follows: 
<pre>
int count(String dithered, String[] screen) {
   int n = 0;
   for(int i = 0; i &lt; screen.length; i++)
   for(int j = 0; j &lt; screen[i].length(); j++)
      if(dithered.indexOf(screen[i].charAt(j)) != -1)  n++;
   return n;
}
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2939&amp;rd=5854" name="2939">PseudoPrimeTest</a></b>
</font>
<A href="Javascript:openProblemRating(2939)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
     115 / 199 (57.79%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     94 / 115 (81.74%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>rem</b> for 562.90 points (7 mins 23 secs)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     373.56 (for 94 correct submissions)
   </td>
  </tr>
</table></blockquote>
<p>
The concepts outlined in this problem play a key role in the Miller-Rabin algorithm used in
algorithmic number theory and cryptography.  The major difficulty here was figuring out how to
exponentiate in a timely fashion.  More precisely, we need a function 
<pre> int ModularExponentiation(int base, int exponent, int mod) </pre>
that computes base<SUP>exponent</SUP> % mod.  The following code does this inefficiently:
<pre>
int ModularExponentiationSlow(int base, int exponent, int mod) {
   int ret = 1;
   for (int i = 0; i &lt; exponent; i++) 
      ret = (ret * base) % mod;
   return ret;
}
</pre>
Notice how we use % mod after each multiplication to keep the size of the values manageable.  Even
though the code above is correct, the number of iterations of the loop is linear in the value of
exponent.  Taking advantage of repeated squaring, we can get the following optimized version: 
<pre>
int ModularExponentiation(int base, int exponent, int mod) {
   if (exponent == 0) return 1;
   if (exponent % 2 == 0) { //exponent is even
      int temp = ModularExponentiation(base,exponent/2,mod);
   return (temp * temp) % mod;
   } else { //exponent is odd
   return (base * ModularExponentiation(base,exponent-1,mod)) % mod;
   }
}
</pre>
The recursive code given above checks to see if the exponent is even.  If so, we can halve the
exponent, and square the result.  This check dramatically increases the speed of our function,
achieving asymptotic performance logarithmic in the value of the exponent (considering mults,divs,
and mods as constant time operations).  As a short
exercise, you can check to see why the following iterative code correctly computes the same
function: 
<pre>
int ModularExponentiationIter(int base, int exponent, int mod) {
   int ret = 1;
   for ( ; exponent &gt; 0 ; exponent /= 2) {
   if (exponent % 2 == 1) ret = (ret * base) % mod;
   base = (base * base) % mod;
   }
   return ret;
}
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2935&amp;rd=5854" name="2935">QueenInterference</a></b>
</font>
<A href="Javascript:openProblemRating(2935)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
     12 / 199 (6.03%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     9 / 12 (75.00%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>bwpow</b> for 560.74 points (30 mins 47 secs)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     482.42 (for 9 correct submissions)
   </td>
  </tr>
</table></blockquote>

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
     105 / 177 (59.32%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     96 / 105 (91.43%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>venco</b> for 392.20 points (15 mins 49 secs)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     246.77 (for 96 correct submissions)
   </td>
  </tr>
</table></blockquote>
<p>
This problem consisted of transforming the stated algorithm into runnable code.  After reading the
statement, certain things still needed to be figured out: how to compute the number of queens that
could reach each other and select one for movement; how to compute the number of queens that could
reach each spot in a column and select one spot for movement; and how to determine if the process is
done.  The first and last of these are closely tied since the process is done when 0 queens can
reach one another.  To solve these problems, I used an n x n array of integers that stored how many
queens could reach each position.  In addition, I store a separate n-element array of integers,
storing where each queen was located.  I had a helper function that modified these structures, as
needed by the algorithm. 
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2923&amp;rd=5854" name="2923">TallPeople</a></b>
</font>
<A href="Javascript:openProblemRating(2923)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
     176 / 177 (99.44%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     167 / 176 (94.89%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>ZorbaTHut</b> for 246.83 points (3 mins 13 secs)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     216.47 (for 167 correct submissions)
   </td>
  </tr>
</table></blockquote>
<p>
The two most popular solutions involved sorting or simply looping.  Using the sorting method, we
take the given array and its transpose and sort each row.  We build new lists using these row-sorted
arrays, and then sort the new lists to find the solution.  In the looping method we never sort, but
always loop through to find minima or maxima.  
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2940&amp;rd=5854" name="2940">StarAdventure</a></b>
</font>
<A href="Javascript:openProblemRating(2940)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
     38 / 177 (21.47%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     12 / 38 (31.58%)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>snewman</b> for 791.53 points (15 mins 27 secs)
   </td>
  </tr>
  <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     608.21 (for 12 correct submissions)
   </td>
  </tr>
</table></blockquote>
<p>
In nearly all applicable problems, I favor memoization over dynamic programming since I find it
easier to code.  Here I decided to try dynamic programming, but memoization would have worked too. I
broke the problem into 2 cases, in order to make the coding simpler. The first case occurs when
there are only 2 rows, in which case every spot is reachable, and we simply return a sum taken over 
the entire input (this could be done in the 3 row case as well). <br/>
<br/>
The second case is the bulk of the code. The first important thing to realize is that we can assume
all paths begin in the upper left and finish in the lower right corner of the map. This way our
solution will model 3 paths leaving the upper left corner. Next we can assume, without loss of
generality, that the 3 paths will proceed horizontally along different rows, never crossing. In
other words, the 3 paths will only ever meet in the leftmost column and the rightmost column. During 
the majority of the trip, one path will always be on top, another path on the bottom, and a final
path strictly in between. Focusing on such a setup allows us to considerably optimize our algorithm.<br/>
<br/>
The dp algorithm outlined here proceeds rightward across the board, considering one column at a
time.  The leftmost column is setup with values based on how low the lowest path begins. During each 
iteration of the algorithm we proceed rightward one column, assuming each path moves rightward one
step. Upon arriving at a column, the paths can move downward as they please, but will never cross. 
We are done when we reach the rightmost column. <br/>
<br/>
In order to guarantee we do not cross paths during the algorithm, me must handle each column
carefully.  To accomplish this, first handle all possible cases where you can move the highest path
downward without crossing the middle path.  Secondly, once the top path is done, do the same for the
middle path.  Finally move the lowest path.  To see code that implements this algorithm, look at my
solution in the practice room. 
</p>

                <p>
                <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br />
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
