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
                                        
                                        <p><b>Single Round Match 139</b><br/>
										Tuesday 18, March 2003 
										</p>
										
                                        <P><B>Problem Set Analysis &amp; Opinion</B></P>
										<p>
										This SRM featured a set of unique problems that gave many coders a hard time.  The division 
										1 medium, a numerical analysis problem, had a few tricks that caught many competitors.  
										The division 1 hard asked coders to embed a path on the surface of a rectangular solid.  
										At first glance, the problem seems trivial, but rectangular solids aren't as simple as they look.  
										As a result, few coders solved all of the problems correctly.  Once the challenge phase was over, 
										antimatter led the pack with SnapDragon close behind.  In division 2, a newcomer by the name of 
										aneubeck beat all competitors with an impressive 1673.43. 
										</p>
										<font size="+2"><b>Serpentine</b></font><br/>
										Used as: Division 2 - Level 1:
										<blockquote>
										<table cellspacing="2">
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Value</b></td>
												<td style="background: #eee;" class="bodyText">350</td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
												<td style="background: #eee;" class="bodyText">137 / 175  (78.29%) </td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
												<td style="background: #eee;" class="bodyText">87 / 137  (63.50%)</td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
												<td style="background: #eee;" class="bodyText"><b>aneubeck</b> for 336.53 points</td>
											</tr>
										</table>
										</blockquote>
										
										<p>
										To solve this problem we have to keep track of the position in the current row, and which direction 
										the row is going.  Using these two pieces of information we can calculate our column and thus 
										produce the returned string.  Code such as this will do the trick:
										</p>
										<pre>
String column(String s, int width, int index) {
	String ret = "";
	for (int pos = 0, col = 0, dir = 1; pos &lt; s.length(); col+=dir) {
		if (col&lt;0 || col &gt;= width) dir = -dir;
		else {
			if (col == index) ret+=s.charAt(pos);
			pos++;
		}
	} return ret;
}
										</pre>
										

										<font size="+2"><b>HalfRange</b></font><br/>
										Used as: Division 2 - Level 2:
										<blockquote>
										<table cellspacing="2">
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Value</b></td>
												<td style="background: #eee;" class="bodyText">500</td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
												<td style="background: #eee;" class="bodyText">99 / 175  (56.57%) </td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
												<td style="background: #eee;" class="bodyText">60 / 175  (60.61%)</td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
												<td style="background: #eee;" class="bodyText"><b>MPhk</b> for 482.69 points</td>
											</tr>
										</table>
										</blockquote>
										
										<p>
										Here we are trying to find the smallest range that contains at least half of the numbers.  I
										t is useful to realize that the bounds of the range must be numbers in the list.  Using 
										this information, we first sort the list.  Then, we loop through checking values that enclose 
										half the list.  The closest pair becomes our range.  This concept is shown in the following code:
										</p>
										<pre>
