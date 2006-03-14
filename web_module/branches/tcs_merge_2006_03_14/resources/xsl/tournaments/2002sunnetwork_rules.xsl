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
<BR/>

	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">      
      <TR>
        <TD COLSPAN="2"><DIV ALIGN="center"><A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/sun_network_logo.gif" ALT="" WIDTH="284" HEIGHT="80" BORDER="0"/><!-- </A><A HREF="/?&amp;t=authentication&amp;c=login&amp;errorMsg=You%20must%20log%20in%20to%20view%20this%20portion%20of%20the%20site.&amp;errorURL=/Registration" TARGET="_blank"> --><IMG SRC="/i/tournament/sun_challenge_logo.gif" ALT="" WIDTH="174" HEIGHT="65" BORDER="0"/></A></DIV></TD>
      </TR>      
      
      <TR>
        <TD COLSPAN="2" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;SunNetwork Coding Challenge Features</TD>
      </TR>                    						
	  <TR>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" >
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sunnetwork_rules'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/index?t=tournaments&amp;c=2002sunnetwork_rules#4" CLASS="statTextBig">Rounds</A></TD> -->
		<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<!-- <xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_regions_ne'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute> -->		
		<A HREF="/index?t=tournaments&amp;c=" CLASS="statTextBig"></A><FONT COLOR="#666666">Round Updates</FONT></TD>
		<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sunnetwork_rules'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=tournaments&amp;c=2002sunnetwork_rules" CLASS="statTextBig">Rules &amp; Regulations</A></TD>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sunnetwork_rules'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/?&amp;t=authentication&amp;c=login&amp;errorMsg=You must log in to view this portion of the site.&amp;errorURL=/Registration" CLASS="statTextBig">Sign-Up!</A></TD> -->
	  </TR>
    </TABLE>
<UL CLASS="statText">
	<LI><A HREF="#1" CLASS="statText"><FONT COLOR="#FFCC00">Overview of the Tournament</FONT></A></LI>
	<UL CLASS="statText">
	<LI><A HREF="#2" CLASS="statText"><FONT COLOR="#FFCC00">Eligibility</FONT></A></LI>
   </UL>
</UL>


<UL CLASS="statText">
	<LI>About the Tournament</LI>
	<UL CLASS="statText">
	<LI><A HREF="#4" CLASS="statText"><FONT COLOR="#FFCC00">Qualification Round and Qualification Period</FONT></A></LI>
	<LI><A HREF="#6" CLASS="statText"><FONT COLOR="#FFCC00">Quarterfinal, Semifinal and Championship Rounds</FONT></A></LI>
	<LI><A HREF="#7" CLASS="statText"><FONT COLOR="#FFCC00">Competition Round Structure</FONT></A></LI>
	<LI><A HREF="#8" CLASS="statText"><FONT COLOR="#FFCC00">About the Prizes</FONT></A></LI>
	<LI><A HREF="#9" CLASS="statText"><FONT COLOR="#FFCC00">Conditions of Participation</FONT></A></LI>
	<LI><A HREF="#10" CLASS="statText"><FONT COLOR="#FFCC00">Other</FONT></A></LI>
</UL>
</UL>

<P CLASS="statText"><BR/></P>

<P CLASS="statText">
<A NAME="1"></A><B>Overview of the Tournament</B>
</P>

<P CLASS="statText">
The 2002 SunNetwork<sup>sm</sup> Coding Challenge computer programming tournament will take place at the SunNetwork<sup>sm</sup> 
Conference at the Moscone Center in San Francisco, CA from September 18th through September 20th. All 
rounds of the tournament, consisting of Qualification, Quarterfinal, Semifinal and Championship rounds, 
will be held onsite at the conference. The total prize purse for the tournament will be $80,000, with the final four 
(4) competitors in the Championship round receiving prize money. For more information about the prizes <A HREF="#8" CLASS="statText"><FONT COLOR="#FFCC00">click here</FONT></A>.
</P>

<P CLASS="statText">
All expenses to attend the SunNetwork<sup>sm</sup> conference, including the conference registration fee, 
and the SunNetwork<sup>sm</sup> Coding Challenge are the responsibility of the competitor.
</P>

<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>
<P CLASS="statText">
<A NAME="2"></A><B>Eligibility</B><BR/>
Contestants must be a TopCoder member and a registered attendee of the SunNetwork<sup>sm</sup> Conference 
in order to participate in the SunNetwork<sup>sm</sup> Coding Challenge.  To become a TopCoder member, 
visit TopCoder's website at <A HREF="www.topcoder.com" CLASS="statText"><FONT COLOR="#FFCC00">www.topcoder.com</FONT></A>.  To register for the SunNetwork<sup>sm</sup> Conference, visit 
the SunNetwork<sup>sm</sup> website at <A HREF="http://sunnetwork.sun.com/sf2002/reg/general/index.en.jsp" CLASS="statText"><FONT COLOR="#FFCC00">http://sunnetwork.sun.com</FONT></A>.
</P>

