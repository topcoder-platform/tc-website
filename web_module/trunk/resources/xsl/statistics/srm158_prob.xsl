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

<title>Single Round Match 158 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 158</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, August 6, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
SRM 158 had a well balanced set, with almost no confusion issues.  Division 1
saw <strong>ZorbaTHut</strong> easily taking first place, with the highest score on the level 3,
and a good 50 points ahead of <strong>Yarin</strong>, without the help of challenges.  Newbie
coder <strong>gevak</strong> edged out <strong>DimaGer</strong> by 20 points to win division 2, and got a nice
1815 debut rating.  <strong>gevak</strong> also got the high score for his level 3 solution.  Also of note, <strong>raquib</strong> pulled off 6 successful challenges in room 9, and <strong>radeye</strong> got 4 successful challenges in room 4, all with the same test case.
</p>

<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>TireRotation</b> 
</font><A href="Javascript:openProblemRating(1791)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      191 / 210 (90.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187 / 191 (97.91%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Sleeve</b> for 245.55 points (3 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192.56 (for 187 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Since there are only 4 valid tire configurations, this problem can be solved
with one loop.  First, we write a function to rotate a tire set for 1 phase,
and then we call the function on the initial value 4 times.  If before the
function, initial == current, then we return the current index of the loop.
Otherwise, the initial tires will never equal the current tires, so return -1.
Here is C++ code that will do this (assume the rotate function moves initial to
the next phase):
</p>

<pre>
int getCycle(string initial, string current)
{
  for(int i = 1; i &lt;= 4; i++)
  {
    if(initial == current)
      return i;
    initial = rotate(initial);
  }
  return -1;
}
</pre>

