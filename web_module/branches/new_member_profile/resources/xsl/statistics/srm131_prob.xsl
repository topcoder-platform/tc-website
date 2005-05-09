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
                                        <B>Single Round Match 131</B>
                                        <BR/>
                                        Thursday, January 30, 2003
                                        <P>
                                            <B>Problem Set Analysis &amp; Opinion</B>
                                        </P>
                                        <P>
                                            With the Collegiate Championship only a few weeks down the road,
                                            competition attendance is growing steadily.  Over 400 coders registered
                                            for SRM 131 including top ranked competitors Yarin, John Dethridge,
                                            SnapDragon, and ZorbaTHut.  Competition was fierce, with the top scoring
                                            spot changing hands multiple times in the coding, challenge, and system
                                            test phases.  In the end, Yarin prevailed with SnapDragon and John Dethridge
                                            close behind.
                                            <BR/>
                                            <BR/>
                                            As a departure from the standard types of problems used, this competition
                                            featured an assorted set of algorithmic solutions unlike those seen in
                                            previous competitions.  It is very exciting to see competitors struggle with
                                            problems that challenge their minds, forcing them to develop innovative
                                            techniques with little time to think.  For example, the division 1 hard
                                            problem required the efficient generation of minimum weight Steiner trees,
                                            a topic none of the top ranked coders seemed to have experience with.  It was
                                            this problem that ended up deciding who won SRM 131.
                                            <BR/>
                                        </P>
                                        <a name="CSCourse"></a>
                                        <font size="+2">
                                            <b>CSCourse</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-II, Level 1:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">250</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">252
                                                            /
                                                            264
                                                            (95.45%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">138
                                                            /
                                                            252
                                                            (54.76%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>stingant</b> for
                                                            245.21 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            In this problem, coders were asked to determine the final letter grade a
                                            student should receive given their exam scores, and the number of TopCoder
                                            competitions they competed in.  The intelligent Professor M. forces his
                                            students to compete in at least 3 competitions per semester.  Their final
                                            grade will fall a single letter if they compete in less than 3 competitions.
                                            To solve this problem one must add up the given scores and then account for
                                            the number of competitions.
                                        </p>

                                        <p>&#160;</p>
                                        <a name="SpellCheck"></a>
                                        <font size="+2">
                                            <b>SpellCheck</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-II, Level 2:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">500</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">196
                                                            /
                                                            264
                                                            (74.24%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">96
                                                            /
                                                            196
                                                            (48.98%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Karshikinpa</b> for
                                                            474.04 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            Here coders needed to implement the spelling rule: I before E except after C.
                                            To make things slightly more complicated, the I's, E's, and C's can be either
                                            capital or lowercase.  In addition, the rule must be continually applied until
                                            every place where E comes before I is removed unless after C.  For example,
                                            after a single application of this rule to the string "eeei" we end up with
                                            "eeie".  There is still an I before an E so we must apply the rule again
                                            producing "eiee".  Applying the rule a final time produces the string "ieee"
                                            and we are done.  Code to solve this problem basically consisted of swapping i's
                                            and e's until no more swaps could be made, is in the practice room under brett1479.
                                        </p>
                                        <p>&#160;</p>
                                        <a name=" FloorTile"></a>
                                        <font size="+2">
                                            <b> FloorTile</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-III, Level 3:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">1000</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">119
                                                            /
                                                            264
                                                            (45.08%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">103
                                                            /
                                                            119
                                                            (86.58%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>vipernky</b> for
                                                            996.22 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <font size="-1">
                                            Used as: Division-I, Level 1:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">300</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">126
                                                            /
                                                            136
                                                            (92.65%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">109
                                                            /
                                                            126
                                                            (86.51%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Yi Zhang</b> for
                                                            298.28 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            Given a 2^k by 2^k square floor, you have been asked to lay down tiling
                                            covering the entire area incurring the smallest cost.  The two types of
                                            tiles at your disposal are: a 1 by 1 square tile, and a 2 by 2 tile with a
                                            1 by 1 square removed from one of its corners (an L-shaped tile).  The
                                            L-shaped tile may be flipped or rotated in any fashion.  In addition, both
                                            the small square shaped tiles, and the L-shaped tiles cost $1 to lay down.
                                            To solve this problem, one could theoretically try to brute-force every
                                            possible arrangement of tiles, but a simpler method is possible.  Consider
                                            the solution to the 2 by 2 square floor below.  Using a single L-shaped piece
                                            with a square piece costs a total of $2.  The key insight here is to realize
                                            that the 4x4 case can be produced by placing four of the 2x2 cases next to
                                            each other.  We can align the single squares in each of the four 2x2 components
                                            so that they lie in the middle of the resulting 4x4 block thus giving us the
                                            opportunity to use another L-shaped block.  In other words, when four of the
                                            2x2 diagrams are used to produce the 4x4 diagram 1, we aligned the B's to all
                                            occur in the middle.  In 4x4 diagram 2, three of these B's are replaced by the
                                            L-shaped E block.  Different letters have been used to illustrate the different
                                            blocks.  Furthermore, we can align four 4x4 blocks to produce a 16x16 block.
                                            4x4 diagram 3 shows how I have slightly changed the organization of diagram 2
                                            to place the single leftover square 'F' in the lower righthand corner allowing
                                            four diagram 3 blocks to be connected to form a 16x16 block analogously to how
                                            we generated the 4x4 block.
                                        </p>
                                        <pre>

2x2      4x4 (diagram 1)   4x4 (diagram 2)     4x4 (diagram 3)
 --        ----               ----                ----
|AB|      |AAAA|             |AABB|              |AABB|
|AA|      |ABBA|             |AEEB|              |AEEB|
 --       |ABBA|             |DEFC|              |DECC|
          |AAAA|             |DDCC|              |DDCF|
           ----               ----                ----
                                        </pre>
                                        <p>
                                            The moral of this story is, you never need to use more than a single square in
                                            any of the problem sizes.  Thus the answer can be calculated by finding the
                                            total area, dividing by 3, and then adding 1 for the remaining square block.
                                        </p>
                                        <p>&#160;</p>
                                        <a name="RedChart"></a>
                                        <font size="+2">
                                            <b>RedChart</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-I, Level 2:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">500</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">121
                                                            /
                                                            136
                                                            (88.97%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">73
                                                            /
                                                            121
                                                            (60.33%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>SnapDragon</b> for
                                                            480.25 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            In this problem, coders were asked to find the minimum size chart containing
                                            rating information for a bunch of "red" ranked TopCoder competitors.  If a
                                            coder is red for a period of time, the chart must contain a contiguous bar
                                            from the column designating the start of this period, to the column designating
                                            the end.  Since no overlap may occur, if multiple competitors are red
                                            simultaneously, multiple rows must be used.  Arranging these bars such that the
                                            fewest number of rows is used solves the problem.  To accomplish this, we sort
                                            the ranges by starting competition numbers and loop through them in ascending
                                            order.  When processing each item, if one of the rows we have already used is
                                            free we can place the bar in that row.  Otherwise we must allocate a new row.
                                        </p>
                                        <p>&#160;</p>
                                        <a name="ChipWire"></a>
                                        <font size="+2">
                                            <b>ChipWire</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-I, Level 3:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">1000</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">24
                                                            /
                                                            136
                                                            (17.65%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">8
                                                            /
                                                            24
                                                            (33.33%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Yarin</b> for
                                                            777.13 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            In computer chips, wires usually must travel only horizontally and vertically
                                            between two points.  When trying to build a chip such that all parts on it are
                                            connected, many wires must often be used.  These parts and wires are often
                                            modeled by vertices and edges in a graph.  In order to produce a more efficient
                                            wiring scheme extra vertices, called Steiner points, may be added allowing for
                                            cheaper solutions.  To solve this problem, we realize that the only points that
                                            need be considered share x and y coordinates with the given points.  For example,
                                            if the points given are (5,5), (0,0) and (10,0) the x-coordinate of added points
                                            must be 0, 5, or 10, where as the y-coordinate must be 0 or 5.  Since the maximum
                                            number of input points is 5, the largest number of added points we have to consider
                                            is 25.  In addition, we will never need more than 5 added points to solve this
                                            problem, so we can check all subsets of these 25 elements up to 5 elements
                                            determining which set of added points produces the best answer.  Each time we
                                            want to check, we can run a minimum spanning tree algorithm such as Prim's
                                            algorithm.
                                        </p>
                                        <p>&#160;</p>

                                        <IMG SRC="/i/m/brett1479_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;brett1479
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/tc?module=MemberProfile&amp;cr=251317" CLASS="smallText">Author Profile</A>
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
