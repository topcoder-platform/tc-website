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


<B>TopCoder Collegiate Challenge > NE and SE Regional Round</B><BR/>Tuesday, February 18 2003
<P><B>Problem Set Analysis &amp; Opinion</B></P><p>
    The first problem set of the collegiate challenge turned out to be a little bit trickier than previous first round
    problem sets have been, though still easier than the average division 1 problem set.  Only 191 people competed
    from the two regions, and of those only 113 ended up with positive points - 78 from the northeast, and 35 from the
    southeast.  dgarthur was able to complete all three of the problems in an impressive 35 minutes, and with 50 points
    from the challenge phase, he easily took first.  In second, 160 points behind, is insomnia, with 4 successful
    challenges.  Good luck to everyone in the next round!
</p><a name="NameSort"></a><font size="+2"><b>NameSort</b></font><br/><font size="-1">
    Used as: Level 1:<blockquote>
        <table cellspacing="2">
            <tr><td style="background: #eee;"><b>Value</b></td><td style="background: #eee;">250</td></tr>
            <tr><td style="background: #eee;"><b>Submission Rate</b></td><td style="background: #eee;">160 / 191 (83.77%)</td></tr>
            <tr><td style="background: #eee;"><b>Success Rate</b></td><td style="background: #eee;">98 / 160 (61.25%)</td></tr>
            <tr><td style="background: #eee;"><b>High Score</b></td><td style="background: #eee;"><b>ColinMacLeod</b> for 239.72 points</td></tr>
        </table></blockquote></font>
<p>
    Sorting can be done in a variety of ways.  The simplest way to implement it in this case, where runtime is not an
    issue, is probably to simply use two loops:
<pre>
for i = 1 to n
    for j = 1 to i-1
        if(element i should come before element j)
            swap elements i and j
</pre>
To tell if one element should come before another, you simply have to tokenize each element, and compare the final
    tokens, ignoring case.  If there is a tie, you need to know the original index, so you should probably keep track
    of the indices and swap them along with the elements.

</p><a name="RoadWork"></a><font size="+2"><b>RoadWork</b></font><br/><font size="-1">
    Used as: Level 2:<blockquote>
        <table cellspacing="2">
            <tr><td style="background: #eee;"><b>Value</b></td><td style="background: #eee;">500</td></tr>
            <tr><td style="background: #eee;"><b>Submission Rate</b></td><td style="background: #eee;">89 / 191 (55.28%)</td></tr>
            <tr><td style="background: #eee;"><b>Success Rate</b></td><td style="background: #eee;">46 / 89 (51.69%)</td></tr>
            <tr><td style="background: #eee;"><b>High Score</b></td><td style="background: #eee;"><b>niteneb</b> for 471.50 points</td></tr>
        </table></blockquote></font>
<p>
    If the roads were shorter, it would be easy to iterate through each one foot section of road, and check to see if it
    is included in multiple contracts.  However, since the roads are up to 2 billions feet long, this is clearly not an
    option.  Instead, we should divide the roads into a number of segments, and then determine if each segment is
    contained within multiple contracts, and then add the length of the whole segment, if it is all covered by
    multiple contracts.  The trick is to pick the segments so that the whole segment is guaranteed to be covered
    by the same number of contracts.  One simple way to do this is to add all of the points in start and end into one
    array, and sort that array.  The segments of interest will now be defined as the region between adjacent elements
    in the array.  It should be clear that there is no way for only part of one of these segments to be covered by
    multiple contracts.  Now that way have defined our segments, it is simple to test each of the segments to see if
    it's covered:
<pre>
all = union(start,end)
sort(all)
ret = 0
for i = 0 to all.size-2
    count = 0
    for j = 0 to start.size-1
        if(start[j]&lt;=all[i] &amp;&amp; end[j] &gt;= all[i+1])
            count = count + 1
    if(count &gt; 1)ret = ret + all[i+1]-all[i]
</pre>
</p><a name="TupleLine"></a><font size="+2"><b>TupleLine</b></font><br/><font size="-1">
Used as: Level 3:<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;"><b>Value</b></td><td style="background: #eee;">1000</td></tr>
        <tr><td style="background: #eee;"><b>Submission Rate</b></td><td style="background: #eee;">20 / 191 (10.47%)</td></tr>
        <tr><td style="background: #eee;"><b>Success Rate</b></td><td style="background: #eee;">12 / 20 (60.00%)</td></tr>
        <tr><td style="background: #eee;"><b>High Score</b></td><td style="background: #eee;"><b>dgarthur</b> for 708.62 points</td></tr>
    </table></blockquote></font>
<p>
    Like any line, a line here is defined by two points.  As a result, the simplest way to do this is to pick two points,
    and examine the line defined by those two points.  The first thing to check is that the line is maximal.  This is
    probably the hardest part of the problem, but it is not very algorithmically difficult.  First, you should find the
    distance tuple between the two points.  Each non-zero element of distance tuple should have the same absolute value.
    If this is not the case, then the two points cannot lie along a maximal line.  For example, (0,0) and (1,2) cannot
    lie along a maximal line because the slope of the line is 2, and thus when the line traverses an n by n box, it
    will hit only n/2 cells.  Once you have done this, you still have to check that the length of the line is the same
    as the size of the box.  For example, if the size of the box is 3, and two points are (0,1) and (1,2), the line
    through them does not include 3 points, only 2.  One way to do this is to generate all of the points along the line,
    and count them.  There are other ways to do this too, but generating the points is probably a good way to do it,
    since this lets you count the total points easily.  Once you have generated the points along the line, you simply
    iterate through all of the points and count how many were given to you.  AdminBrett wrote the shortest solution I
    have seen, though it takes a minute to see how it works:
</p><pre>
public class TupleLine {
public int quickLine(int size, String[] chosen) {
    int ret = size-1;
    for (int i = 0; i &lt; chosen.length; i++) {
        for (int j = i+1; j &lt; chosen.length; j++) {
            int[] curri = new int[chosen[j].length()], currj = new int[curri.length], diff = new int[curri.length];
            int div = 1000, cntused = 0, cntunused = 0;
            for (int x = 0; x &lt; diff.length; x++) {
                curri[x] = chosen[i].charAt(x)-'0';
                currj[x] = chosen[j].charAt(x)-'0';
                diff[x] = curri[x]-currj[x];
                while (diff[x]%div!=0) div--;
            } for (int x = 0; x &lt; diff.length; x++) diff[x] /= div;
        outer:	for (int x = -10; x &lt;= 10; x++) {
                int[] temp = (int[])diff.clone();
                for (int y = 0; y &lt; temp.length; y++) {
                    temp[y] = curri[y]+x*temp[y];
                    if (temp[y] &gt;= size || temp[y] &lt; 0) continue outer;
                }
            outer2:	for (int y = 0; y &lt; chosen.length; y++) {
                    for (int k = 0; k &lt; temp.length; k++)
                        if (chosen[y].charAt(k)-'0'!=temp[k]) continue outer2;
                    cntused++;
                    continue outer;
                }
                cntunused++;
            }
            if (cntused+cntunused==size &amp;&amp; cntunused &lt; ret) ret = cntunused;
        }
    }
    return ret;
}
}
</pre>









                                        <IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;lbackstrom
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/stat?c=member_profile&amp;cr=159052" CLASS="smallText">Author Profile</A>
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
