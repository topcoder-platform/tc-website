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


<P><B>Problem Set Analysis &amp; Opinion</B></P>
<p>  Tension builds as we get closer and closer to the finals.  This round, the Regional Quarterfinals, proved to be
    one of the most interesting to date.  After 15 minutes only a few competitors submitted the easy problem, a
    departure from the normal frantic pace.  John Dethridge, the top ranked competitor, was seemingly unfazed by
    the problem set.  He sped through all 3 problems winning the round by a margin.  Quite amazingly he finished
    both the easy and the hard before second highest ranked coder Yarin submitted his first problem.  As time passed
    many coders finished the treacherous easy and were able to complete the rest of the problems.  Although slightly
    troubled by the easy problem, Reid finished off the rest of the set with ease propelling him to second place.
    Previous tournament champions jonmac and dmwright are both returning to top form winning their respective rooms.

</p><font size="+2"><b>Champagne</b></font><BR/>
Used as: Division 1 - Level 1:
<blockquote>
  <table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">300</td></tr>
    <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">168 / 273  (61.54%) </td></tr>
    <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">100 / 168  (59.52%)</td></tr>
    <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>John Dethridge</b> for 272.77 points</td></tr>
  </table>
</blockquote>

<p>
    One popular way to solve this problem involves building an array of the entire champagne glass tower simulating
    the process second by second.  At the beginning of each iteration pour 1 unit of champagne into the first glass.
    Then loop through the entire tower searching for spills.  If a spill occurred, distribute its contents to the two
    glasses below it.  An optimization on this method involves pouring all of the champagne into the first glass all
    at once, and processing the rest of the tower as before.  Some other coders used recursive methods that similarly
    handled spillage and distribution of champagne.  An easy way to deal with the required fractional amounts was to
    pick some arbitrarily large power of 2 and store all glass contents as fractions of that amount.  2^23 would have
    been more than sufficient for all of the possible tower sizes.  At the end a call to a GCD function would reduce
    the fraction producing the correct results.  This method avoids the use of any floating points values.

</p>
<font size="+2"><b>Marketing</b></font><BR/>
Used as: Division 1 - Level 2:
<blockquote>
    <table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">99 / 273  (36.26%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">66 / 99  (66.67%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>sjelkjd</b> for 448.58 points</td></tr>
    </table>
</blockquote>

<p>
    The problem requirements cleanly map to a pair of concepts in the field of graph theory.  Splitting the marketed
    products equally to two consumer groups corresponds to the notion of bipartite or 2-colorable graphs.  Once a
    graph is determined to be bipartite one must determine the number of distinct connected components in order to
    calculate the flexibility present in marketing schemes.  2-colorability is quickly verified using a depth first
    search that colors each adjacent vertex with a different color.  If you ever try to color the same vertex twice
    with a different color each time, the graph is not bipartite and your method can return -1 immediately.  To
    determine the number of components a depth first search will suffice again.  A single call to the search on a
    particular vertex will identify all reachable vertices.  Repeating this process until all vertices have been
    reached one way or another will produce the number of components.  2 raised to this number is the number of
    possible ways to market the products.
</p><font size="+2"><b>Macros</b></font><BR/>
Used as: Division 1 - Level 3:
<blockquote>
    <table cellspacing="2"><tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">39 / 273  (14.29%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">18 / 39  (46.15%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>John Dethridge</b> for 888.44 points</td></tr>
    </table>
</blockquote>

<p>
This problem is related to a well known algorithm in formal language theory that determines which strings are
    derivable from a given grammar.  The existence of this algorithm, called CKY after its inventors, proves that
    the membership problem for context-free languages is decidable.  Using dynamic programming this algorithm
    determines which non-terminals (called Variable Characters in the problem) can produce fragments of the string,
    and then builds the entire string from these fragments.  For example, lets say the string was &quot;abba&quot;.
    The algorithm would first determine which 2 character substrings can be produced by the given rules and how they
    are produced, i.e. whether ab, bb, and ba can be derived and which non-terminals can produce them.  Using that
    information it tries produce the 3 character substrings.  This continues until it determines which non-terminals
    can produce the entire string.
</p>




                                        <IMG SRC="/i/m/brett1479_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;brett1479
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/stat?c=member_profile&amp;cr=251317" CLASS="smallText">Author Profile</A>
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
