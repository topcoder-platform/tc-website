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
        <HTML>
            <HEAD>
                <xsl:call-template name="Preload"/>
                <TITLE>TopCoder :: Statistics</TITLE>
                <xsl:call-template name="CSS"/>
                <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
                <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
                <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
            </HEAD>
            <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
                <xsl:call-template name="Top"/>
                <!-- Body Begins -->
                <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
                    <TR>
                        <!-- Left Column Begins -->
                        <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
                            <!-- Left Column Include Begins -->
                            <!-- Global Seconday Nav Begins -->
                            <xsl:call-template name="global_left"/>
                            <!-- Global Seconday Nav Ends -->
                            <!-- Left Column Include Ends -->
                        </TD>
                        <!-- Left Column Ends -->
                        <!-- Gutter Begins -->
                        <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top">
                            <IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->

                        <!-- Body Area -->
                        <!-- Center Column Begins -->
                        <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">statisticsw</xsl:with-param>
                                <xsl:with-param name="title">&#160;TC Last Match Editorials</xsl:with-param>
                            </xsl:call-template>
                            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                                <TR>
                                    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
                                        <BR/>
                                        <!--body contextual links-->
                                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
                                            <TR>
                                                <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top">
                                                    <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top">
                                                    <IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
                                                <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
                                            </TR>
                                            <TR>
                                                <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
                                                    <TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
                                                        <TR>
                                                            <!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC">
                                                                <A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A>
                                                            </TD>
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC">
                                                                <A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A>
                                                            </TD>
                                                        </TR>
                                                    </TABLE>
                                                </TD>
                                            </TR>
                                        </TABLE>
                                        <!--end contextual links-->
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/>
                                        <BR/>
                                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
                                        
                                        <p><b>Single Round Match 140</b><br/>
										Wednesday 26, March 2003 
										</p>
										
                                       <p><B>Problem Set Analysis &amp; Opinion</B></p>