<font size="+2"> 
<b>BaseMystery</b> 
</font><A href="Javascript:openProblemRating(1789)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      124 / 210 (59.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 124 (66.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hilfiger</b> for 480.66 points (5 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      317.11 (for 82 correct submissions) 
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
      144 / 146 (98.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      121 / 144 (84.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>b0b0b0b</b> for 247.04 points (3 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.13 (for 121 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Unfortunately, not all of the languages have a function which can parse a
number with an arbitrary base.  In Java, you can use Integer.parseInt(), and in
C++, you can use strtol().  However, I could not find an equivalent function
for either C# or VB .net.  .net does provide a function to parse a string in
bases 2, 8, 10, or 16, but this will not help for any other base.  Even so,
converting bases is pretty straightforward.  All you need to do is add the
value associated with each character, and multiply by the base for every
character parsed.  The following C++ code does this:
</p>

<pre>
int parseInt(string s, int base)
{
  int result = 0;
  for(int i = 0; i &lt; s.length(); i++)
  {
    int v;
    if(s[i] &gt;= '0' &#38;&#38; s[i] &lt;= '9')
      v = s[i] - '0';
    else
      v = s[i] - 'A' + 10;
    if(v &gt;= base)
      return -1000;
    result *= base;
    result += v;
  }
  return result;
}
</pre>

<p>
With the above function, you must check for -1000 to see if the base did not
parse correctly.  Alternatively, you can throw and catch an exception instead
of returning -1000.  So the easiest solution to the problem is to parse all the
numbers for each of the bases from 2 to 20, and see which bases can parse the
numbers properly, and for which the equation holds true. 
</p>

<p>
As it turns out, if the addition of any digit happens to carry to the next
digit, then the equation can only be valid for at most one base. If not, and
the equation is valid mathematically, it is valid for all the bases which can
parse the highest digit in the equation. For example, if the highest digit in
such an equation is a 5, then the equation is valid for bases 6 and above. 
</p>

<p>
Many people failed on the case "0+0=0" because they added a 1 to the resulting
bases.
</p>

<font size="+2"> 
<b>Gems</b> 
</font><A href="Javascript:openProblemRating(1767)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      33 / 210 (15.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 33 (63.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gevak</b> for 779.67 points (16 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      554.62 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Most people will recognize the game that this question is based on (made
popular by <a href="http://www.popcap.com">PopCap</a>).  The problem isn't
concerned with the normal gameplay, but simply how many valid moves are left.
To check if a move is valid, the best way is to swap two gems and see if the
two gems just swapped are part of any horizontal or vertical line of 3 or more
gems of the same type.  To do this, see how many gems above and below the gem
in question are the same, and see how many gems to the right and left are the
same.  If either of these adds up to 2, then you have a valid move.
</p>

<p>
To avoid duplicating moves, you only need to swap gems with others to the right
of it or below it.  However, you must remember to do all the gems, even the
ones just above or to the left of the lower right corner.
</p> 

<font size="+2"> 
<b>StampPads</b> 
</font><A href="Javascript:openProblemRating(1676)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      96 / 146 (65.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      56 / 96 (58.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>radeye</b> for 472.57 points (6 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      351.20 (for 56 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
At first glance, one might be inclined to do some sort of optimization, or use
a greedy solution.  But with only 20 stamp pads, the brute force solution will
only take 2^20 or 1 million iterations, executing in well under 8 seconds.  One
method is to loop from 1 to 2^pads.length and use each bit in the mask to
determine whether a pad is included or not.   The second is to use a recursive
function, deciding on whether to include a pad or not, and recursivly calling
for the next pad.
</p>

<p>
The second part of the solution is to determine which colors are satisfied by
the stamps.  Since we only care about at most 25 colors, we can use a bitmask
to represent the colors from wishlist that have been purchased.  If, after
setting all the bits for the colors purchased, the bitmask includes all the
bits in the wishlist, we minimize a pad count.  If no combinations set all the
bits, then we must return -1.
</p> 

<font size="+2"> 
<b>Jumper</b> 
</font><A href="Javascript:openProblemRating(1157)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      13 / 146 (8.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 13 (61.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ZorbaTHut</b> for 650.43 points (23 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      534.83 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Based on a well known amphibious game, this problem involves using a breadth
first search to find the best path on a moving grid.  First we note that there
are two portions to the state of the board, the character position, and the
position of all the pads.  Since there are only 4 possible descriptions of a
row of pads, and each pattern is 5 characters long, the position of the pads
can be saved by storing the offset into the pattern that the current rows start
with.  This gives us a trivial maximum of 20x21x5x5x5x5, or 262,500 states.
This is well within the boundary for timeout.  However, we can prove that there
are actually only 5 different board states, which reduces the number of states
to 20x21x5, or 2100 states (we'll prove this later).
</p>

<p>
So for a BFS, we need a queue, and a way to represent the state.  Simply saving
the time used and the x and y position in a structure, or creating a hash code
based on the values is sufficient.  The next tricky part is to determine how
the character moves.  After every move, we must check to see that the character
landed on a hoverpad, and after the move, check to see that the character did
not get carried off the side of the board.  The position of the hoverpads can
be determined by some modulo math and the final position can be determined by
simply adding the speed to the x coordinate.  If the character lands safely, we
add this new state to the queue and continue only if the state has not yet been
encountered.  Note that we also must check the case where the character does
not jump.
</p>

<p>
To prove there are only 5 board states, we first derive an equation which gives
us the offset into the pattern that any given row starts with.  This offset
is<br />
<tt>(((-t * speed) % 5) + 5) % 5</tt><br />
Now, notice that if t is divisible by 5, then <tt>(-t * speed)</tt> will always
be divisible by 5, and therefore <tt>((-t * speed) % 5)</tt> will always be 0,
making the whole equation 0.  Therefore, all rows will be offset to 0 every 5
seconds, regardless of speed.  Since every pattern starts out at offset 0, this
means the patterns all loop every 5 seconds, and we can only have at most 5
board states.
</p>

<p>
Other solutions used a maximum time to limit the running of the solution.
Since there were only 20x21 board locations, limiting the time to 10000 seconds
works and is the solution ZorbaTHut used.
</p> 


                        <p><img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=273217"><strong>schveiguy</strong></a><br/>
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

