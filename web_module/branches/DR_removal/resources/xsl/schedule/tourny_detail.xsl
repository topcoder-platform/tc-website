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
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
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
              <DIV CLASS="bodySubhead">[ <FONT COLOR="#333333">Tournament Match Detail</FONT> ]</DIV>
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
                    <DIV ALIGN="center">
                      <TABLE WIDTH="400" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                          <TD WIDTH="21" ALIGN="right" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/srm_detail_angle.gif" ALT="" WIDTH="22" HEIGHT="22" BORDER="0" /><BR/><IMG SRC="/i/clear.gif" ALT="" WIDTH="22" HEIGHT="1" BORDER="0" /></TD>
                          <TD WIDTH="263" ALIGN="left" CLASS="bodyText" BGCOLOR="#FFFFFF">Single Round Match 00 - 00.00.00<BR/>Registration Time: &#40;EST&#41;<BR/>Match Time: &#40;EST&#41;</TD>
                          <TD ROWSPAN="2" HEIGHT="93" ALIGN="left" BGCOLOR="#FFFFFF"><IMG SRC="/i/srm_detail_badge.gif" ALT="" WIDTH="93" HEIGHT="93" BORDER="0" /></TD>
                        </TR>
                        <TR><TD COLSPAN="3" HEIGHT="21" ALIGN="right"><IMG SRC="/i/srm_downloadapplet.gif" ALT="" WIDTH="263" HEIGHT="21" BORDER="0" /></TD></TR>
                      </TABLE>
                    </DIV><BR/>
                    Divisions:<BR/><BR/>
                    There will be 2 divisions. Division I is 1500 rating and up, while Division II is below 1500. 
                    The single round match room assignments will only place members of like divisions together. 
                    Any member who changes divisions as a result of a rating change will compete in their new division in the next rated event following the rating change.<BR/><BR/>
                    Prizes:<BR/><BR/>
                    Coders must place with a positive point total to collect their prize.<UL>
                    Division I<BR/>
                    <LI>1st place in each room: &#36;300</LI>
                    <LI>2nd place in each room: &#36;150</LI>
                    <LI>3rd place in each room: &#36;75</LI><BR/>
                    Division II<BR/>
                    <LI>1st place in each room: &#36;150</LI>
                    <LI>2nd place in each room: &#36;75</LI>
                    <LI>3rd place in each room: &#36;25</LI></UL><BR/>
                    Eligibility:<BR/><BR/>
                    The match is open to members who are at least 18 years of age, meeting the following eligibility requirements:<UL>
                    <LI>All US&#42; and Canadian Citizens, excluding Quebec</LI>
                    <LI>All Lawful Permanent Residents of the US &#40;i.e., Green Card Holders&#41;</LI>
                    <LI>All Legal Permanent Residents of Canada, excluding Quebec</LI>
                    <LI>All Legal Permanent Residents of Australia</LI>
                    <LI>All Legal Permanent Residents of India</LI>
                    <LI>All non-immigrants&#42;&#42; currently residing in the US with a valid Visa</LI></UL>
                    &#42;&#40;Including the US Territories of Guam, Puerto Rico and the US Virgin Islands&#41;<BR/>
                    &#42;&#42;Non-immigrants refer to people who come to the US, but not permanently &#40;i.e., they are not permanent residents&#41;.<BR/><BR/>
                    <B>Tournament Description</B><BR/><BR/>
                    Maximum of 64 coding rooms. 8 coders per room. Ratings will be adjusted. Members will be emailed prior to the match regarding how to participate.<BR/><BR/>
                    The match will feature a mixed programming language format. For each individual problem, the coder will have the option of using either Java or C++ to code the solution. 
                    Syntactical knowledge of both languages will be helpful during the challenge phase of each round of competition.<BR/><BR/>
                    <A HREF="#" CLASS="bodyText"><B>Click here for Official Rules &amp; Qualifications</B><BR/><BR/></A>
                  </TD>
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