<font size="+2"><b>SoccerLeague</b></font><br />
Used as: Division-II, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">200</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">186 / 195  (95.38%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">180 / 186  (96.77%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>aastor</b> for 199.54 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>This problem is unusually easy, even for a Division-II Level 1 problem. We can initialize the maximum points value to 0, as no team will have negative points. We then loop through all teams, and for each team check how many points they've been awarded by the simple formula 3*wins+1*ties. If this is greater than the maximum value found so far, we update the maximum value with this new value.</p>

<font size="+2"><b>SpriteCollision</b></font><br />
Used as: Division-II, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">600</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">127 / 195  (65.13%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">78 / 127  (61.42%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Sleeve</b> for 557.81 points</td></tr>
</table>
</blockquote>

Used as: Division-I, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">130 / 134  (97.01%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">108 / 130  (83.08%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>sjelkjd</b> for 295.00 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>One can solve this problem using at least three different methods. In the first two of these, we check for every pair of sprites (two nested loops, make sure not to check a sprite against itself!) whether they collide or not. This check consist of finding out whether or not two rectangles overlap; that is, if they intersect. This can be done either using Javas geometry library (method 1), or by the following reasoning: if two rectangles A and B do <i>not</i> overlap, then either</p>

<ol>
<li>The right side of rectangle A is to the left (or the same) of the left side of rectangle B</li>
<li>The left side of rectangle A is to the right (or the same) of the right side of rectangle B</li>
<li>The upper side of rectangle A is below (or the same) the lower side of rectangle B</li>
<li>The lower side of rectangle A is above (or the same) the upper side of rectangle B</li>
</ol>

<p>In all other cases, the two rectangles overlap (method 2).</p>

<p>The third method is to actually plot the sprites on a virtual screen. This is feasible since the screen size is so small, 256x256 pixels. Initially we mark all pixels as empty; that is, no sprite occupies this pixel. Then, for each sprite, we use two nested loops to mark all pixels this sprite occupies. If, when doing this, we intend to mark a pixel that has already been marked, then obviously two sprites collide. These two sprites are the one already marked (when marking, we store the sprite index of the sprite) plus the one we are currently marking. We need to add both to a list of sprites marked as "collided". We then continue the process until all sprites have been plotted. Finally we return a sorted array of the sprites marked as collided (also making sure no elements are duplicated).</p>

<font size="+2"><b>DrawCircle</b></font><br />
Used as: Division-II, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1000</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">59 / 195  (30.26%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">33 / 59  (55.93%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>vegeta</b> for 932.57 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>Consider the image below, where a coordinate system has been inserted. Each pixel in the bitmap (from here on, I will use the term <i>square</i> instead of pixel) has length 1 in this coordinate system.</p>

<img src="/contest/problem/DrawCircle/drawcircle.gif" />

<p>To determine if a square is entirely inside the circle, we would like to check the distance from all points in the square to the centre of the circle. If all those distances are less than the radius, then the whole square is inside the circle and thus this we know this square should be represented by a 'x'. We can apply the same reasoning to decide if a square is entirely outside the circle, a '.'. If it's neither entirely inside nor outside the circle, it's obviously on the edge, a '#'.</p>

<p>Now, the trick is that we don't actually have to check all points (there are of course infinitely many points inside the square) - it's enough to just check the distance from the four corners of the square to the centre of the circle. The coordinates for the corners of square x,y (0,0 being the square where the centre of the circle is located in) is (-0.5+x,-0.5+y),(0.5+x,0.5+y),(-0.5+x,-0.5+y),(0.5+x,0.5+y). The distance from a point to the centre is calculated using Pythagoras formula, a<sup>2</sup>+b<sup>2</sup>=c<sup>2</sup>.</p>

<pre>
// Return TRUE if square x,y (0,0 = centre square) is entirely inside the circle
boolean isInside(int x, int y, int radius)
{
  double cx,cy;
  cx=-0.5+x; cy=-0.5+y; // Upper left corner
  if (cx*cx+cy*cy&gt;radius*radius) return false;
  cx= 0.5+x; cy=-0.5+y; // Upper right corner
  if (cx*cx+cy*cy&gt;radius*radius) return false;
  cx=-0.5+x; cy= 0.5+y; // Lower left corner
  if (cx*cx+cy*cy&gt;radius*radius) return false;
  cx= 0.5+x; cy= 0.5+y; // Lower right corner
  if (cx*cx+cy*cy&gt;radius*radius) return false;
  return true;
}
</pre>

<p>Similar code is used for the function isOutside. When those are written, we loop through all squares, from -radius to radius (inclusive) in both horizontal and vertical direction and check what kind of square this is.</p>
  
<p>One can avoid using floating point math if the whole coordinate system is scaled up by a factor of two. I prefer this method because, if it's possible, one should always avoid using floating point (double). In this problem it's not necessary at all, because the problem statement guaranteed that the circle never touched the corners precisely, in which case floating point math must be used with care.</p>

<p>This problem can also be solved with the help of Javas geometry library, using intersections of circles and rectangles.</p>

<font size="+2"><b>RoundRobin</b></font><br />
Used as: Division-I, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">87 / 134  (64.93%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">71 / 87  (81.61%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>SnapDragon</b> for 466.06 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>A trick which makes solving this problem easier is to realize that you should consider <i>all</i> points from 0 to 2*<i>n</i>, inclusive, as point groups. Most likely most of these will contain no players at all, but that won't affect the outcome of the sorting.</p>

<p>Obviously, we need to start calculating the total score for each player so we know which point group the player belongs to. Once that's done, for each player <i>i</i> we create an array - call it <i>v</i> - where the <i>v[j]</i> is the score player <i>i</i> took against all players in point group <i>j</i> and above. If we use the trick in mentioned in the previous paragraph, this becomes really easy - <i>v[j</i>] is simply the score player <i>i</i> took against all players whose score is greater (or equal) to <i>j</i>. A couple of nested loops through all players and points is the only thing required to calculate the <i>v</i> array for each player.</p>

<p>Now we can sort. When comparing two players, we first check element 0 in each players <i>v</i>'array (this is the same as the total score of the player). If it's the same, check the next element etc. If it's the same for all elements, we check the player index. The easy way to do that is to add an extra element to the array <i>v</i>, containing the player index.</p>

<p>In C++, the code becomes extremely short because there's a default less-than operator for vector which does what we want:</p>

<pre>
vector&lt;int&gt; order(vector&lt;string&gt; r) {
    vector&lt; vector&lt;int&gt; &gt; v;
    vector&lt;int&gt; sc(r.size(),0);
    for(int i=0;i&lt;r.size();i++) for(int j=0;j&lt;r.size();j++)
        sc[i]+=isdigit(r[i][j])?r[i][j]-'0':0;
    for(int i=0;i&lt;r.size();i++) {
        // 98 points is max due to the problem constraints
        vector&lt;int&gt; t(100,0);
        // Element 0-98 are for point group results, element 99 = player index
        t[99]=i;
        for(int j=0;j&lt;99;j++) for(int k=0;k&lt;r.size();k++)
            if (sc[k]&gt;=j) t[j]-=isdigit(r[i][k])?r[i][k]-'0':0;
        v.push_back(t);       
     }
    sort(v.begin(),v.end());
    // Fetch the player indexes from the sorted vector
    for(int i=0;i&lt;r.size();i++) sc[i]=v[i][99];
    return sc;
}
</pre>

<font size="+2"><b>Knapsack</b></font><br />
Used as: Division-I, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1100</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">11 / 134  (8.21%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">0 / 11  (0.0%)</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>Yet again I managed to write a problem which no one solved. Some of the contestants were really close though; for instance a missing type cast from int to long long was the only mistake <b>SnapDragon</b> had in an otherwise flawless solution.</p>

<p>This is an undisguised version of the 0-1 Knapsack problem, a problem mentioned in most algorithm books. This problem is NP complete, meaning that in general it's hard to solve unless the input constraints are "nice". Almost always it's the upper bound for <i>maxWeight</i> that is small enough which lets you loop through all weights and apply dynamic programming. Obviously, this is <i>not</i> the case with this problem, hence it being a Division-1 hard problem.</p>

<p>Since the number of objects is quite small, at most 34, it's tempting to use a brute force algorithm, trying all 2<sup>n</sup> combinations. 2<sup>34</sup> is way too much though, but some clever pruning should reduce the number of combinations we have to try a lot. It makes sense to select the most valuable objects first (the objects with the greatest quotient <i>value/weight</i>) since it's more likely on a random input that those objects are in the optimal solution. When pruning, we can estimate if it's possible to surpass the best combination found so far with the objects we haven't yet considered. This solution works <i>very</i> well on randomized inputs. However, a quick look at the last example should tell you that this test data is <i>not</i> random - rather the opposite in fact...</p>


<img src="/contest/problem/KnapSack/knapsack.gif" /> 

<p>The "correct" way to solve the problem is to use a solution a "split-and-merge" strategy (not quite divide and conquer). We split the objects into two halves of equal size (or if <i>n</i> is odd, nearly equal size). Each half contains at most 17 objects. This is a quite small number, so for each half we can try all 2<sup>m</sup> combinations of selecting objects. All these combinations (for each half) can now be sorted according to value, weight, number of objects and object set (in that order). We also make sure to remove all bad combinations. A bad combination is something that could never be part of an optimal solution - for instance, having a set of objects that weigh more but has less value than some other set of objects. This filtering can be done in linear time (a single loop through all set of objects) once they have been sorted. Again, we treat each half separately.</p>

<p>Now it's time to merge the two halves (see picture). We start with the combination in the first half which has the highest value (and weight) and in the second half with the lowest value. Then we keep either going up in the left half or down in the right half depending on whether the total weight of the current combination in the left and right half is less than or greater than <i>maxWeight</i>. After every step, we check if the new merging of the combination to the left and combination to the right is better than the best one found so far. This is repeated until we reached the top in the left half or the bottom in the right half. We will then have found the optimal solution.</p>

													

                                       

                                        <IMG SRC="/i/m/Yarin_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;Yarin
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/stat?c=member_profile&amp;cr=269554" CLASS="smallText">Author Profile</A>
                                        </DIV>
                                        <BR CLEAR="all"/>
                                        <P>
                                            <BR/>
                                        </P>
                                    </TD>
                                    <TD VALIGN="top" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" WIDTH="75">
                                        <IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14">
                                        <IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                            </TABLE>
                        </TD>
                        <!-- Center Column Ends -->
                        <!-- Body Area Ends -->

                        <!-- Gutter -->
                        <TD WIDTH="4" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->
                        <!-- Right Column Begins -->
                        <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top">
                            <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/>
                            <BR/>
                            <!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
                            <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
                            <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
                            <!-- Right Column Include Begins -->
                            <xsl:call-template name="public_right_col"/>
                            <!-- Right Column Include Ends -->
                        </TD>
                        <!-- Right Column Ends -->
                        <!-- Gutter -->
                        <TD WIDTH="10" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->
                    </TR>
                </TABLE>
                <!-- Body Ends -->
                <xsl:call-template name="Foot"/>
            </BODY>
        </HTML>
    </xsl:template>
</xsl:stylesheet>
