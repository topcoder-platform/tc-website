<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
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
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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
  <xsl:with-param name="image">about_tc_membr</xsl:with-param>
  <xsl:with-param name="title">&#160;What are teams?</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
          			<TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
	            <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">INPUT:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:service@topcoder.com" CLASS="bodyText">Comments? Ideas?</A><BR/><A HREF="/rtables/index.jsp" CLASS="bodyText">Go to round table discussion</A></TD>
						</TR>
						<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
					</TABLE>
		          	</TD>
        		</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<P><B>Team Based Competitions - Interfacing with Web Services</B></P>
<P><B>Preface</B><BR/>
TopCoder will begin the next major phase of testing member's skills in the fashion of team-based competitions. The team-based competitions 
will be extended to include the usage of Web Services.  The competitions will test a person's ability to work with others, take direction from 
a team lead, interface with 3rd party objects and solve problems, all while working under pressure of time. The web services component of the 
competition will allow TopCoder to insert more technical disciplines and vary the skills being assessed. Like all TopCoder events, the performance 
of all participants will be systematic and objective. It will also allow members to get more familiar with the structure and applicability of 
what is clearly an increasingly important technology.</P>
<P>THE DATES AND TIMES OUTLINED IN THIS DOCUMENT ARE MEANT TO ELICIT FEEDBACK FROM OUR MEMBERS AND ARE SUBJECT TO CHANGE.</P>
<B>Team Organization</B>
<UL><LI><B>Number of Teams</B><BR/>The number of teams to be assembled will be based on the number of people that register for team-based competitions.  However, the teams will be split into 2 divisions.<BR/><BR/>
Division 1:  The number of teams will be capped at 48.  All rated members will be eligible for the draft, but once the 288 participants are chosen, all others can form additional teams in Division 2.<BR/><BR/>
Division 2:  The number of teams is unlimited.</LI><BR/>
<LI><B>Members per team:</B> (6)</LI><BR/>
<LI><B>Members on a team competing at once</B><BR/>There will be a maximum number of 4 members and a minimum of 3 members competing in any given team-based competition. 
Teams are encouraged to vary the team playing on any given night in order to ease scheduling conflicts and promote participation.</LI><BR/>
<LI><B>Sign Up</B><BR/>TopCoder will announce on Monday, April 1 to the member base that team competitions will be starting on a date to be determined. 
TopCoder will "announce" this via a page posted to the web site, and linking this page to a round table post.  In order to be considered for team-based competitions, 
members will have to sign up on the web site.  Part of the sign-up process will allow members to express interest in becoming a team captain.</LI><BR/>
<LI><B>Captains</B><BR/>Based on the response, TopCoder will select 48 team captains and alert them of their status.  The highest rated individuals who express an 
interest in being team captains will be chosen as captains. Once the teams have been established, the captain will select one alternate captain to be available 
in the event of scheduling conflicts and/or emergencies.</LI><BR/>
<LI><B>Draft</B><BR/>On a predetermined date, TopCoder will hold the TopCoder Draft. The TopCoder Draft will be similar to other professional drafts and will include 6 rounds 
in which all teams will select a player to their team.<BR/><BR/><UL>
<LI>Date: To be determined</LI><BR/>
<LI>Start Time: To be determined</LI><BR/>
<LI>Selection: The first selection in Round 1 will go to the lowest rated captain. The last selection in Round 1 will go to the highest rated captain. The first 
selection in Round 2 will go to the lowest rated captain, and so on.<BR/><BR/>
Each team will have 60 seconds to choose a member to their team.  If a team fails to select within the specified time slot they will have to wait until the end of 
that round to fill the spot. The clock within the arena will count down for each selection and TopCoder will announce the official selection.</LI><BR/>
<LI>Communication: In the arena, teams will be allowed to communicate amongst each other in private rooms to discuss skill sets, experience, etc.</LI><BR/>
<LI>Trades: At any point during the draft, teams will be allowed to trade team members.</LI></UL></LI></UL>
<P><B>Schedule</B><BR/>
There will be a team-based competition every week.  The day and time will be the same for every team competition.  This will allow team members to set their 
schedules accordingly.  The set date and time will be every Monday.  The season will last for 10 weeks.  As with any 
other major sporting event, the season will be composed of a regular season and playoffs.<UL>
<LI><B>Regular Season</B><BR/>The regular season will consist of 10 team-based competitions. However, only 24 Division I teams will compete for prize money each week. 
All other teams in Division 1 and 2 are eligible to compete, however prize money will be paid only to the 24 teams designated to compete for that week.<BR/><BR/>
Note:  Not every team will play each other during the regular season.</LI><BR/>
<LI><B>Regular Season Start</B><BR/>To be determined<BR/>There will be a team match every Monday for 10 weeks (total of 10 team matches).</LI><BR/>
<LI><B>Playoffs Start (8 teams)</B><BR/>
Round 1:	To be determined, 4 teams advance<BR/>
Semifinal:	To be determined, 2 teams advance</LI><BR/>
<LI><B>Championship Match (2 teams compete head-to-head)</B><BR/>
To be determined</LI></UL>
During the first 2 team-based competitions, which will span 2 weeks, a team captain will have the ability to trade players or cut players and select members 
from a pool of players not selected in the TopCoder Draft.</P>
<P><B>Competition Format</B><BR/>
Every time there is a team-based competition it will be the responsibility of the team captain to register all of the competing team members.   During each team-based 
competition, there will be a minimum of 3 and maximum of 4 members competing on a given team.  TopCoder will require that each team member must compete in at least 6 
team-based competitions in order to be eligible for the Playoffs.</P><UL>
<LI><B>Assignments</B><BR/>In the competition, TopCoder will define the components that need to be implemented in order to accomplish the specified task.  Once the 
competition begins, the team captain will assign each team member a task (component) to complete.  The task (component) and the assigned writer will be registered 
with the TopCoder server.  Only that team member will be able to submit code for that component.  If a team captain feels that a member is not doing adequate work, 
he/she may assign the task to another team member or themselves, thus allowing the new member to submit.  During the competition each team member will be able to view 
each other's work.</LI><BR/>
<LI><B>Questions</B><BR/>The questions will be composed in such a way that there will be several components that need to be developed.  The components will have to 
interface with web services that have already been implemented by TopCoder problem coordinators.  TopCoder will provide to each team the specification of the web 
service along with the associated URL to access the web service.  The team members will then have to communicate with the web service via the Simple Object Access 
Protocol (SOAP), in order to obtain a service that is integral to a problems solution.  An example would be to call a web service, passing it an SQL statement, which 
would in turn return a result set in XML format.  Every team-based competition will attempt to test a different set of technical skills. During each team-based 
competition, there will only be one problem given that the team needs to solve.<BR/><BR/>
The plan is to have 3 web services for each team-based competition.  The team lead would assign a component that deals with one of the web services to each team member. 
The 3 members are writing the code that would interface with the web services and at the same time perform some unit of work.  The team lead would then write the main 
level code that would interface with the 3 components that the other 3 members have created, and produce some output.  This way the team lead's submission is dependent 
on the code submitted by the other 3 team members.  In turn, the 3 team member's submissions are dependent on interfacing with TopCoder specific web services.  Multiple 
submissions will be allowed, however there will be a penalty associated with such an action.</LI><BR/>
<LI><B>Web Services</B><BR/>The TopCoder members that currently write problems for Single Round Matches will also be creating the web services that will support the team based competitions. 
The web services that will be created for each team-based competition will be exposed via the Internet during the active contest.  That way as members are using their 
preferred IDE they will be able to interface with the web service remotely and perform the necessary tasks.  Regardless of the approach used, connecting remotely vs. using 
the TopCoder system to test their application, the team member must submit all code to earn points for the submission.</LI><BR/>
<LI><B>Team Communication</B><BR/>All of the team members will have the ability to communicate with each other without having the other team view the conversation. 
This way a team member may ask questions, provide feedback and discuss different approaches.</LI><BR/>
<LI><B>Rooms</B><BR/>2 teams will be assigned to each room for a given team-based competition. In the event where there are 24 teams competing at a time, there will be 12 rooms 
created for the match.  The relevance of the rooms will only come into play during the challenge phase.</LI><BR/>
<LI><B>Points</B><BR/>A team will have the potential of receiving points based on a timed submission per component, and an overall submission score. Teams will also be awarded 
points based on performance metrics.  At the end of the competition the mean processing time will be determined from all of the solutions submitted.  Then points will be 
awarded or deducted based upon the standard deviation from the calculated mean. The mean processing time will be based on all solutions submitted, regardless of technology used.</LI><BR/>
<LI><B>Challenge Phase</B><BR/>The Challenge Phase will be very similar to the current Challenge Phase.   The only distinct difference is that there will be 2 teams per room, thus 
only allowing the 2 opposing teams to challenge each other's submissions.  The team's problems will be challenged at the main level and not the individual component level.</LI><BR/>
<LI><B>System Test Phase</B><BR/>All of the successful submissions (those that withstand the Challenge Phase) will go through the first stage of system testing.  Any submissions 
that fail during the Challenge Phase and/or the System Test Phase will need to be tested for partial credit.  Each, or a subset, of the components will need to be tested in order 
to provide the team with the ability of earning points.</LI><BR/>
<LI><B>Rating</B><BR/>The TopCoder team rating will be kept separate from the individual match rating that members have.  The team-based rating will be a function of the team's 
overall score in the competition.  Since all of the teams will be solving the same problem during a team-based competition, the team rating will be relative.</LI><BR/>
<LI><B>Prize Money</B><BR/>Regular Season competitions (10 competitions in total)<BR/><BR/>
A total of $5,000 will be paid out for each weekly team competition. Each week, 24 teams will compete and 12 teams will win. The 4 team members who compete in the competition will 
collect the prize money, so each winning team member will receive $100 each. A total of $4,800 will be paid out to Division 1 winners. The remaining $200 will be paid to the highest 
scoring team in Division 2.<BR/><BR/>
Playoffs (3 rounds in total) - Total prize purse of $55,000<BR/><BR/>
8 teams compete - TBD<BR/>
4 teams compete - TBD<BR/>
2 teams compete - TBD<BR/><BR/>
Best 4 teams win:  $55,000 total prize purse to be paid as follows:<BR/>
#1 team: $25,000 ($5,000 per team member)<BR/>
#2 team: $15,000 ($3,000 per team member)<BR/>
#3 team: $10,000 ($2,000 per team member)<BR/>
#4 team: $ 5,000 ($1,000 per team member)</LI></UL>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
          			<TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
	            <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">INPUT:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:service@topcoder.com" CLASS="bodyText">Comments? Ideas?</A><BR/><A HREF="/rtables/index.jsp" CLASS="bodyText">Go to round table discussion</A></TD>
						</TR>
						<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
					</TABLE>
		          	</TD>
        		</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
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
