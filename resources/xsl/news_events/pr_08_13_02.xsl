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
        <TITLE>Sun Microsystems and TopCoder Host SunNetwork(SM) Coding Challenge</TITLE>
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
<P><B>Sun Microsystems and TopCoder Host SunNetwork(SM) Coding Challenge<BR/>
              At the SunNetwork(SM) Conference in San Francisco</B></P>

<P>
    SANTA CLARA, Calif. and GLASTONBURY, Conn., Aug. 13 /PRNewswire-FirstCall/
-- Sun Microsystems, Inc. (Nasdaq: SUNW) and TopCoder, Inc. today opened
registration for the upcoming SunNetwork(SM) Coding Challenge being held
during the SunNetwork(SM) Conference and Pavilion at the San Francisco Moscone
Center from September 18-20, 2002. The tournament, which has a total prize
purse of $80,000, will be open to Java(TM) coding conference attendees who
register for the conference at http://www.topcoder.com/sunnetworkchallenge or
at the TopCoder pavilion during the SunNetwork Conference.
</P>
<P>
    This year marks the inaugural edition of the SunNetwork Conference and
Pavilion, an event dedicated to showcasing Sun's end-to-end solutions that
have revolutionized the Internet, networking and computing industries.
SunNetwork offers in-depth sessions on Sun system architecture, network and
computing management, services development tools and techniques. SunNetwork
will bring Sun's partners, customers and developers together to solve their
technology and networking challenges.
</P>
<P>
    "Many people think of software engineers as antisocial without a
competitive bone in their bodies," said James Gosling, Vice President and Sun
Fellow, Sun Microsystems, Inc. "But while we may be 'differently social', we
are very competitive, especially about the activity at the core of our
profession:  coding. The folks at TopCoder have done a great job of
formalizing the informal competitions that hackers have always engaged in, and
I'm looking forward to the Java Coding Challenge at the SunNetwork
Conference."
</P>
<P>
    The Challenge will commence with a qualification round on September 18th,
which will be open to everyone attending the SunNetwork Conference with the
top 32 performers advancing to the next round of competition. Through
elimination rounds, the field of 32 competitors will then be narrowed to an
elite "Final Four," who will compete in the Championship round for the grand
prize of $50,000. The second place winner will receive $15,000, the third
place winner takes home $10,000 and the fourth place winner captures the final
$5,000. The championship round will be held at 4:00 p.m. PDT on Thursday,
September 19th at the Moscone Center. The grand prize winner will be awarded a
check for $50,000 on Friday, September 20th at 9:00 a.m. PDT by James Gosling
and Bill Joy prior to the closing keynote of the conference. Competition
updates will be published on the Sun web site,
http://sunnetwork.sun.com/sf2002/topcoder/ throughout the tournament.
</P>
<P>
    "TopCoder has taken a very technical discipline and made it into an
exciting competitive event," said Mark Tolliver, Executive Vice President,
Marketing &amp; Strategy, Chief Strategy Officer, Sun Microsystems, Inc. "We at
Sun are very pleased with the way developers across the US are taking an
interest in the Challenge. The SunNetwork Coding Challenge provides an
excellent platform for displaying individual programming talent, and is a
great way to learn and build collaborative developer communities."
</P>
<P>
    "TopCoder is pleased to be powering the SunNetwork Coding Challenge," said
Rob Hughes, President and Chief Operating Officer, TopCoder, Inc. "TopCoder's
competitions are a proven way for developers to hone their coding skills. Over
the past six months, TopCoder's student and professional members have spent
over 80,000 hours at TopCoder's web site improving their Java skills. The
SunNetwork Coding Challenge is an opportunity for these developers to showcase
their skills during competition."
</P>

<P><BR/></P>
<P>
About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>


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
