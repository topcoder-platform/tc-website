<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules</title>

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

<body onLoad="timer(1);">

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
   <jsp:param name="selectedTab" value="coding_rules"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="coding_rules"/>
   <jsp:param name="selectedTab" value="eligibility"/>
</jsp:include>

            <h2>Eligibility</h2> 

            <p>
            All TopCoder members who are 18 years of age or older may attempt to
            qualify for the TCO.  500 members will qualify either through
            Qualification Rounds or by receiving an automatic berth.
            </p>

            <p><span class="bodySubtitle">Qualification Rounds</span><br />
            All members who have not already qualified for the Coding Tournament can compete in
            the Qualifying Rounds.  The top 200 scorers from each of the two
            Qualification Rounds will be eligible to compete in Online Round 1.
            The Qualification Rounds will be held on Tuesday, October 7th
            and Thursday, October 9th. </p>

            <p><span class="bodySubtitle">Automatic Berths</span><br />
            The 100 highest rated TopCoder members as of October 7th who have
            participated in at least three (3) TopCoder rated events (i.e., Single
            Round Matches and previous tournaments) prior to October 7th, with at
            least one (1) of those events being between July 7th and October 7th,
            will receive an automatic berth into Online Round 1. 
            <br/><br/>
            Please note that the top 100 rated members with automatic berths will not be permitted 
            to compete in the Qualification Rounds.  In addition, the members qualifying for the tournament 
            in Qualification Round #1 will not be permitted to compete in Qualification Round #2.
            </p>
            

            <p><span class="bodySubtitle">Eligibility</span><br />
            TopCoder members who are 18 years of age or older are eligible to win cash prizes, unless otherwise prohibited.  The TopCoder Open is 
            void in the Quebec province of Canada, and elsewhere where prohibited by applicable law.  Cash prizes will not be paid to residents 
            of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria.</p>

            <p>Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation
            and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers,
            agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament
            and members of the immediate families and/or persons living in the same household as such persons, are ineligible
            to enter the tournament.</p>

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
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
