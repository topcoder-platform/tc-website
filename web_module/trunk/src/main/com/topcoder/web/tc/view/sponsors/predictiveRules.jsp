<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Sponsor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
           
        <div align="center"><img src="/i/longcontest/banner.jpg" border="0px" alt="TopCoder Marathon Matches" /></div>
        <br /><br />

        <h1>TopCoder Predictive Marathon Match</h1>
        <p align="center">
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveOverview">Overview</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveInstructions">How to Compete</a>&#160;&#160;|&#160;&#160;
            Rules&#160;&#160;|&#160;&#160;
            <span class="grayedOut">Active Contests (coming soon)</span>
            <%--
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
            --%>
        </p>
        
        <p><span class="bigTitle">Official Rules &amp; Regulations</span></p>
        
        <p>No purchase necessary to enter or win. Void where prohibited.</p>
        
        <p><span class="bodySubtitle">Overview</span><br />
        Predictive Marathon Match #1 ("Competition") will take place between June 6th, 2008 and August 4th, 2008 and will consist of a single round ("Round"). This Round will award a total prize purse of $2,000. TopCoder members must register for this Round. Registration may occur at any time between the opening of registration for that Round to the deadline for submissions for that Round. All competitors who have registered for the current Round will immediately be given access to the competition problem statement for that Round.</p>
        
        <p><span class="bodySubtitle">Eligibility</span><br />
        The competition is open to all TopCoder members who are at least 18 years of age as of the start date of each Round.</p>
        <p>All competitors must be registered members of TopCoder and must have agreed to the rules on this page prior to participating in this Competition and any Round.</p>
        <p>TopCoder members who are 18 years of age or older as of the start date of each Round are eligible to win cash prizes, unless otherwise prohibited. The Competition and each Round is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Prizes will not be paid to residents of Cuba, Iran, North Korea, Sudan or Syria.</p>
        <p>Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter or participate in the Competition.</p>
        
        <p><span class="bodySubtitle">Match Structure</span><br />
        There will be one Round in this Competition. The format of this Round is similar to a TopCoder Marathon Match. The rules in place for such competitions as of January 30, 2008, as may be amended by these rules or the rules for this Competition, will apply to this Competition.</p>
        <p>A Predictive Marathon Match Round shall consist of three phases: the Coding Phase, an Intermission Phase, and the System Testing Phase.</p>
        <p><em>Coding Phase</em><br />
        The Coding Phase is a timed event where all competitors are presented with the same problem statement. The criteria for scoring will be provided in the problem statement and may change in subsequent Rounds. During any such Round, each competitor may submit one of two types of submissions: an Example Submission or a Full Submission.</p>
        <p>Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the competitor. Each Full Submission is run against a more complete set of test cases which are unknown to the competitor and the competitor receives a provisional score only. The duration of the Coding Phase is thirty-one days from the start of the competition.</p>
        <p><em>Intermission Phase</em><br />
        During the intermission phase, data is gathered from real-world events as indicated by the problem statement. This data is directly used in a systematic fashion as indicated in the problem statement to produce system tests that will later be used in the System Testing Phase. During this time no submissions may take place, neither Example nor Full Submission. The duration of this phase for this Round is 24 days, starting at the end of Coding phase.</p>
        <p><em>System Testing Phase</em><br />
        The System Testing Phase is applied to the most recent Full Submission for each competitor. During system testing, each Full Submission is run against the system test cases generated during the Intermission Phase as discussed in its description above. These test cases are not disclosed previously to the competitors, and each submission is scored according to the criteria specified in the problem statement. Once the system tests are completed, competitors are ranked according to their score on the system test cases. The score a competitor's Full Submission receives is determined solely by the system testing.</p>
        
        <p><span class="bodySubtitle">Schedule</span></p>
        <table cellpadding="0" cellspacing="0" class="stat" width="90%" align="center">
            <tbody>
                <tr>
                    <td class="title" colspan="2">Schedule</td>
                </tr>
                <tr>
                    <td class="header C">Phase</td>
                    <td class="header C">Date</td>
                </tr>
                <tr class="light">
                    <td class="value">Registration</td>
                    <td class="value"><strong>June 6th at 12:00PM EDT</strong></td>
                </tr>
                <tr class="dark">
                    <td class="value">Submission</td>
                    <td class="value"><strong>July 7th at 12:00PM EDT</strong></td>
                </tr>
                <tr class="light">
                    <td class="value">Intermission</td>
                    <td class="value"><strong>July 31st at 12:00PM EDT</strong></td>
                </tr>
                <tr class="dark">
                    <td class="value">System Test</td>
                    <td class="value"><strong>Finished By August 4th at 12:00PM EDT</strong></td>
                </tr>
            </tbody>
        </table>
        
        <p><span class="bodySubtitle">Prizes</span><br />
        This Round will award seven (7) cash prizes to the top scorers as follows:</p>
        <table cellpadding="0" cellspacing="0" class="stat" width="45%" align="center">
            <tbody>
                <tr>
                    <td class="header">Place</td>
                    <td class="header R">Prize</td>
                </tr>
                <tr class="light">
                    <td class="value">1st Place</td>
                    <td class="value R"><strong>$800</strong></td>
                </tr>
                <tr class="dark">
                    <td class="value">2nd Place</td>
                    <td class="value R"><strong>$500</strong></td>
                </tr>
                <tr class="light">
                    <td class="value">3rd Place</td>
                    <td class="value R"><strong>$250</strong></td>
                </tr>
                <tr class="dark">
                    <td class="value">4th Place</td>
                    <td class="value R"><strong>$150</strong></td>
                </tr>
                <tr class="light">
                    <td class="value">5th Place through 7th Place</td>
                    <td class="value R"><strong>$100 each</strong></td>
                </tr>
            </tbody>
        </table>
        
        <p>In the event of a tied score, the coders tied will split the award for each place. For example, if 1st and 2nd place are tied, they would both share the prizes for 1st and 2nd place. In other words, each would receive $650.00 (($800.00+$500.00)/2).</p>
        
        <p><span class="bodySubtitle">Conditions of Participation</span><br />
        By participating in the Competition, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.</p>
        <p>As a condition of participating in the Competition, each competitor grants and agrees to grant TopCoder a perpetual, royalty-free, irrevocable, non-exclusive license to use, reproduce, and publish such submission in any form, medium or technology.</p>
        <p><span class="bigRed">Competitors must not cheat. All ideas for code and/or challenges submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions or the Competition. TopCoder reserves the right, in its sole discretion, to remove any competitor from a Round and/or the Competition who it suspects of cheating.</span></p>
        <p>The winning competitor in each Round will be the competitor that scores the most points across all competitors for that Round. All decisions relating to the viability or validity of submissions, the ranking of submissions and all other matters pertaining to the Competition shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>
        <p>By participating in the Competition, a winning competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition, or participation in any Competition-related activity, or the receipt, use or misuse of a prize.</p>
        <p>TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the competition process, or who is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Competition or any Round if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
        <p>All prizes will be distributed within 60 days of the end of each Round.</p>
        <p>As a condition of winning and redeeming a cash prize, winning competitors will be required to submit a completed (i) Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9, W-8BEN or W-8ECI, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winning competitor (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (d) authorizes TopCoder to publicize the results of the Competition, (e) agrees to sign any applicable forms required by tax authorities, (f) grants to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish any and all information submitted during the Competition (including rights to source code, executables, and text posted by the winning competitor) into any form, medium or technology, and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires winning competitors to complete the Form W-9, W-8BEN or W-8ECI for tax reporting purposes. If prize notification is returned as undeliverable, or if the winning competitor fails to return the Affidavit or tax form as specified, such competitor will be disqualified and will forfeit any prize money won . Providing false information in the registration process or on the required forms described in this paragraph will result in disqualification and forfeiture of any prizes.</p>
        
        <p><span class="bodySubtitle">Other</span><br />
        This Competition is void in whole or in part where prohibited by law.</p>
        <p>A list of winning handles for each Round will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the Competition.</p>
        <p>All federal, state, and local taxes on prize are the sole responsibility of the winning competitor.</p>
        <p>Acceptance of prize constitutes permission to use the winning competitor's name and/or likeness on the web site for advertising/trade purposes without further compensation, except where prohibited.</p>
        <p>All federal, state and local laws and regulations apply.</p>
        <p>This Competition is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.</p>
        <p>&nbsp;</p>

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>