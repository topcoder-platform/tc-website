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
        <TITLE>TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament</TITLE>
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
<P CLASS="bodyTextBold">10.15.2001 - TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament<BR/>  
<SPAN CLASS="bodyTextItal">Computer Programming Tournament Will Award $100,000 To Winner</SPAN></P>
<P>GLASTONBURY, CT - October 15, 2001 - TopCoder, Inc., a company committed to identifying and promoting top-notch computer programming talent, announced today the 16 finalists to compete in their upcoming 2001 TopCoder Invitational tournament being held November 2-3 at the Foxwoods Resort Casino in Mashantucket, CT. The tournament has a total prize purse of $250,000, with the winner receiving $100,000.</P>
<P>The finalists are: Daniel Wright (Stanford, CA), Jon McAlister (Stanford, CA), Dan Adkins (Berkeley, CA), Jason Woolever (Sunnyvale, CA), James Lee (Ann Arbor, MI), Logan Hanks (Blacksburg, VA), Kamen Yotov (Ithaca, NY), Leo Polovets (Pasadena, CA), Eric Ellingson (Prior Lake, MN), David Ziegler (Boston, MA), Nathan Bronson (Durham, NC), Jon Salz (Somerville, MA), Ambrose Feinstein (Orlando, FL), Trayton Otto (Powder Springs, GA), Patrik Sundberg (Cambridge, MA) and Ben Wilhelm (Oberlin, OH).</P>
<P>Finalists advanced to the championship rounds based on their scoring in online elimination rounds, which began on September 25. Scoring in TopCoder competitions is based on two factors: Intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition, and velocity, the ability to write good code quickly and accurately. Scores are calculated using TopCoder's objective rating system, designed to fairly and accurately gauge a contestant's performance. Winners are the fastest among their peers to solve the problems with code that withstands the scrutiny of other contestants, as well as TopCoder's system test.</P>
<P>"We're confident our programming competitions test and reflect real-world coding skills in a way that's valuable to our constituents," said TopCoder founder Jack Hughes. "We're very excited as we enter the finals for our first TopCoder Invitational. The spirit of competition among these highly rated developers has become palpable. We wish each of the finalists the best of luck and look forward to announcing the winners on November 5."</P>
<P>TopCoder has created an objective rating system that places high value on the best and brightest in the programming industry. Their unique programming competitions, and the resulting natural attraction of competition, rewards and recognition, has created a powerful community of software developers. TopCoder competitions hold the attention and interest of individuals who are integral to the technology decision-making process for corporations, now and in the future. TopCoder offers exclusive targeted sponsorships of their single-round competitions and major tournaments to companies seeking to build brand awareness and loyalty among the developer community.</P>
<P>The tournament favorite is Daniel Wright, a junior at Stanford University, majoring in Computer Science. This is Wright's second consecutive appearance in TopCoder's first two major tournaments, as he finished tied for ninth at the TopCoder Collegiate Challenge in June, and won $5,750. Other returning competitors include Collegiate Challenge champion Jason Woolever, a Senior Research and Design Engineer for Synopsys, Inc. of Mountain View, CA; Wright's classmate and winner of $25,000 at the Collegiate Challenge, Jon McAlister; and James Lee, a computer science graduate student at the University of Michigan.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. Since the introduction of TopCoder in February, these competitions have attracted over 4,200 software developers. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. It costs members nothing to participate. For more information and registration details, visit the Web site, http://www.topcoder.com/?r=13</P> 
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
