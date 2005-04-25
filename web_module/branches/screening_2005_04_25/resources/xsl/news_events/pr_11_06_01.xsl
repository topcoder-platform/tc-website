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
        <TITLE>Houston Native Jon McAlister Wins $250,000 TopCoder Invitational</TITLE>
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
<P CLASS="bodyTextBold">11.06.2001 - Houston Native Jon McAlister Wins $250,000 TopCoder Invitational<BR/>  
<SPAN CLASS="bodyTextItal">Stanford University Junior Beats Out 15 Competitors for $100,000 Grand Prize</SPAN></P>
<P>CONNECTICUT -- November 5, 2001 -- Jon McAlister, a native of Houston, Texas, won the first-ever $250,000 TopCoder Invitational computer programming tournament held November 2 and 3 at the Foxwoods Resort Casino in Mashantucket, CT. McAlister, who is currently a junior computer science major at Stanford University, beat out 15 of the top computer programmers in the country to claim the $100,000 grand prize.</P>
<P>"Jon has clearly distinguished himself as one of the top computer programmers in the country," said TopCoder Chairman and Founder, Jack Hughes. "This is a tremendous accomplishment as Jon is only a junior in college, and was able to win a tournament which was not only open to other top collegians, but professional programmers as well."</P>
<P>"TopCoder competitions are great intellectual brain candy," said McAlister. "Tournaments like the Invitational are a unique experience to show how good a programmer you really are."</P>
<P>McAlister entered the Invitational as the second seed, and upset top-seed and fellow Stanford junior Daniel Wright (Lafayette, CO) by 71 points in the finals. Nathan Bronson (Durham, NC) and James Lee (Ann Arbor, MI) finished third and fourth, respectively, in the final round. </P>
<P>Semi-finalists in the tournament were: Dan Adkins (Berkeley, CA), Jason Woolever (Sunnyvale, CA), Logan Hanks (Blacksburg, VA), Kamen Yotov (Ithaca, NY), Leo Polovets (Pasadena, CA), Eric Ellingson (Prior Lake, MN), David Ziegler (Boston, MA), Jon Salz </P>
<P>(Somerville, MA), Ambrose Feinstein (Orlando, FL), Trayton Otto (Powder Springs, GA), Patrik Sundberg (Cambridge, MA) and Ben Wilhelm (Oberlin, OH).</P>
<P>TopCoder, Inc. is a company committed to identifying and promoting top-notch computer programming talent. TopCoder's objective rating system places high value on the best and brightest in the programming industry. These unique programming competitions, and the resulting natural attraction of competition, rewards and recognition, have created a powerful community of software developers who are integral to the technology decision-making process for corporations, now and in the future. TopCoder offers exclusive targeted sponsorships of their competitions to companies seeking to build brand awareness and loyalty among the developer community. Single-round competitions are held weekly and are open to all TopCoder members. TopCoder's best-rated members are invited to compete in major tournaments. </P>
<P>All Invitational semifinalists advanced to the onsite rounds based on their scoring in three online elimination rounds. Four semi-final rounds were held on Friday, with the winner of each round advancing to the Saturday's final. Scoring in TopCoder competitions is based on two factors: Intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition, and velocity, the ability to write good code quickly and accurately. Scores are calculated using TopCoder's objective rating system, designed to fairly and accurately gauge a contestant's performance. Winners are the fastest among their peers to solve the problems with code that withstands the scrutiny of other contestants, as well as TopCoder's system test.</P>
<P>The Invitational was the second major programming competition hosted by TopCoder. The company will hold its next tournament, the 2002 TopCoder Collegiate Challenge, in April 2002 in Cambridge, MA. </P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. Since the introduction of TopCoder in February, these competitions have attracted over 4,800 software developers. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. For more information and registration details, visit the Web site, http://www.topcoder.com/?r=15.
Editors' Note: Photos are available via the Associated Press Photo Network and on the Internet at Feature Photo Service's link through http://www.newscom.com </P> 
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
