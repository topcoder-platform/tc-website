<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tco03_head.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules - Structure</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body onLoad="timer(1);">

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText">

<!-- TCO Head Begins -->
<xsl:call-template name="tco03_head"/>
<!-- TCO Head Ends -->

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedContest">coding</xsl:with-param>
                <xsl:with-param name="selectedTab">coding_rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedList">coding_rules</xsl:with-param>
                <xsl:with-param name="selectedTab">structure</xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Competition Structure</h2>

<!-- The Competition Field -->
            <p><span class="bodySubtitle">The Competition Field</span><br />
            A total of 500 TopCoder members will compete in Online Round 1.  The field will be comprised of 100 automatic
            berths and 400 qualification spots.</p>

            <p>Click <a href="/?&amp;t=tournaments&amp;c=tco03_sched#berths">here</a> for more details regarding the automatic berths
            and qualification spots.</p><br />

<!-- Online Elimination Rounds -->
            <p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior to
            the start of the online round. (Click <a href="/?&amp;t=tournaments&amp;c=tco03_sched#sched">here</a> for competition dates and times.)
            TopCoder members from around the world may be
            participating in these rounds, but all start times will be communicated as Eastern Time, so contestants in different time zones
            must adjust accordingly. If a coder does not participate, for any reason, in an online round they have advanced to, it will be
            treated as an automatic loss in that round of competition.</p>

            <p>All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all
            room assignments prior to the start of each online round in a manner such that the average competitor rating (as of October
            7th) for each room will be similar.</p><br />

<!-- Scoring and Advancing During Online Rounds -->
            <p><span class="bodySubtitle">Scoring and Advancing During Online Rounds</span><br />
            After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next
            online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the
            round (see Round Structure below) for each coder. In order to advance, a coder must finish each round with a
            greater-than-zero point total. The structure of the online rounds is as follows:</p>

            <ul>
                <li><strong>Online Round #1</strong><br />
                A total of 500 coders will compete in Round #1 and a total of 200 will advance.  The winner of each of the 50 rooms will
                automatically advance to Online Round #2.  The remaining 150 spots will be wildcards, and will be awarded based on total
                points across all rooms.  (In the event there are less than 50 room winners in Round #1, the total number of wildcard spots
                will be equal to 200 minus the actual number of room winners.)</li>

                <li><strong>Online Round #2</strong><br />
                200 coders will compete and 100 will advance.  The winner of each of the 20 rooms will automatically advance to Online Round
                #3.  The remaining 80 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there
                are less than 20 room winners in Round #2, the total number of wildcard spots will be equal to 100 minus the actual number
                of room winners.)</li>

                <li><strong>Online Round #3</strong><br />
                100 coders will compete and 50 will advance.  The winner of each of the 10 rooms will automatically advance to Online Round
                #4.  The remaining 40 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there
                are less than 10 room winners in Round #3, the total number of wildcard spots will be equal to 50 minus the actual number of
                room winners.)</li>

                <li><strong>Online Round #4</strong><br />
                50 coders will compete and 16 will advance.  The winner of each of the 5 rooms will automatically advance to the field of
                Semifinalists.  The remaining 11 spots will be wildcards and will be awarded based on total points across all rooms.  (In the
                event there are less than 5 room winners in Round #4, the total number of wildcard spots will be equal to 16 minus the actual
                number of room winners.)</li>
            </ul>

            <p><strong>NOTE:</strong>  In the event of a tie for any advancing position (i.e. room winner or
            wildcard spot), the tie will be resolved in the following manner:</p>

            <ul>
                <li>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were
                presented with the same set of problems</li>
                <li>If a tie still remains, then by rating (higher is better) as of October 6, 2003</li>
                <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul><br />

<!-- Round Structure -->
            <p><span class="bodySubtitle">Round Structure</span><br />
            Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase.
            (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)</p>

            <ul>
                <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions
                representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are
                awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time
                the problem was opened to the time it was submitted.</li>

                <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality
                of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the
                defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as
                a penalty, applied against their total score in that round of competition.</li>

                <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully
                challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the
                points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the
                output from the code submission to be correct. If the output from a coder's submission does not match the expected output,
                the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a
                given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing
                Phase.</li>
            </ul><br />

<!-- Other -->
            <p><span class="bodySubtitle">Other</span><br />
            The tournament is void in whole or in part where prohibited by law.</p>

            <p>A list of tournament winners by coder handles will be available on the web site at http://www.topcoder.com/, and will be
            displayed for at least 3 months after the end of the tournament.</p>

            <p>This tournament is brought to you by TopCoder, Inc. (http://www.topcoder.com/) 703 Hebron Avenue, Glastonbury, CT 06033.</p>
            </blockquote>

            <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tco03</xsl:with-param>
            </xsl:call-template>
        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

