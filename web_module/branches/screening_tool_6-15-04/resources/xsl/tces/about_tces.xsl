<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Employment Services</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="180" VALIGN="top">
  <!-- Global Seconday Nav Begins -->    
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
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>

<P>
<B>About TCES</B>
</P>

<P>
TopCoder [TC], a site designed for programmers by programmers, builds opportunity 
through computer programming tournaments. Weekly, hundreds of programmers from 
around the world gather online at TopCoder to participate in Single Round Matches (SRMs). 
The SRMs are designed to objectively assess a coder's ability by having the coder solve three 
algorithmic problems, scrutinize other competitors' code, and withstand a system-generated 
test for correctness. Additionally, [TC] orchestrates major programming tournaments with
 prize purses up to $150,000. Upon completion of each competition, a coder's rating is 
 adjusted to reflect his/her ability as compared to all other rated TopCoder members. 
 It is this rating that will help potential employers differentiate talent during the 
 hiring process. 
</P>

<P>
TopCoder Employment Services [TCES] provides employers with innovative programs designed 
to attract, identify, and evaluate collegiate candidates, as well as experienced 
professionals, for full time employment consideration. [TCES] provides employers with 
intelligence about both graduating students and experienced professionals. With a member base in 
excess of 20,000 - including more than 10,000 students from over 750 schools - employers 
obtain objective measurement and detail about candidates not found elsewhere. 
</P>


<P>
The employer receives the following: 
</P>

<P>
<B>Employment Advertisement and Job Postings</B><BR/>
[TCES] launches a page in the Jobs section of the [TC] site allowing employers to introduce 
their company, the benefits of working in their organization and displays a list of job openings. [TCES] 
includes a link for a member to indicate interest in the position advertised. 
</P>

<P>
<B>Targeted Email Campaign</B><BR/>
[TCES] broadcasts an email to those members who have opted to receive employment 
notifications to alert them of the employer's page in the Jobs section. 
Additionally, the employer has the opportunity to send one targeted email per month during 
the contract. The employer can focus on one or multiple criteria, including rating status, rating level, 
state, professional/student status, school, and competition language. 
</P>

<P>
<B>SRM Featured Employer</B><BR/>
During the membership term, the employer has advertising time in the applet.
As part of the employment package, the employer will be noted as a Featured Employer on the [TC] homepage, 
member homepage, SRM summary page, and competition schedule page, as well as in the applet and practice rooms. 
</P>

<P>
<B>Reporting Access</B><BR/>
[TCES] presents the employer with reports on member responses to the employer's job advertisements 
and targeted emails. In addition, the employer is provided with the ability to view and download 
resumes and access member profiles, contact information and competition detail, which includes comparative 
statistics and code samples for rated TopCoder members. 
</P>


<B>Pricing</B>

<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="2" BGCOLOR="#FFFFFF" WIDTH="100%">
	<TR>
		<TD class="bodyText" BGCOLOR="CCCCCC" WIDTH="20%"><B>Membership Term</B></TD>
		<TD class="bodyText" BGCOLOR="CCCCCC" WIDTH="20%"><B>Number of Job Postings</B></TD>
		<TD class="bodyText" BGCOLOR="CCCCCC" WIDTH="20%"><B>Number of SRMs</B></TD>
		<TD class="bodyText" BGCOLOR="CCCCCC" WIDTH="20%"><B>Number of Emails</B></TD>
		<TD class="bodyText" BGCOLOR="CCCCCC" WIDTH="20%"><B>Price</B></TD>		
	</TR>
	<TR>
		<TD class="bodyText">3 months</TD>
		<TD class="bodyText">Up to 15</TD>
		<TD class="bodyText">1</TD>
		<TD class="bodyText">3</TD>
		<TD class="bodyText">$5,000</TD>		
	</TR>
</TABLE>

<P>
<B>Website Specifications</B>
</P>

<P>
Focusing on the unique nature of Single Round Match competitions, TopCoder does not permit banner 
advertising.  Employers are provided dedicated space within the website to recognize their promotion of 
employment opportunities and Single Round Matches.  Employers receive placement on various pages of the 
website with the Company's logo incorporated into Single Round Match promotional areas.  
</P>

<P>
Employers are required to provide the following to the TopCoder web marketing team by the deadline defined 
in the chart below:
<UL>
	<LI>  Logo and brand guidelines regarding color</LI>
	<LI>  Copy and URL for Sponsor Overview page</LI>
</UL>
</P>


<P>
*NOTE:  The TopCoder web marketing team can work in conjunction with the employer's internal 
marketing team to coordinate and facilitate artwork in order to meet the defined requirements and deadlines.  
Animated elements are not accepted.
</P>

<P>
<B>Position of Sponsored Areas</B>
</P>

<TABLE BORDER="1" BORDERCOLOR="#cccccc" CELLSPACING="1" CELLPADDING="2" BGCOLOR="#FFFFFF" WIDTH="100%">
	<TR>
		<TD class="bodyText" BGCOLOR="#CCCCCC" WIDTH="25%"><B>Area</B></TD>
		<TD class="bodyText" BGCOLOR="#CCCCCC" WIDTH="25%"><B>Size</B></TD>
		<TD class="bodyText" BGCOLOR="#CCCCCC" WIDTH="25%"><B>Duration</B></TD>
		<TD class="bodyText" BGCOLOR="#CCCCCC" WIDTH="25%"><B>Deadline</B></TD>	
	</TR>
	<TR>
		<TD class="bodyText">Employment Advertisement</TD>
		<TD class="bodyText">Full page</TD>
		<TD class="bodyText">Membership term</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>		
	</TR>
	<TR>
		<TD class="bodyText">Public Home</TD>
		<TD class="bodyText">244 x 140</TD>
		<TD class="bodyText">One week</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>		
	</TR>	
	<TR>
		<TD class="bodyText">Member home</TD>
		<TD class="bodyText">244 x 140</TD>
		<TD class="bodyText">One week</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>	
	</TR>
	<TR>
		<TD class="bodyText">Match Overview</TD>
		<TD class="bodyText">428 x 80</TD>
		<TD class="bodyText">One week</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>	
	</TR>	
	<TR>
		<TD class="bodyText">Registration</TD>
		<TD class="bodyText">170 x 117</TD>
		<TD class="bodyText">Match date</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>		
	</TR>	
	<TR>
		<TD class="bodyText">Calendar (Month View)</TD>
		<TD class="bodyText">Text listing</TD>
		<TD class="bodyText">N/A</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>		
	</TR>
	<TR>
		<TD class="bodyText">Applet
<UL>
	<LI> Lobby</LI>
	<LI> Status window</LI>
	<LI> Coding window</LI>
	<LI> Leader board</LI>
	<LI> Practice rooms</LI>
</UL>		
		</TD>
		<TD class="bodyText">300 x 50</TD>
		<TD class="bodyText">Match date</TD>
		<TD class="bodyText">2 weeks prior to posting</TD>		
	</TR>	
	<TR>
		<TD class="bodyText">Targeted email</TD>
		<TD class="bodyText">50 words each</TD>
		<TD class="bodyText">N/A</TD>
		<TD class="bodyText">3 days prior to distribution</TD>		
	</TR>			
</TABLE>


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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
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
