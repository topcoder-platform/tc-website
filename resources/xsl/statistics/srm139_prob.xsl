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
                                        <BR />
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
                                        <BR />
                                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->

                                       	<P><B>Problem Set Analysis &amp; Opinion</B></P>
                                       	<p>
										This round of the Collegiate Championship was clearly a notch more difficult than all previous rounds.  
										bstanescu, the only competitor to sucessfully complete the hard problem, received the highest score 
										for the round.  Along with the the challenging hard, coders were faced with an incredibly tricky medium 
										problem.  The 550 caught many competitors by surprise with its unusual style.  The easy problem, 
										a relatively simple dynamic programming exercise, would have been a medium had it been a normal SRM.  
										If this round is any indication of the future, competitors will need to be in top form to score above 
										1000 in the upcoming rounds.
										</p>
										<font size="+2"><b>ChessMetric</b></font>
										<BR />
										Used as: Division 1 - Level 1:
										<blockquote><table cellspacing="2">
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Value</b></td>
										<td style="background: #eee;" class="bodyText">250</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
										<td style="background: #eee;" class="bodyText">47 / 50  (94.00%)</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
										<td style="background: #eee;" class="bodyText">42 / 47  (89.36%)</td>
										</tr>
										<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td>
										<td style="background: #eee;" class="bodyText"><b>Yarin</b> for 240.21 points</td>
										</tr></table></blockquote>
										<p>
										The most popular way to solve this problem uses dynamic programming. First, set up a 
										2-dimensional array that represents the board. Each element of the array will signify 
										how many ways there are of reaching a given square.  In other words, after the ith iteration 
										of our loop, a particular element in the array will represent how many ways there are of reaching 
										the corresponding square in i moves.  To initialize the array, all elements should be 0 except the 
										start square which should be 1. We then loop over the number of moves, using the array from the 
										previous iteration to produce the array for the next iteration.</p>

										<font size="+2"><b>TileMatch</b></font>
										<BR />
										Used as: Division 1 - Level 2:
										<blockquote><table cellspacing="2">
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Value</b></td>
										<td style="background: #eee;" class="bodyText">550</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
										<td style="background: #eee;" class="bodyText">26 / 50  (52.00%)</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
										<td style="background: #eee;" class="bodyText">14 / 26  (53.85%)</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
										<td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 378.71 points</td>
										</tr></table></blockquote>
										<p>
										At first glance, it may appear that a brute force solution trying combinations of removals would be 
										the way to solve this problem, but the size of the inputs makes such a method infeasible.  
										Instead of blindly trying removals, we can directly calculate which colored tiles are causing 
										problems.  By looping over the border of the given tile, we can check, for each square on an edge, 
										what squares it can come into contact with.  For each of the non-corner squares, this involves 
										checking 12 possible adjacencies that can occur given any rotation of the tile.  For corner squares 
										we must also check 12 possible adjacencies at each of the corners. If we ever find a colored square 
										that does not have a colored adjacent square we must uncolor that square. We return the total number 
										of squares that need be uncolored.
										</p>
										<font size="+2"><b>Optimizer</b></font>
										<BR />
										Used as: Division 1 - Level 3:
										<blockquote>
										<table cellspacing="2">
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Value</b></td>
										<td style="background: #eee;" class="bodyText">1000</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
										<td style="background: #eee;" class="bodyText">5 / 50  (10.00%) </td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
										<td style="background: #eee;" class="bodyText">1 / 5 (20.00%)</td>
										</tr>
										<tr>
										<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
										<td style="background: #eee;" class="bodyText"><b>bstanescu</b> for 428.07 points</td>
										</tr></table></blockquote>
										<p>
										This question, although more straightforward than the medium, requires more code to complete.  
										Given the grammar of the problem language, we construct a recursive descent parser that will 
										produce a parse tree of the input.  This basically involves building a function for each production 
										in the grammar.  Some tricks are: 1) arranging the grammar such that multiplication has higher precedence 
										than addition, 2) removing left recursion from the grammar (productions of the form ( N -&gt; N... ).  
										The grammar in this problem is easy enough that these two steps are almost automatic.  Once the parser 
										has built a tree, we can traverse it producing the required optimizations.  The easiest transformations 
										are the identity and annihilation properties: multiply by 1, add 0, multiply by 0.  If we find any of 
										these in the grammar we can simply cut off tree branches.  Another easy transformation changes subtrees 
										of the form "(Number)" to a leaf "Number".  In other words, performs the unparenthesizing of numbers.  
										The most complicated transformation requires the isolation of subtrees that consist of multiplications.  
										Such subtrees can be replaced by a simpler subtree resulting from applying all associativity rules.  
										A similar transformation can be performed on subtrees consisting of additions and variable multiplications.  Repetitive use of these transformations in a bottom up manner will give us the optimized tree.  A final count of the number of multiplies and adds contained in the tree will produce the answer.
										</p>
                                       
                                        <IMG SRC="/i/m/brett1479_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;brett1479
                                        <BR />
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR />
                                            <A HREF="/stat?c=member_profile&amp;cr=251317" CLASS="smallText">Author Profile</A>
                                        </DIV>
                                        <BR CLEAR="all"/>
                                        <P>
                                            <BR />
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
                            <BR />
                            <!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
                            <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR />
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
