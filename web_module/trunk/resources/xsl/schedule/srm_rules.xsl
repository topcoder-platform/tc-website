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
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
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
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">schedule</xsl:with-param>
                <xsl:with-param name="title">&#160;SRM Official Rules &amp; Qualification</xsl:with-param>
              </xsl:call-template>

    <xsl:variable name="roundId">
      <xsl:value-of select="/TC/SCHEDULE/RoundId"/>
    </xsl:variable>


    <table bgcolor = "#ffffff" cellspacing="0" cellpadding="10" border="0" width="619">
      <tr>
        <td><img src="/i/clear.gif" width="100" height="1" /></td>
        <td><img src="/i/clear.gif" width="19" height="1" /></td>
        <td><img src="/i/clear.gif" width="100" height="1" /></td>
      </tr>
      <tr>
        <td colspan="3" class="bodyText">
          <font color="#ff0000">
            <b>
              <xsl:value-of select="/TC/SCHEDULE/Contests/Contest[ContestId=$roundId]/ContestName"/>
              &#160;
              <xsl:value-of select="substring(/TC/SCHEDULE/Rounds/Round[RoundId=$roundId]/Start,0,11)"/><br/>
              <br/>
              Official Rules and Regulations
            </b>
          </font>
          <br/>
          No purchase necessary to enter or win.
          <br /><br />





   <xsl:choose>
   <xsl:when test="$roundId&lt;4230">
        <b>Prizes</b><br/>
Each competition room will have a maximum of 10 coders. There will be 2 divisions. Division I is 1200 rating and up, while Division II is below 1200. The single round match room assignments will only place members of like divisions together. Any member who changes divisions as a result of a rating change will compete in their new division in the next rated event following the rating change. Coders must place with a positive point total to collect any prize. 
        <br /><br />
All prizes will be calculated at the conclusion of the match, based on the ratings of the coders in each room, as well as the final scores of each coder.
Prizes are calculated based on the ratings of the coders who are assigned to a given room.  The higher the ratings of the coders assigned to a given room, the higher the prize purse for that room will be.  A detailed explanation of how the prizes will be calculated can be found at <a href="/?t=support&amp;c=divisions">http://www.topcoder.com/index?t=support&amp;c=divisions</a>.
        <br /><br />
All prizes will be awarded at the conclusion of the single round of competition.
Any and all applicable taxes on a prize are the sole responsibility of the prize winner. 
        <br /><br />
        <b>About the Tournament</b>
        <br/>
        <ul>
          <li>
            <b>When to start the Online Tournament Rounds</b><br/>
            TopCoder members must register for the online tournament. 
              Registration is from

              <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_begin"/>
              to
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_end"/>, Eastern Time.
              Competition is at
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/coding_begin"/>&#160;<xsl:value-of select="/TC/SCHEDULE/Round/Details/date"/> Eastern Time.
              To register, login to the Tournament Arena applet, click on the 'Main' menu, and 
              choose the option for 'Event Registration'.
              TopCoder members from all over the country will be participating
              in this event, but <b><i>all start times will be communicated as Eastern Time, so contestants in different time zones must adjust accordingly.</i></b>  
              All competitors who have registered for the online tournament 
              round will be assigned to a specific tournament room.  
              TopCoder will perform the room assignments prior to the start of 
              a tournament round, in a manner such that only coders in the same 
              division are placed in a room and the average competitor 
              rating for each room is similar.  
              The Online Round will begin at 
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/coding_begin"/> Eastern Time.
            <br />
          </li>
          <br />
          <br />
          <li>
            <b>Upon Entering an Online Tournament Round</b><br/>
            Each online tournament round consists of three phases:
            the coding phase, challenge phase, and the testing phase.
          </li>
          <ol>
            <li>
              <b>The Coding Phase</b> is a timed event where all
              contestants are presented with the same three questions representing
              three levels of complexity and, accordingly, three levels
              of point earnings potential.
              Points for a problem are awarded upon submission of
              any solution that successfully compiles.
            </li>
            <li>
              <b>The Challenge Phase</b> is a timed event wherein each competitor
              has a chance to challenge the functionality of other competitors' code.
              A successful challenge will award 50 points to the challenger, and any 
              points gained by the submitter for the problem will be lost. 
              Unsuccessful challenges will cost the challenger 50 points as a
              penalty, applied to their total score in that round of competition.
            </li>
            <li>
              <b>The Automated Testing Phase</b> is applied to all submitted code that has
              not already been successfully challenged.  If TopCoder finds code that is flawed,
              the author of that code submission will lose all of the points they earned for that
              code submission.  The automated tester will apply a set of inputs, expecting the output
              from the code submission to be correct.  If the output from a coder's submission does 
              not match the expected output, the submission is considered flawed.  The same set of input/output 
              test cases will be applied to all code submissions for a given problem.
            </li>
          </ol>
          <br />
          <li>
            <b>Scoring during Online Tournament Rounds</b><br/>
