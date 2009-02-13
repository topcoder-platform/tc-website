<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006 Employee Competition, Powered by TopCoder</title>

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
                    <img border="0" src="/i/events/google2006/codejamLogo_emp.gif" alt="Google Code Jam Employee Competition"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
</tr>

<!-- Tab bar links-->
<tr>
    <td>
        <div align="center">
            <jsp:include page="emp_links.jsp">
                <jsp:param name="selectedTab" value="overview"/>
            </jsp:include>
            <br/>
        </div>
    </td>
</tr>

<!-- content -->
<tr>
<td>
<div align="center">
<div class="pageLayout" align="left">

         <span valign="top">
         <jsp:include page="emp_right.jsp"/>
         </span>

         <span class="bigBluetitle">Google&#153; Code Jam 2006 Employee Competition</span>
         <br><br>
         Introducing the Google Code Jam 2006 Employee Competition. This competition is a chance for you to use your skills 
         to compete against your co-workers, as well as see how you stack up against top programmers from all over the world.
         <br><br><br>
         <span class="subTitle">What is the Google Code Jam 2006 Employee Competition?</span>
         <br><br>
         The tournament is a timed contest where Google employees and interns compete online to solve the same problems under the same time constraints as 
         the entire Code Jam field.
         <br><br>
         The competition is available in five programming languages - Java, C++, C#, VB.NET and Python. 
         <br><br>
         Learn how to participate by reading the
         <a href="/pl/?&module=Static&d1=google06&d2=emp_instructions">instructions</a>.
         <br><br><br>
         <span class="subTitle">When is the competition?</span>
         <br><br>
         Registration for the Google Code Jam 2006 Employee Competition is open from Monday, August 28, 2006 at 9:00 AM EDT (GMT/UTC -4) through Tuesday, 
         September 5, 2006 at 9:00 AM EDT (GMT/UTC -4). There is no limit to the number of registrants for the competition, but only the top 100 scorers 
         from the Qualification Round will advance to Round 1 on September 14.
         <br><br>
         The competitors with the top 50 scores from Round 1 will advance to compete in Round 2.
         <br><br>
         The competitors with the top 25 scores from Round 2 will be invited to compete online during the Championship Round on October 27, 2006.
         <br><br>

         <table width="500" class="box" align="center" style="clear:right;">
             <tr>
                 <td class="boxTitle" width="33%">Date</td>
                 <td class="boxTitle" width="17%">Time*</td>
                 <td class="boxTitle" width="50%">Status</td>
             </tr>
             <tr valign="top">
                 <td class="boxText">Monday, August 28</td>
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
                 <td class="boxText">Round 1 - 100 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" nowrap>Tuesday, September 19</td>
                 <td class="boxText">10:00 AM</td>
                 <td class="boxText">Round 2 - 50 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText">Friday, October 27**</td>
                 <td class="boxText">TBD</td>
                 <td class="boxText">Championship Round - 25 participants</td>
             </tr>

             <tr valign="top">
                 <td class="boxText" colspan="3">*All times are denoted as Eastern Daylight Time (GMT/UTC -4)<br>
                     ** The Championship Round date is subject to change with or without prior notice.</td>
             </tr>
         </table>

         <br><br>
         To find out more detailed information about the Google&#153; Code Jam 2006 Employee Competition, please read the
         <a href="/pl/?&module=Static&d1=google06&d2=emp_rules">Terms and Conditions</a>.
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