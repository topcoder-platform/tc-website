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
            How to Compete&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=amdRules">Rules</a>&#160;&#160;|&#160;&#160;
            <%--
            <span class="grayedOut">Active Contests (coming soon)</span>
            --%>
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
        </p>
        
        <p><span class="bigTitle">How To Compete</span></p>
        
        <p><span class="bodySubtitle">Registration</span><br />
        In order to compete in an AMD Multicore Threadfest event, one must first register. One may register at any time during the submission phase. The submission phase for each of the four (4) events will last for two weeks each. In order to register, you will need to click Register next to the appropriate Multicore Threadfest event within the Active Contests list and agree to the rules of the event. Once registered, you may view the problem statement by clicking the Problem Name from within the Active Contests list. Problem statements will be made available to all TopCoder members once the competition starts. Registration is not required to view them. Check the website for further details.</p>
        
        <p><span class="bodySubtitle">Problem Statements</span><br />
        During the AMD Multicore Threadfest, the types of problems and the associated scoring mechanism will vary for each month's problem. A description of the scoring mechanism will be provided in the problem statement each month. Competitors will have to understand the scoring mechanism in order to effectively compete. The problems will be designed such that a solution that is properly threaded will tend to have a performance advantage over those that are not threaded, resulting in a higher score for threaded submissions. Each problem in the event series may have different memory usage constraints, threading constraints, and scoring criteria. These specifics will be outlined in the problem statement form for each event in the series.</p>
        
        <p><span class="bodySubtitle">Submitting Solutions</span><br />
        All members registered for a specific AMD Multicore Threadfest event will see a Submit option for that event. Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. Example test cases will not be tested. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly. During the submission phase, overall ranking is the only piece of information that will be made available. A given competitor will only be allowed to submit once every 4 hours - other than that there are no restrictions on the number of submissions that each competitor may perform.</p>
        <p>Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.</p>
        <p>In this multi-threading event, all competitors are encouraged to improve their solutions and resubmit iteratively throughout the two weeks of the submission phase. The most recent submission is always the one that counts, so if you make a submission that does not score as well as a prior submission, the most recent will still be the one that counts in the standings.</p>
        <p><span class="bodySubtitle">Languages</span><br />
        Competitors may only submit C++ solutions to the problem. They will be compiled using Open SUSE's version of gcc 4.2.1.</p>
        <p>Note: The language must be appropriately selected on the submission screen.</p>
        
        <p><span class="bodySubtitle">Hardware</span><br />
        Each individual test case will be run against a competitor's submission on a dedicated machine with the following specifications:</p>
        <ul>
            <li>Processors(2): Quad-Core AMD Opteron(tm) Processor 2350  2 GHz,  512 KB Level II Cache</li>
            <li>Memory: 8 GB</li>
            <li>OS: SUSE Linux 10.3, kernel 2.6.22.17</li>
        </ul>
        
        <p><span class="bodySubtitle">Viewing Match Standings</span><br />
        At any time during an AMD Multicore Threadfest event, TopCoder members may view the latest standings of that event. This will show the current score (for the latest submission) for each member who has registered for that event, their rank, and the number of submissions they have performed during the event. Clicking on the submission count will display the date, time, and point-in-time score of each submission for a given participant.</p>
        
        <p><span class="bodySubtitle">Match results</span><br />
        Once the submission phase of AMD Multicore Threadfest event has ended, system testing will begin. During System Testing each competitors' submission will be run through a suite of system test cases and assigned a score based on the rules outlined in the problem statement. Only this final score will be used in determining the results of each match.</p>
        <p>Once system testing is complete, the final results will become available by clicking the Results link. Competitors will be able to see the test cases, other competitors' submissions, and the testing results.</p>
        <p>Competitors will have 24 hours from the end of the system testing phase of each event to submit any scoring appeals. All appeals must be submitted to service@topcoder.com in order to be considered. Prize winners will be notified via email at the conclusion of the appeals period for each event.</p>
        
        <p><span class="bodySubtitle">Competition Series Schedule</span><br />
        The AMD Multicore Threadfest event schedule will be as follows:</p>
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
        The prizes for each of the events will have the following structure:</p>
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
        <p>Placement will always be dependant on final score at the end of each event. The rules for calculating final score will be specific to each problem and outlined within the problem statement of each series event.</p>
        
        <p><span class="bodySubtitle">Forums</span><br />
        Competitors should regularly check the forum associated with that specific series event during the length of the submission phase. Any issue resolution or problem clarifications will be posted to this forum. It is the responsibility of each competitor to check for any information or updates in this forum during the length of each event.</p>
        <p>A forum will be created for each event in the Multicore Threadfest.</p>
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