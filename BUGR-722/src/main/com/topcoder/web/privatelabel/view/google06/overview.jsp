<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006, Powered by TopCoder</title>

    <jsp:include page="../script.jsp"/>
</head>

<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center">
                    <img border=0 src="/i/events/google2006/codejamLogo.gif" alt="Google Code Jam logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
</tr>

<!-- Tab bar links-->
<tr>
    <td>
        <div align="center">
            <jsp:include page="links.jsp">
                <jsp:param name="selectedTab" value="overview"/>
            </jsp:include>
            <br/>
        </div>
    </td>
</tr>

<tr>
<!-- content -->
<td>
<div align="center">
<div class="pageLayout" align="left">
<span valign="top"><jsp:include page="right.jsp"/></span>
<span class="bigBluetitle">Google&#153; Code Jam 2006</span>
         <br><br>
         Want a chance at $165,000? Here's how: Google Code Jam 2006. This competition is a chance for you to use your
         skills and compete against top programmers from all over the world.
         <br><br><br>
         <span class="subTitle">What is the Google Code Jam 2006?</span>
         <br><br>
         The tournament is a timed contest where all participants compete online to solve the same problems under the
         same time constraints.
         <br><br>
         The competition is available in five programming languages - Java, C++, C#, VB.NET and Python.
         <br><br>
         Learn how to participate by reading the
         <a href="/pl/?&module=Static&d1=google06&d2=instructions">instructions</a>.
         <br><br><br>
         <span class="subTitle">When is the competition?</span>
         <br><br>
         Registration for the Google Code Jam 2006 is open from Monday, August 14, 2006 at 9:00AM EDT (GMT/UTC -4)
         through Tuesday, September 5, 2006 at 9:00AM EDT (GMT/UTC -4). There is no limit to the number of registrants
         for the competition, but only the top 1,000 scorers from the Qualification Round will advance to Round 1 of the
         Code Jam on September 14.
         <br><br>
         The competitors with the top 500 scores from Round 1 will advance to compete in Round 2.
         <br><br>
         The competitors with the top 100 scores from Round 2 will be invited to compete for $165,000 in cash and prizes
         at the onsite Championship Round at the Google Office in New York City, New York, United States.
         <br><br>
         <%--
         Here's the line-by-line documentation:
         <br><br>
         <div class="indented">
            <b>Download the Arena</b><br/>
            The TopCoder&#174; Competition Arena (a Java Applet) is where you begin. Download the app, read the problem statements, then code solutions, compile and test those solutions and submit the code for points. You can download the arena ahead of time to practice on sample problems prior to the competition.
            <br/><br/>
            <b>Coding Phase</b><br/>
            At the designated date and time, competitors enter the Arena and are placed in groups of ten into virtual rooms. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tallies the points during each step of the competition.
            <br/><br/>
            <b>Challenge Phase</b><br/>
            During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through the submitted code, with the hope that the results are not satisfied by the software written. Breaking another developer's code is the most direct form of competition for a programmer. In this phase, points are awarded for successful challenges and deducted for unsuccessful challenges.
            <br/><br/>
            <b>System Tests</b><br/>
            Within minutes of the end of the Challenge Phase, the automated, objective system tests determine the accuracy of all submissions and award final points to all competitors. The assessment of your performance and presentation of stats is nearly instantaneous, as is the gratification of knowing how you did against a competitive field.
         </div>
         <br><br>
         --%>

         <table width="500" class="box" align="center" style="clear:right;">
             <tr>
                 <td class="boxTitle" width="33%">Date</td>
                 <td class="boxTitle" width="17%">Time*</td>
                 <td class="boxTitle" width="50%">Status</td>
             </tr>
             <tr valign="top">
                 <td class="boxText">Monday, August 14</td>
                 <td class="boxText">9:00 AM</td>
                 <td class="boxText">Registration Opens</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, September 5</td>
                 <td class="boxText">9:00 AM</td>
                 <td class="boxText">Registration Closes</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, September 5</td>
                 <td class="boxText">12:00 PM (Noon)</td>
                 <td class="boxText">Qualification Round begins</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Wednesday, September 6</td>
                 <td class="boxText">12:00 PM (Noon)</td>
                 <td class="boxText">Qualification Round ends</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Thursday, September 14</td>
                 <td class="boxText">10:00 AM</td>
                 <td class="boxText">Round 1 - 1,000 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, September 19</td>
                 <td class="boxText">10:00 AM</td>
                 <td class="boxText">Round 2 - 500 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText">Friday, October 27**</td>
                 <td class="boxText">TBD</td>
                 <td class="boxText">Championship Round - 100 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" colspan="3">*All times are denoted as EDT (GMT/UTC -4)<br>
                     ** The Championship Round date is subject to change with or without prior notice.</td>
             </tr>
         </table>

         <br><br>
         <span class="subTitle">What can you win?</span>
         <br><br>
         The top 250 participants in Round 2 will receive a "Google Code Jam 2006" t-shirt. All 100 finalists who
         compete in the Championship Round will receive prizes as follows:
         <br><br>
         <table width="250" class="box" align="center" style="clear:right;">
             <tr valign="top">
                 <td class="boxTitle">Competitor(s)</td>
                 <td class="boxTitle">Prize*</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap"><b>First Place</b></td>
                 <td class="boxText"><b>$10,000</b></td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">2nd - 10th Place </td>
                 <td class="boxText">$5,000</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">11th - 25th Place</td>
                 <td class="boxText">$2,500</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">26th - 50th Place</td>
                 <td class="boxText">$1000</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">51st - 100th Place</td>
                 <td class="boxText">$750</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" colspan="2">* Winners must be present at the onsite round to receive prize.</td>
             </tr>
         </table>
         <br><br>
         To find out more detailed information about the Google&#153; Code Jam 2006, please read the
         <a href="/pl/?&module=Static&d1=google06&d2=rules">Terms and Conditions</a>.
         <br><br>
</div>
</div>
</td>
</tr>
<tr>
    <td>
        <div align="center">
            <jsp:include page="foot.jsp"/>
        </div>
    </td>
</tr>

</table>
</body>
</html>