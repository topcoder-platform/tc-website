<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>

    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
          <jsp:include page="/includes/global_left.jsp">
              <jsp:param name="level1" value="long_contests"/>
              <jsp:param name="level2" value="how_to_compete"/>
          </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Rules & Regulations"/>
    </jsp:include>

<span class="bigTitle">Official Rules & Regulations</span>
<br><br>
No purchase necessary to enter or win. 
<br><br>
<span class="bodySubtitle">About the Competition</span>
<ul>
<li><strong>When to start the Competition Round</strong><br>
TopCoder members must register for the competition round. Registration may occur at any time from 12:00 Noon Eastern Time on 12/15/05 to 12:00 Noon Eastern Time on 12/22/05. All competitors who have registered for the competition round will immediately be given access to the competition problem statement for that round. The competition round will begin at 12:00 Noon Eastern Time on 12/15/05 which is the earliest time that any member will be given access to the problem statement.</li>
<li><strong>Upon Entering a Marathon Match</strong><br>
Each Marathon Match will contain a single problem.  The problem statement will indicate both the question presented to the contestant as well as how submissions will be scored.  Contestants will submit their solution which will immediately be put on a queue for system testing.  Once system testing is complete, the competitor will be assigned a score which will be available on the website.  Each competitor may submit as many times as they choose, however they may only submit once per hour.</li>
</ul>
<span class="bodySubtitle">Conditions of Participation</span>
<br><br>
By participating in the competition round, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.
<br><br>
Contestants must not cheat; all ideas for any code and/or challenge submitted must be the contestant's alone.
<br><br>
The winner in each Marathon Match will be the competitor that scores the most points across all competitors who participate in that match. All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the competition shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
<br><br>
By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Marathon Match, or participation in any competition-related activity, or the receipt, use or misuse of a prize. 
<br><br>
TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the competition process, or is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. 
<br><br>
<span class="bodySubtitle">Participants</span><br>
The competition is open to all members who are at least 13 years of age.
<br><br>
All competitors must be registered members of TopCoder, and must have agreed to the rules on this page prior to participating in this competition between the 12/15/05 12:00 Noon start time and the 12/22/05 12:00 Noon Eastern Time competition submission deadline.
<br><br>
Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the competition. 
<br><br>
<span class="bodySubtitle">Other</span><br>
The competition is void in whole or in part where prohibited by law.
<br><br>
A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the competition.
<br><br>
This tournament is brought to you by TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.
<br><br>

   </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
          <jsp:include page="public_right.jsp">
              <jsp:param name="level1" value="privatelabel"/>
          </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>
