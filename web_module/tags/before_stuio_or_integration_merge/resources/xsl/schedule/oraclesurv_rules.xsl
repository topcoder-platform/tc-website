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
        <TITLE>TopCoder :: Schedule</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
          <TR>
    <!-- Left Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
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
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">schedule_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;Tournaments</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<DIV ALIGN="center">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="80%">
	<TR>
		<TD ALIGN="center" WIDTH="81"><A HREF="http://www.oracle.com/go/?&amp;Src=1393108&amp;Act=95" CLASS="statTextBig" TARGET="_blank"><IMG SRC="/i/oracleworld_logo.gif" ALT="" WIDTH="81" HEIGHT="80" BORDER="0" VSPACE="10"/></A><BR/>
		<A HREF="http://www.oracle.com/go/?&amp;Src=1393108&amp;Act=95" CLASS="statTextBig" TARGET="_blank">Register!</A></TD>
		<TD ALIGN="center"><IMG SRC="/i/oracle_cs1.gif" ALT="" WIDTH="150" HEIGHT="150" BORDER="0" VSPACE="10"/></TD>
	</TR>
</TABLE>
</DIV>
<B>What:</B> Code Survivor: the Java Developer Challenge, Powered by TopCoder<BR/>
<B>When:</B> November 11th - 13th<BR/>
<B>Where:</B> OracleWorld - Moscone Center, San Francisco, CA<BR/>
<B>Prizes:</B> Prizes valued at over $40,000<BR/>

<P>
Note:  You must be an OTN member and a
registered attendee* of OracleWorld to compete.
</P>
<P>
* There is no cost to attend the OracleWorld exhibit hall. <A HREF="http://www.oracle.com/go/?&amp;Src=1393108&amp;Act=95" CLASS="statTextBig" TARGET="_blank">Click here to register</A>.
</P>
<BR/>
<P><B>Code Survivor Official Rules</B> (needs link)</P>
<UL>
	<LI><A HREF="#2" CLASS="statText">Round Schedule</A></LI>
	<LI><A HREF="#3" CLASS="statText">Practice Opportunities</A></LI>
	<LI><A HREF="#4" CLASS="statText">Powered by TopCoder<sup>TM</sup></A></LI>	
</UL>


<P><BR/></P>

<!-- <P>
<A NAME="1"></A><B>Overview of the Tournament</B>
</P>

<P>
The contest would involve six rounds of competition, 
with the Qualification Round taking place on Monday, November 11th.  The Qualification Round will consist of two sessions of up to 400 competitors per session to identify the 100 coders who will advance to compete on 20 Code Survivor teams. The next three rounds will be conducted on Tuesday, November 12th, with teams 
building a "bank of prize money" and eliminating one team member per round.   One team member will be voted off buy his/her respective team after each Elimination Round. The final two rounds will be held on Wednesday, November 13th and will determine the 
winner of each team and the "Code Survivor Champion".  Competitors will use the existing TopCoder Arena Applet where Java will be the only programming language 
available to the contestants. 
</P>

<P>
The total number of developers who can participate in this 
competition will be a factor of the number of workstations that can be provided.  In the following scenario, if Oracle were to provide 400 workstations, a maximum of 800 developers would have the option to participate in the competition as structured.
</P>

<P>
<B>Qualification Round</B><BR/>
The Qualification Round will consist of two sessions.  400 people will compete in each session for a total of 800 participants.  Each  group will compete on Monday with 
the schedule for the sessions being as follows:
<UL>
	<LI> Session #1: Monday, November 11th (8:30PM - 9:00PM, PST) </LI>
	<LI> Session #2: Monday, November 11th (9:30PM - 10:00PM, PST)</LI>
</UL>
  
</P>

<P>
In each session, competitors will be assigned to rooms of 20 coders per room (within the TopCoder Arena Applet) in a shortened version of a TopCoder Single Round Match. 
</P>

<P>
Each Qualification Round session will consist of a 30-minute Coding Phase where the participants will be 
presented one, less difficult problem.  The Challenge Phase will be eliminated for this round.  After Session #2, TopCoder will run the System Testing Phase to verify the accuracy of every submission from both sessions.  A 
different problem will be presented in each session, with the top 50 scorers from each session advancing.  TopCoder will group the 100 advancers into 20 Coder Survivor teams.  
</P>

<P>
The handles of the 100 advancers, their scores, and the team assignments will be posted onsite and online. In the event of a tie for the last spot(s), TopCoder will 
conduct a 30-minute Code-Off on Tuesday, November 12th.  The highest scoring coders in the Code-Off will fill the open spot(s) and advance to the Elimination Rounds.
</P>

