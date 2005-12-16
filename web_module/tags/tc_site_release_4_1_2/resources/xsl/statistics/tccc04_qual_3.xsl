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

<title>TCCC04 Qualification 3 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC04 Qualification Problem Set 3</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">February 23-24, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
TopCoder's highest rated member, tomek, competed in this problem set, but ended up a little bit slower than Wernie, who took 1<sup>st</sup> place by less than 10 points.  bmerry was a close 3<sup>rd</sup>, less than 50 points out of 1<sup>st</sup> place, and the best new comer was freestyler in 14<sup>th</sup>.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>Commission</b> 
</font> 
<A href="Javascript:openProblemRating(2293)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      123 / 132 (93.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      117 / 123 (95.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>haha</b> for 246.43 points (2 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      199.39 (for 117 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was actually inspired by a real-life scenario involving a furniture company.  Basically, you want to know how much a cheaper salesman will have to sell in order to for you to make the same profit as you currently do with your expensive salesman.  Your current salesman sells <b>$sales</b> goods, <b>cost%</b> of which go to your overhead, and 20% of which go towards his commission.  The new salesman works for a lower commission, so he doesn't need to sell quite as much for you to make the same profit.  While you could have used some sort of numerical search technique (binary search, for instance), if you work with the terms a bit, there is a relatively simple closed form solutions that most coders found without trouble.  First, find out how much profit you currently make: <b>sales*(1-0.2-cost/100)</b>.  Next, consider that your profit with the new salesman will be <b>x*(1-commission/100-cost/100)</b>, for some <b>x</b>, which represents the return value.  Now, you simply need to set these two equations to be equal and do the algebra to get <b>x = sales*(1-0.2-cost/100)/(1-commission/100-cost/100)</b>
</p> 

<font size="+2"> 
<b>Scale</b> 
</font> 
<A href="Javascript:openProblemRating(2294)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      65 / 132 (49.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 65 (67.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Wernie</b> for 520.08 points (12 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      357.65 (for 44 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Image scaling is a pretty well-studied algorithm, and there are lots of different ways to do it.  The method used in this problem is not very commonly used, as more advanced interpolation techniques are generally preferred.<br/><br/>
The algorithm to solve this problem was hinted at in the problem statement.  Basically, you first scale the image up so that width of the image is divisible by both the original width and the scaled width.  You do the same thing for the height.  You could find the least common multiple of the two widths, but that help you in the worst case, so you might as well just use the prduct of the two widths as the width in your scaled up image.  Hence, in the problem statement, when we scaled an image from 2x2 to 3x3, we first made a 6x6 image.  In the worst case, this will give you an image with 20 million pixels, which is quite manageable, so long as you use only one or two bytes per pixel.  Once you have the larger image, you can scale it back down to the required dimensions by dividing up into a number of blocks, each one the same size as the original image.  Hence, when we go from 2x2 to 3x3, our blocks are 2x2.  If we take the average value of the pixels in a block, and round it, we get the value for one pixel in the return:
<pre>
        char[][] b = new char[image.length*y][image[0].length()*x];
        for(int i = 0; i&lt;b.length; i++)for(int j = 0; j&lt;b[0].length; j++)
            b[i][j] = image[i/y].charAt(j/x);
        String[] ret = new String[y];
        Arrays.fill(ret,"");
        for(int i = 0; i&lt;y; i++)for(int j = 0; j&lt;x; j++){
            double tot = 0;
            for(int k = 0; k&lt;image.length; k++)for(int l =0 ; l&lt;image[0].length(); l++){
                tot += b[i*image.length+k][j*image[0].length()+l];
            }
            ret[i] += (char)Math.round(tot/image.length/image[0].length());
        }
        return ret;
</pre>
If we needed to, we could solve this without explicitly making the scaled up image.  Our loops end up being basically the same, and our runtime is still O(N^4) (where N is the size of the largest dimension), but we use a lot less memory.  Basically, we note that when we look up <tt>b[i*image.length+k][j*image[0].length()+l]</tt> in the above code, we could instead have looked up the value in the original image simply by dividing the two coordinates by x and y, respectively: <tt>image[(i*image.length+k)/y].charAt((j*image[0].length()+l)/x)</tt>.  We can also improve our runtime significantly if we want to be really clever.  Rather than considering a larger, scaled up image, we can calculate exactly which pixels in the original image have an effect on a particular pixel in the new image.  Say we are considering pixel (i,j) in the scaled image.  That pixel falls in the region from <tt>(i-1,j-1)</tt> to <tt>(i,j)</tt> in the scaled image, and if you do out the math, you'll find that it falls in the region <tt>((i-1)*width/y,(j-1)*height/y)</tt> to <tt>(i*width/y,j*height/y)</tt>, where width and heigh correspond to the original image.  Now, we can go to the original image and iterate over all pixels that are at least partly in this region, and calculate how much of each one is in the region.  The runtime for this is a little harder to calculate, but it works out to O(N^2), a significant improvement.  See mathijs' solution for an implementation of this.
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
