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
              Unsuccessful challenges will cost the challenger 25 points as a
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