The prize winners of each room will be determined as follows:  Coder standing in each room is determined by comparing the point values for all coders in the room for all three phases of the round.  Those with the top three positive point values in the room, place in first, second, and third.  In the event of a tie (unlikely, since scoring is calculated to .01), all coders who have greater than zero points tied for a place will split that prize money combined with the prize money of lesser place(s) equal to the number of coders tied.  For example:  if three coders within a room are tied for first place with positive point totals, they split the combined prize money for first, second and third place.  No other coders are paid.  If two coders are tied for first place with positive point totals, they split the first and second prize money combined, and the coder with the next highest positive point total wins the third place prize money.
            <br /><br />
            All contestants, who opened any problem during the round, will have their ratings 
            adjusted up or down to reflect their performance, based on TopCoder's rating formula.  
            Contestant ratings play no role in a Coder's final standing in the competition room.
          </li>
        </ul>
        <br />
        <b>Conditions of Participation</b><br />

        By participating in the tournament,
        you agree to be bound by these rules and to all decisions of TopCoder,
        which are final, binding and conclusive in all matters.<br /><br />

        Contestants must not cheat; all ideas for any code and/or challenge submitted must be the 
        contestant's alone.<br /><br />

        Winners in each round of competition will be those competitors that win the most points 
        in their respective rooms.  All decisions relating to the viability of submissions, the ranking of
        submissions and all other matters pertaining to the tournament
        shall be within the sole discretion of TopCoder or its designee and shall be final and
        binding in all respects.<br /><br />

        Prize winners will be notified via e-mail within 10 days of the completion of the tournament 
        that they have won a prize and will be forwarded an affidavit of eligibility to be completed 
        and returned to TopCoder.  Prizes will be presented within 10 days of making an eligibility 
        determination. Unclaimed or undeliverable prizes will not be awarded.<br /><br />

As a condition of winning and redeeming a prize, winners will be required to return within 60 days of receipt a completed (i) Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winner (i) confirms their eligibility, (ii) represents and warrants that they have not cheated; that the idea for the code and/or challenge submitted is theirs alone, (iii) verifies the accuracy of the demographic information submitted, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) grants to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to  use, reproduce and publish any and all information submitted during the contest (including source code and text posted by you) into any form, medium or technology, and (vii) releases TopCoder from liability arising out of any prize won. The Form W-9 or W-8BEN is required by the IRS for tax reporting purposes. If prize notification is returned as undeliverable, or the winner fails to return the Affidavit, or the W-9 or W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winner.
<br /><br />

By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.
<br /><br />

Verified winners agree to use their name, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by or attributed to the winner relating to TopCoder and any and all rights to said use, without further compensation.
<br /><br />

TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the tournament process, or is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
<br /><br /><br />

        <b>Participants</b><br />

The match is open to all members who are at least 13 years of age.<br/>
However, prizes will only be paid to members who are at least 18 years of age, meeting the following eligibility requirements: 
                        <ul>
                          <li>All US* Citizens.</li>
                          <li>All Lawful Permanent Residents of the US (i.e., Green Card Holders).</li>
                          <li>All Citizens and Legal Permanent Residents of Canada, excluding Quebec.</li>
                          <li>All Citizens and Legal Permanent Residents of China.</li>                          
                          <li>All Citizens and Legal Permanent Residents of Australia.</li>
                          <li>All Citizens and Legal Permanent Residents of India.</li>
                          <li>All Citizens and Legal Permanent Residents of Ireland.</li>
                          <li>All Citizens and Legal Permanent Residents of New Zealand.</li>                          
                          <li>All Citizens and Legal Permanent Residents of the United Kingdom.</li>
                          <li>All non-immigrants** currently residing in the US with a valid Visa.</li>
                        </ul>
                        *(including the US Territories of Guam, Puerto Rico and the US Virgin Islands)<br/>
                        ** Non-immigrants refer to people who come to the US, but not permanently 
                        (i.e., they are not permanent residents).
        <br />

        All competitors must be registered members of TopCoder,
        and must have agreed to the rules on this page by the 


              <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_date"/>&#160;<xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_end"/> Eastern Time registration deadline.<br/><br/>

Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
<br /><br />

        <b>Other</b><br />

        The tournament is void in whole or in part where prohibited by law.<br /><br />

        A winners list of coder handles for all competitions will be available on the web site at
        http://www.topcoder.com displayed for at least 3 months after the end of the
        competition.<br /><br />

        This tournament is brought to you by
        TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.<br /><br />

 </xsl:when>
 <xsl:otherwise>

        <b>Rooms</b><br/>