<P CLASS="statText">
The SunNetwork<sup>sm</sup> Coding Challenge is open to citizens and lawful permanent residents of the United States*, and 
to all non-immigrants currently in the United States* with a valid Visa, who
are at least 18 years of age and who did not win prize money in the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  
</P>

<P CLASS="statText">
*Including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands
</P>
<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>

<P CLASS="statText">
Employees and former employees of TopCoder, Inc. and Sun Microsystems, Inc. and those involved in the 
production (including prize suppliers), implementation and distribution of this tournament and their advertising or 
promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other 
persons or entities directly associated with the tournament and members of the immediate families and/or persons 
living in the same household as such persons, are ineligible to enter the tournament.
</P>


<P CLASS="statText">
<B>About the Tournament</B>
</P>

<P CLASS="statText">
<A NAME="4"></A><B>Qualification Round and Qualification Period</B><BR/>
In order to participate in the Qualification round, contestants must first sign-up for the SunNetwork<sup>sm</sup> 
Coding Challenge.  Competitors may sign-up prior to the SunNetwork<sup>sm</sup> Conference via the TopCoder website 
at <A HREF="http://www.topcoder.com/sunnetworkchallenge" CLASS="statText"><FONT COLOR="#FFCC00">www.topcoder.com/sunnetworkchallenge</FONT></A>, or at
the SunNetwork<sup>sm</sup> Conference.  
 To register at the SunNetwork<sup>sm</sup> Conference, contestants should proceed to the 
 TopCoder pavilion at the Moscone Center to sign-up at any time during the Qualification Period.  (Please note:  
 you must first sign-up to be a TopCoder member prior to registering for the tournament.) The Qualification Period will
 be as follows:  
</P>

<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;
 border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
<tr>
<td colspan="2" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Qualification Period</b></p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  background:#666666;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Date</b></p>
</td>
<td width="215" valign="top" style='width:214.85pt;border:solid windowtext .5pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#666666;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText"><b>Time</b></p>
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
&#160;Wednesday, September 18
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
&#160;11:30AM - 7:00PM
</td>
</tr>
</table>

<P CLASS="statText">
At the conference, registered individuals may participate in the Qualification round any 
time during the Qualification Period.  To participate in the 
Qualification round, contestants should go to the TopCoder pavilion, where they will be seated at a computer terminal, 
and be presented with one problem to solve by coding in Java.  The individual 
will have 45 minutes to submit the solution to the problem.  Solutions will be tested using the TopCoder 
System Test at the end of the Qualification Period.  After the System Test has been completed, TopCoder 
will announce the 32 highest overall scoring competitors based upon the scores' standard deviation 
from the mean scores.  The handles of the 32 top-scorers will be posted on TopCoder's website at 
<A HREF="http://www.topcoder.com/sunnetworkchallenge" CLASS="statText"><FONT COLOR="#FFCC00">www.topcoder.com/sunnetworkchallenge</FONT></A> 
and on Sun's website at <A HREF="http://sunnetwork.sun.com/sf2002/topcoder" CLASS="statText"><FONT COLOR="#FFCC00">http://sunnetwork.sun.com/sf2002/topcoder</FONT></A> and at the TopCoder pavilion in 
the Moscone Center.   Those 32 top-scoring individuals will advance to the Quarterfinal round of 
the tournament.  In the event of a tie for the 32<sup>nd</sup> spot, the first competitor to achieve the 
tied score will advance to the next round of competition. Individuals may only participate once in 
the Qualification Round.
</P>

<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>


<P CLASS="statText">
<A NAME="6"></A><B>Quarterfinal, Semifinal and Championship Rounds</B>
</P>

<P CLASS="statText">
The 32 top-scoring individuals from the Qualification round will advance to the Quarterfinal round 
of the tournament.  If a contestant who has advanced to the Quarterfinal round 
does not participate in the Quarterfinal round, he/she will forfeit his/her spot in the tournament.  TopCoder will maintain a 
"stand-by list" 
of the coders who competed in the Qualification round but who did not advance.  If one of the 
advancing competitors forfeits his/her spot, the next person on the stand-by list will be allowed to compete. Stand-by competitors should inquire at the TopCoder pavilion at least 10 minutes prior to the start of a round about their
opportunity to compete.
</P>

