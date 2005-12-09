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


                                        <P>
                                            <B>Problem Set Analysis &amp; Opinion</B>
                                        </P>
                                        <p>
                                            The phrase "March Madness" best describes the last SRM.  Over 15% of the division 1 competitors submitted the hard problem, but only 2 passed systests.  SnapDragon, who won the competition, resubmitted the hard problem twice, and eventually won by successfully challenging 5 of the coders in his room.  "I didn't even check the last [challenge], I just went for the sweep" said SnapDragon, after sucessfully challenging all of the div 1 hards in his room.  schveiguy, the second place finisher, had the highest problem score but could not top SnapDragon's challenge round performance.  Division 2 coders faced similar difficulties, with only 10 coders passing systests on the hard problem.

                                        </p>
                                        <font size="+2">
                                            <b>MedianOfMedians</b>
                                        </font>
                                        <BR></BR>
                                        Used as: Division 2 - Level 1:
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
                                                    <td style="background: #eee;" class="bodyText">204 / 227  (89.87%) </td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">175 / 204  (85.78%)</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>koder</b> for 247.71 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>
                                            The most straightforward way to solve this problem involved sorting each of the rows given.  Extracting the second element from each of these sorted rows will produce a new list of 3 elements.  Sorting this list, and taking the second elment will produce the result.  Coders need not convert the given input to integer values until the very end, since sorting the characters will produce the same results.</p>

                                        <font size="+2">
                                            <b>PQNumbers</b>
                                        </font>
                                        <BR></BR>
                                        Used as: Division 2 - Level 2:
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
                                                    <td style="background: #eee;" class="bodyText">115 / 227  (50.66%) </td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">52 / 115  (45.22%)</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>sh_maestro</b> for 444.07 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>

                                            Given 2 numbers we are going to consider the possible values generated by multiplying powers of them together.  In other words, given numbers p and q we are going to consider values of the form p^k * q^j.  Since we are guaranteed that all necessary values will be no greater than 1 million, we can loop through all possible exponents of p and q, and store all of the products, ignoring any values that are greater than 1 million.  All of the generated values can be thrown into a sorted set structure whereby, the nth largest value is easily extracted.
                                        </p>
                                        <font size="+2">
                                            <b>ViscoverExpress</b>
                                        </font>
                                        <BR></BR>
                                        Used as: Division 2 - Level 3:
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
                                                    <td style="background: #eee;" class="bodyText">26 / 227  (11.45%) </td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">10 / 26 (38.46%)</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td style="background: #eee;" class="bodyText">
                                                        <b>omasoud</b> for 543.91 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                    <p>

                                    </p>
                                    Used as: Division 1 - Level 2:
                                    <blockquote>
                                        <table cellspacing="2">
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Value</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">450</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Submission Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">114 / 132  (86.36%) </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Success Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">76 / 114 (66.67%)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>High Score</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Yarin</b> for 424.08 points
                                                </td>
                                            </tr>
                                        </table>
                                    </blockquote>
                                    <p>

                                        An intuitive way to solve this problem is to first write a "numberCheck" method.  This function takes a string of 16 digits and return true or false depending on whether the value checked out.  Such a method loops through the string, summing up the digits (multiplying by 2 where necessary).  If the resulting sum is 0 mod 10 return true.  Once this helper method is written, the main function can try to generate all possible errors, detecting which ones produce valid numbers.  The "at most 1 incorrect digit" error can be produced by replacing each number with any possible digit.  The transposition errors can be produced by trying every swap.

                                    </p>
                                    <font size="+2">
                                        <b>Rendezvous</b>
                                    </font>
                                    <BR></BR>
                                    Used as: Division 1 - Level 1:
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
                                                <td style="background: #eee;" class="bodyText">120 / 132  (90.91%) </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Success Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">81 / 120 (67.50%)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>High Score</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>antimatter</b> for 295.07 points
                                                </td>
                                            </tr>
                                        </table>
                                    </blockquote>
                                    <p>

                                        Solving this problem basically comes down to solving a system of equations.  The two pieces start at (0,0) and (x,y).  They change position by &lt;DX,DY&gt; and &lt;dx,dy&gt; respectively each turn.  To find the first place they could meet we must solve the equations: t*DX = x+t*dx  and t*DY = y+t*dy  where t is the turn number.  Solving for DX and DY in these equations we get: DX = x/t + dx and DY = y/t + dy  where t!=0.  A hint was given that we only need check a finite range of positions to rule out all possibilities.  Looping through all t values will quickly find the result.  Alternate methods which loop over DX and DY values can work as well.

                                    </p>
                                    <font size="+2">
                                        <b>TextileDetective</b>
                                    </font>
                                    <BR></BR>
                                    Used as: Division 1 - Level 3:
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
                                                <td style="background: #eee;" class="bodyText">21 / 132  (15.91%) </td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>Success Rate</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">2 / 21 (9.52%)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>High Score</b>
                                                </td>
                                                <td style="background: #eee;" class="bodyText">
                                                    <b>schveiguy</b> for 629.15 points
                                                </td>
                                            </tr>
                                        </table>
                                    </blockquote>
                                    <p>

                                        This problem, although relatively easy in nature, had many tricks and cases increasing its difficulty tremendously.  When a problem breaks into numerous cases, it no longer becomes easy to envision an entire solution.  Handling each case in seclusion simplifies matters, but how does one define these cases, and are they separable?  Both are questions not so easily answered.</p>
                                    <p>
                                        The first issue to be dealt with in this problem is the color of the weft thread.  Once chosen, other pieces fall into place.  Many methods exist, but the simplest is probably looping through all possible colors.  If one turns out infeasible, just continue, and try the next.  Given the color of the weft thread, we can determine the color of each warp thread.  One square at a time, we loop through the fabric determining which columns should be raised, and which lowered in each row.  During this process, we verify that each row and column has at least one raised and one lowered color as the problem states.  If everything checks out we are nearly done.  One case remains: warp threads that share the same color as the weft thread.  We will call columns with this condition weft columns.  If all columns are weft columns (a fabric of a single color) we will still need 2 harnesses to drive the machine.  If only some are weft columns but every row has been accounted for (every row contains at least 1 raised or lowered harness at some point) all of these weft columns can be attached to preexistant harnesses.  Finally, if there are rows that still require a raised or lowered harness at some point, the extra weft columns can fill this gap adding 1 to the total number of required harnesses.  Having considered all cases (there are alot) the result produced is the correct number of harnesses.  </p>
                                    <p>
                                        In summary, we first choose a weft thread color, then we determined the weft and non-weft columns.  Using this information we can determined the lowered and raised status of each square in the weft columns.  If certain rows still do not meet the 1 lowered 1 raised criteria, the weft columns can fill that gap, otherwise we are done.  The only other hitch, is that certain invalid setups must be checked.  For example, a column with 3 different colors must produce a return value of -1.
                                    </p>


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