int halfRange(int[] data) {
	java.util.Arrays.sort(data);
	int start = 0, end = (data.length-1)/2, score = data[end]-data[start];
	for (;end!=data.length;start++,end++) score = Math.min(score,data[end]-data[start]);
	return score;
}
										</pre>
										
										
										<font size="+2"><b>Tourney</b></font><br/>
										Used as: Division 2 - Level 3:
										<blockquote>
										<table cellspacing="2">
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Value</b></td>
												<td style="background: #eee;" class="bodyText">1000</td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
												<td style="background: #eee;" class="bodyText">76 / 175  (43.43%) </td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
												<td style="background: #eee;" class="bodyText">52 / 76 (68.42%)</td>
											</tr>
											<tr>
												<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
												<td style="background: #eee;" class="bodyText"><b>vegeta</b> for 915.05 points</td>
											</tr>
											</table>
											</blockquote>
											
											Used as: Division 1 - Level 1:
											<blockquote>
											<table cellspacing="2">
												<tr>
													<td style="background: #eee;" class="bodyText"><b>Value</b></td>
													<td style="background: #eee;" class="bodyText">300</td>
												</tr>
												<tr>
													<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
													<td style="background: #eee;" class="bodyText">138 / 138  (100.00%) </td>
												</tr>
												<tr>
													<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
													<td style="background: #eee;" class="bodyText">125 / 138 (90.58%)</td>
												</tr>
												<tr>
													<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
													<td style="background: #eee;" class="bodyText"><b>sjelkjd</b> for 296.31 points</td>
												</tr>
											</table>
											</blockquote>
											
											<p>
											The most popular way to solve this involved using 2 lists: a current list, and a next list.  
											Looping through the current list 2 at a time you check for the word "bye".  If you find it, 
											the other team in the pair is added to the back of the next list.  If not, you determine which 
											of the pair to add based on the current element of the winnings parameter.  Once you have 
											exhausted the current list, you assign the next list to the current list, clear the next list, 
											and repeat the process.  The winner is the last team left.
											</p>
											
											<font size="+2"><b>Errors</b></font><br/>
											Used as: Division 1 - Level 2:
											<blockquote>
											<table cellspacing="2">
												<tr>
													<td style="background: #eee;" class="bodyText"><b>Value</b></td>
													<td style="background: #eee;" class="bodyText">500</td>
												</tr>
												<tr>
													<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
													<td style="background: #eee;" class="bodyText">118 / 138  (85.51%) </td>
												</tr>
												<tr>
													<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
													<td style="background: #eee;" class="bodyText">39 / 118 (33.05%)</td>
												</tr>
												<tr>
													<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
													<td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 454.65 points</td>
												</tr>
												</table>
												</blockquote>
												
												<p>
												Given a particular operation to perform, you try every combination of adding or subtracting 
												the error from each operand.  Given all these results you can figure what the maximum and 
												mininum possible values are.  Subtracting the min from the max you arrive at the required 
												range size.  The only catch is the division operation.  If the denominator error 
												(parameter/1000) is greater than or equal to the measured denominator value, 
												the range may potentially be infinite, so return "INFINITY".  Otherwise return the 
												properly formatted result.
												</p>
												
												<font size="+2"><b>Skyscraper</b></font><br/>
												Used as: Division 1 - Level 3:
												<blockquote>
												<table cellspacing="2">
													<tr>
														<td style="background: #eee;" class="bodyText"><b>Value</b></td>
														<td style="background: #eee;" class="bodyText">900</td>
													</tr>
													<tr>
														<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
														<td style="background: #eee;" class="bodyText">50 / 138  (36.23%) </td>
													</tr>
													<tr>
														<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
														<td style="background: #eee;" class="bodyText">12 / 50 (24.00%)</td>
													</tr>
													<tr>
														<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
														<td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 560.64 points</td>
													</tr>
													</table>
													</blockquote>
													
													<p>
													Many tricks lie beneath the surface of this problem even though the solution is very 
													easy to type.  The actual code can comfortably fit on 3 lines.  The basic trick is 
													realizing all possible ways to run the wire when calculating the distances.  The 
													following pictures may illuminate the topic: 
													</p>
													<pre>

Case 1:                      Case 2:                  Case 3:
    _______________          ________________         |     |      |
   |       |       |        |Top    |Right            |     |      |
   |Front  |Right  |        |_______|________         |Back |Right |
   |       |       |        |Front  |                 |_____|______|
   |       |       |        |       |                 |Top  |
   |       |       |        |       |                 |_____|
                                                      |Front|
                                                      |     |
                                                      |     | 

Case 4:                            Case 5:                      
__________                         
Right     |                        |      | 
__________|_______                 |      |
Back      |Top    |                |Right |         
__________|_______|_______         |______|
          |Left   |Front  |        |Top   |
          |       |       |        |______|______
          |       |       |        |Left  |Front |
          |       |       |        |      |      |
          |       |       |        |      |      |
                                   |      |      |
													
													</pre>                                        
													
													<p>
													Each picture above represents one of the cases that must be considered when measuring the 
													distance from a point on the front, to a point on the right.  In each picture above, 
													the rectangular solid has been taken apart and laid flat to illuminate the way to measure 
													the distance.  The following code handles all 5 of these cases:
													</p>
													<pre>
int dist(int x1, int y1, int x2, int y2) { return (int)Math.ceil(Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)));}
int wire(int w, int x, int y, int xx, int yy) {
	return Math.min(dist(x,y,200+xx,yy),Math.min(dist(x,y,200+yy,-xx),
		   Math.min(dist(x,y,200+w-xx,-w-yy),Math.min(dist(x,y,-xx,-200-yy),dist(x,y,-w-yy,-200-w+xx)))));
}
													</pre>
													

                                       

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