<P>
<B>Elimination Rounds</B><BR/>
The 100 competitors who advance from the Qualification Round must check-in for Elimination Round #1 60 
minutes prior to the start of the Round.  If a contestant who has advanced to the Elimination Round does not check-in during the 30-minute check-in period, he/she will forfeit his/her spot in the tournament.  TopCoder will maintain a "stand-by list" of the coders who competed 
in the Qualification Round but who did not advance.  The list will be compiled in order of score from the Qualification Round (i.e. highest score to lowest score).  If one of the advancing competitors forfeits his/her spot, the next person on the stand-by list will be allowed to compete.  
</P>

<P>
Each Elimination Round will consist of a two-problem, 30-minute Coding Phase, followed by a 10-minute Challenge Phase, followed by a 10-minute Vote-Off, and will conclude after the System Testing Phase.
</P>

<P><A HREF="#top" CLASS="statText">Back to Top</A></P> -->


<P>
<A NAME="2"></A><B>Round Schedule</B>
</P>

<table border="0" cellspacing="1" cellpadding="3" width="100%" bgcolor="#666666">
<tr>
<td bgcolor="#000000" width="40%" valign="top">
<p class="statText"><b>Round of Competition</b></p>
</td>
<td bgcolor="#000000" width="60%" valign="top">
<p class="statText"><b>Date and Time</b></p>
</td>
</tr>
<tr>
<td colspan="2" valign="top">
</td>
</tr>
<tr>
<td class="statText" valign="top">
Qualification Round
</td>
<td class="statText" valign="top">
Monday, Nov. 11<sup>th</sup> (8:00 PM - 9:00 PM)
</td>
</tr>
<tr>
<td class="statText" valign="top">
Qualification Round
</td>
<td class="statText" valign="top">
Monday, Nov. 11<sup>th</sup> (9:30 PM - 10:30 PM)
</td>
</tr>
<tr>
<td class="statText" valign="top">
Elimination Round #1
</td>
<td class="statText" valign="top">
Tuesday, Nov. 12<sup>th</sup> (7:00 PM - 8:00 PM)
</td>
</tr>
<tr>
<td class="statText" valign="top">
Elimination Round #2
</td>
<td class="statText" valign="top">
Tuesday, Nov. 12<sup>th</sup> (8:00 PM - 9:00 PM)
</td>
</tr>
<tr>
<td class="statText" valign="top">
Elimination Round #3
</td>
<td class="statText" valign="top">
Tuesday, Nov. 12<sup>th</sup> (9:00 PM - 10:00 PM)
</td>
</tr>
<tr>
<td class="statText" valign="top">
Semifinal Rounds
</td>
<td class="statText" valign="top">
Wednesday, Nov. 13<sup>th</sup> (11:00 AM - 12:00 PM)
</td>
</tr>
<tr>
<td class="statText" valign="top">
Championship Round
</td>
<td class="statText" valign="top">
Wednesday, Nov. 13<sup>th</sup> (12:30 PM - 2:00 PM)
</td>
</tr>

</table>

<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="3"></A><B>Practice Opportunities</B>
</P>
<P>
The following competitions will be offered to become familiar with the
TopCoder competition Arena:
</P>

