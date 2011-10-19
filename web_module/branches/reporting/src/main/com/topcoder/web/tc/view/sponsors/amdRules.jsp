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
           
        <div align="center"><img src="/i/sponsor/amd_logo.png" border="0px" alt="AMD Logo" /></div>
        <br /><br />

        <p align="center">
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=amdOverview">Overview</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=amdInstructions">How to Compete</a>&#160;&#160;|&#160;&#160;
            Rules&#160;&#160;|&#160;&#160;
            <%--
            <span class="grayedOut">Active Contests (coming soon)</span>
            --%>
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
        </p>
        
        <p><span class="bigTitle">Official Rules &amp; Regulations</span></p>
        
        <p>No purchase necessary to enter or win. Void where prohibited.</p>
        
        <p><span class="bodySubtitle">Overview</span><br />
        The AMD Multicore Threadfest ("Competition") will take place between March 10, 2008 and December 31, 2008 and will consist of four (4) rounds (each a "Round"). Each Round will award a total prize purse of $5,000. TopCoder members must register for each Round . Registration may occur at any time between the opening of registration for that Round  to the deadline for submissions for that Round.  All competitors who have registered for the current Round will immediately be given access to the competition problem statement for that Round.</p>
        
        <p><span class="bodySubtitle">Eligibility</span><br />
        The competition is open to all TopCoder members who are at least 18 years of age as of the start date of each Round.</p>
        <p>All competitors must be registered members of TopCoder and must have agreed to the rules on this page prior to participating in this Competition and any Round.</p>
        <p>TopCoder members who are 18 years of age or older as of the start date of each Round are eligible to win cash prizes, unless otherwise prohibited.  The Competition and each Round is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law.  Prizes will not be paid to residents of Cuba, Iran, North Korea, Sudan or Syria.</p>
        <p>Employees of TopCoder and AMD and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter or participate in the Competition.</p>
        
        <p><span class="bodySubtitle">Match Structure</span><br />
        There will be four (4) Rounds in the Competition.  The format of each Round is similar to a TopCoder Marathon Match. The rules in place for such competitions as of January 30, 2008, as may be amended by these rules or the rules for this Competition, will apply to this Competition.</p>
        <p>Each Round shall consist of two phases: the Coding Phase and the System Testing Phase.</p>
        <p><em>Coding Phase</em><br />
        The Coding Phase is a timed event where all competitors are presented with the same problem statement. The criteria for scoring will be provided in the problem statement and may change in each Round. During each Round, each competitor may submit one of two types of submissions: an Example Submission or a Full Submission.</p>
        <p>Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the competitor. Each Full Submission is run against a more complete set of test cases which are unknown to the competitor and the competitor receives a provisional score only. The duration of the Coding Phase is two weeks.</p>
        <p><em>System Testing Phase</em><br />
        The System Testing Phase is applied to the most recent Full Submission for each competitor. During system testing, each Full Submission is run against a large number of sample cases not disclosed previously to the competitors, and is scored according to the criteria specified in the problem statement. Once the system tests are completed, competitors are ranked according to their score on the system test cases. The score a competitor's Full Submission receives is determined solely by the system testing.</p>
        
        <p><span class="bodySubtitle">Schedule</span></p>
        <table cellpadding="0" cellspacing="0" class="stat" width="90%" align="center">
            <tbody>
                <tr>
                    <td class="title" colspan="3">Schedule</td>
                </tr>
                <tr>
                    <td class="header">Competition</td>
                    <td class="header C">Registration</td>
                    <td class="header R">Deadline</td>
                </tr>
                <tr class="light">
                    <td class="value">Competition 1</td>
                    <td class="value C">March 12, 2008<br />12:00 Noon EDT</td>
                    <td class="value R">March 26, 2008<br />12:00 Noon EDT</td>
                </tr>
                <tr class="dark">
                    <td class="value">Competition 2</td>
                    <td class="value C">May 21, 2008<br />12:00 Noon EDT</td>
                    <td class="value R">June 4, 2008<br />12:00 Noon EDT</td>
                </tr>
                <tr class="light">
                    <td class="value">Competition 3</td>
                    <td class="value C">September 10, 2008<br />12:00 Noon EDT</td>
                    <td class="value R">September 24, 2008<br />12:00 Noon EDT</td>
                </tr>
                <tr class="dark">
                    <td class="value">Competition 4</td>
                    <td class="value C">December 18, 2008<br />12:00 Noon EDT</td>
                    <td class="value R">January 1, 2009<br />12:00 Noon EDT</td>
                </tr>
                <tr class="light">
                    <td class="value" colspan="3">*Please note the change in Daylight Saving Time in November for deadlines.</td>
                </tr>
            </tbody>
        </table>
        
        <p><span class="bodySubtitle">Prizes</span><br />
        Each competition will award five (5) cash prizes to the top scorers.</p>
        <table cellpadding="0" cellspacing="0" class="stat" width="45%" align="center">
            <tbody>
                <tr>
                    <td class="header">Place</td>
                    <td class="header R">Prize</td>
                </tr>
                <tr class="light">
                    <td class="value">1st Place </td>
                    <td class="value R">$2,500</td>
                </tr>
                <tr class="dark">
                    <td class="value">2nd Place </td>
                    <td class="value R">$1,000</td>
                </tr>
                <tr class="light">
                    <td class="value">3rd Place </td>
                    <td class="value R">$750</td>
                </tr>
                <tr class="dark">
                    <td class="value">4th Place </td>
                    <td class="value R">$500</td>
                </tr>
                <tr class="light">
                    <td class="value">5th Place </td>
                    <td class="value R">$250</td>
                </tr>
            </tbody>
        </table>
        
        <p>In the event of a tied score, the coders tied will split the award for each place. For example, if 1st and 2nd place are tied, they would both share the prizes for 1st and 2nd place.  In other words,  each would receive  $1,750.00 (($2,500.00+$1,000.00)/2).</p>
        
        <p><span class="bodySubtitle">Conditions of Participation</span><br />
        By participating in the Competition, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.</p>
        <p>As a condition of participating in the Competition, each competitor grants and agrees to grant TopCoder a perpetual, royalty-free, irrevocable, non-exclusive license to use, reproduce, and publish such submission in any form, medium or technology.</p>
        <p><span class="bigRed">Competitors must not cheat. All ideas for code and/or challenges submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions or the Competition. TopCoder reserves the right, in its sole discretion, to remove any competitor from a Round and/or the Competition who it suspects of cheating.</span></p>
        <p>The winning competitor in each Round will be the competitor that scores the most points across all competitors for that Round. All decisions relating to the viability or validity of submissions, the ranking of submissions and all other matters pertaining to the Competition shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>
        <p>TopCoder and AMD are not responsible for entries not received due to lost, failed, delayed or interrupted connections or miscommunications, or other electronic malfunctions, or due to lost, late, mutilated, illegible, incomplete, postage due or misdirected mailed entries. TopCoder and AMD are not responsible for incorrect or inaccurate entry information, whether caused by persons entered at the web site or by any of the equipment or programming associated with or utilized in the Competition or by any human error which may occur in the processing of the entries in this Competition.</p>
        <p>By participating in the Competition, a winning competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition, or participation in any Competition-related activity, or the receipt, use or misuse of a prize.</p>
        <p>TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the competition process, or who is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Competition or any Round if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
        <p>All prizes will be distributed within 60 days of the end of each Round.</p>
        <p>As a condition of winning and redeeming a cash prize, winning competitors will be required to submit a completed (i) Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9, W-8BEN or W-8ECI, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winning competitor (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (d) authorizes TopCoder to publicize the results of the Competition, (e) agrees to sign any applicable forms required by tax authorities, (f) grants to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish any and all information submitted during the Competition (including rights to source code, executables, and text posted by the winning competitor) into any form, medium or technology, and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires winning competitors to complete the Form W-9, W-8BEN or W-8ECI for tax reporting purposes. If prize notification is returned as undeliverable, or if the winning competitor fails to return the Affidavit or tax form as specified, such competitor will be disqualified and will forfeit any prize money won . Providing false information in the registration process or on the required forms described in this paragraph will result in disqualification and forfeiture of any prizes.</p>
        
        <p><span class="bodySubtitle">Other</span><br />
        This Competition is void in whole or in part where prohibited by law.</p>
        <p>A list of  winning handles for each Round will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the Competition.</p>
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