<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

</head>

<body>

<!-- TCO Header -->

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Header -->
         <td width="100%" valign="top" class="bodyText" colspan="3">
       
         <table  width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colspan="11" align="center"><img src="/i/events/google2003/google_logo_white.gif" width="300" height="150" border="0"/></td></tr>
            <tr><td colspan="11"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="11" align="center"><img src="/i/events/google2003/google_tagline.gif" width="173" height="15" border="0"/></td></tr>
            <tr><td colspan="11"><img src="/i/clear.gif" width="10" height="20"></td></tr>

            <tr>
               <td width="50%">&nbsp;</td>
               <td bgcolor="#3366cc" align="center" width=95 nowrap><font color="#ffffff" size="-1"><b>Overview</b></font></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_sched" style="text-decoration:none" ><font size="-1">Schedule</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview" style="text-decoration:none" ><font size="-1"><img src="/i/events/google2003/rules_arrow_blue.gif" width="15" height="10" border="0"/>Rules</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_registration" style="text-decoration:none" ><font size="-1">Register Now</font></a></td>
<%--               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="?&<%=Constants.MODULE_KEY+"="+Constants.GOOGLE_REG_MAIN+"&"+Constants.COMPANY_ID+"=1865&"+Constants.EVENT_ID+"=1"%>" style="text-decoration:none"><font size="-1">Register Now</font></a></td> --%>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);" style="text-decoration:none"><font size="-1">Practice Arena</font></a></td>
               <td width="50%">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor=#3366cc><img width=1 height=1 alt=""></td>
            </tr>
         </table>
         </td>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

      </tr>
      <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins -->
        <td width="150" valign="top">      
            <img src="/i/clear.gif" width="150" height="10" border="0"/><br />
            <img src="/i/events/google2003/left.gif" width="150" height="450" border="0" usemap="#tchome"/>
            <map name="tchome"><area shape="rect" alt="TC" coords="1,1,149,49" href="/" /></map>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td width="100%" class="bodyText" valign="top">
            <img src="/i/clear.gif" width="10" height="10" border="0"/><br />            
            <h2>At Google, being the best is just the starting point.</h2>

            <p>Are you exceptional at what you do?  Do you have world class programming skills?  Can you make computers do amazing things?  Show us!</p>
            
            <p>Google is looking for engineers with the programming skills to change the world.  The Google Extreme Coding Challenge is designed as a premiere online recruiting event for us. We will utilize the technology platform and expertise developed by TopCoder for the exclusive purpose of objectively assessing programming skills.  We’ll use the results of this competition as the basis for our hiring decisions.</p>

            <p>Best of all, if you’re really the best, we’ll pay you $10,000 to boot!</p>

            <p><span class="bodySubtitle">Choose Your Weapon</span><br />
            Use Java, C++, C# or VB.NET to compete. The event will allow developers to choose from these four important programming languages, with no particular advantage given to any one language. </p>

            <p><span class="bodySubtitle">How It Works</span><br />
            The tournament is a timed contest allowing all participants to compete online to solve the same problems under the same time constraints. The contests are challenging and exciting for participants and spectators. The format is simple:</p>

            <blockquote>
            <p><span class="bodySubtitle">Download the Arena</span><br />
            TopCoder's Competition Arena (a Java Applet) provides the interface to the competition. Here contestants will read the problem statements, code solutions, compile and test those solutions and submit their code for points. Prior to the match, you can practice on many sample problems by downloading the arena ahead of time.</p>

            <p><span class="bodySubtitle">Coding Phase</span><br />
            At the designated date and time, competitors will enter the Arena just prior to kick off. Competitors are placed in virtual rooms of 10 developers per room. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tells the tale as competitors vie for the highest point total.</p>

            <p><span class="bodySubtitle">Challenge Phase</span><br />
            During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through the submitted code, with the hope that the results are not satisfied by the software written. Breaking another developer's code is the most direct form of engaging competition for a programmer. In this phase, precious points are awarded or taken away based on successful challenges. A penalty exists for an unsuccessful challenge. </p>

            <p><span class="bodySubtitle">System Tests</span><br />
            Within minutes of the end of the Challenge Phase, TopCoder will determine the accuracy of all submissions and award final points to all competitors. It is the instant gratification of knowing winners, losers, statistics and one's own performance versus the field that makes TopCoder events unique and captivating.</p>
            </blockquote>
            
            <p><span class="bodySubtitle">Are You Ready?</span><br />
            Registration for the Extreme Coding Challenge opens on October 1st and ends on October 15th, 2003.  Registration is unlimited, but only the top 500 scorers from the Qualification Round will advance to Round 1 of the Challenge on October 24th.</p>

            <p>The competitors with the top 250 scores from Round 1 will advance to Round 2 on October 27th. The top 25 performers in Round 2 will be invited to compete in the Championship Round for the large cash prizes onsite at the Googleplex on November 14th.</p>

             <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align="center">
                <tr>
                    <td class="sidebarTitle" width="30%">Date</td>
                    <td class="sidebarTitle" width="20%">Time*</td>
                    <td class="sidebarTitle" width="50%">Status</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Wednesday, October 1</td>
                    <td class="sidebarText">8:00 AM</td>
                    <td class="sidebarText">Registration Opens</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Wednesday, October 15</td>
                    <td class="sidebarText">5:00 PM</td>
                    <td class="sidebarText">Registration Closes</td>
                </tr>
                
                <tr valign="top">
                    <td class="sidebarText">Friday, October 17</td>
                    <td class="sidebarText">8:00 AM</td>
                    <td class="sidebarText">Qualification Round begins</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Monday, October 20</td>
                    <td class="sidebarText">8:00 AM</td>
                    <td class="sidebarText">Qualification Round ends</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Friday, October 24</td>
                    <td class="sidebarText">9:00 PM</td>
                    <td class="sidebarText">Round 1 - 500 participants</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Monday, October 27</td>
                    <td class="sidebarText">9:00 PM</td>
                    <td class="sidebarText">Round 2 - 250 participants</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Friday, November 14</td>
                    <td class="sidebarText">3:00 PM</td>
                    <td class="sidebarText">Championship Round - 25 participants</td>
                </tr>
                
                <tr valign="top">
                  <td class="sidebarText" colspan="3">*All times are Eastern Time</td>
                </tr>
            </table>

            <p><span class="bodySubtitle">Prizes</span><br />
            The 500 participants in Round 1 will receive a "Google Extreme Coding Challenge" t-shirt.  The top four scorers in the Championship Round will receive the following cash prizes:<br />
            </p>
            <p>
            1st Place - $10,000<br />
            2nd Place - $5,000<br />
            3rd Place - $3,500<br />
            4th Place - $1,250</p>

            <p>Those finalists not finishing as one of the top four scorers in the Championship Round will each receive $250.</p>

            <p>To find out more detailed information about the Google Extreme Coding Challenge, including a list of the prizes, please read the 
            <a href="/pl/?&module=Static&d1=google&d2=google_rules_conditions">Terms and Conditions.</a></p>

            <p><br /></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>