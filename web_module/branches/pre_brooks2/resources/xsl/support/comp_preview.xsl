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
        <TITLE>Competition Preview at TopCoder</TITLE>
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
  <xsl:with-param name="title">&#160;Competition Preview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                    <BR/>
                    <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                            <TD CLASS="bodyText" COLSPAN="2">

                                    <B>To compete in any single round match or tournament, a coder must first... </B>
                                    <UL>
                                        <LI>
                                            <A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register</A>
                                        </LI>
                                        <LI>Complete the Qualification Round</LI>
                                    </UL>
                                    <B>Process</B>
                                    <BR/>
			For those TopCoder Members that qualify to move on in the tournament, several elimination rounds await. 
			The first rounds will be conducted online in three parts: 
			<OL>
                                        <LI>
                                            <B>The coding phase:</B> Algorithms of varying complexity must be coded within a set amount of time. Coders in division two will be presented with a less difficult problem set than those in division one. </LI>
                                        <LI>
                                            <B>The challenge phase:</B> Competitors review and challenge each other's submissions. </LI>
                                        <LI>
                                            <B>The testing phase:</B> TopCoder will attempt to validate all remaining submissions. </LI>
                                    </OL>
			
			Contestants and spectators will also be able to participate in a chat room before, during and after the competition.  
			However, contestants won't be able to see spectator postings. 
			<BR/>
                                    <BR/>
                                    <A HREF="/index?t=schedule&amp;c=index" CLASS="bodyText"><B>View the current single round match and tournament schedule</B></A><BR/><BR/>
                                    <A HREF="/index?t=schedule&amp;c=practice_room" CLASS="bodyText"><B>Participate in the practice competition</B></A>
                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top" COLSPAN="2"><IMG ALT="" HEIGHT="10" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD VALIGN="top" COLSPAN="2">
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD><IMG ALT="" HEIGHT="15" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="15" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="15" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText"><IMG ALT="" HEIGHT="3" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                        <TD CLASS="bodyText"><B>TopCoder Competition Arena:</B> Lobby and Coding Area
                                        </TD><TD><IMG ALT="" HEIGHT="3" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD><IMG ALT="" HEIGHT="3" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="3" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="3" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD ALIGN="center"><IMG ALT="" HEIGHT="15" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG SRC="/i/lobby_coding_leader.jpg" ALT="" WIDTH="400" HEIGHT="300" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="15" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top" COLSPAN="2"><IMG ALT="" HEIGHT="15" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
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

