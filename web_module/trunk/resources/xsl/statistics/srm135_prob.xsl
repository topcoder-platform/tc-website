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


<B>Single Round Match 135</B><BR/>Tuesday, February 11 2003
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<p>
    The last competition before the Collegiate Championship went off without a hitch.   Well over 400 competed in what
    turned out to be a very exciting match.  In Division 1 it was a close race between all of the top rated competitors.
    Lunatic Fringe came out early finishing the easy and medium problems before anyone.  At one point yellow rated
    coders led all of the rooms.  This slowly changed as Yarin, John Dethridge, and Ambrose came through - submitting
    their solutions to the hard problem.  Despite their efforts, Modulator, a yellow rated competitor, emerged from the
    coding phase with the highest score.  In the challenge phase, the top position exchanged numerous times between
    Yarin and Modulator.   Once the system testing had completed, Yarin prevailed with one of the few correct solutions
    to the hard problem.
</p>

<p>
    Division 2 had similar intensity.  Many of the higher rated coders raced through the easy and medium problems to be
    faced with a difficult hard - a permutation problem where timing out was a factor.  A number of submissions were
    made, but in the end only two Division 2 coders successfully completed it.  Mishagam came out on top with 1353
    points and is now competing as a Division 1 coder.
</p>

                                        <a name="Defragment"></a><font size="+2"><b>VideoCrypto</b></font><br/><font size="-1">
                                            Used as: Division-II, Level 1
                                                    :<blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;"><b>Value</b></td>
                                        <td style="background: #eee;">300</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;"><b>Submission Rate</b></td>
                                        <td style="background: #eee;">212 / 247 (85.83%)</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;"><b>Success Rate</b></td>
                                        <td style="background: #eee;">190 / 212 (89.62%)</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;"><b>High Score</b></td>
                                        <td style="background: #eee;"><b>Jwizard </b> for 282.60 points</td>
                                        </tr>
                                        </table></blockquote></font>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>


<p>
    In this problem coders were presented with a unique encryption/decryption scheme for black and white pictures.  Given
    the secret key and cyphertext(both pictures), competitors were required to juxtapose the two images and determine
    which spots would be colored in decrypted image.  As explained in the problem, this required a scan through the
    joint image only retaining the color where both a even and immediately following odd numbered column were both
    colored.  This directly translated into 2 for loops: the outer for the rows of the image, and the inner for the
    columns.  The inner was incremented 2 each time to check a group of even and odd blocks per iteration.
