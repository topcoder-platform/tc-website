<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/schedule/public_schedule_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Schedule</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
              <!-- Left Column Include Begins -->  
              <!-- Global Seconday Nav Begins -->  
              <xsl:call-template name="public_schedule_left"/>
              <!-- Global Seconday Nav Ends -->      
              <!-- Left Column Include Ends -->          
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
            <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
              <xsl:for-each select="/TC/SCHEDULE/Contests/Contest[ContestId=$contestId]">
                <xsl:call-template name="BodyTop">
                  <xsl:with-param name="image1">white</xsl:with-param>
                  <xsl:with-param name="image">schedule</xsl:with-param>
                  <xsl:with-param name="title"><xsl:value-of select="ContestName"/></xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                <TR>
                  <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
                  <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                    <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

                    <TABLE WIDTH="400" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center">
                      <TR><TD COLSPAN="3" ALIGN="center"><IMG SRC="/i/clear.gif" ALT="" WIDTH="428" HEIGHT="10" BORDER="0" /></TD></TR>


                      <xsl:for-each select="/TC/SCHEDULE/Contests/Contest[ContestId=$contestId]">
                        <xsl:variable name="start_hr">
                          <xsl:value-of select="number(substring(ContestStartTimestamp,12,2))"/>
                        </xsl:variable>
                        <xsl:variable name="start_min">
                          <xsl:value-of select="substring(ContestStartTimestamp,15,2)"/>
                        </xsl:variable>
                        <xsl:variable name="am_pm">
                          <xsl:value-of select="substring(ContestStartTimestamp,21,2)"/>
                        </xsl:variable>
                        <TR>
                          <TD COLSPAN="3" ALIGN="center">
                            <xsl:choose>
                              <xsl:when test="ContestId='4175'">
                                <a href="Javascript:sponsorLink('http://www.topcoder.com/contest/citrix.html')"><IMG SRC="/i/srm91_citrix.jpg" ALT="" WIDTH="414" HEIGHT="172" BORDER="0" /></a>
                              </xsl:when>
                              <xsl:when test="ContestId='4185'">
                                <a href="Javascript:sponsorLink('http://www.topcoder.com/contest/citrix.html')"><IMG SRC="/i/srm93_citrix.jpg" ALT="" WIDTH="414" HEIGHT="172" BORDER="0" /></a>
                              </xsl:when>
                              <xsl:otherwise>
                                <IMG SRC="/i/srm_banner.jpg" ALT="" WIDTH="428" HEIGHT="80" BORDER="0" />
                                <TR BGCOLOR="#CCCCCC">
                                  <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Date</B></TD>
                                  <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Registration</B></TD>
                                  <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Start</B></TD>
                                </TR>
                                <TR BGCOLOR="#666666">
                                  <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                                  <b>
                                  <xsl:choose>
                                    <xsl:when test="ContestId='4155'">05/09/2002<br/></xsl:when>
                                    <xsl:when test="ContestId='4160'">05/15/2002<br/></xsl:when>
                                    <xsl:when test="ContestId='4165'">05/18/2002<br/></xsl:when>
                                    <xsl:when test="ContestId='4170'">05/21/2002<br/></xsl:when>
                                    <xsl:when test="ContestId='4175'">05/22/2002<br/></xsl:when>
                                    <xsl:otherwise>
                                      <xsl:value-of select="substring(ContestStartTimestamp,0,11)"/><br/>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  </b>
                                  </TD>
                                  <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                                    <B>
                                      <xsl:choose>
                                        <xsl:when test="ContestId='4155'">7:30 PM</xsl:when>
                                        <xsl:when test="ContestId='4160'">7:30 PM</xsl:when>
                                        <xsl:when test="ContestId='4165'">11:30 AM</xsl:when>
                                        <xsl:when test="ContestId='4170'">7:30 PM</xsl:when>
                                        <xsl:when test="ContestId='4175'">7:30 PM</xsl:when>
                                        <xsl:otherwise>
                                          <xsl:value-of select="$start_hr"/>:<xsl:value-of select="$start_min"/>&#160;<xsl:value-of select="$am_pm"/>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </B>
                                  </TD>
                                  <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                                    <B>
                                      <xsl:choose>
                                        <xsl:when test="ContestId='4155'">9:00 PM <xsl:value-of select="ShortDaylight"/>.</xsl:when>
                                        <xsl:when test="ContestId='4160'">9:00 PM <xsl:value-of select="ShortDaylight"/>.</xsl:when>
                                        <xsl:when test="ContestId='4165'">1:00 PM <xsl:value-of select="ShortDaylight"/>.</xsl:when>
                                        <xsl:when test="ContestId='4170'">9:00 PM <xsl:value-of select="ShortDaylight"/>.</xsl:when>
                                        <xsl:when test="ContestId='4175'">9:00 PM <xsl:value-of select="ShortDaylight"/>.</xsl:when>
                                        <xsl:otherwise>
                                          <xsl:value-of select="number($start_hr)+2"/>:<xsl:value-of select="format-number(number($start_min)-30,'00')"/>&#160;<xsl:value-of select="$am_pm"/>&#160;<xsl:value-of select="ShortDaylight"/>.
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </B>
                                  </TD>
                                </TR>
                              </xsl:otherwise>
                            </xsl:choose>
                          </TD>
                        </TR>

                      </xsl:for-each>
                      
                      
                      <TR><TD COLSPAN="3" ALIGN="center" class="bodyText">
                        <BR/>.:: All times are Eastern Daylight unless noted otherwise ::.<BR/><BR/></TD></TR>
                      <TR><TD COLSPAN="3" ALIGN="center">
                        .:: 
                          <A HREF="JavaScript:arena();" CLASS="bodyTextBig">
                            <b>DOWNLOAD THE ARENA APPLET</b>
                            <BR/><BR/>
                          </A>
                      </TD></TR>
                      <TR><TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
					  <B>Each match has a total prize purse of $10,000</B><BR/>
					  - $500 from each match is donated to <A HREF="/index?t=support&amp;c=charities" CLASS="bodyText">charity</A><BR/>
					  - $100 is paid to the unrated competitor who has the highest points for the match<BR/>
					  - Coders must place with a positive point total to collect their prize.<BR/><BR/>
					  <A HREF="/index?t=support&amp;c=divisions" CLASS="bodyText">More about the Prize structure</A><BR/><BR/>
					  <B>Single Round Match Description</B><UL>
                      <LI>Maximum of 10 coders per room</LI>
                      <LI>Ratings will be adjusted post-match</LI>
                      <LI>Members will be emailed prior to the match with date and time (opt-in)</LI>
                      <LI>Members will be emailed the match results (opt-in)</LI>
                      </UL>
                      The match will feature a mixed programming language format. For each individual problem, the coder will have the option of using either Java or C++ to code the solution. Syntactical knowledge of both languages will be helpful during the challenge phase of each round of competition.<BR/><BR/>
                      <B>Divisions and Ironman Room Assignments:</B><UL>
					  <LI>Members rated 1200 or better compete in Division-I</LI>
					  <LI>Members rated 1199 or lower compete in Division-II</LI>
					  <LI>Members not yet rated compete in Division-II</LI>
                      <LI>Room assignments place members of like divisions together</LI>
                      <LI>Rating changes go into effect in next participated match</LI>
                      <LI>Members who are ineligible to receive prizes, due to age or country restrictions, will be placed in rooms separate from those members who are eligible to receive prizes.</LI></UL>
                      <A HREF="/index?t=support&amp;c=divisions" CLASS="bodyText">More about the Division structure</A><BR/><BR/>
                      <B>Eligibility:</B><BR/><BR/>
                      Open to members meeting the following eligibility requirements:<UL>
					  <LI>Ages 13 and up can compete in any match</LI>
					  <LI>18 and older and meet the following residence requirements to claim cash prizes</LI>
                      <LI>All US* Citizens</LI>
                      <LI>All Lawful Permanent Residents of the US (i.e., Green Card Holders)</LI>
                      <LI>All Citizens and Legal Permanent Residents of Canada, excluding Quebec</LI>
                      <LI>All Citizens and Legal Permanent Residents of Australia</LI>
                      <LI>All Citizens and Legal Permanent Residents of India</LI>
                      <LI>All Citizens and Legal Permanent Residents of Ireland</LI>
                      <LI>All Citizens and Legal Permanent Residents of the United Kingdom</LI>
                      <LI>All non-immigrants** currently residing in the US with a valid Visa</LI></UL>
                      *(including the US Territories of Guam, Puerto Rico and the US Virgin Islands)<BR/>
                      ** Non-immigrants refer to people who come to the US, but not permanently (i.e., they are not permanent residents)<BR/><BR/>
                      <A CLASS="bodyText"><xsl:attribute name="HREF">/?t=schedule&amp;c=srm_rules&amp;ContestId=<xsl:value-of select="$contestId"/></xsl:attribute><B>Click here for complete rules &amp; regulations</B></A>
                      </TD></TR>
                    </TABLE>
                    <P><BR/></P>
                  </TD>
                  <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
                <TR>
                  <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                </TR>     
                <TR>
                  <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
                  <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
                  <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                </TR>  
                <TR>
                  <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
                  <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
                  <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                </TR>
              </TABLE>
            </TD>
            <!-- Center Column Ends -->
            <!-- Body Area Ends -->
            <!-- Gutter -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
              <!-- Right Column Include Begins --> 
              <xsl:call-template name="public_right_col"/>       
              <!-- Right Column Include Ends -->        
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

