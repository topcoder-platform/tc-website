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
        <TITLE>Competition Process at TopCoder</TITLE>
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
  <xsl:with-param name="title">&#160;Competition Process</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                    <BR/>
                    <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                            <TD CLASS="bodyText">
                                    <B>Starting a Competition</B><A HREF="/index?t=support&amp;c=manual_fig3" CLASS="bodyText"> (Fig. 3)</A>
                                    <BR/>
	Contestants must be registered, qualified and logged in for a particular competition prior to the beginning of the round 
	to be considered a contestant.  
	Before the beginning of a round, contestants will experience the following sequence of events:
	<OL>
                                        <LI>
                                            <B>Alert message - start of round:</B>  Each contestant will receive a pop-up message when 
	it is time for the round to begin.  This message will pop-up regardless of a contenstant's location within the applet.<BR/>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B>Room assignment:</B>  The alert message will prompt the contestant to move into an assigned room and commence competition.  
	Contestants will find the contest name, round room and time on this panel.<BR/>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B>Move request:</B>  Each contestant will move to his/her assigned room by clicking "yes" on the alert message.<BR/>
                                        </LI>
                                    </OL>
                                    <BR/>
                                    <B>Competition Phases</B>
                                    <BR/>
                                    <UL>
                                        <LI>
                                            <B>Phase I: Coding</B><A HREF="/index?t=support&amp;c=manual_fig4" CLASS="bodyText"> (Fig. 4)</A>
                                            <BR/>
	During this phase, the contestant must first select a problem based on point value. The point values for the problems will vary from match to match based on the relative difficulty of the problems to each other. You will have the ability to view the point values before choosing a problem. Each match will involve:
	<UL>
                                                <LI>a problem with a low difficulty rating</LI>
                                                <LI>a problem with a medium difficulty rating</LI>
                                                <LI>a problem with a high difficulty rating</LI>
                                            </UL>
                                            <BR/>
	When a problem has been selected, a window containing the following will be presented to the contestant:
	<UL>
                                                <LI>Problem information, problem statement, and coding area</LI>
                                                <LI>Editor: <A HREF="/index?t=support&amp;c=editor_info" CLASS="bodyText">standard</A>
                                                </LI>
                                                <LI>Buttons for saving, compiling, testing, clearing and submitting the coded problem</LI>
                                            </UL>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B>Intermission</B>
                                            <BR/>
	There will be a brief intermission between the Coding and Challenge phases.  This  allows 
	the contestant time to reflect on submissions and to prepare for the upcoming Challenge Phase, 
	and chat with other users.<BR/>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B>Phase II: Challenge</B><A HREF="/index?t=support&amp;c=manual_fig5" CLASS="bodyText"> (Fig. 5)</A>
                                            <BR/>
	If the status window is not already open, it will open at the start of the Challenge Phase.  
	During this phase, contestants will examine competitors' source code submissions in order to 
	determine if the problem requirements have been satisfied. If a possible flaw is detected and 
	a challenge is made, the contestant will be prompted for a set of required arguments. If the return 
	value is invalid which means the challenge is successful, the scores in the status window will 
	be adjusted in favor of the challenger. For more information on point distribution, review our <A HREF="/index?t=support&amp;c=ratings" CLASS="bodyText">rating system</A>.<BR/>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B>Phase III: System Testing</B>
                                            <BR/>
	The final phase will run submitted solutions that have not been successfully challenged through 
	a set of system test cases.  Results will then be posted in the status window, and also be 
	available on the website.<BR/>
                                        </LI>
                                    </UL>
                                    <A HREF="/index?t=support&amp;c=process_details" CLASS="bodyText">More details</A>
                            </TD>
                        </TR>
                    </TABLE>
<P><BR/></P>
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

