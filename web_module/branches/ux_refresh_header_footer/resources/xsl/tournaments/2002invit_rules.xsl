<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
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
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P><B>2002 TopCoder Invitational Tournament
Official Rules
</B></P>
<UL>
	<LI><A HREF="#1" CLASS="statText">Overview of the Tournament</A></LI>
	<UL>
	<LI><A HREF="#2" CLASS="statText">Eligibility</A></LI>
	<LI><A HREF="#3" CLASS="statText">Invitations and Registration</A></LI>
</UL>
</UL>


<UL>
	<LI>About the Tournament</LI>
	<UL>
	<LI><A HREF="#4" CLASS="statText">Online Elimination Rounds</A></LI>
	<LI><A HREF="#5" CLASS="statText">Scoring and Advancing during Online Rounds</A></LI>
	<LI><A HREF="#6" CLASS="statText">Competition Round Structure</A></LI>
	<LI><A HREF="#7" CLASS="statText">Onsite Semifinal and Championship Rounds</A></LI>
	<LI><A HREF="#8" CLASS="statText">About the Prizes</A></LI>
	<LI><A HREF="#9" CLASS="statText">Conditions of Participation</A></LI>
	<LI><A HREF="#10" CLASS="statText">Other</A></LI>
</UL>
</UL>




<P>
No purchase necessary to enter or win.
</P>

<P><BR/></P>

<P>
<A NAME="1"></A><B>Overview of the Tournament</B>
</P>

<P>
The 2002 TopCoder Invitational tournament will take place between October 8th and November 23rd. It will consist of four (4) online elimination rounds and two (2) onsite rounds, being the Semifinal and Championship rounds. The total prize purse for the tournament will be $150,000, with the top 64 finishers in the online rounds receiving prize money.  The top 16 finishers in the online rounds will advance to the onsite Semifinal and Championship rounds, being held at the Mohegan Sun Casino in Uncasville, CT from November 21st through November 23rd.
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>
<P>
<A NAME="2"></A><B>Eligibility</B><BR/>
The tournament is open to the following members who are at least 18 years of age, AND who have participated in at least three (3) TopCoder rated events (i.e., Single Round Matches and previous tournaments) prior to October 1, with at least one (1) of those events being since March 31st: 
</P>

<P>
<UL>
	<LI> All citizens and lawful permanent residents of:</LI>	
<UL>
	<LI> Australia</LI>	
	<LI> Canada (excluding Quebec)</LI>	
	<LI> China</LI>	
	<LI> India</LI>	
	<LI> Ireland</LI>	
	<LI> New Zealand</LI>	
	<LI> the United Kingdom</LI>	
	<LI> the United States (including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands)</LI>	
</UL>
	<LI> All non-immigrants currently residing in the United States with a valid Visa</LI>	
</UL>
</P>

<P>
<A NAME="3"></A><B>Invitations and Registration</B><BR/>
The top 1,024 rated TopCoder members as of October 1st who meet the eligibility criteria defined above will be invited via email to compete in the tournament.  Invitations will be emailed on October 4th.  Once invited, members must register on TopCoder's website to compete in the tournament.  Registration details and deadlines will be provided in the invitations.  
</P>

<P>
Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<B>About the Tournament</B>
</P>

<P>
<A NAME="4"></A><B>Online Elimination Rounds</B><BR/>
Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round. (See below for competition dates and times.) TopCoder members from around the world may be participating in these rounds, but all start times will be communicated as Eastern Time, so contestants in different time zones must adjust accordingly. If a coder does not participate, for any reason, in an online round that they have advanced to, it will be treated as an automatic loss in that round of competition. 
</P>

<P>
All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all room assignments prior to the start of each online round in a manner such that the average competitor rating (as of October 1st) for each room will be similar. The dates and times of the online rounds of competition are as follows: 
</P>

<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;
 border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Round of Competition</b></p>
</td>
<td width="215" valign="top" style='width:214.85pt;border:solid windowtext .5pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Date and Time *</b></p>
</td>
</tr>
<tr>
<td width="431" colspan="2" valign="top" style='width:431.0pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
</td>
</tr>
<tr>
<td class="statText" width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<ul type="disc">
<li>Online Round#1</li>
</ul>
<p class="statText"><BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;- Part 1</p>
<p class="statText"><BR/><BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;- Part 2<BR/><BR/><BR/></p>
<ul type="disc">
<li>Online Round #2</li>
</ul>
<ul type="disc">
<li>Online Round #3</li>
</ul>
<ul type="disc">
<li>Online Round #4</li>
</ul>
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<BR/><BR/>
Tuesday, October 8<sup>th</sup><BR/>
Registration:&#160;7:30 PM &#8211; 9:25 PM<BR/>
START:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;9:30 PM

