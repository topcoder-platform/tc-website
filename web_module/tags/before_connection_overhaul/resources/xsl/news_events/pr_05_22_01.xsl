<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title</TITLE>
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
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Press Releases - 2001</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
		            <!-- <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR> -->
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P CLASS="bodyTextBold">05.22.2001 - Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title<BR/><SPAN CLASS="bodyTextItal">San Francisco Tournament Concurrent with Sun's JavaOne Event. Winners From Top Schools Will Share $250,000 in Prize Money</SPAN></P>
<P>Glastonbury, Conn. -- May 22, 2001 -- TopCoder Inc., a Glastonbury, Connecticut-based company committed to identifying and promoting top-notch computer programming talent, announced today the 16 finalists to compete in the upcoming TopCoder Collegiate Challenge being held June 5-7 at the San Francisco Hilton and Towers. The tournament also sets the stage for the official launch of TopCoder, which uses these competitions to attract and rate highly skilled programmers while acting as a conduit between its members and potential employers.</P>
<P>The finalists from across the U.S. are: Jon McAlister, Daniel Wright and David Pecora (Stanford University); Andrew Nierman, Jason Dillaman, and James Lee (University of Michigan,); Nathan Egge and Alex Kalita, (Virginia Polytechnic Institute); Benjamin Jackson and Sean Stanek, (Iowa State University); Jason Woolever (MIT); Kenneth Tang (University of California, San Diego); Jason Wodicka (Rensselaer Polytechnic Institute); Aleksey Kurchuk (Rutgers University); Chad Wood (University of Texas at Austin); and Andrew Marut (Worcester Polytechnic Institute).</P>
<P>"Each year a new class of graduates enters the IT workforce," said TopCoder founder Jack Hughes. "TopCoder competitions help high-technology companies and recruiters identify and objectively assess candidates by testing and rating coding skills under real-world conditions."</P>
<P>Finalists advanced to the final rounds based on their scoring in preliminary online competition rounds that began on April 7. Scoring in TopCoder competitions is based on two factors: intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition; and velocity, the ability to write good code quickly and accurately. Scores are calculated using TopCoder's objective assessment model and unique rating system, designed to fairly and accurately gauge a contestant's performance.</P>
<P>For the Collegiate Challenge, the 16 finalists have been divided into four groups of four, based on the ratings they have earned over the course of competition. Each group's first place winner will then advance to the final championship round on June 7 from 10:00 a.m. to 12 p.m. (PDT) with an awards ceremony to follow. All competition rounds can be viewed live, online at www.topcoder.com.</P>
<P>The schedule for the event is as follows:</P>
<P><SPAN CLASS="bodyTextBold">Semi-final Rounds</SPAN><BR/>
Tuesday, June 5:<BR/> 
Group 1: 10:00 am - 12:00 pm Pacific Time<BR/>
Group 2: 2:00 pm - 4:00 pm Pacific Time<BR/></P>
<P><SPAN CLASS="bodyTextBold">Wednesday, June 6:</SPAN><BR/> 
Group 3: 10:00 am - 12:00 pm Pacific Time<BR/>
Group 4: 2:00 pm - 4:00 pm Pacific Time<BR/></P>
<P><SPAN CLASS="bodyTextBold">Prizes each semi-final group:</SPAN><BR/>
4th place: $3,000 (4 recipients total)<BR/>
3rd place: $5,750 (4 recipients total)<BR/>
2nd place: $10,000 (4 recipients total)<BR/>
1st place: $25,000 (four coders advance to Championship Round)<BR/></P>
<P><SPAN CLASS="bodyTextBold">Championship Round ($75,000 to 1st place winner) Thursday, June 5:</SPAN><BR/>
10:00 am - 12:00 pm Pacific Time<BR/></P>
<P><SPAN CLASS="bodyTextBold">Awards Ceremony and Reception</SPAN><BR/>
12:00 pm - 2:00 pm Pacific Time<BR/></P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts programming competitions for its members. Through its website, www.topcoder.com, the company has effectively combined the challenge of online contests, the efficiency of online recruiting and the objectivity of IT certification. By offering substantial membership incentives, including cash awards, and a unique objective rating model, TopCoder brings together highly qualified, talent-differentiated programmers, and facilitates connections with companies seeking access to such a group. As a commercial site, TopCoder establishes partnerships with organizations in the form of subscriptions and sponsorships. It costs programmers nothing to participate.</P> 
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
        <xsl:call-template name="pr_right_col"/>       
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
