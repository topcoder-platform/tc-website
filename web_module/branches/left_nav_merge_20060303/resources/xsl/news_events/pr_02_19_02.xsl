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
        <TITLE>Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge</TITLE>
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
  <xsl:with-param name="title">&#160;Press Releases - 2002</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
		            <!-- <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR> -->
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P CLASS="bodyTextBold"> 02.19.2002 <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/>Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge<BR/><SPAN CLASS="bodyTextItal">Students From Top U.S. Universities Will Vie for a Share of $150,000 in Prize Money</SPAN></P>
<P>GLASTONBURY, CT., Feb. 19, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced the field for its 2002 Collegiate Challenge, sponsored by Sun Microsystems.  The tournament, which will award a total prize purse of $150,000, begins tonight.</P>
<P>Elimination rounds will crown Regional Champions and reduce the field to 16<BR/>The 2002 Sun Microsystems and TopCoder Collegiate Challenge brings together 512 of the highest-rated TopCoder college-level members, identified based upon their performance in TopCoder competitions, for four rounds of online regional competition.  The winner of each region will be crowned the Regional Champion, win $5,000 and automatically advance to the final field of 16 competitors.  This elite 16 will compete in the tournament's final two onsite rounds and vie for their share of $150,000.  The Semifinal and Championship rounds will be held April 19 and 20, 2002 at the University Park Hotel @ MIT in Cambridge, Massachusetts.  There, the tournament champion will win $100,000.</P>
<P><DIV CLASS="bodyTextBold">Top U.S. Schools represented</DIV>The top-five schools, and number of students from each, that will be represented in the Collegiate Challenge are:  MIT (37), the University of Michigan (24), Georgia Tech (22), Stanford University (20), and the University of Texas-Austin (16).  Stanford junior Jon McAlister is ranked first in the West region and is the highest rated member entering the tournament.  McAlister was the runner-up in last year's Collegiate Challenge, and followed that performance with a first-place win at the 2001 TopCoder Invitational held in November 2001, which featured TopCoder's top-rated collegiate and professional members.</P>
<P>Other schools that will be strongly represented in the tournament include Virginia Polytechnic Institute and State University, Cornell University, Duke University, Carnegie Mellon University, the University of Illinois Urbana-Champlain, Iowa State University, the California Institute of Technology and UCLA.</P>
<P>THis is the second annual Collegiate Challenge and third major programming tournament hosted by TopCoder.  The 2001 TopCoder Collegiate Challenge was held in June 2001, and was won by Jason Woolever, a Massachusetts Institute of Technology graduate student.  Woolever is currently a Senior Research and Development Engineer at Synopsys, Inc. of Sunnyvale, California.</P>
<P>"Each year a new class of graduates enters the IT workforce," said TopCoder Chairman and founder, Jack Hughes.  "TopCoder competitions enable technology companies and recruiters to identify and objectively assess candidates through testing and rating coding skills under real-world conditions.  TopCoder offers services to assist companies looking to hire top programming talent."  </P>
<P>More information regarding TopCoder employment services, as well as sponsorship of weekly single-round matches and future major tournaments, can be found at www.topcoder.com or by calling 1-866-867-2633.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.</P>
<P CLASS="smallText">About the Sun Developer Connection Program<BR/>Building on Sun's vision to enable services on demand with the latest open technologies, the Sun Developer Connection (SDC) offers individual developers and software development partners a single, worldwide entry point to build a technical and business relationship with Sun.  As one of the largest developer communities in the world, the SDC is the connection to Sun for comprehensive resources to build and market solutions leveraging Sun's open technologies, products, business development, and community forums.</P>
<P CLASS="smallText">Sun, Sun Microsystems, the Sun logo, Sun Developer Connection, Java, Solaris, and The Network Is The Computer are trademarks of Sun Microsystems in the United States and other countries.</P>
<A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>:: Register with TopCoder to compete</A>
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
