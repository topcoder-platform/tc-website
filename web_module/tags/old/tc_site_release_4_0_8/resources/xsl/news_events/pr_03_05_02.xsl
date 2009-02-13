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
        <TITLE>TopCoder Reaches 10,000 Member Milestone</TITLE>
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
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
<P><B>TopCoder Reaches 10,000 Member Milestone</B></P>
<P>Host of Computer Programming Contests Sees Considerable Growth in the Last Six Months</P>
<P>GLASTONBURY, CT., March 4, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced it has reached the 10,000-member mark just one year into the company's existence.</P>
<P>Almost 75 Percent of Membership Gained in Past Six Months</P>
<P>Aided by membership drives to increase the amount of competitors in the 2001 TopCoder Invitational and the current TopCoder Collegiate Challenge, TopCoder added over 7,300 new members from September 2001 through February 2002.  The following chart outlines TopCoder's membership growth over the past six months:</P>
<DIV ALIGN="center"><IMG SRC="/i/membergrowth.jpg" alt="membergrowth" width="371" height="227" border="0"/></DIV>
<P>International Expansion Increases TopCoder's Global Presence</P>
<P>Over the past six months, TopCoder has seen positive results from expanding the eligibility criteria to include residents of four major computer programming hotbeds: Canada, Australia, India and the United Kingdom.  These countries make up more than 1,100 of TopCoder's developer community.  India leads with 401, followed by Canada (390), the United Kingdom (176) and Australia (139).  This growth demonstrates the success of TopCoder's global expansion, and TopCoder will continue to extend its programming competitions worldwide as international demand for competition continues, in effect, bringing the entire worldwide developer community together.  The company's next expansion effort is Ireland.</P>
<P>Match Participation Growth</P>
<P>Participation in TopCoder's Single Round Matches has increased from 81 for the first match in May 2001 to almost 600 for the most recent match on February 28, an increase of over 600 percent.  TopCoder began averaging over 100 participants for matches in August 2001, grew to over 200 in November, reached the 350 mark in January 2002, and erupted to more than 500 in February.   The following chart tracks the member participation per match:</P>
<DIV ALIGN="center"><IMG SRC="/i/matchparticipation.jpg" alt="matchparticipation" width="371" height="214" border="0"/></DIV>
<P>Growth Due to Desire to Increase Skills and Marketability</P>
<P>TopCoder's growth is due largely to the fact that TopCoder offers the developer community a means of building their skills in order to help differentiate and better position themselves in a tight job market.  TopCoder competitions establish objective peer coding ratings that document skills and accomplishments to colleagues and prospective employers.</P>
<P>Continued Growth Expected</P>
<P>TopCoder expects to see this growth trend continue as its average monthly growth rate has been more than 1,200 new members for the past six months, after averaging 510 the previous six.  TopCoder's most successful way of recruiting new members has been its Referral Incentive Program, which debuted in August 2001.  The Referral Incentive Program was designed to increase the number of quality programmers competing in TopCoder competitions.  This program provides cash incentives to those members who spread the word about TopCoder.  For a one-year period following the registration of a referral, the referring member will receive a commission of 10 percent of all cash prizes won by the referred member.</P>
<P>"The Referral Incentive Program has done a great job in increasing membership and developer support," said Jack Hughes, founder and chairman for TopCoder.  "A referring member could actually earn over $20,000 in commissions off of one referral.  This is unprecedented in Internet competitions.  To date, TopCoder's Referral Incentive Program has been responsible for 1,537 members."</P>
<P>About TopCoder, Inc.</P>
<P>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>
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
