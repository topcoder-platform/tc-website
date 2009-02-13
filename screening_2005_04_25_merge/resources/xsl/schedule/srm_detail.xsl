<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
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
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->          
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="10" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" valign="top">
<SPAN CLASS="header">Schedule</SPAN>
<DIV CLASS="bodySubhead">[ <FONT COLOR="#333333">SRM Detail</FONT> ]</DIV>
<BR/>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11" ALIGN="right"><IMG SRC="/i/table_top_left1.gif" ALT="" WIDTH="11" HEIGHT="16" BORDER="0"/></TD>
          <TD VALIGN="top" WIDTH="75" ALIGN="left"><IMG SRC="/i/table_top_left2.gif" ALT="" WIDTH="75" HEIGHT="16" BORDER="0"/></TD>
          <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="16" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

                  <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                            <TD CLASS="bodyText" VALIGN="top">
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/srm_logo.gif" WIDTH="170" HEIGHT="170" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="3"><IMG HEIGHT="10" WIDTH="1" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="3">
                                            
                                                <A HREF="JavaScript:doSubmitNavBar('arena','')" CLASS="bodyText"><B>Ready for the competition?</B>
                                                    <BR/>
                                                </A> 
                        
                        Click the button below to launch the Competition Arena.
                        <A HREF="JavaScript:doSubmitNavBar('arena','')" CLASS="bodyText"><IMG BORDER="0" HEIGHT="30" WIDTH="200" ALT="Tournament Arena" SRC="/images/tourn_arena_14.gif"/></A>
                                            
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD COLSPAN="3"><IMG HEIGHT="10" WIDTH="1" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                            </TD>
                            <TD CLASS="bodyText" VALIGN="top" WIDTH="10"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD>
                            <TD VALIGN="top" WIDTH="100%">
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="12" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top">
                                                <B>Single Round Match 51 - 12.17.2001</B>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD VALIGN="top" CLASS="bodyText">Registration from 7:30&#160;PM to 8:55&#160;PM&#160;EST.<BR/>
                              Competition at 9:00&#160;PM&#160;EST.
                            <BR/>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top">
                                                <B>Divisions:</B>
                                                <BR/>
                        There will be 2 divisions.  Division I is 1500 rating and up, 
                        while Division II is below 1500.  The single round match room assignments will 
                        only place members of like divisions together.  Any member who changes divisions 
                        as a result of a rating change will compete in their new division in the next 
                        rated event following the rating change.<BR/>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><B>Prizes:</B><BR/>
                         Coders must place with a positive point total to collect their prize.<BR/><BR/>
                        
                            Division I<BR/>
                            1st place in each room: $300<BR/>
                            2nd place in each room: $150<BR/>
                            3rd place in each room: $75<BR/><BR/>
                            
                            Division 2<BR/>
                            1st place in each room: $150<BR/>
                            2nd place in each room: $75<BR/>
                            3rd place in each room: $25
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top">
                                                <B>Eligibility:</B><BR/>
                        The match is open to members who are at least 18 years of age, 
                        meeting the following eligibility requirements: 
                        <UL>
                                                    <LI>All US* and Canadian Citizens, excluding Quebec.</LI>
                                                    <LI>All Lawful Permanent Residents of the US (i.e., Green Card Holders).</LI>
                                                    <LI>All Legal Permanent Residents of Canada, excluding Quebec.</LI>
                                                    <LI>All Legal Permanent Residents of Australia.</LI>
                                                    <LI>All non-immigrants** currently residing in the US with a valid Visa.</LI>
                                                </UL>
                        *(including the US Territories of Guam, Puerto Rico and the US Virgin Islands)<BR/>
                        ** Non-immigrants refer to people who come to the US, but not permanently 
                        (i.e., they are not permanent residents).
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top">
                                                <B>Tournament Description</B><BR/>
                        Maximum of 64 coding rooms. 8 coders per room. 
                        Ratings will be adjusted.
                        Members will be emailed prior to the match regarding how to participate.<BR/><BR/>
                        
                            The match will feature a mixed programming language format.  
                            For each individual problem, the coder will have the option 
                            of using either Java or C++ to code the solution. 
                            Syntactical knowledge of both languages will be helpful during 
                            the challenge phase of each round of competition.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD VALIGN="top">
                                                <A HREF="/support/rules_qual.shtml" CLASS="bodyText"><B>Click here for Official Rules &amp; Qualifications</B></A>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD COLSPAN="3"><IMG HEIGHT="25" WIDTH="1" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                        </TR>
                    </TABLE>
<P><BR/></P>
          </TD>
          <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>     
        <TR>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>  
        <TR>
          <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

