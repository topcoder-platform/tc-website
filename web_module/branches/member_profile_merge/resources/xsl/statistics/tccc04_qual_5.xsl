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

<title>TCCC04 Qualification 5 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC04 Qualification Problem Set 5</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">February 23-24, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
In this round, another set of 100 coders made it to the final round, with only
12 non-zero scores being cut.  This was mostly due to a very simple level one
problem, and a brute-forceable level two.  Competition was fierce, as the top
5 coders were separated by less than 50 points.  Too bad there wasn't a
challenge phase!
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>FunctionIter</b> 
</font> 
<A href="_Javascript:openProblemRating(2334)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      121 / 139 (87.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      110 / 121 (90.91%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>k_m</b> for 245.18 points (3 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.99 (for 110 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Problems don't get much simpler than this.  Follow the directions and return
the answer.  You are given a function, with its output values for each
possible input value.  You are then asked to iterate it for bound times.
Then, you are to iterate the function until it returns the same value you
started with.  The problem can be solved in one loop:
</p>

<pre>
int t = x;
int n = 0;
while(n &lt;= bound || t != x)
{
  t = f[t];
  n++;
}
return n;
</pre>

<p>
Simply stated, we continue to call the function on t until we have called it
more than bound times and t is equal to x.  By converting to a for-loop, we
can compress the code to a 3-line solution:
</p>

<pre>
int n, t;
for(n = 0, t = x; n &lt;= bound || t != x; n++, t=f[t]);
return n;
</pre>

<font size="+2"> 
<b>MoneyRun</b> 
</font> 
<A href="_Javascript:openProblemRating(2324)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 139 (58.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 82 (54.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Jan_Kuipers</b> for 486.79 points (8 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      325.99 (for 45 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem can be solved by brute force.  A path that a person can take
can be described with the points at which the person moves to the right, and
the points at which the person moves down.  For the worst case of a 7x7 grid,
The person moves exactly 12 times, 6 times to the right and 6 times down.  For
example, a path on a 7x7 grid can be described as "RDDDRRRDRRDD".  The number
of possible paths is therefore defined by the choice function C(12, 6),
because there are that many ways to put 6 R's in a field of 12 characters
(with the rest being D's).  Therefore, the maximum number of paths for an
individual is 924.  with two individuals, 924<sup>2</sup> is the maximum
number of combinations of paths, giving us about a million possibilities to
check.  This is probably best done through a recursive function, where at each
point, all possibilities are tried, and money which is picked up is put back
when the function exits to try another path.
</p>

<p>
Of course, with a higher maximum, such as a 50x50 grid, brute force would not
be possible, as C(98,49)<sup>2</sup> would be way too many possibilities.
However, there is another way to process the paths, using memoization.
First we assume that each person moves at the same speed and starts at the
same time (this is an important point!).  The logic is, if we get to a point
where you are at position (x<sub>1</sub>, y<sub>1</sub>), and your friend is
at position, (x<sub>2</sub>, y<sub>2</sub>), then the maximum amount of money
you can subsequently pick up is not affected by your path to that location.
Therefore, we define a function maxMoney(x<sub>1</sub>, y<sub>1</sub>,
x<sub>2</sub>, y<sub>2</sub>), which is memoized on the four input values.
The answer then is simply maxMoney(0, 0, 0, 0).  The function can be written
as follows:
</p>

<pre>
int cache[MAXC][MAXR][MAXC][MAXR]; // initialized all to -1
vector&lt;string&gt; grid;
int maxMoney(int x1, int y1, int x2, int y2)
{
  if(x1 &gt;= MAXC || y1 &gt;= MAXR || x2 &gt;= MAXC || y2 &gt;= MAXR)
    return 0;
  if(cache[x1][y1][x2][y2] != -1)
    return cache[x1][y1][x2][y2];
  int money = grid[y1][x1] - '0';
  if(x1 != x2 || y1 != y2)
    money += grid[y2][x2] - '0';
  return cache[x1][y1][x2][y2] = money + max(
    max(maxMoney(x1 + 1, y1, x2 + 1, y2), maxMoney(x1, y1 + 1, x2 + 1, y2)),
    max(maxMoney(x1 + 1, y1, x2, y2 + 1), maxMoney(x1, y1 + 1, x2, y2 + 1)));
}
</pre>

<p>
With MAXC and MAXR = 50, this would probably get past topcoder systests, but
if MAXC and MAXR were 200, the above O(n<sup>4</sup>) solution would certainly
time out.  See if you can solve this problem in O(n<sup>3</sup>), and I will
post the answer to the algorithms round table.
</p>



                        <p>
                        <img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
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
