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
        <TITLE>Divisions in TopCoder computer programming competitions</TITLE>
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
  <xsl:with-param name="title">&#160;Divisions</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/><BR/>
		Starting on February 20, 2002, significant changes to the structure of Single Round Matches will go into effect.  
		The changes are designed to make matches better balanced, more fair, and to reduce intimidation for first-time match participants.  Descriptions 
		of all of the changes are provided below.  We encourage feedback on these changes, and also encourage the use of the round tables for any such discussions.<BR/><BR/>
		<B>Changes to the Division Structure</B><BR/><BR/>
		TopCoder will introduce an easier problem set for Division II competitors, using two sets of problems for each Single Round Match.  As a result, the division 
		structure and the corresponding color-coding will change.  To establish the new break point between divisions, and to more evenly distribute the members 
		into the various rating levels, the rating colors will change to the following:<BR/><BR/><BR/>
		<DIV ALIGN="center">
		<TABLE WIDTH="75%" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
		<TR>
			<TD COLSPAN="2" HEIGHT="21" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Division I</TD>
			<TD COLSPAN="2" HEIGHT="21" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Division II</TD>
		</TR>
		<TR>
			<TD WIDTH="50" ALIGN="left" VALIGN="top" CLASS="statText"><SPAN CLASS="coderTextRed">Red</SPAN><BR/><SPAN CLASS="coderTextYellow">Yellow</SPAN><BR/><SPAN CLASS="coderTextBlue">Blue</SPAN></TD>
			<TD WIDTH="100" ALIGN="left" VALIGN="top" CLASS="statText">2200+<BR/>1500 - 2199<BR/>1200 - 1499</TD>
			<TD WIDTH="50" ALIGN="left" VALIGN="top" CLASS="statText"><SPAN CLASS="coderTextGreen">Green</SPAN><BR/><SPAN CLASS="coderTextGray">Gray</SPAN></TD>
			<TD WIDTH="100" ALIGN="left" VALIGN="top" CLASS="statText">900 - 1199<BR/>0 - 899</TD>
		</TR>
		</TABLE>
		</DIV><BR/><BR/><BR/>
		A coder will move into Division I immediately upon attaining a rating of 1200 or higher.  Likewise, when a coder's rating drops below 1200, they will be placed 
		(and seeded) in Division II.<BR/><BR/>
		The point values associated with each problem will begin varying from match to match, based on TopCoder's estimation on the relative difficulty of the individual 
		problems to one another.  Each coder will have the ability to view the various point values before they choose which problem to open.<BR/><BR/>
		<B>Changes to the Room Seeding Structure</B><BR/>
		<UL>
			<LI>Each room will be populated with an average 10 coders</LI>
			<LI>Division I and Division II competitors will be seeded in an "iron man" fashion to more evenly match the skill levels of the competitors in each room.  The 
			"iron man" seeding algorithm involves assigning coders to rooms in a sequential manner, based on coder ratings.  For example:  Room 1 in Division I will contain 
			the top 10 rated members who have signed up for the match</LI>
		</UL>
		Furthermore, all new, non-rated members will compete against other non-rated members in separate rooms.  Upon competing in their first rated event, a previously 
		non-rated member will be placed in the division that corresponds to their new rating.<BR/><BR/>
		<!-- <B>Changes to the Prize Money Structure</B><BR/><BR/>
		All first-time, or non-rated participants will be competing for a single prize of $100, to be paid to the highest scoring non-rated coder.  No other prize money will be paid 
		to the non-rated rooms.<BR/><BR/>
		In an effort to better control and predict the amount of prize money awarded in each SRM, the total pool of prize money for each match will become fixed at $10,000 
		per match.  Of the total purse for each single round match five percent ($500) will be given away to a charity organization.  At the end of each match, TopCoder will pick 
		a random room, and the winner of that room will be allowed to choose the charity to which the money will be donated.  Assuming that at least one non-rated member signs 
		up for a match, the remaining pool to be paid to Divisions I and II will be fixed at $9,400 ($10,000 minus the $500 donation, minus the $100 prize for the non-rated winner).<BR/><BR/>
		The prize money will be allocated to all rated participants, starting with 80% allocated to Division I and 20% to Division II.  This percentage is then adjusted, based upon 
		the actual participation weights in each division.<BR/><BR/>
		<B>Example</B><BR/><BR/>
		Total SRM participants = 300.  115 of the 300 are Division I, and 185 are Division II.  The weighted prize money is calculated as follows:<BR/><BR/><BR/>
		<DIV ALIGN="center">
		<TABLE WIDTH="75%" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
		<TR>
			<TD ALIGN="center" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">&#160;</TD>
			<TD ALIGN="center" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Prize %</TD>
			<TD ALIGN="center" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Participation %</TD>
			<TD ALIGN="center" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Weighted Prize %</TD>
			<TD ALIGN="center" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Prize $</TD>
		</TR>
		<TR>
			<TD CLASS="statTextBig" ALIGN="left">Division I</TD>
			<TD CLASS="statText" ALIGN="center">80%</TD>
			<TD CLASS="statText" ALIGN="center">38.3%</TD>
			<TD CLASS="statText" ALIGN="center">71.3%</TD>
			<TD CLASS="statText" ALIGN="center">6,702</TD>
		</TR>
		<TR>
			<TD CLASS="statTextBig" ALIGN="left">Division II</TD>
			<TD CLASS="statText" ALIGN="center">20%</TD>
			<TD CLASS="statText" ALIGN="center">61.7%</TD>
			<TD CLASS="statText" ALIGN="center">28.7%</TD>
			<TD CLASS="statText" ALIGN="center">2,698</TD>
		</TR>
		</TABLE>
		</DIV><BR/><BR/><BR/>
		Within each division, the calculated division purse will be divided across all of the rooms in the division based on a rating contribution system.  The higher a coder's 
		rating is, the higher the percentage of the division pool that that coder contributes to the room's prize money.  Within each room in both divisions, the top three 
		finishers will be paid 39%, 33% and 28% of the room purse, respectively.  These winning percentages will be the same for each room in Division I.  Any ties will be settled 
		as they are in the current system.  No prize money will be given to any coder who finishes with zero or less points.<BR/><BR/>
		<B>Example</B><BR/><BR/>
		The following is an example prize distribution under the new system for a recent single round match:<BR/><BR/><BR/>
		<DIV ALIGN="center">
		<TABLE WIDTH="75%" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
		<TR><TD COLSPAN="5" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif"><B>Division I</B></TD></TR>
		<TR>
			<TD CLASS="statText" ALIGN="center">Room</TD>
			<TD CLASS="statText" ALIGN="center">Coders</TD>
			<TD CLASS="statText" ALIGN="center">1st Place $</TD>
			<TD CLASS="statText" ALIGN="center">2nd Place $</TD>
			<TD CLASS="statText" ALIGN="center">3rd Place $</TD>
		</TR>
		<TR>
			<TD CLASS="statText" ALIGN="center">1<BR/>2<BR/>3<BR/>4<BR/>5<BR/>6<BR/>7<BR/>8<BR/>9<BR/>10<BR/>11<BR/>12<BR/></TD>
			<TD CLASS="statText" ALIGN="center">9<BR/>9<BR/>9<BR/>9<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/></TD>
			<TD CLASS="statText" ALIGN="center">635<BR/>382<BR/>293<BR/>249<BR/>249<BR/>227<BR/>211<BR/>196<BR/>183<BR/>172<BR/>165<BR/>158<BR/></TD>
			<TD CLASS="statText" ALIGN="center">537<BR/>323<BR/>248<BR/>211<BR/>211<BR/>192<BR/>179<BR/>166<BR/>155<BR/>145<BR/>140<BR/>133<BR/></TD>
			<TD CLASS="statText" ALIGN="center">456<BR/>274<BR/>211<BR/>179<BR/>179<BR/>163<BR/>152<BR/>141<BR/>132<BR/>123<BR/>119<BR/>113<BR/></TD>
		</TR>
		<TR><TD COLSPAN="5" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif"><B>Division II</B></TD></TR>
		<TR>
			<TD CLASS="statText" ALIGN="center">Room</TD>
			<TD CLASS="statText" ALIGN="center">Coders</TD>
			<TD CLASS="statText" ALIGN="center">1st Place $</TD>
			<TD CLASS="statText" ALIGN="center">2nd Place $</TD>
			<TD CLASS="statText" ALIGN="center">3rd Place $</TD>
		</TR>
		<TR>
			<TD CLASS="statText" ALIGN="center">1<BR/>2<BR/>3<BR/>4<BR/>5<BR/>6<BR/>7<BR/>8<BR/>9<BR/>10<BR/>11<BR/></TD>
			<TD CLASS="statText" ALIGN="center">10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>10<BR/>11<BR/>11<BR/>11<BR/></TD>
			<TD CLASS="statText" ALIGN="center">91<BR/>86<BR/>81<BR/>73<BR/>69<BR/>66<BR/>63<BR/>60<BR/>62<BR/>59<BR/>51<BR/></TD>
			<TD CLASS="statText" ALIGN="center">77<BR/>73<BR/>69<BR/>62<BR/>58<BR/>56<BR/>53<BR/>51<BR/>52<BR/>50<BR/>43<BR/></TD>
			<TD CLASS="statText" ALIGN="center">65<BR/>62<BR/>58<BR/>52<BR/>49<BR/>48<BR/>45<BR/>43<BR/>45<BR/>43<BR/>36<BR/></TD>
		</TR>
		<TR><TD COLSPAN="5" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif"><B>Non-rated</B></TD></TR>
		<TR>
			<TD CLASS="statText" ALIGN="center">Room</TD>
			<TD CLASS="statText" ALIGN="center">Coders</TD>
			<TD CLASS="statText" ALIGN="center">1st Place $</TD>
			<TD CLASS="statText" ALIGN="center">2nd Place $</TD>
			<TD CLASS="statText" ALIGN="center">3rd Place $</TD>
		</TR>
		<TR>
			<TD CLASS="statText" ALIGN="center">1<BR/>2<BR/>3<BR/></TD>
			<TD CLASS="statText" ALIGN="center">10<BR/>11<BR/>11<BR/></TD>
			<TD CLASS="statText" ALIGN="center">100<BR/>0<BR/>0<BR/></TD>
			<TD CLASS="statText" ALIGN="center">0<BR/>0<BR/>0<BR/></TD>
			<TD CLASS="statText" ALIGN="center">0<BR/>0<BR/>0<BR/></TD>
		</TR>
		</TABLE>
		</DIV> -->
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

