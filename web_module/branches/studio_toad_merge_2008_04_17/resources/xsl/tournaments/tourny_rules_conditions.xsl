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
						<DIV CLASS="statTextBig">Conditions of Participation</DIV>
						By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.<BR/><BR/>
						Contestants must not cheat.  All ideas for any code and/or challenge submitted must be the contestant's alone.<BR/><BR/>
						Winners in each round of competition will be those competitors who win the most points in their respective rooms.  All decisions relating to the viability of submissions, the 
						ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all 
						respects.<BR/><BR/>
						Prizewinners will be notified via e-mail and the U.S. Postal Service within 10 days of the completion of the online Regional Final Round that they have won a prize. They will also 
						be forwarded an Affidavit of Eligibility and Liability and Publicity Release to be completed and returned to TopCoder prior to advancing to the onsite Semifinal and Championship 
						rounds. Prizes will be presented within 60 days of making an eligibility determination.  Unclaimed or undeliverable prizes will not be awarded.<BR/><BR/>
						As a condition of participation in the tournament, ALL information provided by you in your TopCoder member profile must be comprehensive, accurate and up-to-date.  
						TopCoder may require you to complete an additional registration form to register for the tournament.  In order to be eligible to participate in the tournament, you must 
						have completed any and all registration forms required by TopCoder.<BR/><BR/>
						As a condition of winning and redeeming a prize, winners will be required to return within 10 days of receipt a completed (i) Affidavit of Eligibility and Liability and Publicity 
						Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate.  In completing the Affidavit of Eligibility and Liability and Publicity Release, a winner (i) confirms his/her eligibility, 
						(ii) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies the accuracy of the 
						demographic information submitted, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) 
						licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (vii) releases TopCoder from 
						liability arising out of any prize won.  The Form W-9 or W-8BEN is required by the IRS for tax reporting purposes.  If prize notification is returned as undeliverable, or the winner 
						fails to return the Affidavit, or the W-9 or W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited.  Providing 
						false information in the registration process or in the required forms described in this paragraph will disqualify a winner.<BR/><BR/>
						By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, 
						sponsors (including Sun Microsystems, Inc.), and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property 
						damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, 
						or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties 
						with regard to, any prize given.<BR/><BR/>		
						In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, address (city 
						and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to 
						TopCoder and any and all rights to said use, without further compensation.<BR/><BR/>		
						TopCoder reserves the right, in it's sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems 
						appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web 
						site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of 
						completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.<BR/><BR/>
						 <B>Other</B><BR/>
						The tournament is void in whole or in part where prohibited by law.<BR/><BR/>
						A list of tournament winners by coder handles will be available on the web site at <A HREF="http://www.topcoder.com" CLASS="statText">www.topcoder.com</A>, and will be displayed for at 
						least 3 months after the end of the tournament.<BR/><BR/>
						This tournament is brought to you by <A HREF="http://www.sun.com" CLASS="statText">Sun Microsystems, Inc.</A> (www.sun.com) and <A HREF="http://www.topcoder.com" CLASS="statText">TopCoder, Inc.</A>
						(www.topcoder.com).<BR/><BR/>
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

