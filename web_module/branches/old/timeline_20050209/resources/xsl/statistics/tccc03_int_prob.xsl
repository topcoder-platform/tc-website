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

<h1>Problem Summary</h1>
<p>
            The most notable aspect of this round was the Level 2 problem, which was solved by only four coders.
            This lead to a lot of successful challenges by coders such as <b>John Dethridge</b>.  The
            The Level 1 and Level 3 problems had very high success rates among those that submitted the problems,
            but only 14 coders managed to submit a possible solution for the Level 3 problem.
        </p>
<h1>The Problems</h1>
<a name="Pareto"></a><font size="+2"><b>Pareto</b></font><br/><font size="-1">
    Used as: Level 1
            :<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;"><b>Value</b></td>
<td style="background: #eee;">250</td>
</tr>
<tr>
<td style="background: #eee;"><b>Submission Rate</b></td>
<td style="background: #eee;">84
    /
    102
    (82.35%)
</td>
</tr>
<tr>
<td style="background: #eee;"><b>Success Rate</b></td>
<td style="background: #eee;">78
    /
    84
    (92.86%)
</td>
</tr>
<tr>
<td style="background: #eee;"><b>High Score</b></td>
<td style="background: #eee;">
<b>lars</b> for
                    232.90 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                This problem can be solved by iterating over all pairs of outcomes.  For each pair of outcomes <i>A</i> and <i>B</i>,
                one of the following will be true: <i>A</i> may be suboptimal to <i>B</i>; <i>B</i> may be suboptimal to <i>A</i>;
                or neither may be suboptimal to the other.  In the first two cases, we can eliminate one of the outcomes as a
                candidate for being a Pareto optimum.
            </p>
<p>
                We can do this with two nested loops.  The outer loop iterates over all outcomes.  The inner loop also iterates
                over all outcomes.  If the outer outcome is not suboptimal to any of the inner outcomes, we know that it is a
                Pareto optimum and increase a counter.  We return this counter after iterating over all pairs in this fashion.
            </p>
<p>&#160;</p>
<a name="Coherence"></a><font size="+2"><b>Coherence</b></font><br/><font size="-1">
    Used as: Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;"><b>Value</b></td>
<td style="background: #eee;">500</td>
</tr>
<tr>
<td style="background: #eee;"><b>Submission Rate</b></td>
<td style="background: #eee;">59
    /
    102
    (57.84%)
</td>
</tr>
<tr>
<td style="background: #eee;"><b>Success Rate</b></td>
<td style="background: #eee;">4
    /
    59
    (6.78%)
</td>
</tr>
<tr>
<td style="background: #eee;"><b>High Score</b></td>
<td style="background: #eee;">
<b>haha</b> for
                    406.84 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                Very few people were able to get this problem, yet the solution is almost embarrassingly simple.  The first step
                should be to compare the number of foreground pixels to the number of background pixels.  We will get very bogus results
                if there are more foreground pixels than background pixels, and it is this sort of test case that broke a great many
                submissions.  The simple fix is to simply invert the colors if there are more foreground pixels than background pixels.
                This can be as simple as <tt>n &lt;?= w * h - n</tt> in C++.
            </p>
<p>
                There are three possible ways to optimally layout the pixels.  The first is to fill rows in the image with the
                foreground color, until there are not enough pixels left to fill a row (in which case you fill as much of the
                row as possible, aligned to the left).  The second is to fill columns in the exact same fashion.  The third is
                to fill in a rectangle that shares two sides with adjacent borders of the image (i.e., a corner).
            </p>
<p>
                For each of the first two methods, there is only one optimal count.  The number of boundaries will be the width (height)
                of the image, plus an additional boundary if we have an incompletely filled row (column).  For the third method, we
                need to iterate through all possible rectangle sizes.  For each rectangle, the number of boundaries will be at least the
                height of the rectangle plus its width.  This is true even for rectangles that cannot be completely filled.  Only
                rectangles where every column (row) except for one is filled will be optimal, and in such cases the boundary count works
                out the same as for the fully filled rectangle; for each pixel that is removed, two previously unexposed boundaries
                become exposed, while two previously exposed boundaries become internal to the background.
            </p>
<p>
                So to solve the problem, we compute the number of boundaries that we would get if we fill in each of the first two
                fashions, and remember only the minimum.  Then we iterate through every possible rectangle size that would fit in
                the image and be large enough to hold the number of pixels we need, and remember the minimum between our previous
                minimum and the sum of the dimensions of the rectangle.  After all this we return the minimum value.
            </p>
<p>&#160;</p>
<a name="Wireless"></a><font size="+2"><b>Wireless</b></font><br/><font size="-1">
    Used as: Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;"><b>Value</b></td>
<td style="background: #eee;">1000</td>
</tr>
<tr>
<td style="background: #eee;"><b>Submission Rate</b></td>
<td style="background: #eee;">14
    /
    102
    (13.72%)
</td>
</tr>
<tr>
<td style="background: #eee;"><b>Success Rate</b></td>
<td style="background: #eee;">12
    /
    14
    (85.71%)
</td>
</tr>
<tr>
<td style="background: #eee;"><b>High Score</b></td>
<td style="background: #eee;">
<b>John Dethridge</b> for
                    837.02 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                We start out with a 2048-element boolean array (initialized all to <tt>false</tt>) to indicate whether any particular
                angle is protected.  Next we need to define a function that translates an angle name (e.g. &quot;NENE&quot;) to an index into
                this array.
            </p>
<p>
                One way to do this is to precompute all the mappings between angle names and indices.  To do this we will define a
                function that takes an angle name, its index, the index of its nearest neighbors of the same name length, and recursively
                generates the indices for all angles that have that name as a suffix in their own names.
                We would call this function four times at the top level, once for each cardinal direction.  For instance, to generate
                all angle names that end with <tt>&quot;N&quot;</tt>, we will start with <tt>name = &quot;N&quot;</tt>, <tt>id = 512</tt>, <tt>prev = 0</tt>,
                and <tt>next = 1024</tt>.  In the definition of this function, we simply determine the two characters that we can add
                to the beginning of the angle name to make new valid angles and recurse on these new angles.  The two characters can
                be determined by looking at the index.  Indices in the range <tt>1-511</tt> can be modified by either <tt>N</tt>
                (an increase in angle) or <tt>E</tt> (a decrease).  Indices in the range <tt>513-1023</tt> are modified by either <tt>W</tt>
                (increase) or <tt>N</tt> (decrease).  Indices in the range <tt>1025-1535</tt> are modified by either <tt>S</tt> (increase)
                or <tt>W</tt> (decrease).  And indices in the range <tt>1537-2047</tt> are modified by either <tt>E</tt> (increase) or
                <tt>S</tt> (decrease).  The indices of <tt>0</tt>, <tt>512</tt>, <tt>1024</tt>, and <tt>1536</tt> -- corresponding
                to the four cardinal directions -- have their own modifiers, which are easy to determine.  We will need a two-way
                mapping for returning the angle name when we're done.
            </p>
<p>
                Once we've generated a mapping of angle name to index, the rest of the problem is easy.  For each wall description, we
                iterate from the index of the first angle to the index of the second angle (being careful to wrap around properly
                when necessary) and mark the angles covered by this range as protected (both endpoints being included).  Once we have
                done this for all walls, we then find the smallest index that is unprotected, and then return the name associated with
                that index.
            </p>
<p>&#160;</p>



                                        <IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;Logan
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A>
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
