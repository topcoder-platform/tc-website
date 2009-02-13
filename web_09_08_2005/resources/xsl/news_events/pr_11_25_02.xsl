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
        <TITLE>Australian Programmer Wins 2002 TopCoder Invitational Tournament</TITLE>
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
		            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P><B>Australian Programmer Wins 2002 TopCoder Invitational Tournament</B><BR/>
Melbourne Resident John Dethridge 'Out-Codes' 15 Top Competitors For $50,000 Grand Prize</P>

<P>
GLASTONBURY, Conn., Nov. 25 /PRNewswire/ -- John Dethridge of Melbourne,
Australia won the second annual 2002 TopCoder Invitational, held at the
Mohegan Sun Casino in Uncasville, CT on November 22-23.  Dethridge beat 15 of
the world's best computer programmers during the semifinal and championship
rounds for the $50,000 grand prize.
</P>
    
<P>
    The 2002 TopCoder Invitational is Dethridge's first appearance at an
onsite TopCoder competition.  "This is really exciting for me," said
Dethridge.  "Although this is my first appearance in a TopCoder tournament, I
have quite a bit of experience in programming competitions.  The TopCoder
finals are unlike any competition I've been in, and I am proud to represent
Australia in the tournament."
</P>

<P>
    At the start of the tournament, Dethridge was the 4th seed and the #4
rated member among more than 20,000 developers in the TopCoder community.  As
a result of his victory, he has now become the #1 rated TopCoder member.  He
"out-coded" Derek Kisman, the previous top rated member and a programmer at a
bioinformatics company in Waterloo, Ontario; David Arthur, a junior at Duke
University; and Zhiyan Liu, a doctorate student at Princeton University in the
Championship round.  Although TopCoder competitions offer competitors the
choice of three programming languages -- Java, C++ and C# -- all the finalists
used C++ in the Championship round.
</P>

<P>
    "John is arguably the best computer programmer in the world," said
TopCoder founder and chairman, Jack Hughes.  "Winning this global competition,
which started with more than 700 programmers from eight different countries,
is a tremendous accomplishment.  He should be very proud of his performance in
the tournament."
</P>

<P>
    Semifinalists in the tournament were Ben Wilhelm (Seattle, WA), Tom
Sirgedas (Novi, MI), Nathan Bronson (Chapel Hill, NC), Reid Barton (Arlington,
MA), Ruoming Pang (Princeton, NJ), Ambrose Feinstein (Orlando, FL), Dan Adkins
(Berkeley, CA), Daniel Wright (Stanford, CA), Jared Showalter (Cambridge, MA),
Lars Hellsten (Waterloo, CA), Tomas Rokicki (Palo Alto, CA), and Sergey
Kalinichenko (San Francisco, CA).
</P>

<P>
    The results of TopCoder's major tournaments and weekly competitions create
a global database of objectively rated and talent-differentiated student and
professional programmers.  "Companies use our competition platform and the
valuable information and statistics derived from our competitions to identify
the proficiency of programmers," said Hughes, a veteran programmer.  "Our
programming competitions test and reflect real-world coding skills in a way
that's valuable to our constituents.  Our fast growing list of blue-chip
clients, including Microsoft, the FBI, and Google, is proof of that.  By
hosting these competitions, TopCoder provides the means for leading companies
to access the upper echelon of computer programmers."
</P>


<P><BR/></P>

<P>
<B>About TopCoder, Inc.</B><BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information, visit www.topcoder.com.</P>

<P>
<B>About TopCoder Employment Services (TCES)</B><BR/>
    TCES provides companies with an unprecedented way to identify and
differentiate skilled programmers.  By providing technical information about
employment candidates, TCES enables recruiting and hiring personnel to be more
efficient, save time and employ more productive hires.  Subscribing companies
post jobs, and TopCoder members respond directly, at http://www.topcoder.com.</P>
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
