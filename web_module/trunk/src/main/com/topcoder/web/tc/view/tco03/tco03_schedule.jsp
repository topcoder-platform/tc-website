<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Schedule</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>');
}
</SCRIPT>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_schedule"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

            <h2>Schedule</h2>

<!-- Qualification Rounds begins -->
           <p><span class="bodySubtitle">Qualification Rounds</span></p>

            <p><a name="berths"></a><strong>Automatic Berths</strong> - The 100 highest rated TopCoder members as of October 7th (who are 18 years of age or older) will receive an automatic berth into
            <A href="#online">Online Round #1.</A> The 100 highest rated members must have competed in at least three TopCoder rated events (i.e.,
            Single Round Matches and/or previous tournaments) prior to October 7th with at least one (1) of those events being between July 7th
            and October 7th.  Any member receiving an automatic berth will not be permitted to compete in the Qualification Rounds.</p>

            <p><strong>Qualification Spots</strong> - All members (who are 18 years of age or older) can compete for one of 400 qualification spots in the tournament.  Two Qualification
            Rounds will be held, and the top 200 scorers from each Qualification Round will win a spot in Online Round #1 of the TCO.  Please note
            that the top 100 rated members with an automatic berth will not be allowed to compete in the Qualification Rounds.  Also, those members
            who qualify for the tournament during Qualification Round #1 will not be allowed to compete in Qualification Round #2.</p>

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round #1</td>
                    <td class="sidebarText">
                        Tuesday, October 7<br />
                        Registration:  6:00 PM - 8:55 PM<br />
                        Compete: 9:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">All members who have not previously qualified - limited to the first 1,000 participants to register</td>
                    <td class="sidebarText" align="center">200</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Qualification Round #2</td>
                    <td class="sidebarText">
                        Thursday, October 9<br />
                        Registration:  7:00 PM - 9:55 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">All members who have not previously qualified - limited to the first 1,000 participants to register</td>
                    <td class="sidebarText" align="center">200</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate"
                        will be the following day at the same time.<br/>
                    </td>
                </tr>
            </table><br />
<!-- Qualification Rounds ends -->

<!-- Online Elimination Rounds begins -->
            <A name="online"></A><p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            Up to 500 TopCoder members will compete in Online Round #1 of the Coding Tournament.  The field will be comprised of 100 automatic
            berths and 400 qualification spots. Each room winner and the next highest scorers in each round will advance.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #1</td>
                    <td class="sidebarText">
                        Wednesday, October 15th<br />
                        Registration:  6:30 PM - 9:25 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                    <td class="sidebarText" align="center">500</td>
                    <td class="sidebarText" align="center">200</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #2</td>
                    <td class="sidebarText">
                        Wednesday, October 22nd<br />
                        Login by:  9:20 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                    <td class="sidebarText" align="center">200</td>
                    <td class="sidebarText" align="center">100</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #3</td>
                    <td class="sidebarText">
                        Wednesday, October 29th<br />
                        Login by:  9:20 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                    <td class="sidebarText" align="center">100</td>
                    <td class="sidebarText" align="center">50</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #4</td>
                    <td class="sidebarText">
                        Wednesday, November 5th<br />
                        Login by:  9:20 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                    <td class="sidebarText" align="center">50</td>
                    <td class="sidebarText" align="center">16</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate"
                        will be the following day at the same time.
                    </td>
                </tr>
            </table>
<!-- Online Elimination Rounds ends -->

<!-- Onsite Semifinal and Championship Rounds begins -->
            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br />
            The 16 advancers from Online Round #4 will travel to Mohegan Sun on Wednesday, December 3rd to compete in the Semifinal round
            of the tournament being held on Thursday, December 4th.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #1</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 10:00 AM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #2</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 1:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #3</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 4:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #4</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 7:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" bgcolor="#FFCC33"><strong>Championship Round</strong></td>
                    <td class="bodyText" bgcolor="#FFCC33">
                        <strong>Friday, December 5th<br />
                        Compete: 1:00 PM<br /></strong>
                    </td>
                    <td class="bodyText" bgcolor="#FFCC33" align="center"><strong>4</strong></td>
                    <td class="bodyText" bgcolor="#FFCC33" align="center"><strong>1</strong></td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. The times of the onsite rounds are subject to change.
                    </td>
                </tr>
            </table><br />

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