<table border="0" cellspacing="1" cellpadding="3" width="100%" bgcolor="#666666">
<tr>
<td bgcolor="#000000" width="50%" valign="top">
<p class="statText"><b>Where</b></p>
</td>
<td bgcolor="#000000" width="50%" valign="top">
<p class="statText"><b>Date and Time</b></p>
</td>
</tr>
<tr>
<td colspan="2" valign="top">
</td>
</tr>
<tr>
<td class="statText" valign="top">
OTN Match (log-in at <A HREF="http://otn.oracle.com/" TARGET="_blank" CLASS="statText">http://otn.oracle.com</A>)
</td>
<td class="statText" valign="top">
Tuesday, Oct. 22<sup>nd</sup> (9:30PM EDT)
</td>
</tr>
<tr>
<td class="statText" valign="top">
TopCoder Single Round Match (you must be a TopCoder member to compete;
log-in at <A HREF="http://www.topcoder.com/" TARGET="_blank" CLASS="statText">http://www.topcoder.com</A>)
</td>
<td class="statText" valign="top">
Tuesday, Oct. 29<sup>th</sup> (8:00PM EST)
</td>
</tr>
<tr>
<td class="statText" valign="top">
OTN Match (log-in at <A HREF="http://otn.oracle.com/" TARGET="_blank" CLASS="statText">http://otn.oracle.com</A>)
</td>
<td class="statText" valign="top">
Monday, Nov. 4<sup>th</sup> (9:30PM EST)
</td>
</tr>
</table>

<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<!-- <P>
<A NAME="3"></A><B>Scoring and Advancing during Online Rounds</B>
</P>

<P>
After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the online rounds is as follows:
</P>

<P>
<B>Elimination Round#1</B><BR/>
(100 people in 20 teams of 5 coders each will compete)<BR/>
Competitors will be grouped into 5 rooms of 20 coders each, so that each member of the team is competing against one member from every other team.  At the 
conclusion of the Challenge Phase, the Vote-Off will 
commence.  During the Vote-Off, team members will be able to view the code of their fellow team members.  Before the end of the Vote-Off, each team member must vote off one of his/her team members.  The highest-
scoring team member gets "immunity" from the process, meaning he/she can vote but cannot be eliminated.  This voting process will be done automatically (i.e. members will vote on their computers which team member they wish to remove).  In the event of a tie between members 
getting voted off, the highest scoring team member gets to choose which team member is voted off.
</P>

<P>
<B>Elimination Round #2 </B><BR/>
(80 people in 20 teams of 4 coders each will compete)<BR/>
The remaining 4 coders per team then compete in Elimination Round #2.  Competitors will be grouped into 4 rooms of 20 coders each.  At the conclusion of the Challenge Phase, team members will again vote off one of their team members with the highest-scoring team member getting "immunity".  In the event of a tie, the highest scoring team member will choose which member is voted off. 
</P>

<P>
<B>Elimination Round #3 </B><BR/>
(60 people in 20 teams of 3 coders each will compete)<BR/>
The remaining 3 coders per team then compete in Elimination Round #3.  Competitors will be grouped into 3 rooms of 20 coders each.  At the conclusion of the Challenge Phase, team members will again vote off one of their team members with the highest-scoring team member getting "immunity".  In the event of a tie, the highest scoring team member will choose which member is voted off.  The remaining 40 competitors will comprise 20 teams of 2 people per team and will advance to the Semifinal Round. 
</P>

<P>
<B>Semifinal and Championship Rounds</B><BR/>
The remaining 40 competitors (20 teams of 2 people 
per team)<BR/>
 will compete in the Semifinal Round.  The 
competitors will be grouped into 20 rooms of 2 coders per room, with 2 team members per team competing against each other.  The highest-scoring team member will advance to the Championship Round.  In the event of a tie between 2 team members, the tie will be resolved in the following manner (in order):
</P>

<P>
<UL>
	<LI> Total points acquired (higher is better) during the rounds of the tournament in which the tied participants were presented with the same set of problems</LI> 
	<LI> If a tie still remains, both team members will advance to the Championship Round</LI> 
</UL>
</P>

<P>
The Semifinal and Championship Rounds will each 
consist of a two-problem, 30-minute Coding Phase, 
followed by a 10-minute Challenge Phase, with the System Testing Phase being the last phase.  After the System Testing Phase, TopCoder will announce the team winners.  The 20 team winners will advance to the Championship Round
</P>

<P><A HREF="#top" CLASS="statText">Back to Top</A></P> -->

<P>
<A NAME="4"></A><B>Powered by TopCoder<sup>TM</sup></B>
</P>

<P>
"Powered by TopCoder<sup>TM</sup>" is a service where TopCoder conducts an online and/or onsite programming 
competition using the TopCoder Arena Applet. This includes the use of the competition process, problem sets, scoring engine, administration and match reporting. 
</P>

<P>
The advantage of running a tournament using this 
program is the ability to focus on the business goals at hand rather than the logistical hurdles to pull off such 
an event.
</P>

<P>
Under this service, TopCoder is not the primary promoter, organizer or administrator of any activities, functions, set up or communications outside of the competition itself.
</P>

<P>
There are many aspects of the tournament to be 
considered, including the competition structure, 
scheduling, degree of difficulty, logistics, participation, promotion, and the overall tournament management that will require a shared responsibility by both TopCoder and the host company.  For more information about customizing a "Powered by TopCoder<sup>TM</sup>" event for your organization, please email us at <A HREF="mailto:sponsorships@topcoder.com" CLASS="statText">sponsorships@topcoder.com</A>.
</P>

<P><A HREF="#top" CLASS="statText">Back to Top</A></P>
<P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
              <xsl:call-template name="public_right_col"/>       
              <!-- Right Column Include Ends -->        
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
