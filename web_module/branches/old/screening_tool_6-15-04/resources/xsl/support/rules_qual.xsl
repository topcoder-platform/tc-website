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
        <TITLE>Official Rules and Qualifications for participating in TopCoder</TITLE>
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
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Official Rules &amp; Qualification</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
          <BR/>No purchase necessary to enter or win.
          <BR/><BR/>
	      <B>Single Round Match Description</B><UL>
	      <LI>Maximum of 20 coders per room</LI>
	      <LI>Ratings will be adjusted post-match</LI>
	      <LI>Members will be emailed prior to the match with date and time (opt-in)</LI>
	      <LI>Members will be emailed the match results (opt-in)</LI></UL>
	      The match will feature a mixed programming language format. For each individual problem, the coder will have the option of using either Java, C++, Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174; .NET to code the solution. Syntactical knowledge of each language will be helpful during the challenge phase of each round of competition.<BR/><BR/>
	      <B>Divisions and Ironman Room Assignments:</B><UL>
	      <LI>Members rated 1200 or better compete in Division-I</LI>
	      <LI>Members rated 1199 or lower compete in Division-II</LI>
	      <LI>Members not yet rated compete in Division-II</LI>
	      <LI>Room assignments place members of like divisions together</LI>
	      <LI>Rating changes go into effect in next participated match</LI></UL>
	      <A HREF="/index?t=support&amp;c=divisions" CLASS="bodyText">More about the Division structure</A><BR/><BR/>
	      <!-- <B>Each match has a total prize purse of $10,000</B><BR/>
	      - $500 from each match is donated to <A HREF="/index?t=support&amp;c=charities" CLASS="bodyText">charity</A><BR/>
	      - $100 is paid to the unrated competitor who has the highest points for the match<BR/>
	      - Coders must place with a positive point total to collect their prize.<BR/><BR/>
	      <A HREF="/index?t=support&amp;c=divisions" CLASS="bodyText">More about the Prize structure</A><BR/><BR/> -->
	      <B>About the Tournament</B><BR/><UL>
	      <LI><B>When to start the Online Tournament Rounds</B><BR/>
TopCoder members must register for each single round match from within the competition arena. 
Registration is for 3 hours before the start of each match. To register, login to the 
competition arena, click on the 'Active Contests' menu, choose the competition for 
which you would like to register, and then select 'Register'.
              TopCoder members from all over the world will be participating
              in this event, but <B><I>all start times will be communicated as 
              &#160;Eastern Time, so contestants in different time zones must
              adjust accordingly.</I></B>  
              All competitors who have registered for the match 
               will be assigned to a specific competition room.  
              TopCoder will perform the room assignments prior to the start of 
              a competition round, in a manner such that only coders in the same 
              division are placed in a room and the average competitor 
              rating for each room is similar. The start time will vary from match to match, so be sure to check the <A HREF="/index?t=schedule&amp;c=index" CLASS="bodyText">calendar</A> for
              the starting times of each match.            
            <!-- TopCoder members must register for the online tournament. 
              Registration is from
              7:30&#160;PM
                              to
                              8:55&#160;PM
                              &#160;EST.<BR/>
                              Competition at
                              9:00&#160;PM
                              &#160;EST on
                            December<FONT SIZE="1">&#160;</FONT>12,
              2001.  

              To register, login to the Tournament Arena applet, click on the 'Main' menu, and 
              choose the option for 'Event Registration'.
              TopCoder members from all over the country will be participating
              in this event, but <B><I>all start times will be communicated as 
              &#160;Eastern Time, so contestants in different time zones must
              adjust accordingly.</I></B>  
              All competitors who have registered for the online tournament 
              round will be assigned to a specific tournament room.  
              TopCoder will perform the room assignments prior to the start of 
              a tournament round, in a manner such that only coders in the same 
              division are placed in a room and the average competitor 
              rating for each room is similar.  
              The Online Round will begin at 
              9:00&#160;PM &#160;EST. -->
            <BR/>
                                        </LI>
                                        <BR/>
                                        <BR/>
                                        <LI>
                                            <B>Upon Entering an Online Tournament Round</B>
                                            <BR/>
            Each online tournament round consists of three phases:
            the coding phase, challenge phase, and the testing phase.
          </LI>
                                        <OL>
                                            <LI>
                                                <B>The Coding Phase</B> is a timed event where all
              contestants are presented with the same three questions representing
              three levels of complexity and, accordingly, three levels
              of point earnings potential.
              Points for a problem are awarded upon submission of
              any solution that successfully compiles.
            </LI>
                                            <LI>
                                                <B>The Challenge Phase</B> is a timed event wherein each competitor
              has a chance to challenge the functionality of other competitors' code.
              A successful challenge will award 50 points to the challenger, and any 
              points gained by the submitter for the problem will be lost. 
              Unsuccessful challenges will cost the challenger 50 points as a
              penalty, applied to their total score in that round of competition.
            </LI>
                                            <LI>
                                                <B>The Automated Testing Phase</B> is applied to all submitted code that has
              not already been successfully challenged.  If TopCoder finds code that is flawed,
              the author of that code submission will lose all of the points they earned for that
              code submission.  The automated tester will apply a set of inputs, expecting the output
              from the code submission to be correct.  If the output from a coder's submission does 
              not match the expected output, the submission is considered flawed.  The same set of input/output 
              test cases will be applied to all code submissions for a given problem.
            </LI>
                                        </OL>
                                        <BR/>
                                        <LI>
                                            <B>Scoring during Online Tournament Rounds</B>
                                            <!-- <BR/>
