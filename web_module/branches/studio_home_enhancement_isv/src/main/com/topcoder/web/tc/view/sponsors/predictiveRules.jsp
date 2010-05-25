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
            <%--
            <span class="grayedOut">Active Contests (coming soon)</span>
            --%>
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
            
        </p>
        
        <p><span class="bigTitle">Official Rules &amp; Regulations</span></p>
        
        <p>No purchase necessary to enter or win. Void where prohibited.</p>
        
        <p><span class="bodySubtitle">Overview</span><br />
        Predictive Marathon Match #1 ("Competition") will take place between June 6th, 2008 and August 4th, 2008 and will consist of a single round. The Competition will award a total prize purse of $2,000. TopCoder members must register for the Competition. Registration may occur at any time between the opening of registration and the end of the Submission Phase. All competitors who have registered for the Competition will immediately be given access to the competition problem statement.</p>
        
        <p><span class="bodySubtitle">Eligibility</span><br />
        The Competition is open to all TopCoder members who are at least 18 years of age as of June 6, 2008.</p>
        <p>All competitors must be registered members of TopCoder and must have agreed to these rules prior to participating in the Competition.</p>
        <p>TopCoder members who are 18 years of age or older as of June 6, 2008 are eligible to win cash prizes, unless otherwise prohibited. The Competition is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Prizes will not be paid to residents of Cuba, Iran, North Korea, Sudan or Syria.</p>
        <p>Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter or participate in the Competition.</p>
        
        <p><span class="bodySubtitle">Match Structure</span><br />
        There will be one round in this Competition. The format for the Competition is similar to a TopCoder Marathon Match. The rules in place for such competitions as of June 6, 2008, as may be amended by these rules, will apply to this Competition.</p>
        <p>The Competition shall consist of three phases: the Coding Phase, an Intermission Phase, and the System Testing Phase.</p>
        <p><em>Coding Phase</em><br />
        The Coding Phase is a timed event where all competitors are presented with the same problem statement. The criteria for scoring will be provided in the problem statement. During this Phase, each competitor may submit one of two types of submissions: an Example Submission or a Full Submission.</p>
        <p>Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the competitor. Each Full Submission is run against a more complete set of test cases which are unknown to the competitor and the competitor receives a provisional score only. The Coding Phase begins on June 6, 2008 at 11:59 AM EDT ends on July 7, 2008 at 11:59 AM EDT.  No submissions will be accepted after the end of the Coding Phase.</p>
        <p><em>Intermission Phase</em><br />
        During the Intermission Phase, data is gathered from real-world events as indicated by the problem statement. This data is directly used in a systematic fashion as indicated in the problem statement to produce system tests that will later be used in the System Testing Phase. The Intermission Phase begins on July 7, 2008 at 11:59 AM EDT and ends on July 31, 2008 at 11:59 AM EDT.</p>
        <p><em>System Testing Phase</em><br />
        The System Testing Phase is applied to the most recent Full Submission of each competitor. During this Phase, each Full Submission is run against the system test cases generated during the Intermission Phase. These test cases are not disclosed previously to the competitors, and each submission is scored according to the criteria specified in the problem statement. Once the system tests are completed, competitors are ranked according to their score on the system test cases. The score a competitor's Full Submission receives is determined solely by the submission's performance during the System Testing Phase.  The System Testing Phase begins on July 31, 2008 at 11:59AM EDT and ends on August 4, 2008 at 11:59 AM EDT.</p>
        
        <p><span class="bodySubtitle">Schedule</span></p>
        <table cellpadding="0" cellspacing="0" class="stat" width="90%" align="center">
            <tbody>
                <tr>
                    <td class="title" colspan="3">Schedule</td>
                </tr>
                <tr>
                    <td class="header C">Phase</td>
                    <td class="header C">Start Date</td>
                    <td class="header C">End Date</td>
                </tr>
                <tr class="light">
                    <td class="value">Registration/Submission</td>
                    <td class="value"><strong>June 6, 2008<br />at 11:59 AM EDT</strong></td>
                    <td class="value"><strong>July 7, 2008<br />at 11:59 AM EDT</strong></td>
                </tr>
                <tr class="dark">
                    <td class="value">Intermission</td>
                    <td class="value"><strong>July 7, 2008<br />at 11:59AM EDT</strong></td>
                    <td class="value"><strong>July 31, 2008<br />at 11:59 AM EDT</strong></td>
                </tr>
                <tr class="light">
                    <td class="value">System Test</td>
                    <td class="value"><strong>July 31, 2008<br />at 11:59 AM EDT</strong></td>
                    <td class="value"><strong>August 4, 2008<br />at 11:59 AM EDT</strong></td>
                </tr>
                <tr class="dark">
                    <td class="value">Winners Announced</td>
                    <td class="value"><strong>&nbsp;</strong></td>
                    <td class="value"><strong>&nbsp;</strong></td>
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
                    <td class="value R"><strong>$100</strong></td>
                </tr>
            </tbody>
        </table>
        
        <p>In the event of a tied score, the coders tied will split the award for each place. For example, if 1st and 2nd place are tied, they would share equally the prizes for 1st and 2nd place. In other words, each would receive $650.00 (($800.00+$500.00)/2).</p>
        
        <p><span class="bodySubtitle">Conditions of Participation</span><br />
        By participating in the Competition, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.</p>
        <p>As a condition of participating in the Competition, each competitor grants and agrees to grant TopCoder a perpetual, royalty-free, irrevocable, non-exclusive license to use, reproduce, and publish such submission in any form, medium or technology.</p>
        <p><span class="bigRed">Competitors must not cheat. All ideas for code submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions or the Competition. TopCoder reserves the right, in its sole discretion, to remove any competitor from the Competition who it suspects of cheating.</span></p>
        <p>The winning competitor will be the competitor that scores the highest following the completion of the System Test Phase. All decisions relating to the viability or validity of submissions, the ranking of submissions and all other matters pertaining to the Competition shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>
        <p>TopCoder is not responsible for entries not received due to lost, failed, delayed or interrupted connections or miscommunications, or other electronic malfunctions, or due to lost, late, mutilated, illegible, incomplete, postage due or misdirected mailed entries. TopCoder is not responsible for incorrect or inaccurate entry information, whether caused by persons entered at the web site or by any of the equipment or programming associated with or utilized in the Competition or by any human error which may occur in the processing of the entries in this Competition.</p>
        <p>By participating in the Competition, a winning competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition, or participation in any Competition-related activity, or the receipt, use or misuse of a prize.</p>
        <p>TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the competition process, or who is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
        <p>All prizes will be distributed within 60 days of the end of the Competition.</p>
        <p>As a condition of winning and redeeming a cash prize, winning competitors will be required to submit a completed (i) Affidavit of Eligibility and Liability and Publicity Release, (ii) a Competition Assignment Document, if one is not already on file with TopCoder, and (iii) IRS Form W-9, W-8BEN or W-8ECI, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winning competitor (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (d) authorizes TopCoder to publicize the results of the Competition, (e) agrees to sign any applicable forms required by tax authorities, and (f) releases TopCoder from liability arising out of any prize won. TopCoder requires winning competitors to complete the Form W-9, W-8BEN or W-8ECI for tax reporting purposes. TopCoder also requires winning competitors to execute the TopCoder Competition Assignment Document to assign all rights to all information submitted during the Competition to TopCoder by a winning competitor.  If prize notification is returned as undeliverable, or if the winning competitor fails to return the Affidavit, Competition Assignment or tax form as specified, such competitor will be disqualified and will forfeit any prize money won . Providing false information in the registration process or on the required forms described in this paragraph will result in disqualification and forfeiture of any prizes.</p>
        
        <p><span class="bodySubtitle">Other</span><br />
        This Competition is void in whole or in part where prohibited by law.</p>
        <p>A list of winning handles for the Competition will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the Competition.</p>
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