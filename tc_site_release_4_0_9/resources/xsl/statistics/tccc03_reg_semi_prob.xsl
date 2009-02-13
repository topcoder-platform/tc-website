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
                                                                <A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyGeneric">&#160;Archive&#160;</A>
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

                                        <h2>Match summary</h2>

                                        <p>
                                            The regional semifinals caused some huge upsets when top seeded <b>John Dethridge</b> was knocked out,
                                            together with other high ranked coders such as <b>reid</b> and <b>malpt</b> (<b>reid</b> did not show
                                            up at all). The cutoffs for the different regions differed quite a lot; <b>John Dethridge</b> would
                                            for instance have qualified had he competed in any other region. Top scorers were <b>bigg_nate</b>
                                            and <b>Yarin</b>. The problem set was arguably one of the better in this CC, with a mix of math,
                                            dynamic programming and geometry.
                                        </p>

                                        <p><B>Problem Set Analysis &amp; Opinion</B></p>

                                        <font size="+2"><b>Ordered</b></font><BR/>
                                        Used as: Level 1:

                                        <blockquote>
                                        <table cellspacing="2">
                                        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">200</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">127 / 129  (98.45%) </td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">111 / 127  (87.40%)</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>bigg_nate</b> for 193.50 points</td></tr>
                                        </table>
                                        </blockquote>

                                        <p>Reference implementation: <b>Yarin</b> <i>(room 2)</i></p>

                                        <h4>Implementation</h4>

                                        <p>
                                            I suspect an easy (200 pts) first problem was selected just to make sure all regional finals would have
                                            10 competitors... Still, the problem had some pitfalls, the major one being <b>spelling errors</b>, even
                                            though the notes warned about that.
                                        </p>

                                        <p>
                                            Given a sequence of numbers, we should deduce if it's strictly increasing, strictly decreasing, non-decreasing
                                            or non-increasing (which I believe are the proper terms). To check the first two cases, just make sure every
                                            value is greater (smaller) than the previous value. If this is not the case, set a flag. We do the same for
                                            the other two cases, but instead check that every value is greater-or-equal (smaller-or-equal) to the
                                            previous value.
                                        </p>

                                        <p>
                                            Depending on the results, we should either append the mean of the values (reduced fraction, so we need to
                                            use GCD) to the result string or the frequency of the most common element. It could also be that none of
                                            the four types of sequences applied, in which case we simply returned "NOTHING".
                                        </p>

                                        <font size="+2"><b>GreedyChange</b></font><BR/>
                                        Used as: Level 2:

                                        <blockquote>
                                        <table cellspacing="2">
                                        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">73 / 129  (56.59%) </td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">46 / 73  (63.01%)</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>bigg_nate</b> for 444.78 points</td></tr>
                                        </table>
                                        </blockquote>

                                        <p>Reference implementation: <b>bigg_nate</b> <i>(room 13)</i></p>

                                        <h4>Implementation</h4>

                                        <p>
                                            This is a typical DP (dynamic programming) problem. It consists of two parts - first we calculate the
                                            optimal way of handing back coins for all values up to a limit. Then for each such value we compare
                                            with the greedy method. If the greedy method is worse than the optimal, we return this value. Otherwise
                                            we keep going until we hit the limit (see below), and once we hit it, we return -1.
                                        </p>

                                        <p>
                                            To calculate the optimal way of handing back coins, we use induction. Assume we know the fewest coins
                                            possible for all integers <i>x</i>&lt;<i>k</i> (this value is stored in a big array, opt[], where
                                            opt[<i>x</i>] = the fewest coins possible when the value is <i>x</i>). Now we should calculate the
                                            fewest coins possible when the value is <i>k</i>. The idea is that for any value <i>k</i>&gt;0, we
                                            must first give back one coin. After that, the remaining value is less than <i>k</i>, and for that
                                            value we already know the fewest coins possible (by induction). So, we loop through all
                                            denominations (call them d[<i>i</i>]), check opt[<i>k</i>-d[<i>i</i>]], and pick the minimum of
                                            these values. Thus,
                                        </p>

                                        <pre>opt[k]: for all denominations d[i]: min(opt[k-d[i]])+1</pre>

                                        <p>
                                            For the greedy approach, we can use induction again. Assume we know that the greedy method equals the
                                            optimal method for all integers <i>x</i>&lt;<i>k</i>. That is, opt[<i>x</i>]==greedy[<i>x</i>]. Now,
                                            in order for greedy to work on the value <i>k</i>, opt[<i>k</i>-<i>d_max</i>]+1 must equal opt[<i>k</i>],
                                            where <i>d_max</i> is the highest denomination less than or equal to <i>k</i>. The reason for this is
                                            that this is the coin we will hand back first; after that we know by induction that greedy works for
                                            the value <i>k</i>-<i>d_max</i>, so the number of coins that we hand back by this method is
                                            opt[<i>k</i>-<i>d_max</i>]+1.
                                        </p>

                                        <p>
                                            In order for the program to run in time, we need a quick way to find out the largest coin less than or
                                            equal to the current value. This can be solved nicely by first sorting the coins, and then as we loop
                                            through the values, we keep updating which coin is currently the largest less than or equal to the
                                            value - the reference implementation handles this nicely.
                                        </p>

                                        <p>
                                            This is all fairly standard stuff. What maybe made this problem slightly harder is to figure out how
                                            long you should search before deducting that greedy works on all values. I believe most people
                                            simply guessed (I know I did), with the hint from the last example case, that if greedy worked
                                            for all values up to 2<i>N</i> (where <i>N</i> was the largest denomination), it worked for all
                                            values. Below follows a proof that this is actually the case:
                                        </p>

                                        <ul>
                                        <p>
                                            Assume greedy works for all numbers less than <i>k</i>, <i>k</i>&gt;2<i>N</i>, where <i>N</i> is the
                                            largest coin. We will now prove that greedy works for <i>k</i> as well. By assumption, we have
                                            the true recurrence that opt[<i>k</i>]=min(opt[<i>k</i>-<i>j</i>]+1) where j is the value of some
                                            coin.  Now, we know that the greedy solution works for opt[<i>k</i>-<i>j</i>] and also that
                                            <i>k</i>-j&gt;<i>N</i>.  Thus, opt[<i>k</i>-<i>j</i>]=opt[<i>k</i>-<i>j</i>-<i>N</i>]+1. So, we can
                                            rewrite this as:
                                        </p>

                                        <pre>
                                        opt[<i>k</i>]=min(opt[<i>k</i>-N-j]+1)+1
                                        </pre>

                                        <p>
                                            since the greedy solution for <i>k</i>-<i>j</i> involves using a coin valued at <i>N</i>
                                            (<i>k</i>-<i>j</i>&gt;<i>N</i>). Now, we can rewrite min(opt[<i>k</i>-<i>N</i>-<i>j</i>]+1) as
                                            opt[<i>k</i>-<i>N</i>], from our original recurrence, and thus we get:
                                        </p>

                                        <pre>
                                        opt[k]=opt[k-N]+1
                                        </pre>
                                        <p>which is what the greedy solution gives. QED <i>(proof by <b>lbackstrom</b>)</i></p>
                                        </ul>


                                        <font size="+2"><b>SolidArea</b></font><BR/>
                                        Used as: Level 3:

                                        <blockquote>
                                        <table cellspacing="2">
                                        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1000</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">49 / 129  (37.98%) </td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">39 / 49  (79.59%)</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin </b> for 824.44 points</td></tr>
                                        </table>
                                        </blockquote>

                                        <p>Reference implementation: <b>Yarin</b> <i>(room 2)</i></p>

                                        <h4>Implementation</h4>

                                        <p>
                                            <img align="right" src="/contest/problem/SolidArea/cc3.gif"></img>Given a polygon on the xy-plane, the polygon is moved "up" along
                                            the z-axis while being enlarged. This creates a solid, see picture below. The problem is to calculate
                                            the area of all the surfaces of this solid.
                                        </p>

                                        <p>
                                            The solid has two kinds of surfaces: the two polygonal surfaces (top &amp; bottom),
                                            and the <i>n</i> faces. The problem constraint guarantees that the solid will be
                                            "nice", no crossing surfaces or any such (in fact, I don't think such
                                            a figure would be called a solid!).
                                        </p>

                                        <p>
                                            The area of the two polygonal surfaces can be calculated with a formula that, if you don't know it,
                                            you should learn!
                                        </p>

                                        <p>
                                        P<sub>AREA</sub> =
                                        ((x<sub>1</sub>*y<sub>2</sub>-x<sub>2</sub>*y<sub>1</sub>) +
                                        (x<sub>2</sub>*y<sub>3</sub>-x<sub>3</sub>*y<sub>2</sub>) +
                                        .... +
                                        (x<sub>n</sub>*y<sub>1</sub>-x<sub>1</sub>*y<sub>n</sub>))
                                        /2
                                        </p>

                                        <p>where the polygon points are (x<sub>1</sub>,y<sub>1</sub>), (x<sub>2</sub>,y<sub>2</sub>), ... ,
                                            (x<sub>n</sub>,y<sub>n</sub>). Depending on whether or not the polygon points are clockwise or counter
                                            clockwise, you may have to negate the value above.
                                        </p>

                                        <p>
                                            It remains to calculate the area of the <i>n</i> sides. Each side is
                                            a trapezoid with coordinates in 3D. The coordinates for the trapezoid are
                                            (x<sub>i</sub>,y<sub>i</sub>,0),(x<sub>i+1</sub>,y<sub>i+1</sub>,0),(x<sub>i</sub>*f,y<sub>i</sub>*f,s),(x<sub>i+1</sub>*f,y<sub>i+1</sub>*f,s)
                                            where x<sub>i</sub>,y<sub>i</sub> are the original coordinates for the polygon,
                                            f is the enlargement factor and s is the shift value (how much the polygon is moved up along the z-axis).
                                        </p>

                                        <p>
                                            <img align="left" src="/contest/problem/SolidArea/cc3_2.gif"></img>Now, calculating the area of a trapezoid is fairly simple - multiply the average base length with the height.  The problem here is that the trapezoid is in 3D
                                            and calculating the height requires some elementary knowledge in linear algebra. Instead I went
                                            for a different approach: I divided the trapezoid into two triangles and calculated the area
                                            of those using Herons formula:
                                        </p>

                                        <p>T<sub>AREA</sub> = sqrt(<i>p</i>*(<i>p</i>-<i>a</i>)*(<i>p</i>-<i>b</i>)*(<i>p</i>-<i>c</i>))</p>

                                        <p>
                                            where <i>a</i>, <i>b</i>, <i>c</i> are the sides of the triangle (calculated from the coordinates
                                            using Pythagoras formula) and <i>p</i> is half the perimeter, (<i>a</i>+<i>b</i>+<i>c</i>)/2.
                                        </p>

                                        <p>
                                            That's basically it. The answer is sum of all these areas, rounded down. Check the reference
                                            implementation for details.
                                        </p>





                                        <IMG SRC="/i/m/Yarin_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;Yarin
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/tc?module=MemberProfile&amp;cr=269554" CLASS="smallText">Author Profile</A>
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
