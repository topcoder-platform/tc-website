<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/about/public_about_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: About TopCoder</TITLE>
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
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
	<!-- Global Seconday Nav Begins -->		
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="public_about_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">about_tc</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
<P><B>Team Based Competitions – Interfacing w/ Web Services</B></P>
<P>Preface<BR/><BR/>TopCoder has been criticized in the past for not being able to provide an accurate depiction of a coder’s skill set.  The criticism has come about because the current competitions only test a coder’s algorithmic problem solving skills, in regards to the element of speed.  TopCoder will begin the next major phase of testing member’s skills sets.  TopCoder will attempt to do this in the fashion of team-based competitions.  The team-based competitions will be extended to include the usage of Web Services.  The Team based competitions will test a person’s ability to work with others, take direction from a team lead, interface with 3rd party objects, and solve problems, all while working under pressure of time.</P>
<P><B>Team Organization</B></P>
<P>Number of Teams<BR/>The number of teams that will be assembled will be based on the number of people that register for team-based competitions.</P>
<P>Members per team<BR/>6</P>
<P>Members on a Team competing at once</BR>There will be a maximum number of 4 members and a minimum of 3 members competing at any given team-based competition.</P>
<P>Sign Up<BR/>
TopCoder will announce to the member base that team competitions will be starting on a predetermined date.  In order to get ready for team-based competitions, members will have to sign up on the website.  Part of the signup process will allow members to express interest in becoming a team captain.  The sign up process will be open for 7 days.  In order for members to sign up they must have:<UL>
1. A TopCoder rating.<BR/>
2. Competed in at least 2 rated TopCoder events.</UL></P>
<P>Captains<BR/>Based on the response TopCoder will select 32 team captains (team leads), and alert them of their status.</P>
<P>Draft<BR/>On a predetermined date TopCoder will hold the TC Draft.  The draft will work very similarly to other sport drafts.<UL>
Start Time - 12:01 P.M. EST<BR/>
Selection<BR/>
The lowest rated captain will select first, and go up from there.  In the arena there will be a clock counting down.  There will be 60 seconds between each start of member selection phase.  Each team will have 60 seconds to choose a member to their team.  If they miss the specified time slot they will have to wait until the end to fill the spot.<BR/>
Communication<BR/>In the arena, teams will be allowed to communicate amongst each other in private rooms to discuss skill sets, experience, etc.<BR/>
Trades<BR/>At any point during the draft, teams will be allowed to trade team members.<BR/>
End Time - 2:00 P.M. EST<BR/>
Schedule<BR/></P>
<P>There will be a team-based competition every 2 weeks.  The day and time will be the same for every team competition.  This will allow team members to set their schedules accordingly.  As with any other major sporting event, the season will be composed of a regular season and playoffs.  
	Regular Season
The regular season will consist of 16 team-based competitions.  
Note:  Not every team will play each other during the regular season.
Playoffs
The top 8 rated teams will advance to the playoffs.  The playoffs will be composed of 3 rounds, the first round, semi-finals and finals.  The first round will have 8 teams with only the winners advancing.  The semi-finals will be composed of 4 teams with only 2 teams advancing.  And the finals will be the final 2 teams competing head to head for the grand prize.

**Note that the dates are not real, they are shown here to give an example of a whole season.
	Regular Season Start
	May 2nd, 2002
	Playoffs Start
	December 12th, 2002
	Championship Match
	January 9th, 2003

During the first 2 team-based competitions, which will span a month, a team captain will have the ability to trade its players, or cut players and select member from a pool that has yet to be chosen from.
Competition Format
Every time there is a team-based competition it will be the responsibility of the team captain to register all of the competing team members.   During each team-based competition there will be maximum of 3 members competing on a given team.  TopCoder might want to enforce that each team member must compete in a team-based competition for a minimum number of times in order to be eligible for the playoffs.
	Assignments
In the competition, TopCoder will define the components that need to be implemented in order to accomplish the specified task.  Once the competition begins the team captain will assign each team member a task (component) to complete.  The task (component) and the assigned writer will be registered with the TopCoder server.  Only that team member will be able to submit code for that component.  If a team captain feels that a member is not doing adequate work he/she may assign the task to another team member or themselves, thus allowing the new member to submit.  During the competition each team member will be able to view each other’s work.  
	Questions
The questions will be composed in such a way that there will be several components that need to be developed.  The components will have to interface with Web Services that have already been implemented by TopCoder problem coordinators.  TopCoder will provide to each team the specification of the Web Service along with the associated URL to access the Web Service.  The team members will then have to communicate with the Web Service via the Simple Object Access Protocol (SOAP), in order to obtain a service that is integral to a problems solution.  An example would be to call a Web Service passing it an SQL statement, which would in turn return a result set in XML format.  Every team-based competition will attempt to test a different set of technical skills.  Some examples include: SQL, Algorithm skills, and HTTP.    During each team-based competition there will only be one problem given that the team needs to solve.

The plan is to have 2 Web Services for each team-based competition.  The team lead would assign a component that deals with one of the Web Services to each team member.  The 2 members are writing the code that would interface with the Web Services and at the same time perform some unit of work.  The team lead would then write the main level code that would interface with the 2 components that the other 2 members have created, and produce some output.  This way the team lead’s submission is dependant on the code submitted by the other 2 team-members.  In turn the 2 team-member’s submissions are dependant on interfacing with TC specific Web Services.  Multiple submissions will be allowed, however there will be a penalty associated with such an action.
Web Services
The TopCoder members that currently write problems for SRMs will also be creating the Web Services that will support the team based competitions.  The Web Services that will be created for each team-based competition will be exposed via the Internet during the active contest.  That way as members are using their preferred IDE they will be able to interface with the Web Service remotely and perform the necessary tasks.  Regardless of the approach used, connecting remotely vs. using the TopCoder system, to test their application, the team member must submit all code to earn points for the submission.   
	Team Communication
All of the team members will have the ability to communicate to each other without having the other team view the conversation.  This way a team member may ask questions, provide feedback and discuss different approaches.
Rooms
2 teams will be assigned to each room for a given team-based competition. In the event where there are 32 teams competing at a time there will be 16 rooms created for the match.  The relevance of the rooms will only come into play during the challenge phase.
	Points
A team will have the potential of receiving points based on a timed submission per component, and an overall submission score.  Teams will also be awarded points based on performance metrics.  At the end of the competition the mean processing time will be determined from all of the solutions submitted.  Then points will be awarded or deducted based upon the standard deviation from the calculated mean.  Keep in mind that the mean processing time will be based on all solutions submitted regardless of technology used.
Challenge Phase
The challenge phase will be very similar to the current challenge phase.   The only distinct difference is that there will be 2 teams per room.  Thus only allowing the 2 opposing teams to challenge each other’s submissions.  The team’s problems will be challenged at the main level and not the individual component level. 
	Technologies
Teams will be able to use Java and C#.  More analysis needs to be done to determine the viability of C++.
	System Test Phase
All of the successful submissions (withstood challenge phase) will go through the first stage of system testing.  Any submissions that have failed during the challenge phase and/or the system test phase will need to be tested for partial credit.  Each or a subset of the components will need to be tested individually in order to provide the team with the ability of getting some points.
Rating
The TopCoder team rating will be kept separate from the individual match rating that members have.  The team-based rating will be a function of the teams overall score in the competition.  Since all of the teams will be solving the same problem during a team-based competition the team rating will be relative.
</P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
