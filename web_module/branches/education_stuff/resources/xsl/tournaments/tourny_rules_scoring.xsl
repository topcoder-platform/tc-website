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
						<DIV CLASS="statTextBig">Scoring and Advancing during Online Regional Rounds</DIV><BR/>
						After each round of competition, the winners from each of the assigned rooms will be identified and invited to compete at the next level of competition. 
						Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round 
						&#40; see <A HREF="/?RoundId=4025&amp;t=tournaments&amp;c=tourny_rules_structure" CLASS="statText">Competition Round Structure</A> &#41; for each coder.  In order to advance, 
						a coder must finish with a greater-than-zero point total.  The winners will be determined as follows:<BR/><BR/>
						<B>Online Regional Quarter-Final</B><UL>
						<LI>Up to 128 coders per region (totaling 512) will compete - 32 coders per region (totaling 128) will advance</LI><BR/>
						<LI>The winners of each room will automatically advance (automatic berth) (up to 16)</LI><BR/>
						<LI>The remaining spots (wildcard pool) (32 minus the total number of room winners) will be handed out based on total points across all rooms in the region</LI>
						</UL>
						<B>Online Regional Semifinal</B><UL>
						<LI>32 coders per region (totaling 128) will compete - 8 coders per region (totaling 32) will advance</LI><BR/>
						<LI>The winners of each room will automatically advance (4)</LI><BR/>
						<LI>A wildcard pool will be used to determine the remainder of the advancers in each region.  The remaining spots (4) will be handed out based on total points across all rooms in the region.</LI>
						</UL><BR/>
						Note: The term "wildcard" indicates a competitor who has advanced to the next round of competition based on highest points for a given round. In the case of the Regional Championship, 
						the "wildcards" will total twelve (12) competitors based on all regions. There will be a minimum of one (1) representative per region in the Semifinals, but there could be more than one 
						"wildcard" from any region going into the Semifinals.<BR/><BR/>
						<B>Online Regional Final</B><UL>
						<LI>8 coders per region (totaling 32) will compete</LI><BR/>
						<LI>The winners of each region (4) will be crowned Regional Champions, will win $5,000 each, and will automatically advance to the onsite Semifinal round.  (NOTE:  All regional champions must participate in the onsite Semifinal rounds to receive prizes.)</LI><BR/>
						<LI>The remaining spots (12) to advance to the onsite Semifinal and Championship rounds will be handed out based on total points across all rooms (regardless of region)</LI>
						</UL><BR/>
						In order to advance, a coder must finish with a greater-than-zero point total.  If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the regional wildcard pool.  Any tie in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner:<UL>
						<LI>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems</LI><BR/>
						<LI>If a tie still remains, then by rating (higher is better) as of February 14, 2002</LI>
						</UL><BR/>
						If a tie still remains, all tied coders will advance to the next round.<BR/><BR/>
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