</p>


                                        <a name="Defragment"></a>
                                        <font size="+2"><b>Plates</b></font><br/><font size="-1">
                                            Used as: Division-II, Level 2 :
                                        <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;"><b>Value</b></td>
                                            <td style="background: #eee;">550</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Submission Rate</b></td>
                                            <td style="background: #eee;">111 / 247 (44.94%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Success Rate</b></td>
                                            <td style="background: #eee;">68 / 111 (61.26%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>High Score</b></td>
                                            <td style="background: #eee;"><b>jdandr2 </b> for 509.98 points</td>
                                        </tr>
                                        </table></blockquote></font>

                                        <font size="-1">
                                            Used as: Division-I Level 1 :
                                        <blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;"><b>Value</b></td>
                                            <td style="background: #eee;">250</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Submission Rate</b></td>
                                            <td style="background: #eee;">157 / 172 (91.28%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Success Rate</b></td>
                                            <td style="background: #eee;">130 / 157 (82.80%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>High Score</b></td>
                                            <td style="background: #eee;"><b>radeye </b> for 248.28 points</td>
                                        </tr>
                                        </table></blockquote></font>

                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>

<p>
    As described in the problem, license plates have a distinct format composed of letters and digits.  Supposing that
    license plates were assigned lexicographically (dictionary ordering) coders were asked to calculate how many
    license plates could still be generated given the format and the last assigned plate.  To quickly calculate the
    remaining values one could transform the given plate number into a numeric value.  This is done by realizing the
    letter digits of the plate are base 26 values whereas the digits are base 10.  A string of multiplications quickly
    determines the necessary number.  For example, lets say you had the license plate "9448".  Since all are digits,
    all represent base 10 values.  The calculation goes as follows: ((9*10+4)*10+4)*10+8) = 9448.  The multiplications
    have been written out explicitly so the loop structure of the resulting code could be inferred.  Another example
    may be "AB98A" whose calculation would be:
(((0*26+1)*10+9)*10+8)*26+0 where 'A' and 'B' are treated as 0 and 1 respectively.  As illustrated here, a loop that
    tests whether each character is a digit and multiplies by 10 or 26 accordingly produces the correct result.
</p>

                                        <a name="Defragment"></a><font size="+2"><b>Marriage</b></font><br/><font size="-1">
                                            Used as: Division-II, Level 3
                                                    :<blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;"><b>Value</b></td>
                                            <td style="background: #eee;">1000</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Submission Rate</b></td>
                                            <td style="background: #eee;">22 / 247 (8.91%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Success Rate</b></td>
                                            <td style="background: #eee;">3 / 22 (13.64%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>High Score</b></td>
                                            <td style="background: #eee;"><b>mishagam </b> for 601.63 points</td>
                                        </tr>
                                        </table></blockquote></font>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>

<p>
    This problem asked coders to arrange marriages between a group of men and women given how they felt about each
    other.  The input contained the satisfaction values each person would receive for marrying a particular mate.  By
    computing every permutation of mates and selecting the highest sum we arrive at our answer.  The only catch is,
    avoid marriages that produce negative satisfaction values.  This is done via a check in the recursion as seen in
    the reference implementation.  To avoid timing out, make sure you eliminate the people you have married together
    from future recursive steps.  This can be done via a boolean array that marks who has already been married.
</p>

                                        <a name="Defragment"></a><font size="+2"><b>Clusters</b></font><br/><font size="-1">
                                            Used as: Division-I, Level 2
                                                    :<blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;"><b>Value</b></td>
                                            <td style="background: #eee;">450</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Submission Rate</b></td>
                                            <td style="background: #eee;">128 / 172 (74.42%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Success Rate</b></td>
                                            <td style="background: #eee;">48 / 128 (37.50%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>High Score</b></td>
                                            <td style="background: #eee;"><b>Lunatic Fringe </b> for 385.21 points</td>
                                        </tr>
                                        </table></blockquote></font>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>


<p>
    The clustering coefficient of a particular vertex in a graph is the ratio between how many of its neighbors are
    connected and how many of its neighbors could be connected.  This type of analysis is typically used in
    acquaintance graphs that study social patterns and thus the "friendship" analogy may be helpful here.  If someone
    has a high clustering coefficient it means, in general, that many of his/her friends are friends with each other.
    In this example, the "linkage" analogy was used as is sometimes done in search engines.  A web page would receive
    a high clustering score if the pages it links to were highly interlinked.  To solve this problem you dump all of
    the input into a large adjacency matrix and iterate through it.  For each vertex determine all of its neighbors,
    and count how many edges they had between them.  Dividing this value by
    n*(n-1) (number of total possible directed edges between n vertices) will produce the clustering coefficient.
    To avoid rounding issues it can be easier to leave the values in numerator/denominator format and compare accordingly.
</p>

                                        <a name="Defragment"></a><font size="+2"><b>CircleHighway</b></font><br/><font size="-1">
                                            Used as: Division-I, Level 3
                                                    :<blockquote><table cellspacing="2">
                                        <tr>
                                            <td style="background: #eee;"><b>Value</b></td>
                                            <td style="background: #eee;">950</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Submission Rate</b></td>
                                            <td style="background: #eee;">27 / 172 (15.70%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>Success Rate</b></td>
                                            <td style="background: #eee;">5 / 27 (18.52%)</td>
                                            </tr>
                                            <tr>
                                            <td style="background: #eee;"><b>High Score</b></td>
                                            <td style="background: #eee;"><b>Yarin </b> for 701.43 points</td>
                                        </tr>
                                        </table></blockquote></font>
                                        Reference Implementation: brett1479 in practice room
                                        <h4>Implementation</h4>

<p>
    The last thing you want to do in Siberia is push your car.  To minimize the agony of such an experience this problem
    asked for the minimum amount of initial pushing that would be required to allow your vehicle to make one complete
    1000km pushless trip around the track.  Gas stations along the way were low on gas and could not always be counted
    on for help.  In addition, the car's tank can only holds enough gas to travel 500km so poorly placed gas stations
    could ruin any chances of success.  One of the easier solutions was to assume your were in the correct starting
    position and simulate a test run.  If you failed, record how much you failed by, push the car that distance, and
    repeat the process.  After iterating this process 10 or so times, if you still haven't found a solution, place your
    car at the next gas station and try again.  This strategy was used in the reference implementation.
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
