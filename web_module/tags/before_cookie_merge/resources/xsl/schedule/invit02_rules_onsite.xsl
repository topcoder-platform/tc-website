<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_invit02_links.xsl"/>
  <xsl:import href="../includes/modules/invit02_rule_links.xsl"/>  
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
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">schedule_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;Tournaments</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->				
        <xsl:call-template name="tournament_invit02_links"/>
	<!-- Coder of the Week Pulldown Ends -->
	<BR/>
	<xsl:call-template name="invit02_rule_links"/>
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
						<DIV CLASS="statTextBig">Onsite Semifinal and Championship Rounds</DIV><BR/>
						<P>The sixteen (16) advancers from Online Round #4 will travel to Mohegan Sun on Thursday, November 21st to compete in the Semifinal round of the 
						tournament being held on Friday, November 22nd. All contestants must arrive at Mohegan Sun no later than 4:00 PM on Thursday, November 21st. If a 
						contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament 
						will be given to the next highest overall scorer from Online Round #4.</P> 
						
						<P>TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, up to a cost of $1,000 per person. (That is, if a 
						contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.) 
						In addition, TopCoder will also provide travel arrangements to and from the airport to the Mohegan Sun Casino and accommodations and certain 
						meals for each contestant and his/her guest. All other expenses are the responsibility of the contestant and his/her guest.</P> 
						
						<P>TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the 
						average competitor rating (as of October 1st) for each room will be similar. The dates and times of the onsite Semifinal and Championship rounds 
						are as follows:</P>
						
						<TABLE STYLE="border-collapse:collapse;  border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt" CELLPADDING="0" CELLSPACING="0" BORDER="1"><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText"><B>Round of Competition</B></P></TD><TD STYLE="width:214.85pt;border:solid windowtext .5pt;   border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText"><B>Date and Time</B></P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #1</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 8:00 AM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #2</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 11:00 AM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #3</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 3:00 PM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #4</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 6:00 PM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216" CLASS="statText"><B>Championship Round</B></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215" CLASS="statText"><B>Saturday, November 23<SUP>rd</SUP>, 11:00 AM</B></TD></TR></TABLE>
						<P>The Semifinal Round will consist of four (4) rooms of four (4) coders each. The winner in each room will advance to the Championship Round.</P> 
						
						<P>The Championship Round will be a single round of four (4) coders. First, second, third and fourth place in the Championship round are determined 
						by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder 
						with the highest point total for the round. In the event of a tie in the Semifinal and/or Championship rounds, the tie will be resolved in the 
						following manner (in order):</P> 
						
						<UL>
						<LI>Total points acquired (higher is better) during the 2002 TopCoder Invitational to date</LI>
						<LI>If a tie still remains, then by rating (higher is better) as of October 1st</LI>
						<UL>
							<LI>If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</LI>
							<LI>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</LI>
						</UL></UL>
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
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

