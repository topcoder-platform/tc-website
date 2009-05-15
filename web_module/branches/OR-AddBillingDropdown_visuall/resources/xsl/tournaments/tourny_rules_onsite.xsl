<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>
  <xsl:import href="../includes/modules/rule_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
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
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->				
        <xsl:call-template name="tournament_links"/>
	<!-- Coder of the Week Pulldown Ends -->
	<BR/>
	<xsl:call-template name="rule_links"/>
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
						<DIV CLASS="statTextBig">Onsite Semifinal and Championship Rounds</DIV><BR/>
						The sixteen (16) advancers from the online Regional rounds will participate in the Semifinal rounds of the 2002 Sun Microsystems and TopCoder Collegiate Challenge 
						being held on April 19th, 2002.  Each contestant and one (1) guest of his/her choice will travel to the onsite competition to be held in Cambridge, MA.  All contestants 
						must arrive at the University Park Hotel @ MIT in Cambridge, MA no later than 4:00pm EST on Thursday, April 18, 2002.<BR/><BR/>
						TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating 
						(as of February 14, 2002) for each room will be similar.  All those who compete in the Semifinal and Championship rounds will be competing for a range of prizes up to and 
						including the Grand Prize.  If a contestant is unable to attend the onsite Semifinal and Championship rounds, he/she will forfeit his/her eligibility to receive a prize, and 
						his/her spot in the competition will be given to the next highest overall scorer from the final online Regional round.  The dates and times of the onsite Semifinal and 
						Championship rounds are as follows: <BR/><BR/>
						<DIV ALIGN="center"><TABLE WIDTH="75%" BORDER="1" CELLPADDING="6" CELLSPACING="0">
						<TR>
							<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Round of Competition</TD>
							<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Date</TD>
						</TR>	
						<TR>
							<TD WIDTH="50%" ALIGN="left" VALIGN="top" BGCOLOR="#666666"><FONT FACE="arial, helvetica, sans-serif" SIZE="1" COLOR="#ffffff"><UL>
							<LI>Semifinal Room #1</LI><BR/>
							<LI>Semifinal Room #2</LI><BR/>
							<LI>Semifinal Room #3</LI><BR/>
							<LI>Semifinal Room #4</LI><BR/>
							<LI>Championship Round</LI>
							</UL>
							</FONT></TD>
							<TD WIDTH="50%" ALIGN="left" VALIGN="top" BGCOLOR="#666666"><FONT FACE="arial, helvetica, sans-serif" SIZE="1" COLOR="#ffffff">
							April 19, 2002 at 8:00am EST<BR/><BR/>	
							April 19, 2002 at 11:00am EST<BR/><BR/>
							April 19, 2002 at 3:00pm EST<BR/><BR/>
							April 19, 2002 at 6:00pm EST<BR/><BR/>
							April 20, 2002 at 1:00pm EST<BR/>
							</FONT></TD>
						</TR>	
						</TABLE></DIV><BR/>
						In the Semifinal Round, each competitor will compete in one of four (4) rooms of four (4) coders each.  The winner in each room will advance to the Championship round.<BR/><BR/>
						<B>PLEASE NOTE:</B> Due to the structure of the tournament, the coders competing in Semifinal Room #2 will be sequestered for the duration of Semifinal Room #1, and coders 
						competing in Semifinal Room #4 will be sequestered for the duration of Semifinal Room #3.  Therefore, the coders seeded in Semifinal Room #2 are required to be at the 
						University Park Hotel prior to the start of Semifinal Room #1 competition, and coders seeded in the Semifinal Room #4 competition are required to be at the University Park Hotel prior to the start of 
						the Semifinal Room #3 competition.   If the competitors are not present when required, he/she will be disqualified and will not be allowed to compete.  More details regarding sequestering 
						will be provided to the 16 semifinalists when those competitors are identified.<BR/><BR/>
						<B>The Championship Round</B> will be a single match of four (4) coders.  The winner of this round will be crowned the Sun Microsystems and TopCoder Collegiate Challenge Champion and will be awarded 
						the tournament Grand Prize.<BR/><BR/>
						First, second, third and fourth place in the Championship round are determined by comparing the total points of each coder, with the highest point 
						value placing first.  The winner of the Championship Round will be the coder with the highest point total for the round.  In the event of a tie in the Semifinal and/or 
						Championship rounds, the tie will be resolved in the following manner (in order):<UL>
						<LI>Total points acquired (higher is better) in the 2002 Collegiate Challenge to date</LI><BR/>
						<LI>If a tie still remains, then by rating (higher is better) as of February 14, 2002</LI></UL><BR/>
						<DIV ALIGN="center" CLASS="statTextBig">Visit <A HREF="http://www.sun.com" CLASS="statTextBig">Sun Microsystems</A> - exlcusive sponsor of the 2002 TopCoder Collegiate Challenge</DIV><BR/>
						</TD>
						</TR>
					</TABLE>
					<P><BR/></P>
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

