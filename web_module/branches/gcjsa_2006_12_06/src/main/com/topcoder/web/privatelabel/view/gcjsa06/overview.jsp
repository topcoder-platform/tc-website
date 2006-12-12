<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gcjsa06.css"/>
    <title>Google Code Jam South America, Powered by TopCoder</title>

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
                    <img border=0 src="/i/events/gcjsa06/codejamlogo.png" alt="Google Code Jam logo"></td>
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
<span class="bigBluetitle">Google&#153; Code Jam South America</span>
         <br><br>
         Google is making their next stop in South America!  Get ready for the biggest battle the continent has ever seen.  There will be 70,000BRL in cash and prizes up for grabs and enough challenging problems for the most talented engineers.
         <br><br><br>
         <span class="subTitle">What is the Google Code Jam South America?</span>
         <br><br>
         The tournament is a timed contest where all participants compete online to solve the same problems under the
         same time constraints.
         <br><br>
         The competition is available in five programming languages - Java, C++, C#, VB.NET and Python.
         <br><br>
         Learn how to participate by reading the
         <a href="/pl/?&module=Static&d1=gcjsa06&d2=instructions">instructions</a>.
         <br><br><br>
         <span class="subTitle">When is the competition?</span>
         <br><br>
         Registration for the Google Code Jam South America is open from Tuesday, January 2, 2007 at 10:00AM GMT/UTC -2
         through Tuesday, January 23, 2007 at 10:00AM GMT/UTC -2. There is no limit to the number of registrants
         for the competition, but only the top 500 scorers from the Qualification Round will advance to Round 1 of the
         Code Jam on January 30, 2007.
         <br><br>
         The competitors with the top 250 scores from Round 1 will advance to compete in Round 2.
         <br><br>
         The competitors with the top 50 scores from Round 2 will be invited to compete for 70,000BRL in cash and prizes
         at the onsite Championship Round at the Google Office in Belo Horizante, Brazil.
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
                 <td class="boxText">Tuesday, January 2</td>
                 <td class="boxText">10:00 AM</td>
                 <td class="boxText">Registration Opens</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, January 23</td>
                 <td class="boxText">10:00 AM</td>
                 <td class="boxText">Registration Closes</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, January 23</td>
                 <td class="boxText">12:00 PM (Noon)</td>
                 <td class="boxText">Qualification Round begins</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Wednesday, January 24</td>
                 <td class="boxText">12:00 PM (Noon)</td>
                 <td class="boxText">Qualification Round ends</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, January 30</td>
                 <td class="boxText">8:00 PM</td>
                 <td class="boxText">Round 1 - 500 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Thursday, February 1</td>
                 <td class="boxText">8:00 PM</td>
                 <td class="boxText">Round 2 - 250 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText">Thursday, March 1**</td>
                 <td class="boxText">TBD</td>
                 <td class="boxText">Championship Round - 50 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" colspan="3">*All times are denoted as  GMT/UTC -2<br>
                     ** The Championship Round date is subject to change with or without prior notice.</td>
             </tr>
         </table>

         <br><br>
         <span class="subTitle">What can you win?</span>
         <br><br>
         The top 250 participants in Round 2 will receive a "Google Code Jam South America" t-shirt. All 50 finalists who
         compete in the Championship Round will receive prizes as follows:
         <br><br>
         <table width="250" class="box" align="center" style="clear:right;">
             <tr valign="top">
                 <td class="boxTitle">Competitor(s)</td>
                 <td class="boxTitle">Prize*</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap"><b>First Place</b></td>
                 <td class="boxText"><b>6,500BRL</b></td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">2nd - 5th Place </td>
                 <td class="boxText">3,000BRL</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">6th - 10th Place</td>
                 <td class="boxText">1,900BRL</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">11th - 20th Place</td>
                 <td class="boxText">1,300BRL</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" nowrap="nowrap">21st - 50th Place</td>
                 <td class="boxText">400BRL</td>
             </tr>
             <tr valign="top">
                 <td class="boxText" colspan="2">* Winners must be present at the onsite round to receive prize.</td>
             </tr>
         </table>
         <br><br>
         To find out more detailed information about the Google&#153; Code Jam South America, please read the
         <a href="/pl/?&module=Static&d1=gcjsa06&d2=rules">Terms and Conditions</a>.
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