<P CLASS="statText">
Coder advancement in the Quarterfinal, Semifinal and Championship rounds is determined by comparing 
the total point values from three phases of the round (see Competition Round Structure below) for each 
coder. In order to advance, a coder must finish with a greater-than-zero point total.  Tournament advancement 
will be published on TopCoder's website at <A HREF="http://www.topcoder.com/sunnetworkchallenge" CLASS="statText"><FONT COLOR="#FFCC00">www.topcoder.com/sunnetworkchallenge</FONT></A> 
and on Sun's website at <A HREF="http://sunnetwork.sun.com/sf2002/topcoder" CLASS="statText"><FONT COLOR="#FFCC00">http://sunnetwork.sun.com/sf2002/topcoder</FONT></A> 
for the duration of the tournament.
</P>

<P CLASS="statText">
Using the results of the Qualification Round, TopCoder will determine the room assignments for the Quarterfinal 
round.  Room assignments for the Quarterfinal round will be based on the score of each competitor in the 
Qualification round compared to the mean score of all of the competitors who answered the same problem.  
Each competitor will achieve a "number of standard deviations from the mean" from their participation in 
the Qualification round.  This standard deviation calculation will be used to determine a rank for all of 
the competitors in the Quarterfinal round.  The coder with the highest number of standard deviations will 
be assigned the lowest rank (one).  The seeding for the Quarterfinal round will be done in a "tournament 
seeding" fashion, where the coder with the lowest rank from the Qualification round will be placed against 
the coder with the highest rank.  The following is an example of the "tournament seeding" in a case where 
there were 16 competitors to be assigned in four rooms of four coders each:
</P>



<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="80%">
	<TR>
		<TD CLASS="statText" WIDTH="50%"><B>Room</B></TD><TD CLASS="statText" WIDTH="50%"><B>Rankings assigned</B></TD>		
	</TR>
	<TR>
		<TD CLASS="statText">1</TD><TD CLASS="statText">1, 8, 9, 16</TD>		
	</TR>	
	<TR>
		<TD CLASS="statText">2</TD><TD CLASS="statText">2, 7, 10, 15</TD>		
	</TR>	
	<TR>
		<TD CLASS="statText">3</TD><TD CLASS="statText">3, 6, 11, 14</TD>		
	</TR>
	<TR>
		<TD CLASS="statText">4</TD><TD CLASS="statText">4, 5, 12, 13</TD>		
	</TR>		
</TABLE>

<P CLASS="statText">
The dates and times of the Quarterfinal, Semifinal and Championship rounds are as follows: 
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
<p class="statText">Quarterfinal Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Thursday, September 19<sup>th</sup>, 11:30AM PDT</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Semifinal Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">Thursday, September  19<sup>th</sup>, 1:30PM PDT</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>&#160;
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>&#160;

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
<B>Thursday, September 19<sup>th</sup>, 4:00PM PDT</B>
</td>
</tr>
</table>

<P CLASS="statText">
<B>The Quarterfinal Round</B> will consist of one group of 32 coders, grouped into 8 rooms of 4 coders each.  
The top 8 scorers across all rooms in the Quarterfinal Round will advance to the Semifinal Round.
</P>

<P CLASS="statText">
<B>The Semifinal Round</B> 
will be one group of 16 coders, consisting of 4 rooms of 4 coders each.  The top 4 scorers across all rooms will advance to the Championship Round.
</P>

<P CLASS="statText">
<B>The Championship Round</B> 
will be one group of 4 coders. First, second, third and fourth place in the Championship round are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Quarterfinal, Semifinal and/or Championship rounds, the tie will be resolved in the following manner (in order):

<UL CLASS="statText">
	<LI> Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems</LI>
	<LI> If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</LI>
	<LI> If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</LI>
</UL>
</P>
<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>


<P CLASS="statText">
<A NAME="7"></A><B>Competition Round Structure</B>
</P>

<P CLASS="statText">
Java will be the only allowable programming language in the tournament. 
The following describes the different phases of competition:
</P>

<P CLASS="statText">
<UL CLASS="statText">
	<LI> <B>The Coding Phase</B> is a timed event where all contestants are presented with the same question(s).  If more than one (1) question is presented during a round of competition, the questions have varying levels of complexity and, accordingly, varying levels of point earnings potential. Multiple problems may be worked on in any order, and at the same time.  A solution to a problem may be submitted multiple times, however a point penalty of 10% of the maximum value of the problem will be assessed for each submission.  Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the problem was opened to the time it was submitted, regardless of the time it took to submit any previous solutions to that problem, if any.  (NOTE:  Only one (1) question will be presented during the Quarterfinal and Semifinal rounds of the tournament.  Three (3) questions will be presented during the Championship round.)</LI>
	<LI> <B>The Challenge Phase</B> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a penalty, applied against their total score in that round of competition. </LI> 
	<LI> <B>The System Testing Phase</B> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</LI>
