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
        <TITLE>TopCoder Expands to Include Employment Services</TITLE>
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
<P><B>TopCoder Expands to Include Employment Services</B><BR/>
              Host of Computer Programming Contests Offers More to Members and Clients</P>

<P>
<B>GLASTONBURY, CT., Oct. 22, 2002</B> - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced it has expanded its business offering to include employment services. <A HREF="/?&amp;t=tces&amp;c=index" CLASS="bodyText">TopCoder Employment Services (TCES)</A> is designed to improve an organization's often-inefficient hiring process by providing an unmatched method to identify proficient computer programmers.
</P>

<P>
"We hear from companies every day that receive thousands of resumes each week and dedicate significant resources to find qualified candidates amongst a mountain of paper," said Paul Moriarty, director, employment services for TopCoder. "When hiring programmers, companies lack objective data and history of work samples, which are critical measures in assessing skills and projecting productivity.  TopCoder Employment Services provides recruiters and hiring engineers with an unprecedented amount of quick, valuable information to make more informed decisions about a candidate's abilities."
</P>
 
<P>
<B>TCES Candidate Recruiting Program</B><BR/>
During the hiring process, companies typically ask engineers to screen candidates for technical prowess, yet those engineers are provided with little technical information about the candidate's programming ability.  TopCoder's Candidate Recruiting Program provides companies with that information.  Data about the TopCoder member base, recently described by Business 2.0 as "one of the richer databases of programming talent ever assembled," effectively supplements a company's recruiting and screening efforts. 
Since launching this service in September of 2002, several companies have enlisted in TopCoder's Candidate Recruiting Program; General Electric, NVIDIA Corporation, Google, Apex Data Services and the FBI are using this program in their hiring efforts.
</P>

<P>
"The FBI has a heightened need to attract and identify the nation's top technical talent for our computer scientist special agent position as well as professional support positions," said special agent Joe Bross, who manages national recruiting for the FBI.  "We look to TopCoder to help us in this critical mission."
</P>

<P>
"Given the concentration of TopCoder members at the most elite computer science schools in the country, we're using TCES to identify candidates for our information management leadership program," said Steve Canale, manager, recruiting and staffing services for General Electric.
</P>

<P>
"TopCoder Employment Services taps into a unique pool of talent," said Jay Berkenbilt, vice president, software engineering at Apex, and himself a TopCoder member since January 2002.  "By attracting the kind of person who loves to write code, TopCoder
Employment Services has been able to provide more technically qualified programming candidates for Apex than all our other recruiting sources combined."
</P>

<P>
Companies enlist in the TCES Candidate Recruiting Program for terms of 3 to 12 months.  Based on the duration of the program, companies post job descriptions at www.topcoder.com.  TopCoder members respond to desired positions, and the responses are managed via an easy-to-navigate reporting and tracking application.  Each company creates a private database of interested candidates, which contains specific information about each TopCoder member that has applied, including competition statistics, code samples and resume information.  Unlike traditional job sites that offer nothing in the way of skills assessment, TopCoder's system allows employers to find developers with specific skills and an ability to determine proficiency within that skill set.  This dramatically reduces the amount of time involved in verifying proficiency. 
</P>


<P><BR/></P>
<P>
<B>About TopCoder Employment Services (TCES)</B><BR/>
TCES provides companies with an unprecedented way to identify and differentiate skilled programmers.  By providing technical information about employment candidates, TCES enables recruiting and hiring personnel to be more efficient, save time and employ more productive hires.  Subscribing companies post jobs, and TopCoder members respond directly, at www.topcoder.com. </P>

<P>
<B>About TopCoder, Inc.</B><BR/>
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