<p class="statText">Thursday, October 10<sup>th</sup><BR/>
Registration:&#160;7:30 PM &#8211; 9:25 PM<BR/>
START:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;9:30 PM </p>

<p class="statText">Wednesday, October 16<sup>th</sup> at 9:30 PM</p>


<p class="statText">Wednesday, October 23<sup>rd</sup> at 9:30 PM</p>

<p class="statText">Wednesday, October 30<sup>th</sup> at 9:30 PM</p>
</td>
</tr>
<tr>
<td width="431" colspan="2" valign="top" style='width:431.0pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">*NOTE:&#160; In the event
  that a round must be cancelled for any reason, the &#8220;raindate&#8221; for
  the cancelled match will be the following day at the same time.</p>
</td>
</tr>
</table>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="5"></A><B>Scoring and Advancing during Online Rounds</B>
</P>

<P>
After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the online rounds is as follows:
</P>

<P>
<B>Online Round #1</B> (to be completed in 2 parts)
<UL>
	<LI> A total of 1,024 coders will compete in Round #1 and a total of 512 will advance.  Round #1 will consist of 2 parts, with 512 people competing in each part and 256 members advancing from each part.</LI>
	<LI> The winner of each of the 128 rooms (64 rooms in each part of Round #1), will automatically advance (i.e. receive an automatic berth) to Online Round #2.</LI>
	<LI> The remaining 384 spots (192 spots from each part of Round #1) will be wildcards, and 
	 will be handed out based on total points across all rooms.  (In the event that there are 
	 not 64 room winners in one part of Round #1, the total number of wildcard spots for that part of 
	 Round #1 will be equal to 256 minus the number of automatic berths awarded to the room winners.)</LI>
</UL>
</P>

<P>
<B>Online Round #2</B>
<UL>
	<LI> 512 coders will compete and 256 will advance.</LI>
	<LI> The winner of each of the 64 rooms will automatically advance to Online Round #3.</LI>
	<LI> The remaining 192 spots will be wildcards and will be handed out based on total points across all
 rooms.  (In the event that there are not 64 room winners in Round #2, the total number of wildcard 
 spots will be equal to 256 minus the number of automatic berths awarded to the room winners.)</LI>
</UL>
</P>

<P>
<B>Online Round #3</B>
<UL>
	<LI> 256 coders will compete and 64 will advance.</LI>
	<LI> The winner of each of the 32 rooms will automatically advance to Online Round #4.</LI>
	<LI> The remaining 32 spots will be wildcards and will be handed out based on total points 
	across all rooms.  (In the event that there are not 32 room winners in Round #3, the total number 
	of wildcard spots will be equal to 64 minus the number of automatic berths awarded to the room winners.)</LI>
</UL>
</P>

<P>
<B>Online Round #4</B>
<UL>
	<LI> 64 coders will compete and 16 will advance to the onsite Semifinal round.</LI>
	<LI> The winner of each of the 8 rooms will automatically advance to the Semifinal round.  </LI>
	<LI> The remaining 8 spots will be wildcards and will be handed out based on total points 
	across all rooms.  (In the event that there are not 8 room winners in Round #4, the total number 
	of wildcard spots will be equal to 16 minus the number of automatic berths awarded to the room winners.)</LI>
</UL>
</P>

<P>
NOTE:  If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the wildcard pool. Any tie in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner:
<UL>
	<LI> Total points acquired (higher is better) during the rounds of the tournament in which all 
	of the tied participants were presented with the same set of problems</LI>
	<LI> If a tie still remains, then by rating (higher is better) as of October 1, 2002</LI>
	<LI> If a tie still remains, all tied coders will advance to the next round</LI>
</UL>
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="6"></A><B>Competition Round Structure</B>
</P>

<P>
Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)
</P>

<P>
<UL>
	<LI> The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened to the time it was submitted.</LI>
	<LI> The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a penalty, applied against their total score in that round of competition.</LI> 
	<LI> The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</LI>
</UL>
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="7"></A><B>Onsite Semifinal and Championship Rounds</B>
</P>

<P>
The sixteen (16) advancers from Online Round #4 will travel to Mohegan Sun on Thursday, November 21st to compete in the Semifinal round of the tournament being held on Friday, November 22nd.  All contestants must arrive at Mohegan Sun no later than 4:00 PM on Thursday, November 21st.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest overall scorer from Online Round #4.  
</P>

<P>
TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, up to a cost of $1,000 per person.  (That is, if a contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  In addition, TopCoder will also provide travel arrangements to and from the airport to the Mohegan Sun Casino and accommodations and certain meals for each contestant and his/her guest.  All other expenses are the responsibility of the contestant and his/her guest.  
</P>

<P>
TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating (as of October 1st) for each room will be similar.  The dates and times of the onsite Semifinal and Championship rounds are as follows: 
</P>

<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;
 border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Round of Competition</b></p>
</td>
<td width="215" valign="top" style='width:214.85pt;border:solid windowtext .5pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Date and Time</b></p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Semifinal Room #1</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Friday, November 22<sup>nd</sup>, 8:00 AM</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Semifinal Room #2</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Friday, November 22<sup>nd</sup>, 11:00 AM</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Semifinal Room #3</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Friday, November 22<sup>nd</sup>, 3:00 PM</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Semifinal Room #4</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Friday, November 22<sup>nd</sup>, 6:00 PM</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>

</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>

</td>
</tr>
<tr>
<td class="statText" width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<B>Championship Round</B>
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<B>Saturday, November 23<sup>rd</sup>, 11:00 AM</B>
</td>
</tr>
</table>

<P>
The Semifinal Round will consist of four (4) rooms of four (4) coders each. The winner in each room will advance to the Championship Round.
</P>

<P>
The Championship Round will be a single round of four (4) coders. First, second, third and fourth place in the Championship round are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Semifinal and/or Championship rounds, the tie will be resolved in the following manner (in order):
<UL>
	<LI> Total points acquired (higher is better) during the 2002 TopCoder Invitational to date</LI>
	<LI> If a tie still remains, then by rating (higher is better) as of October 1st</LI>
<UL>
	<LI> If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</LI>	
	<LI> If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</LI>
</UL>
</UL>
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="8"></A><B>About the Prizes</B>
</P>

<P>
Prizes will be awarded to the sixty four (64) competitors who advance to Online Round #4. Prize money will be distributed as follows:
</P>

<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;
 border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
<tr>
<td class="statText" width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt'>
<b>Competitor(s)</b>
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border:solid windowtext .5pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;
  padding:0in 5.4pt 0in 5.4pt'>
<B>Prize Money</B>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">48 competitors advancing to, and competing in, Online Round #4
  who do not advance to the Semifinal round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$500 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">4<sup>th</sup> place finisher in each of the four (4) Semifinal
  rooms</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$1,250 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">3<sup>rd</sup> place finisher in each of the four (4) Semifinal
  rooms</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$2,500 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">2<sup>nd</sup> place finisher in each of the four (4) Semifinal
  rooms</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$4,000 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">4<sup>th</sup> place finisher in the Championship Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$10,000</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">3<sup>rd</sup> place finisher in the Championship Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$15,000</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">2<sup>nd</sup> place finisher in the Championship Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$20,000</p>
</td>
</tr>
<tr>
<td class="statText" width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<B>1<sup>st</sup> place finisher &#8211; Tournament Champion</B>
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right"><B align="right" style='text-align:right'>$50,000</B></p>
</td>
</tr>
</table>

<P>
All prizes will be awarded at the conclusion of the Championship Round.  All winners (with the exception of the 48 competitors who do not advance to the onsite rounds) must be present at the onsite rounds to receive their prizes. Any and all applicable taxes on prizes, including the cost of having a guest attend the onsite rounds, are the sole responsibility of the prizewinner.
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="9"></A><B>Conditions of Participation</B>
</P>

<P>
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.
</P>

<P>
Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.
</P>

<P>
Winners in each round of competition will be those competitors who win the most points in their respective rooms. All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
</P>

<P>
Prizewinners will be notified via e-mail within 10 days of the completion of the Online Round #4 that they have won a prize. If prizewinners advance to the onsite rounds of competition, they will also be forwarded an Affidavit of Eligibility and Liability and Publicity Release to be completed and returned to TopCoder no later than Tuesday, November 5th. Prizes will be presented within 60 days of making an eligibility determination. Unclaimed or undeliverable prizes will not be awarded.  
</P>

<P>
As a condition of participation in the tournament, all information provided by you in your TopCoder member profile must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and all registration forms required by TopCoder.
</P>

<P>
As a condition of winning and redeeming a prize, winners will be required to return within 5 days of receipt a completed (i) notarized Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winner (i) confirms his/her eligibility, (ii) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies the accuracy of the demographic information submitted, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit, or the W-9 or W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winner.
</P>

<P>
By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.
</P>

<P>
In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the tournament.
</P>

<P>
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
</P>
<P><A HREF="#top" CLASS="statText">Back to Top</A></P>

<P>
<A NAME="10"></A><B>Other</B>
</P>

<P>
The tournament is void in whole or in part where prohibited by law.
</P>

<P>
A list of tournament winners by coder handles will be available on the web site at www.topcoder.com, and will be displayed for at least 3 months after the end of the tournament.
</P>

<P>
This tournament is brought to you by TopCoder, Inc. (www.topcoder.com) 703 Hebron Avenue, Glastonbury, CT 06033.
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
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
            <!-- Gutter -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
              <!-- Right Column Include Begins --> 
              <xsl:call-template name="public_right_col"/>       
              <!-- Right Column Include Ends -->        
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
