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

<title>Single Round Match 177 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 177</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, December 30, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2>

<p>
SRM 177 was a brutal blood bath for division 1, with problems so hard
even Yarin scored only 50 points on a challenge.  Another notable red
coder was not so lucky, and ended up with -50, in what was perhaps the
hardest SRM in months.  Division 2 had an easier time of things, as most
coders breezed through the easy and medium problems, but hit the wall that
was their hard and division 1's medium.  After the dust settled and system
tests were run, only 61 out of 134 division 1 coders had positive points,
and only 48 of those had any successful submissions.  Out of the chaos,
only a single coder, and a yellow at that, Mike Mirzayanov, was able to
complete all three problems, and take the day with an impressive rating
jump.  WishingBone took second, and nicka81 third, while coders with 0
points gained as much as 22 rating points.  In division 2, new comer pparys
won easily, with datawrangler a distant second, and new comer nicram in third.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b>Stairs</b>
</font>
<A href="Javascript:openProblemRating(2011)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      154 / 188 (81.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      125 / 154 (81.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>hilgart</b> for 237.25 points (6 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      181.32 (for 125 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
With limits of 1000 on all of the inputs, a brute force approach, trying every possible height and width would easily run in time on this problem.  The most straightforward approach is to loop over each conceivable height (1 to maxHeight).  Once you have the height, you must first check to see if the totalHeight is divisible by the height.  If it is not, then simply go on to the next height.  Next, we calculate the width of the treads.  The number of risers is totalHeight/height, and there is one less tread than riser.  So, with the number of treads in hand, we check that the totalWidth is divisible by that number, and then make sure that the width is large enough.  One tricky case to watch out for is when there is only a single riser, and no tread.  There are a number of other ways to solve this problem, but the basic idea is always the same: iterate over one of the parameters (or two if you like) and do a bit of arithmetic to find the valid pairs.
<pre>
        int ret = 0;
        for(int i = 1; i&lt;=maxHeight; i++){
                if(totalHeight%i!=0)continue;
                int cnt = totalHeight/i-1;
                if(cnt==0 || totalWidth%cnt!=0 || totalWidth/cnt &lt; minWidth)continue;
                ret++;
        }
        return ret;
</pre>
</p>

<font size="+2">
<b>OldestOne</b>
</font>
<A href="Javascript:openProblemRating(1913)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      141 / 188 (75.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      122 / 141 (86.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>RandySaint</b> for 466.55 points (7 mins 43 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      334.98 (for 122 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem wasn't really much harder than the easy.  The only thing that really makes it harder is that it requires some knowledge of string manipulation, whereas the easy requires only numeric manipulation.  Anyhow, the simplest way to solve this is first find the index of the first digit in the string.  Then, starting at the first digit, find the next space in the string.  That gives you the substring relating to the age of the student, and then its just a matter of parsing the string into an int.  The name of the student is also easy to attain from this, it is just the characters before the first digit, with leading and trailing space trimmed off.
</p>

