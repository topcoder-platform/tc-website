<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03rule_links.xsl"/>  
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
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
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
        <xsl:call-template name="tccc03_links"/>
	<!-- Coder of the Week Pulldown Ends -->
	<BR/>
	<xsl:call-template name="tccc03rule_links"/>
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
						<DIV CLASS="statTextBig">Online Elimination Rounds</DIV>
<P>
Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior 
to the start of the online round. (See below for competition dates and times.) TopCoder members from around the world 
may be participating in these rounds, <B>but all start times will be communicated as Eastern Time, so contestants in 
different time zones must adjust accordingly</B>. If a coder does not participate, for any reason, in an online round 
that they have advanced to, it will be treated as an automatic loss in that round of competition. 
</P>

<P>
All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all room assignments prior to the start of each online round in a manner such that the average competitor rating (as of February 14th) for each room will be similar. The dates and times of the online rounds of competition are as follows: 
</P>
						<DIV ALIGN="center"><TABLE WIDTH="100%" BORDER="1" CELLPADDING="6" CELLSPACING="0">
						<TR>
							<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Round of Competition</TD>
							<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Date &amp; *Time</TD>
						</TR>
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText"> - Regional Online Round #1</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">&#160;</TD>
						</TR>						
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">&#160;&#160;&#160;&#160;&#160;Northeast and Southeast Regions</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">Tuesday, February 18th <BR/> 
Registration:  7:00 PM - 8:55 PM<BR/>
START: 9:00 PM <BR/></TD>
						</TR>
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">&#160;&#160;&#160;&#160;&#160;West and Midwest Regions</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">Thursday, February 20th <BR/> 
Registration:  7:00 PM - 8:55 PM<BR/>
START: 9:00 PM <BR/></TD>
						</TR>
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">&#160;&#160;&#160;&#160;&#160;International Region</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">Saturday, February 22nd <BR/> 
Registration:  10:00 AM - 11:55 AM<BR/>
START: 12:00 PM <BR/></TD>
						</TR>
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText"> - Regional Quarterfinals</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">Wednesday, February 26th<BR/> 
START:  9:00 PM</TD>
						</TR>
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText"> - Regional Semifinals</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">Wednesday, March 5th<BR/> 
START:  9:00 PM</TD>
						</TR>																								
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText"> - Regional Championship</TD>
							<TD VALIGN="top" BGCOLOR="#666666" class="statText">Wednesday, March 12th<BR/> 
START:  9:00 PM</TD>
						</TR>												
						<TR>
							<TD COLSPAN="2" VALIGN="top" BGCOLOR="#666666" class="statText">*NOTE:  In the event that a round must be cancelled for any reason, the "raindate" for the cancelled match will be the following day at the same time.</TD>
						</TR>								
						</TABLE></DIV><BR/>
						
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
						<DIV CLASS="statTextBig">Scoring and Advancing during Online Regional Rounds</DIV><BR/>
						After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round  
						&#40; see <A HREF="/?t=tournaments&amp;c=tccc03_rules_structure" CLASS="statText">Competition Round Structure</A> &#41; for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the online rounds is as follows:<BR/><BR/>
						
						<B>Online Regional Round One</B><UL>
						<LI>Up to 200 coders per region (totaling 1,000) will compete - A total of 500 competitors, comprised of 20 room winners and 80 wildcard competitors (based on total points across all rooms) per region, will advance to the next round.</LI><BR/>
						</UL>
												
						<B>Online Regional Quarterfinal</B><UL>
						<LI>Up to 100 coders per region (totaling 500) will compete - A total of 200 competitors, comprised of 10 room winners and 30 wildcard competitors per region, will advance to the next round.</LI><BR/>
						<LI>Each of the 200 advancers will win $50 each</LI><BR/>					
						</UL>
						
						<B>Online Regional Semifinal</B><UL>
						<LI>40 coders per region (totaling 200) will compete - A total of 50 competitors, comprised of 4 room winners and 6 wildcard competitors per region, will advance to the next round.</LI><BR/>
						<LI>Each of the 50 advancers will win $50 each </LI><BR/>
						</UL>
						
						<B>Online Regional Final</B><UL>
						<LI>10 coders per region (totaling 50) will compete</LI><BR/>
						<LI>The winner of each of the five (5) regions will be crowned that Regional Champion, and will win $600 each.  Each Regional Champion will automatically advance to the onsite Semifinal Round. (NOTE: All Regional Champions must participate in the onsite Semifinal Round to receive his / her prize.)</LI><BR/>
						<LI>The remaining eleven (11) spots in the onsite Semifinal and Championship Rounds will be handed out based on total points across all rooms (regardless of region).</LI><BR/>
						</UL><BR/>
						In order to advance, a coder must finish with a greater-than-zero point total. If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the regional wildcard pool. Any tie in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner: <UL>
						<LI>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems</LI><BR/>
						<LI>If a tie still remains, then by rating (higher is better) as of February 14, 2003</LI>
						</UL><BR/><BR/>
						</TD>
						</TR>
					</TABLE>						
				
						<P><HR/></P>

						<DIV CLASS="statTextBig">Onsite Semifinal and Championship Rounds</DIV><BR/>
						The sixteen (16) advancers from the Regional Championship round will travel to the University Park Hotel in Cambridge, MA on Thursday, April 3rd to compete in the Semifinal round of the tournament 
						being held on April 4th.  All contestants must arrive at the University Park Hotel no later than 5:00PM on Thursday, April 3rd.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her spot in the tournament, which will be given to the next highest overall scorer from the Regional Championship round.<BR/><BR/>
						
<P>
TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, 
up to a cost of $1,000 per person.  (That is, if a contestant's airfare is greater than $1,000, 
the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  
In addition, TopCoder will also provide travel arrangements to and from the airport to the University 
Park Hotel and accommodations and certain meals for each contestant and his/her guest.  All other expenses 
are the responsibility of the contestant and his/her guest.
</P>
  						
						TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating 
						(as of February 17, 2003) for each room will be similar.  The dates and times of the onsite Semifinal and 
						Championship rounds are as follows: <BR/><BR/>
						<DIV ALIGN="center"><TABLE WIDTH="100%" BORDER="1" CELLPADDING="6" CELLSPACING="0">
						<TR>
							<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Round of Competition</TD>
							<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Date &amp; *Time</TD>
						</TR>
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">- Semifinal Room #1</TD>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">April 4, 2003 at 8:00 AM EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">- Semifinal Room #2</TD>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">April 4, 2003 at 11:00 AM EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">- Semifinal Room #3</TD>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">April 4, 2003 at 2:00 PM EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">- Semifinal Room #4</TD>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">April 4, 2003 at 6:00 PM EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">- Championship Round</TD>
							<TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">April 5, 2003 at 11:00 AM EST</TD>
						</TR>	
						</TABLE></DIV><BR/>
						The Semifinal Round will consist of four (4) rooms of four (4) coders each.  The winner in each room will advance to the Championship Round.<BR/><BR/>

						<B>The Championship Round</B> will be a single round of four (4) coders.<BR/><BR/>
						
						First, second, third and fourth place in the Championship Round are determined by comparing the total points of each coder, with the highest point 
						value placing first.  The winner of the Championship Round will be the coder with the highest point total for the round.  In the event of a tie in the Semifinal and/or 
						Championship rounds, the tie will be resolved in the following manner (in order):<UL>
						<LI>Total points acquired (higher is better) in the 2003 Collegiate Challenge to date</LI><BR/>
						<LI>If a tie still remains, then by rating (higher is better) as of February 14, 2003</LI></UL><BR/>
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
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
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