Each competition room will have a maximum of 20 coders. There will be 2 divisions. Division I is 1200 rating and up, while Division II is below 1200. The single round match room assignments will only place members of like divisions together. Any member who changes divisions as a result of a rating change will compete in their new division in the next rated event following the rating change.
        <br /><br />
        <b>About the Tournament</b>
        <br/>
        <ul>
          <li>
            <b>When to start the Online Tournament Rounds</b><br/>
            TopCoder members must register for the online tournament. 
              Registration is from
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_begin"/>
              to
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_end"/>, Eastern Time.
              Competition is at
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/coding_begin"/>&#160;<xsl:value-of select="/TC/SCHEDULE/Round/Details/date"/> Eastern Time.
              To register, login to the Tournament Arena applet, click on the 'Main' menu, and 
              choose the option for 'Event Registration'.
              TopCoder members from all over the country will be participating
              in this event, but <b><i>all start times will be communicated as Eastern Time, so contestants in different time zones must adjust accordingly.</i></b>  
              All competitors who have registered for the online tournament 
              round will be assigned to a specific tournament room.  
              TopCoder will perform the room assignments prior to the start of 
              a tournament round, in a manner such that only coders in the same 
              division are placed in a room and the average competitor 
              rating for each room is similar.  
              The Online Round will begin at 
              <xsl:value-of select="/TC/SCHEDULE/Round/Details/coding_begin"/> Eastern Time.
            <br />
          </li>
          <br />
          <br />
          <li>
            <b>Upon Entering an Online Tournament Round</b><br/>
            Each online tournament round consists of three phases:
            the coding phase, challenge phase, and the testing phase.
          </li>
          <ol>
            <li>
              <b>The Coding Phase</b> is a timed event where all
              contestants are presented with the same three questions representing
              three levels of complexity and, accordingly, three levels
              of point earnings potential.
              Points for a problem are awarded upon submission of
              any solution that successfully compiles.
            </li>
            <li>
              <b>The Challenge Phase</b> is a timed event wherein each competitor
              has a chance to challenge the functionality of other competitors' code.
              A successful challenge will award 50 points to the challenger, and any 
              points gained by the submitter for the problem will be lost. 
              Unsuccessful challenges will cost the challenger 50 points as a
              penalty, applied to their total score in that round of competition.
            </li>
            <li>
              <b>The Automated Testing Phase</b> is applied to all submitted code that has
              not already been successfully challenged.  If TopCoder finds code that is flawed,
              the author of that code submission will lose all of the points they earned for that
              code submission.  The automated tester will apply a set of inputs, expecting the output
              from the code submission to be correct.  If the output from a coder's submission does 
              not match the expected output, the submission is considered flawed.  The same set of input/output 
              test cases will be applied to all code submissions for a given problem.
            </li>
          </ol>
          <br />
          <li>
            <b>Scoring during Online Tournament Rounds</b><br/>
            All contestants, who opened any problem during the round, will have their ratings 
            adjusted up or down to reflect their performance, based on TopCoder's rating formula.  
            Contestant ratings play no role in a Coder's final standing in the competition room.
          </li>
        </ul>
        <br />
        <b>Conditions of Participation</b><br />

        By participating in the tournament,
        you agree to be bound by these rules and to all decisions of TopCoder,
        which are final, binding and conclusive in all matters.<br /><br />

        Contestants must not cheat; all ideas for any code and/or challenge submitted must be the 
        contestant's alone.<br /><br />

        Winners in each round of competition will be those competitors that win the most points 
        in their respective rooms.  All decisions relating to the viability of submissions, the ranking of
        submissions and all other matters pertaining to the tournament
        shall be within the sole discretion of TopCoder or its designee and shall be final and
        binding in all respects.<br /><br />

By participating in a tournament, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize.
<br /><br />

TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the tournament process, or is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
<br /><br /><br />

        <b>Participants</b><br />

The match is open to all members who are at least 13 years of age.<br/>
        <br />

        All competitors must be registered members of TopCoder,
        and must have agreed to the rules on this page by the 

              <xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_date"/>&#160;<xsl:value-of select="/TC/SCHEDULE/Round/Details/reg_end"/> Eastern Time registration deadline.<br/><br/>

Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
<br /><br />

        <b>Other</b><br />

        The tournament is void in whole or in part where prohibited by law.<br /><br />

        A winners list of coder handles for all competitions will be available on the web site at
        http://www.topcoder.com displayed for at least 3 months after the end of the
        competition.<br /><br />

        This tournament is brought to you by
        TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.<br /><br />
   </xsl:otherwise>
   </xsl:choose>



        </td>
      </tr>
    </table>


            </TD>
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