<font size="+2">
<b>Removal</b>
</font>
<A href="Javascript:openProblemRating(1973)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      61 / 188 (32.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 61 (4.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>pparys</b> for 823.34 points (8 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      588.40 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>



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
      80 / 135 (59.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      20 / 80 (25.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Kavan</b> for 392.23 points (11 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      260.40 (for 20 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The simplest way to solve this problem is to consider events in reverse.  First, consider where the k<sup>th</sup> element of the sequence would have been before the final removal.  Then the removal before that, and so on.  We handle each removal the same way, and after we have undone all of the removals, we end up with the initial position.  So, then all that remains is to figure out exactly how to undo a removal.  Let the index of the number after the removal be <b>k</b> and the removal be given be <b>lo</b> and <b>hi</b>.  If <b>lo</b> is greater than <b>k</b>, then the removal of the elements may not effect the sequence, as each element removed comes later than the <b>k<sup>th</sup></b> and does not effect its position.  If, on the other hand, <b>lo</b> is less than or equal to <b>k</b>, then each element removed came before <b>k</b>, and so we set <tt><b>k</b> = <b>k</b> + <b>hi</b> - <b>lo</b> + 1</tt>.  Then, before we return the final <b>k</b> we need only check that it is at most <b>n</b> (the total number of element in the sequence).  The only other detail to this method is that we must use 64 bit integers, or else we will overflow:
<pre>
public int finalPos(int n, int kk, String[] remove){
        long k = kk;
        for(int i = remove.length-1; i&gt;=0; i--){
                int lo = Integer.parseInt(remove[i].split("-")[0]);
                int hi = Integer.parseInt(remove[i].split("-")[1]);
                if(k&gt;=lo)
                        k+=hi-lo+1;
        }
        return (int)(k&gt;n?-1:k);
}
</pre>
</p>

<font size="+2">
<b>TickTick</b>
</font>
<A href="Javascript:openProblemRating(1609)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      78 / 135 (57.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      35 / 78 (44.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nicka81</b> for 234.43 points (15 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177.98 (for 35 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem stumped many a fine coder, causing trouble even for most of the reds.  The trick to solving it was to figure out which times to consider for the first tick.  To start off, lets first note that the beginning of the program is essentially the same as an event, since it can either be in the same or in a different tick as the next event.  Now, lets us consider some time for the first tick (before the start of the program) which is not an integral distance from any event.  Now, that time causes some sequence of 'S's and 'D's.  Imagine that we now slide the time of the first tick so it happens a little earlier, but not so much earlier that the sequence changes at all.  In fact, as long as the tick remains the same number of full ticks away from each of the events, we can continue sliding.  To find out exactly where we have to stop, we need only find how far we can slide it and remain the same number of whole ticks away from each event.  Now, all this sliding around and you're likely to slip and introduce some bug in your code.  Instead, note that we can always slide the tick down to the point where it is just a hair greater than an integral distance from some event.  So, instead of doing any sliding, we need only consider ticks that occur just after some event.  In fact, we need not even worry about when the first tick is before the program starts, since one tick tells us when all the others are.  So, in pseudocode:
<pre>
        set ret
        add time = 0 to events
        for i = 0 to lengthOf(events)
                double tick = events[i]+5e-8
                double prev = NaN
                String seq = ""
                for j = 0 to lengthOf(events)
                        double tickIndex = floor(events[j]-tick)
                        if(tickIndex==prev)
                                seq = seq + "S"
                        else
                                seq = seq + "D"
                add s to ret
        return sizeOf(ret)
</pre>
And then in Java, using bitmasks:
<pre>
        TreeSet ts = new TreeSet();
        double[] e = new double[events.length+1];
        for(int i = 0; i&lt;events.length; i++)e[i+1] = Double.parseDouble(events[i]);
        for(int i = 0; i&lt;e.length; i++){
                double d = e[i]+5e-8;
                double prev = Double.NaN;
                long s = 0;
                for(int j = 0; j&lt;e.length; j++){
                        double n = Math.floor(e[j]-d);
                        if(n==prev)s|=1&lt;&lt;j;
                        prev = n;
                }
                ts.add(new Long(s));
        }
        return ts.size();
</pre>
</p>

<font size="+2">
<b>Warehouse</b>
</font>
<A href="Javascript:openProblemRating(1140)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      15 / 135 (11.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 15 (20.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>WishingBone</b> for 737.77 points (18 mins 21 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      599.09 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first step to solving this problem is realizing which paths to consider.  Obviously, there are way to many possible paths to try them all (an infinite number, in fact), but only a few that could potentially be optimal.  Each potentially optimal path is defined by either 2 or 3 posts (where the corners are considered posts).  The paths defined by 2 posts have the truck traveling perpendicular to the line between the 2 posts.  A simple example of this is when the truck travels due east between two posts with equal x coordinate.  In the 3 post case, the truck comes close to two of the posts on one side, and to the third on its other side.  We can show that these all optimal paths will fall into one of these cases by imagining some other path, and showing that it must be suboptimal.
<br/><br/>
Let us first start with a little bit of essential computation geometry before we delve into the whole solution.  First, the distance from a line defined by two points, p<sub>1</sub> and p<sub>2</sub>, to a point, p<sub>3</sub>, can be found be taking the cross product of p<sub>3</sub>-p<sub>1</sub> and p<sub>2</sub>-p<sub>1</sub> where subtraction means the subtraction of the x and y coordinates independently.  The cross product yields the area of a parallelogram those base is given by p<sub>1</sub> and p<sub>2</sub> with a third point at p<sub>3</sub>.  Since the area of a parallelogram is simply base times height, we can get the height by taking the area divided by the length of the base.  In other words, the cross product divided by the distance between p<sub>1</sub> and p<sub>2</sub>.
<pre>
        double distToLine(point p1, point p2, point p3){
                vector v1 = p2-p1;
                vector v2 = p3-p1;
                double cross = v1.x * v2.y - v2.x * v1.y;
                double base = sqrt(v1.x * v1.x + v1.y * v2.y);
                return cross/base;
        }
</pre>
One important thing is that the distance will be negative if the point is one side of the base, and positive if it is on the other.  The actually distance is simply the absolute value, but in many cases, knowing which side the point is on is also important.
<br/><br/>
That is almost all of the geometry that you need for this problem.  Some line intersection code is necessary for some implementations, but we won't need it for this implementation.  To avoid it, we will add posts at regular intervals along the upper and lower walls.  This means that we don't have to worry about paths that go through the wall as special cases, since the will be smaller than paths that don't.  With only 50 posts, we know that the gap must be at least 4 units wide, so if we add posts every 4 units along the walls, that will be sufficient.  Next, we will consider paths defined by only two posts, p<sub>1</sub> and p<sub>2</sub>.  To make our code simpler, we will convert this case into the 3 post case by imagining that there is a third post at p<sub>3</sub> such that the line between p<sub>1</sub> and p<sub>2</sub> is perpendicular to that between p<sub>1</sub> and p<sub>3</sub>.  That way, a truck traveling perpendicular to the line between p<sub>1</sub> and p<sub>2</sub> will almost touch p<sub>3</sub>, and we have the 3 post case.  To find p<sub>3</sub>, we do the following:
<pre>
        p<sub>3</sub>.x = p<sub>1</sub>.x + p<sub>1</sub>.y - p<sub>2</sub>.y
        p<sub>3</sub>.y = p<sub>1</sub>.y + p<sub>2</sub>.x - p<sub>1</sub>.x
</pre>
Now, both cases can be handled the same way: for some pair of points, find the width of the widest truck that can drive through such that one of its sides almost touches both of those points.  In the case outlined above, the points are         p<sub>1</sub> and p<sub>3</sub>.  In the three points case, we simply consider all pairs of points given by two posts.
<br/><br/>
Finally, for the given two points, we find the two points nearest the line on either side.  As mentioned above, we can tell which side the point is on based on the sign of the cross product.  Since the line itself is defined by at least one post, we get two widths: the width going down one side, and the width going down the other side.  We can safely ignore points on the line (distance = 0) and needn't worry about using an epsilon since the cross product will be exactly 0 for points on the line.  The only other thing to note is that if there are no points on one side of the line, then that side of the line is outside of the warehouse, and shouldn't be considered.  The return value is just the width of the widest path found when considering all pairs of posts, minus a small epsilon.
<pre>
        double ep = 1e-13;
        public int feetWide(int[] xx, int[] yy){
                int[] x = new int[xx.length+102];
                int[] y = new int[xx.length+102];
                for(int i = 0; i&lt;xx.length; i++){
                        x[i] = xx[i];
                        y[i] = yy[i];
                }
                for(int i = 0; i&lt;=50; i++){
                        x[xx.length+2*i] = 4*i;
                        y[yy.length+2*i] = 0;
                        x[xx.length+2*i+1] = 4*i;
                        y[yy.length+2*i+1] = 200;
                }
                double ret = 0;
                for(int i = 0; i&lt;x.length; i++){
                        for(int j = 0; j&lt;i; j++){
                                double[] d = doit(x,y,x[i],y[i],x[j],y[j]);
                                ret = Math.max(ret,d[0]);
                                ret = Math.max(ret,d[1]);
                                d = doit(x,y,x[i],y[i],x[i]+y[i]-y[j],y[i]+x[j]-x[i]);
                                ret = Math.max(ret,d[0]);
                                ret = Math.max(ret,d[1]);
                        }
                }
                return (int)(ret-ep);
        }
        double[] doit(int[] x, int[] y, int x1, int y1, int x2, int y2){
                double c1 = 10000, c2 = 10000;
                for(int k = 0; k&lt;x.length; k++){
                        double dx1 = x[k]-x1;
                        double dy1 = y[k]-y1;
                        double dx2 = x2-x1;
                        double dy2 = y2-y1;
                        double dist = (dx1*dy2-dx2*dy1)/Math.sqrt(dx2*dx2+dy2*dy2);
                        if(dist&lt;0){
                                c1 = Math.min(c1,-dist);
                        }else if(dist &gt; 0){
                                c2 = Math.min(c2,dist);
                        }
                }
                return new double[]{c1==10000?0:c1,c2==10000?0:c2};
        }
</pre>
</p>

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
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
