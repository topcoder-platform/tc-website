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
        <TITLE>Ratings Overview for computer programming competitions at TopCoder</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->		
<!-- Left Column Include Ends -->							
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Ratings Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                    <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                            <TD HEIGHT="1" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="2" SRC="/i/clear.gif" BORDER="0"/></TD>
                            <TD VALIGN="top"><BR/>
							<TABLE WIDTH="104" BORDER="0" CELLSPACING="0" CELLPADDING="1" BACKGROUND="/i/steel_darkblue_bg.gif">
              				<TR><TD COLSPAN="4" ALIGN="left" VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;&#160; Rating Key</TD></TR>
              				<TR>
								<TD ROWSPAN="7" WIDTH="5"><IMG SRC="/i/clear.gif" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
                                <TD WIDTH="100%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD ROWSPAN="7" WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
							</TR>							
              				<TR><TD CLASS="coderTextRed" ALIGN="left" NOWRAP="">2200+</TD></TR>						 
              				<TR><TD CLASS="coderTextYellow" ALIGN="left">1500 - 2199</TD></TR>
              				<TR><TD CLASS="coderTextBlue" ALIGN="left">1200 - 1499</TD></TR>
              				<TR><TD CLASS="coderTextGreen" ALIGN="left">900 - 1199</TD></TR>
              				<TR><TD CLASS="coderTextGray" ALIGN="left">0 - 899</TD></TR>
              				<TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>
                            <TR BGCOLOR="#FFFFFF"><TD COLSPAN="3" CLASS="smallText" VALIGN="top">A coder's handle is color-coded depending on their rating within the Competition Arena.</TD></TR>
                         </TABLE>
                            
                                <!-- <TABLE WIDTH="104" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD COLSPAN="2"><IMG ALT="" HEIGHT="128" WIDTH="104" SRC="/images/ranks_2.gif"></TD>
                                    </TR>
                                    <TR>
                                        <TD><IMG ALT="" HEIGHT="2" WIDTH="14" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="2" WIDTH="90" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="smallText" VALIGN="top">&gt;&gt;</TD>
                                        <TD CLASS="bodyText" VALIGN="top"><B>Rating Key</B></TD>
                                    </TR>
                                    <TR>
                                        <TD><IMG ALT="" HEIGHT="1" WIDTH="14" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="1" WIDTH="90" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD VALIGN="top"></TD>
                                        <TD CLASS="smallText" VALIGN="top">A coder's handle is color-coded depending on their rating within the Competition Arena.</TD>
                                    </TR>
                                </TABLE> -->
                            </TD><TD VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="top">
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD COLSPAN="2"><IMG ALT="" HEIGHT="5" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD>
                                        <TD CLASS="bodyText"><BR/><BR/>
										<B>How the TopCoder Rating System Works:</B><BR/><BR/>
										The following statistics are kept about each coder:
										<UL>
											<LI>Rating</LI>
											<LI>Volatility</LI>
											<LI>Number of times previously rated</LI>
										</UL>
										Before competing, new members ratings are provisional.<BR/><BR/> 
										After a competition the algorithm below is applied to the competitors. First, the ratings of members who have previously competed are calculated, with new members' performances not considered. Second, new members are given a rating based on their performance relative to everyone in the competition.
										<P><A HREF="/?t=support&amp;c=ratings_cal" CLASS="bodyText">How ratings are calculated</A></P>
                                        </TD>
                                    </TR>
                                </TABLE>
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
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

