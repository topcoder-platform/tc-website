<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
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
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">schedule</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Overview</xsl:with-param>
</xsl:call-template>			
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" ALIGN="left" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
            <TABLE BORDER="0" CELLPADDING="4" CELLSPACING="0" ALIGN="left" BGCOLOR="#FFFFFF">                               
                <TR>
                  <TD VALIGN="TOP" ALIGN="LEFT" BGCOLOR="#FFFFFF">
                    <IMG ALT="" HEIGHT="1" WIDTH="200" SRC="/i/clear.gif" BORDER="0"/>
                  </TD>
                  <TD colspan="3"/>
                </TR>
                <TR>
                  <TD VALIGN="TOP" ALIGN="LEFT" BGCOLOR="#FFFFFF">
                    <xsl:attribute name="ROWSPAN"><xsl:value-of select="2*count(/TC/SCHEDULE/Contests/Contest[not(ContestId='1000' or ContestId='50')])+5"/></xsl:attribute>
                    <B>Process:</B>
                    <UL CLASS="bodyText">
                      <LI>
                        <A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register</A> as a TopCoder member.
                      </LI>
                      <LI>Successfully qualify for a tournament.</LI>
                      <LI>
                        Enter the first round of the tournament.<BR/>
                        <A HREF="/?t=support&amp;c=guide" CLASS="bodyText">
                          Click here to preview the Competiton Arena &gt;&gt;
                        </A>
                      </LI>
                      <LI>
                        There are three phases of online competition:
                        <OL CLASS="bodyText">
                          <LI>Coding</LI>
                          <LI>Challenge</LI>
                          <LI>System Testing</LI>
                        </OL>
                      </LI>
                    </UL>
                    <B>Profit:</B>
                    <UL CLASS="bodyText">
                      <LI>
                        Participate in our tournaments. Each tournament will have a purse that is divided among the winners.
                      </LI>
                      <LI>
                        Use our
                        <A HREF="/?t=support&amp;c=ratings" CLASS="bodyText">
                          rating system
                        </A>
                        to distinguish yourself from other programmers.
                      </LI>
                    </UL>
                    <P><BR/></P>
                  </TD>
                  <TD COLSPAN="3" BGCOLOR="#FFFFFF"><IMG ALT="" HEIGHT="1" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                </TR>
                <TR>
                  <TD colspan="3" CLASS="moduleTitle" BACKGROUND="/i/steel_gray_bg.gif"><IMG ALT="" HEIGHT="1" WIDTH="170" SRC="/i/clear.gif" BORDER="0"/><BR/>
                    <B>Active Single Round Matches</B>
                    <BR/><DIV CLASS="smallFoot">Note: Eastern Time unless otherwise specified</DIV>
                  </TD>
                  <TD ><IMG ALT="" HEIGHT="1" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/next_srm_bg.gif" VALIGN="top"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/mystats_icon.gif" BORDER="0"/></TD>
                  <TD BACKGROUND="/i/next_srm_bg.gif" CLASS="smallText" VALIGN="top">
                    <A HREF="/?t=schedule&amp;c=practice_room" CLASS="statText"><B>Practice Room 1</B>
                      <BR/>
                    </A>
                  </TD>
                  <TD BACKGROUND="/i/next_srm_bg.gif"><IMG ALT="" HEIGHT="1" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                  <TD BGCOLOR="#FFFFFF"><IMG ALT="" HEIGHT="1" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/next_srm_bg.gif" COLSPAN="3"><IMG ALT="" HEIGHT="2" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                  <TD BGCOLOR="#FFFFFF"><IMG ALT="" HEIGHT="1" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                </TR>
                <xsl:for-each select="/TC/SCHEDULE/Contests/Contest[not(ContestId='1000' or ContestId='50')]">
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
                    <TD BACKGROUND="/i/next_srm_bg.gif" VALIGN="top"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/mystats_icon.gif" BORDER="0"/></TD>
                    <TD BACKGROUND="/i/next_srm_bg.gif" CLASS="statText" VALIGN="top">
                      <A HREF="" CLASS="statText">
                         <xsl:attribute name="HREF">/?ContestId=<xsl:value-of select="ContestId"/>&amp;t=schedule&amp;c=srm</xsl:attribute>
                         <b>
                           <xsl:value-of select="substring(ContestStartTimestamp,0,11)"/><br/>
                           <xsl:value-of select="ContestName"/>
                         </b>
                         <br/>
                         Registration Begins:  <xsl:value-of select="substring(ContestStartTimestamp,0,6)"/>
                         <font size="1">&#160;</font>
                         <xsl:value-of select="$start_hr"/>:<xsl:value-of select="$start_min"/>&#160;<xsl:value-of select="$am_pm"/>
                         <br/>
                         Competition:  <xsl:value-of select="substring(ContestStartTimestamp,0,6)"/>&#160;
                         <xsl:choose>
                           <xsl:when test="ContestId='4031'">2:00 PM<br/></xsl:when>
                           <xsl:otherwise>
                             <xsl:value-of select="number($start_hr)+2"/>:<xsl:value-of select="format-number(number($start_min)-30,'00')"/>&#160;<xsl:value-of select="$am_pm"/><br/>
                           </xsl:otherwise>
                         </xsl:choose>
                      </A>
                    </TD>
                    <TD BACKGROUND="/i/next_srm_bg.gif"><IMG ALT="" HEIGHT="1" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                  </TR>
                  <TR>
                    <TD BACKGROUND="/i/next_srm_bg.gif" COLSPAN="3"><IMG ALT="" HEIGHT="2" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                  </TR>
                </xsl:for-each>
                <TR>
                  <TD COLSPAN="3" BGCOLOR="#FFFFFF"><IMG ALT="" HEIGHT="5" WIDTH="5" SRC="/i/clear.gif" BORDER="0"/></TD>
                </TR>                                                
              </TABLE>
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
    <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
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