</UL>
</P>
<P CLASS="statText">
During the Quarterfinal and Semifinal rounds, the Coding phase will last 40 minutes.  After a five-minute intermission, the Challenge Phase will commence and will last 10 minutes.  The System Testing Phase begins immediately following the end of the Challenge Phase.
</P>

<P CLASS="statText">
During the Championship round, the Coding Phase will last 75 minutes.  After a five-minute intermission, the Challenge Phase will commence and will last 15 minutes.  The System Testing Phase begins immediately following the end of the Challenge Phase.
</P>

<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>





<P CLASS="statText">
<A NAME="8"></A><B>About the Prizes</B>
</P>

<P CLASS="statText">
Prizes will be awarded to the four (4) competitors who advance to, and compete in, the Championship Round. Prize money will be distributed as follows:
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
<p class="statText"><B>1<sup>st</sup> place finisher - Tournament Champion</B></p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'><B>$50,000</B></p>
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
<p class="statText" align="right" style='text-align:right'>$15,000</p>
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
<p class="statText" align="right" style='text-align:right'>$10,000</p>
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
<p class="statText" align="right" style='text-align:right'>$5,000</p>
</td>
</tr>
</table>

<P CLASS="statText">
 All prizes will be awarded on Friday, September 20, 2002.  All winners must be present at the 
 keynote presentation on Friday, September 20<sup>th</sup> at 9:00AM to receive their prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.
</P>
<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>

<P CLASS="statText">
<A NAME="9"></A><B>Conditions of Participation</B>
</P>

<P CLASS="statText">
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder and Sun Microsystems, which are final, binding and conclusive in all matters.
</P>

<P CLASS="statText">
<B>Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.</B>
</P>

<P CLASS="statText">
Winners in each round of competition will be those competitors who win the most points in their respective rounds of competition. All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designees and shall be final and binding in all respects.
</P>

<P CLASS="statText">
If a competitor advances to the Championship round, he/she must attend the keynote presentation on Friday, September 20, 2002.
Finalists should be at the TopCoder pavilion no later than 8:45AM on Friday, September 20<sup>th</sup>.
</P>

<P CLASS="statText">
Prizewinners will be notified in person within 24 hours of the completion of the Championship 
round that they have won a prize.  The final results of the Championship round will be announced 
at the beginning of the keynote presentations on Friday, September 20<sup>th</sup> at 9:00AM. If 
prizewinners advance to the Championship round of competition, they will also be provided an 
Affidavit of Eligibility and Liability and Publicity Release to be completed and returned to 
TopCoder no later than 3:00PM on Thursday, September 19<sup>th</sup>. Unclaimed or undeliverable prizes will not be awarded.  
</P>

<P CLASS="statText">
As a condition of winning and redeeming a prize, winners will be required to provide TopCoder a completed (i) 
Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate, 
if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and 
Publicity Release, a winner (i) confirms his/her eligibility, (ii) represents and warrants that he/she has 
not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies the 
accuracy of the demographic information contained within the TopCoder member database, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit, or the W-9 or W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winner.
</P>

<P CLASS="statText">
By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, including Sun Microsystems, Inc., and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.
</P>

<P CLASS="statText">
In addition, all prizewinners agree to cooperate with TopCoder, Inc.'s and Sun Microsystems, Inc.'s publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the tournament.
</P>

<P CLASS="statText">
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
</P>

<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>

<P CLASS="statText">
<A NAME="10"></A><B>Other</B>
</P>

<P CLASS="statText">
The tournament is void in whole or in part where prohibited by law.
</P>

<P CLASS="statText">
A list of tournament winners by coder handles will be available on the web site at <A HREF="http://www.topcoder.com/sunnetworkchallenge" CLASS="statText"><FONT COLOR="#FFCC00">www.topcoder.com/sunnetworkchallenge</FONT></A>, and will be displayed for at least 3 months after the end of the tournament.
</P>

<P CLASS="statText">
This tournament is brought to you by: <BR/><BR/>Sun Microsystems, Inc. (<A HREF="http://www.sun.com/" CLASS="statText"><FONT COLOR="#FFCC00">http://www.sun.com</FONT></A>)<BR/> 
901 San Antonio Road<BR/> 
Palo Alto, CA 94303<BR/><BR/>  and <BR/><BR/> TopCoder, Inc. (<A HREF="http://www.topcoder.com" CLASS="statText"><FONT COLOR="#FFCC00">www.topcoder.com</FONT></A>)<BR/> 703 Hebron Avenue<BR/> Glastonbury, CT 06033
</P>
<P CLASS="statText"><A HREF="#top" CLASS="statText"><FONT COLOR="#FFCC00">Back to Top</FONT></A></P>

<P CLASS="statText"><BR/></P>
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
