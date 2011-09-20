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
            How to Compete&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveRules">Rules</a>&#160;&#160;|&#160;&#160;
            <%--
            <span class="grayedOut">Active Contests (coming soon)</span>
            --%>
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
            
        </p>
        
        <p><span class="bigTitle">How To Compete</span></p>
        
        <p><span class="bodySubtitle">Registration</span><br />
        In order to compete in a Predictive Marathon Match event, one must first register. One may register at any time during the submission phase. The submission phase for a Predictive Marathon Match will last 31 days. In order to register, you will need to click Register next to the appropriate Predictive Marathon Match event within the Active Contests list and agree to the rules of the event. Once registered, you may view the problem statement by clicking the Problem Name from within the Active Contests list. Problem statements will be made available to all TopCoder members once the competition starts. Registration is not required to view them. Check the website for further details.</p>
        
        <p><span class="bodySubtitle">Problem Statements</span><br />
        During the Predictive Marathon Match, the types of problems and the associated scoring mechanism may vary in subsequent problems. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete. The problems will be designed such that submissions that have the ability to more accurately predict the events described in the problem statement that occur during the intermission phase will perform better than other submissions, resulting in a higher score. These specifics will be outlined in the problem statement form for any such Predictive Marathon Match event.</p>
        
        <p><span class="bodySubtitle">Submitting Solutions</span><br />
        All members registered for a specific Predictive Marathon Match event will see a Submit option for that event. Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. Example test cases will not be tested. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly. During the submission phase, overall ranking is the only piece of information that will be made available. A given competitor will only be allowed to submit once every 4 hours - other than that there are no restrictions on the number of submissions that each competitor may perform.</p>
        <p>Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.</p>
        <p>In this predictive event, all competitors are encouraged to improve their solutions and resubmit iteratively throughout the duration of the submission phase. The most recent submission is always the one that counts, so if you make a submission that does not score as well as a prior submission, the most recent will still be the one that counts in the standings.</p>
        
        <p><span class="bodySubtitle">Languages</span><br />
        Competitors may select any of the following languages for this competition: Java, C++, C#.NET, VB.NET, and Python.</p>
        <p>Note: The language must be appropriately selected on the submission screen.</p>
        
        <p><span class="bodySubtitle">Viewing Match Standings</span><br />
        At any time during a Predictive Marathon Match event, TopCoder members may view the latest standings of that event. This will show the current score (for the latest submission) for each member who has registered for that event, their rank, and the number of submissions they have performed during the event. Clicking on the submission count will display the date, time, and point-in-time score of each submission for a given participant.</p>
        
        <p><span class="bodySubtitle">Match results</span><br />
        Once the submission phase of Predictive Marathon Match event has ended, an extended intermission phase will occur. During this intermission data will be collected from a situation as specified in the problem statement, until the intermission expires. No changes to any submission may occur during this time period. This real-world data will be collected and made into system tests as indicated in the problem statement, which will then be used to test each submission and assign a score based on the rules outlined in the problem statement, in the same fashion as a normal Marathon Match. Only this final score will be used in determining the results of each match.</p>
        <p>Once system testing is complete, the final results will become available by clicking the Results link. Competitors will be able to see the test cases, other competitors' submissions, and the testing results.</p>
        <p>Competitors will have 24 hours from the end of the system testing phase of each event to submit any scoring appeals. All appeals must be submitted to service@topcoder.com in order to be considered. Prize winners will be notified via email at the conclusion of the appeals period for each event.</p>
        
        <p><span class="bodySubtitle">Competition Series Schedule</span><br />
        Predictive Marathon Match #1 will progress as follows:</p>
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
        The prizes for each of the events will have the following structure:</p>
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
        <p>Placement will always be dependant on final score at the end of each event. The rules for calculating final score will be specific to each problem and outlined within the problem statement of each series event. Tied places will share prizes among them, so if 1st and 2nd place have the same score both winners will be awarded ($800+$500)/2 or $650 a piece.</p>
        
        <p><span class="bodySubtitle">Forums</span><br />
        Competitors should regularly check the forum associated with that specific series event during the length of the submission phase. Any issue resolution or problem clarifications will be posted to this forum. It is the responsibility of each competitor to check for any information or updates in this forum during the length of each event.</p>
        <p>A forum will be created for each Predictive Marathon Match.</p>
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