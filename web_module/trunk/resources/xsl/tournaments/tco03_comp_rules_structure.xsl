<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
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

<body>

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
                <xsl:with-param name="selectedContest">component</xsl:with-param>
                <xsl:with-param name="selectedTab">component_rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedList">component_rules</xsl:with-param>
                <xsl:with-param name="selectedTab">structure</xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Competition Structure</h2>

            <p>ALL SUBMISSIONS MUST BE RECEIVED DURING EACH ROUND'S SUBMISSIONS TIMELINE TO BE CONSIDERED A VIABLE ENTRY.  THERE
            WILL BE NO EXCEPTIONS.  Following the submission deadline, the TopCoder Review Boards will review and score all eligible entries.
            After the Aggregation Phase, the winners will be identified and announced.  Those winners will advance to the next online round. Coder
             advancement in Online Round 1 and 2 will be determined by averaging each member's two highest Review Board scores.  One score
             to be used in calculating the average will be the highest score for a level 2 submission.  The other score will be the highest score of
             any other submission.  The competitors with the highest average scores will advance.  The specific structure of the online rounds is
             as follows:</p>

             <ul>
                <li><strong>Online Round 1</strong><br />
                All eligible rated members may compete in Round 1 and a total of ten (10) will advance.  For the design contest, two of the 10
                advancing positions will be awarded to the winners of the two previous component design bonus contests (Pops and TangentZ).  If
                fewer than 10 people (8 people for the design contest) qualify for the remaining advancing positions, only those members who
                meet the advancement criteria will advance to Online Round 2.</li>

                <li><strong>Online Round 2</strong><br />
               Up to ten (10) coders will compete and two (2) will advance.  </li>

                <li><strong>Onsite Championship Round 3</strong><br />
                Two (2) members will compete.  The member with the highest score of the final submission will be declared the winner.</li>
            </ul>

            <p><strong>Tie-Breakers</strong>:  In the event of a tie for any advancing position in Rounds 1 and 2, the tie will be resolved in
            the following manner (in order): <br/>
            <ol>
            <li>The highest score for the level 2 component submitted during that round</li>
            <li>If a tie still remains, then by averaging the tied members' scores from each round in which all tied participants competed</li>
            <li>If a tie still remains, then by TopCoder rating as of September 2</li>
            <li>If a tie still remains, then all tied members will advance to the next round</li>
            </ol>
            </p>

            <p><span class="bodySubtitle">Scoring</span><br />
            During each online round of competition, eligible competitors will
            submit design and development solutions for at least two eligible
            components (including at least one level 2 component) by the submission due date.
            Submissions will be scored by the TopCoder Review Boards and will be
            subject to final review and appeal in the same manner as standard
            component design submissions.  Each competitor's score for the round will be the
            average of his/her two highest scores (one score must be a level 2
            component).
            </p>

            <p><span class="bodySubtitle">Onsite Championship Round 3</span><br />
            The two advancers from Round 2 will travel to Mohegan Sun on Thursday, December 4th to compete in the final review stage (see explanation below) of
            Round 3 being held on Friday, December 5th.  All contestants must arrive at Mohegan Sun no later than 4:00 PM on Thursday,
            December 4th.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and
            his/her spot in the tournament will be given to the next highest overall scorer from Round 2.</p>

            <p>The two advancers from Round 2 will have ten days to complete the final project.
            Once the project is completed, the submissions will be submitted to
            TopCoder and reviewed by the TopCoder review board.  The finalists will
            receive the review scorecards at 8:00 am on Friday, December 5th,  as well as an addendum to the original requirements for
            design projects and an additional section of the design for development
            projects.  Each finalist will be scored on the implementation of final
            fixes for the component as well as the additional design or development
            of the addendum.  This portion of the competition will last 4 hours.  (An
            example addendum for an HTTP Listener component would be to design or
            develop an SSL module for the component)</p>

            <p>TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, up to a cost of $1,000 per
            person.  (That is, if a contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between
            the cost of the airfare and $1,000.)  In addition, TopCoder will also provide travel arrangements to and from the airport to the
            Mohegan Sun Casino and accommodations and certain meals for each contestant and his/her guest.  All other expenses are the
            responsibility of the contestant and his/her guest.</p>

            <p>The Championship Round 3 will be a single round of two (2) members.  The winner of Championship Round 3 will be the
            member with the highest score of his/her component submission.</p>


            <p><strong>Championship Tie-Breaker</strong>:  In the event of a tie in the Championship Round, the tie will be resolved
            in the following manner (in order):<br/>
            <ol>
            <li>By averaging the tied members' scores from each round in which all tied participants competed</li>
            <li>If a tie still remains, then by TopCoder rating as of September 2</li>
            <li>If a tie still remains, then the prize money will be distributed equally amongst the tied members</li>
            </ol>
            </p>

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
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
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