The prize winners of each room will be determined as follows:  Coder standing in each room is determined by comparing the point values for all coders in the room for all three phases of the round.  Those with the top three positive point values in the room, place in first, second, and third.  In the event of a tie (unlikely, since scoring is calculated to .01), all coders who have greater than zero points tied for a place will split that prize money combined with the prize money of lesser place(s) equal to the number of coders tied.  For example:  if three coders within a room are tied for first place with positive point totals, they split the combined prize money for first, second and third place.  No other coders are paid.  If two coders are tied for first place with positive point totals, they split the first and second prize money combined, and the coder with the next highest positive point total wins the third place prize money.
            <BR/> -->
                                            <BR/>
            All contestants, who opened any problem during the round, will have their ratings 
            adjusted up or down to reflect their performance, based on TopCoder's rating formula.  
            Contestant ratings play no role in a Coder's final standing in the competition room.
          </LI>
                                    </UL>
                                    <BR/>
                                    <B>Conditions of Participation</B>
                                    <BR/>

        By participating in the tournament,
        you agree to be bound by these rules and to all decisions of TopCoder,
        which are final, binding and conclusive in all matters.<BR/>
                                    <BR/>

        Contestants must not cheat; all ideas for any code and/or challenge submitted must be the 
        contestant's alone.<BR/>
                                    <BR/>

        Winners in each round of competition will be those competitors that win the most points 
        in their respective rooms.  All decisions relating to the viability of submissions, the ranking of
        submissions and all other matters pertaining to the tournament
        shall be within the sole discretion of TopCoder or its designee and shall be final and
        binding in all respects.<BR/>
                                    <!-- <BR/>

        Prize winners will be notified via e-mail within 10 days of the completion of the tournament 
        that they have won a prize and will be forwarded an affidavit of eligibility to be completed 
        and returned to TopCoder.  Prizes will be presented within 10 days of making an eligibility 
        determination. Unclaimed or undeliverable prizes will not be awarded.<BR/>
                                    <BR/>

As a condition of winning and redeeming a prize, winners will be required to return within 60 days of receipt a completed (i) Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate.  In completing the Affidavit of Eligibility and Liability and Publicity Release, a winner 
(i) confirms their eligibility, (ii) represents and warrants that they have not cheated; that the idea for the code and/or challenge submitted is theirs alone, (iii) verifies the accuracy of the demographic information submitted, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won.  The Form W-9 or W-8BEN is required by the IRS for tax reporting purposes.  If prize notification is returned as undeliverable, or the winner fails to return the Affidavit, or the W-9 or W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winner.
<BR/>
                                    <BR/>

By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.
<BR/>
                                    <BR/>

Verified winners agree to use their name, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by or attributed to the winner relating to TopCoder and any and all rights to said use, without further compensation.
<BR/> -->
                                    <BR/>

TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the tournament process, or is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
<BR/>
                                    <BR/>
                                    <BR/>
                                    <B>Participants</B><BR/>
                                    Anyone who is at least 13 years of age may participate in any single round match.<BR/><BR/>
                                    <!-- <BR/>

        The match is open to members who are at least 18 years of age, 
        meeting the following eligibility requirements:
                        <UL>
                                        <LI>All US* and Canadian Citizens, excluding Quebec.</LI>
                                        <LI>All Lawful Permanent Residents of the US (i.e., Green Card Holders).</LI>
                                        <LI>All Legal Permanent Residents of Canada, excluding Quebec.</LI>
                                        <LI>All Legal Permanent Residents of Australia.</LI>
                                        <LI>All Legal Permanent Residents of India.</LI>
                                        <LI>All Legal Permanent Residents of the United Kingdom.</LI>
                                        <LI>All Legal Permanent Residents of Ireland.</LI>
                                        <LI>All Legal Permanent Residents of China.</LI>
                                        <LI>All Legal Permanent Residents of New Zealand.</LI>
                                        <LI>All non-immigrants** currently residing in the US with a valid Visa.</LI>
                                    </UL>
                        
                        *(including the US Territories of Guam, Puerto Rico and the US Virgin Islands)<BR/>
                        ** Non-immigrants refer to people who come to the US, but not permanently 
                        (i.e., they are not permanent residents).
        <BR/>

        All competitors must be registered members of TopCoder,
        and must have agreed to the rules on this page by the 
          December<FONT SIZE="1">&#160;</FONT>12,
          2001&#160;
          8:55&#160;PM
          
          
            &#160;EST registration deadline.<BR/>
                                    <BR/>

Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
<BR/>
                                    <BR/> -->
                                    <B>Other</B>
                                    <BR/>

        The tournament is void in whole or in part where prohibited by law.<BR/>
                                    <BR/>

        A winners list of coder handles for all competitions will be available on the web site at
        http://www.topcoder.com displayed for at least 3 months after the end of the
        competition.<BR/>
                                    <BR/>

        This tournament is brought to you by
        TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.<BR/>
                                    <BR/>
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

