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
        <xsl:call-template name="tournament_invit02_links"/>
	<!-- Coder of the Week Pulldown Ends -->
	<BR/>
	<xsl:call-template name="invit02_rule_links"/>
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
						<DIV CLASS="statTextBig">Online Elimination Rounds</DIV><BR/>
						<P>Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round. 
						(See below for competition dates and times.) TopCoder members from around the world may be participating in these rounds, but all start times will be 
						communicated as Eastern Time, so contestants in different time zones must adjust accordingly. If a coder does not participate, for any reason, in an online 
						round that they have advanced to, it will be treated as an automatic loss in that round of competition. 
						</P><P>
						All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all room assignments prior to the start 
						of each online round in a manner such that the average competitor rating (as of October 1st) for each room will be similar. The dates and times of the online 
						rounds of competition are as follows: 
						</P><TABLE STYLE="border-collapse:collapse;  border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt" CELLPADDING="0" CELLSPACING="0" BORDER="1"><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText"><B>Round of Competition</B></P></TD><TD STYLE="width:214.85pt;border:solid windowtext .5pt;   border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText"><B>Date and Time *</B></P></TD></TR><TR><TD STYLE="width:431.0pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" COLSPAN="2" WIDTH="431"></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216" CLASS="statText"><UL TYPE="disc"><LI>Online Round#1</LI></UL><P CLASS="statText"><BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;- Part 1</P><P CLASS="statText"><BR/><BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;- Part 2<BR/><BR/><BR/></P><UL TYPE="disc"><LI>Online Round #2</LI></UL><UL TYPE="disc"><LI>Online Round #3</LI></UL><UL TYPE="disc"><LI>Online Round #4</LI></UL></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215" CLASS="statText"><BR/><BR/>
						Tuesday, October 8<SUP>th</SUP><BR/>
						Registration:&#160;7:30 PM - 9:25 PM<BR/>
						START:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;9:30 PM
						<P CLASS="statText">Thursday, October 10<SUP>th</SUP><BR/>
						Registration:&#160;7:30 PM - 9:25 PM<BR/>
						START:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;9:30 PM </P><P CLASS="statText">Wednesday, October 16<SUP>th</SUP> at 9:30 PM</P><P CLASS="statText">Wednesday, October 23<SUP>rd</SUP> at 9:30 PM</P><P CLASS="statText">Wednesday, October 30<SUP>th</SUP> at 9:30 PM</P></TD></TR><TR><TD STYLE="width:431.0pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" COLSPAN="2" WIDTH="431"><P CLASS="statText">*NOTE:&#160; In the event
  						that a round must be cancelled for any reason, the "raindate" for
  						the cancelled match will be the following day at the same time.</P></TD></TR></TABLE><BR/>
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

