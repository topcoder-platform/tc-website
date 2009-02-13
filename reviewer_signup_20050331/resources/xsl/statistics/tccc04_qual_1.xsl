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

<title>TCCC04 Qualification 1 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC04 Qualification Problem Set 1</font></td>
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
Last year's Collegiate Challenge winner, dgarthur was assigned to this room, but only got 5<sup>th</sup>, 35 points behind winner Eryx.  antimatter and WishingBone took 2<sup>nd</sup> and 3<sup>rd</sup>, respectively, and were separated by less than 2 points.  Fleur, in 8<sup>th</sup> place, was the most notable new comer, less than 50 points behind the top spot.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>DiamondLogo</b> 
</font> 
<A href="Javascript:openProblemRating(1910)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      110 / 132 (83.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      93 / 110 (84.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>WishingBone</b> for 287.38 points (4 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.93 (for 93 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
While this problem was a little bit more involved than some of the other Qualification Round easy problems, passing the example cases all but guaranteed a correct solution (I looked at a few failed solutions, and didn't find one that passed the examples).  I think that a big part of many of the failures was that it was a bit tricky to compare your solution to the reference because there were so many repeated characters.  If you aren't using an automatic validator (check out the plugins link from the home page), you should really copy and paste both answers to make sure everything lines up.  Anyhow, to the solution...
<br/><br/>
First off, the return is square with size*2-1 rows and columns.  So, if we loop over the rows, our outer loop should go from 0 to size*2-2.  In each row, we first add some background characters, then an 'X', some spaces, another 'X' and some more background characters.  The meat of the problem is figuring out how many spaces and how many backgroud characters to add.  In my solution, I dispensed with the bottom half of the image by using the symmetry to copy the top half.  This makes it a little bit easier to figure out how many spaces and background characters to use, since you would otherwise have to deal with two different cases.  So, for row <i>i</i>, with <i>i</i> &lt;= size, there are max(0,<i>i</i>*2-1) spaces.  There are also size-i-1 background characters on each side of the diamond.  Both of these equations can be easily derived simply by looking at the examples, and if you can come up with equations that work for the examples, you can be pretty confident (for this problem) that your equations are generally correct.
<pre>
    public String[] logo(int size, char background)
    {
        String[] ret = new String[size*2-1];
        for (int i = 0; i &lt; size; i++) {
            char[] row = new char[size*2-1];
            Arrays.fill(row, ' ');
            row[size-1-i] = 'X';
            row[size-1+i] = 'X';
            for (int j = 0; j &lt; size-1-i; j++) {
                row[j] = background;
                row[size*2-2-j] = background;
            }
            ret[i] = new String(row);
            ret[size*2-2-i] = new String(row);
        }
        return ret;
    }
</pre>
</p> 

<font size="+2"> 
<b>Surveyor</b> 
</font> 
<A href="Javascript:openProblemRating(1359)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      57 / 132 (43.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      46 / 57 (80.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 537.01 points (3 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      433.27 (for 46 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem can be solved by using the polygon area algorithm that has been described in previous writeups.  You can read about this on <a href="http://mathworld.wolfram.com/PolygonArea.html">MathWorld</a>.  But here you didn't need to know this general formula to find the area, as all the angles were 90 or 270 degrees.  Since there are at most 50 edges, there are at most 50 distinct x coordinates.  Similarly, there at most 50 distinct y coordinates.  So, we can use coordinate compression to solve this problem.  We look at each interval, between two adjacent x coordinates, then we go through and look at all of the horizontal edges that span the current interval.  If we sort these horizontal lines by y coordinate, we get a series y<sub>1</sub>,y<sub>2</sub>,...,y<sub>n</sub>, with y<sub>1</sub> &lt;= y<sub>2</sub> &lt;= ... &lt;= y<sub>n</sub>.  Now, since y<sub>1</sub> is the bottom edge, we know that the region between y<sub>1</sub> and y<sub>2</sub> is in the polygon, while the region between y<sub>2</sub> and y<sub>3</sub> is not and so on.  Hence, we can find all the regions within the interval that are in the polygon and add them up.
<pre>
    public int area(String direction, int[] length){
    int[] x = new int[length.length];
    int[] y = new int[length.length];
    String dirs = "SENW";
    int[] dx = {0,1,0,-1};
    int[] dy = {1,0,-1,0};
    int xx = 0, yy = 0;
    for(int i = 0; i&lt;length.length; i++){
        x[i] = xx;
        y[i] = yy;
        xx += length[i]*dx[dirs.indexOf(direction.charAt(i))];
        yy += length[i]*dy[dirs.indexOf(direction.charAt(i))];
    }
    int[] xs = (int[])x.clone();
    Arrays.sort(xs);
    int[] ys = new int[x.length];
    int ptr;
    int ret = 0;
    for(int i = 0; i+1&lt;xs.length; i++){
        if(xs[i]==xs[i+1])continue;
        ptr = 0;
        for(int j = 0; j&lt;y.length; j++){
            if(x[j] &lt;= xs[i] &amp;&amp; x[(j+1)%x.length] &gt;= xs[i+1] || 
               x[(j+1)%x.length] &lt;= xs[i] &amp;&amp; x[j] &gt;= xs[i+1]){
                ys[ptr++] = y[j];
            }
        }
        Arrays.sort(ys,0,ptr);
        for(int j = 0; j&lt;ptr; j+=2){
            ret += (xs[i+1]-xs[i])*(ys[j+1]-ys[j]);
        }
    }
    return ret;
}
</pre>
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
