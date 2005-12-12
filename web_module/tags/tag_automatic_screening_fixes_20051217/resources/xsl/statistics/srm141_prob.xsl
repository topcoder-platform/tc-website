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
                                        
                                        <p><b>Single Round Match 141</b><br/>
                              Thursday, April 10 2003 
                              </p>
                              
                                       <P><B>Problem Set Analysis &amp; Opinion</B></P>
                        <p>
                        SnapDragon brought his A game to this match, beating everyone by over 200 points. Most people were 
                        able to get the first two problems, but dynamic programming is always a little tricky, and after 
                        solving the first two problems, few people had time to finish the third. sjelkjd also showed why 
                        he made it to the CC finals, taking second overall, helped largely by his 4 successful challenges. 
                        Over in Division 2, first timer dary also won by over 200 points, with three fast submissions, and 
                        a challenge.</p>
                        
                        <font size="+2"><b>StatementCounter</b></font><BR />
                        Used as: Division II - Level 1:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">250</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">212/227  (93.39%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">195/212  (91.98%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Ceranith</b> for 249.20 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        Once your realize what the problem is asking for, it is pretty trivial. All you have to 
                        do is count the number of semicolons in a String[] (vector &lt;string>). So, its just two nested 
                        loops, and then a check to see if a character is a semicolon.
                        </p>
                        
                        
                        <font size="+2"><b>PrioritySort</b></font><BR />
                        Used as: Division II - Level 2:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">500</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">108/227  (47.58%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">47/108  (43.52%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Sabu</b> for 464.99 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        This problem was a little bit tricky if you didn't know the sorting functions in your language of 
                        choice. The simplest way to do it was to write a comparator function and then use Arrays.sort() 
                        in Java or stable_sort() in C++. Your comparator method can be made pretty simple, since all of 
                        the numbers are exactly one character. This causes the ith number in the string to be character 2*i. 
                        So, you could just loop through all the elements of priorities, and compare the appropriate 
                        characters - no tokenizing required. 
                        </p>
                        
                        <FONT size="+2"><B>Widget</B></FONT><BR />
                        Used as: Division-II, Level 3: 
                        <BLOCKQUOTE>
                    <TABLE cellspacing="2" cellpadding="2">
                     <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>Value</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText">1000</TD>
                     </TR>
                   <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText">37 / 227 (16.30%) </TD>
                     </TR>
                   <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText">28 / 37 (75.68%)</TD>
                     </TR>
                     <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>dary</B> for 782.05 points</TD>
                     </TR>
                     </TABLE>
                     </BLOCKQUOTE>
                     <BR />
                     Used as: Division-I, Level 2: 
                  <BLOCKQUOTE>
                   <TABLE cellspacing="2" cellpadding="2">
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee">500</TD>
                     </TR>
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee">93 / 127 (73.23%) </TD>
                     </TR>
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee">79 / 93 (84.95%)</TD>
                     </TR>
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>ZorbaTHut</B> for 468.58 points</TD>
                     </TR>
                     </TABLE>
                     </BLOCKQUOTE>
<p>
<b>Implementation</b><br />
Widget layout can be a pretty complicated problem, especially when you have 
widths that are percentages, and you want all of the coordinates to be relative 
to the window size. However, this problem simplified widget layout be forcing 
all of the lines to be either in absolute positions, or else offset an absolute 
amount from another line. Also, since there were no dependency loops, a straight 
recursive approach allowed you to easily find the coordinates of the edges in 
question. If the edge is relative to another edge, then recursively find the 
position of that edge, and then add the offset, to get the position for the edge 
you want. If the position of an edge is not relative to any other edge, then you 
are done, and can just return the position. Using this approach, you can easily 
find the location of any edge. The last thing you have to do is a little error 
checking. First, go through all vertical and horizontal edges, and make sure 
they are not at negative positions. Last, find the coordinates of the widget, 
and make sure that the right is to the right of left, and the top is above 
bottom. If everything checks out, just return the location of the widget. 
</p>

                  <font size="+2"><b>Bounce</b></font><BR />
                        Used as: Division I - Level 1:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">250</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">118/127  (92.91%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">103/118  (87.29%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Yarin</b> for 236.85 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        This problem required you to do a little bit of physics, and to determine at what integral speed a 
                        bouncing ball would be above a certain height after traveling a certain distance. The obvious thing 
                        to do is to loop through every speed, starting at 1. You then have to determine the amount of time 
                        the ball will take to reach the other building, at each speed (time = distance / velocity). 
                        If the time is less than 5, there is no way that the ball will bounce before getting to the 
                        other building, and you should return -1. Next, since the ball first bounces after 5 seconds, 
                        subtract 5 from the time. Now, the ball bounces every 10 seconds, so take the remaining time 
                        modulo 10. This gives us the amount of time the ball has been in the air after the last bounce. 
                        We then plug this into the formula given in the problem statement (Y = 50*b +g*b*b/2), and if Y 
                        is greater than height, return the current speed. 
                        </p>
                        
                        <font size="+2"><b>LazyGuitar</b></font><BR />
                        Used as: Division I - Level 3:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">1000</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">19/127  (14.96%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">10/19  (52.63%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 715.61 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        SnapDragon showed why he is the highest rated TopCoder by destroying the competition on this problem. 
                        The first thing that should always pop into your mind when you see a problem like this is Dynamic 
                        Programming. We clearly can't try all possible sequences of positions, so we must come up with some 
                        recurrence about how the cumulative cost after playing a chord in a particular position depends on 
                        the costs of the previous chord. If you are experienced with dynamic programming, you shouldn't have 
                        too much trouble seeing that:</p><pre>

if(chord i can be played in position j)
  cost(i,j) = min over k(cost(i-1,k)+abs(j-k)+(1 if j!=k))
else
  cost(i,j) = infinity

</pre>
                  <p>Where cost(i,j) represents the cost of playing i+1 chords, and ending up in position j. Since we can 
                  start in any position, when i = 0, we have cost(0,j) = 0 if chord 0 is playable in position j, and cost
                  (0,j) = infinity otherwise. The recurrence is pretty easy to implement, and all that we have left to 
                  do is write a function to determine if a chord can be played in a given position. At first glance, 
                  it seems that a greedy approach to assigning notes would work, but then you have the open notes, 
                  which make things tricky. Since there are only 6 strings, the simplest way to determine if a chord 
                  is playable is probably just to try all possible assignments of notes to strings. 6! is pretty small, 
                  so timeout shouldn't be an issue. Then, all you have to do is figure out what to return. Since you can 
                  end in any position, you want to return the minimum cost for any position to have played all chords. 
                  If this value is infinity, return -1.<br />
                  One noteworthy thing to watch for is that there are only 24 frets. So, if position is 23, you can 
                  only use frets 23 and 24. It turns out that there is no reason to ever be in a position above 21. 
                        </p>




      

                                       

                                         <IMG SRC="/i/m/lbackstrom_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                       By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
                                       
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
