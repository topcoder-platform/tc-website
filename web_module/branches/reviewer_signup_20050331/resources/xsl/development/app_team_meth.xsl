<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/stats_intro.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/public_dev_right.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

        <html>
            <head>

                <xsl:call-template name="Preload"/>

                <title>Application Methodology for TopCoder Software Development</title>

                <xsl:call-template name="CSS"/>

                <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

            </head>

            <body>
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>


                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top">
                        <!-- Left Column Begins -->
                        <td width="180">
                            <xsl:call-template name="global_left">
                                <xsl:with-param name="level1">development</xsl:with-param>
                                <xsl:with-param name="level2">applications</xsl:with-param>
                                <xsl:with-param name="level3">app_team_meth</xsl:with-param>
                            </xsl:call-template>
                        </td>
                        <!-- Left Column Ends -->

                        <!-- Gutter Begins -->
                        <td width="6">
                            <img src="/i/clear.gif" width="6" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Center Column Begins -->
                        <td class="bodyText" width="100%">
                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">development</xsl:with-param>
                                <xsl:with-param name="title">&#160;Applications</xsl:with-param>
                            </xsl:call-template>

                            <img src="/i/clear.gif" alt="" width="240" height="20" border="0"/>

                            <div align="center">
                                <h1 class="devSubhead">
                                    <strong>Teams Based Application Development Process</strong>
                                </h1>
                            </div>

<p><span class="bodySubtitle">Teams</span><br/>
Each team must consist of at least one named TopCoder members.  Each team may employ the use of more than one team members, however the final prize payments will be equally split between the named team member(s) and paid out to each.
<br/><br/>
<span class="bodySubtitle">Scope</span><br/>
The teams application competition necessitates that each team move from initial specification, to application design, all the way through to a completed, tested implementation of the application design.
<br/><br/>
<span class="bodySubtitle">Review</span><br/>
There will be no three-person reviews of either the design or the final implementation of the design.  There will be a heavy reliance on the system test cases in determining the suitability of the final deliverable.  Although there will be some subjective criteria in determining the winner of the application competition, the criteria being utilized will be made public and wrapped into a trimmed down scorecard.
<br/><br/>
<span class="bodySubtitle">Prize Penalties</span><br/>
During the application competition, certain checkpoints and timeframes must be met.  In the event that these are not met, prize penalties will be applied.  A prize penalty is measured as a percentage of the total prize amount that a team will receive at the end of the project.  As will be described in the individual phases below, prize penalties are cumulative - however, some checkpoints will allow for nullification of pre-existing penalties.
<br/><br/>
<span class="bodySubtitle">Phases and Deliverables</span><br/>
Various phases and deliverables have been identified primarily to allow TopCoder to assess the progress of any application throughout the design and development cycle.  There are no strict rules about what any team can or cannot be working on during any of the phases.  If a team decided to begin development during the design phase, that would be perfectly legal and may be a good strategy.  Teams must keep in mind, however, that the outcome of the various screening processes may require modifications that would necessitate that any dependant pieces of the application that were already created be re-worked.
<br/><br/>
<blockquote>
<b>Registration</b><br/>
During the registration phase, each team will sign up to work on the named application project.  A single TopCoder member will need to sign up for the project and provide the handle of their teammate in the notes section of the application registration.  If a TopCoder member would like to participate in a team but does not know of a specific teammate, you should register for the application project and indicate in the notes section that you are looking for another member to team up with on the application project.  TopCoder will attempt to form teams from the "singles", and will email each created team with contact information for each member on the team.  If you would like to compete alone, you may do so.
<br/><br/>
<b>Proposal</b><br/>
Upon registering for the application projects, each team will be given access to the requirements specification, high level use cases, activity diagrams, component diagrams, and the test plan for the application project.  They will then begin work on creating a proposal for the application design.  Each submitted proposal should consist of the design specification and the use case diagrams.  At the conclusion of the proposal phase TopCoder will perform basic screening on each proposal to ensure that it meets the requirements of the specific application project.   Based on the submitted proposals, TopCoder will then choose two teams to participate in the application project competition.
<br/><br/>
<b>Design</b><br/>
The two teams that are chosen to compete will now create an application design based on the information that was submitted in their proposals.  The next checkpoint in the competition will be the submission of the final design that will include class diagrams and sequence diagrams - in addition to any enhancements made to the deliverables from each team's proposal.  Upon submission of a team's design, TopCoder will perform design screening to ensure that the design deliverables are consistent and conform to the application specification.  Any team that does not meet the screening requirements for the design will be given feedback as to why - and will be subjected to a 10% prize penalty.  Any team that does not meet the deadline for the design submission will be assessed a 10% prize penalty regardless of the results of the design screening.  In other words, if a submission is either late, or does not meet the screening requirements, the team will be given a 10% prize penalty.  
<br/><br/>
<b>Test Plan/Development</b><br/>
The first deliverable during the development phase of the competition will be the test cases.  Test cases are essentially an implementation of a predefined test plan, which will be provided by TopCoder.  The submitted test cases by each team will undergo a screening process to determine whether the test cases do, in fact, provided complete coverage of the test plan.
<br/><br/>
Any team that does not meet the screening requirements for the test cases will be given feedback as to why - and will be subjected to a 10% prize penalty.  Any team that does not meet the deadline for the test cases submission will be assessed a 10% prize penalty regardless of the outcome of the screening process.  A penalty that is assessed in this phase can be nullified by meeting the requirements and the deadlines of the final deliverable.
<br/><br/>
<b>Development</b><br/>
The final checkpoint in the process will be delivery of a completed application.  A single reviewer will assess each submission for logging, system test results, documentation, security considerations, and error handling.  Minimum screening criteria will need to be met in order for a team to receive any placement or prize.
<br/><br/>
In the event that both teams submit application by the final deadline, the winner will be determined based on the screening, review, and scorecard values.  Once the deadline is reached, the winner will be the first to submit an application that passes screening within a given 24-hour block of time.  For example, if Team A submits by the deadline and Team B does not - Team A will win first place (assuming the submission passes screening).  If neither team submits by the deadline, the deadline will become the time that is 24 hours later than the previous deadline.  If both teams submit within the second 24-hour period - the winner will be determined in the same manner that would have been the case if both teams had made the initial deadline.  This will continue for one week past the original application deadline, after which neither team will place or be paid any prize money.
<br/><br/>
If Team A submits by the initial deadline and passes screening - and Team B has not submitted by the deadline, Team A will win first place and Team B will lose the opportunity for any prize.  This same situation will hold true if the deadline moves out 24 hours due to lack of submission by either team.  In other words, the only way both first and second places will be paid out is if both teams submit a passing application within the current deadline.
<br/><br/>
Any prizes paid to an application that was submitted passed the originally specified deadline will incur a prize penalty of 20% - which will be added to any already existing penalty from the previous phases.  The maximum cumulative prize penalty is 40%.
</blockquote>
</p>

						<p><br/></p>
                        </td>
                        <!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />
        </td>
<!-- Right Column Ends -->

                    </tr>
                </table>

                <!-- Footer Begins -->
                <xsl:call-template name="Foot"/>
                <!-- Footer Endss -->

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

