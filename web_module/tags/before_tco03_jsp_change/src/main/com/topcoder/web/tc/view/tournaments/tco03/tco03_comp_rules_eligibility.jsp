<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules</title>

<jsp:include page="../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
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
   <jsp:param name="selectedContest" value="component"/>
   <jsp:param name="selectedTab" value="component_rules"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="component_rules"/>
   <jsp:param name="selectedTab" value="eligibility"/>
</jsp:include>

            <h2>Eligibility</h2>

            <p>
           All rated TopCoder members who are 18 years of age or older (as of September 2nd) and who have not been permanently suspended
           from participating in TopCoder Component Development projects are eligible to compete in the Component Tournament.
            </p>

            <p>
            Those members who are eligible to compete in both the Coding Tournament of the 2003 TopCoder Open sponsored by Intel&#174;  and in the Component Tournament will be
            permitted to participate in both.  In addition, members will be allowed to compete in both the design and development elements
            of the Component Tournament.  However, if one member participates in Online Round 2 of both the design and development contest AND qualifies
            as one of the finalists in each, then the member will only be permitted to advance in one of the contests (either design or development).  The following criteria
            will be used to determine which contest the member will advance to:
            </p>
            <ul>
            <li>The member will advance to subsequent rounds of the contest according to their seed</li>
            <li>If the member's seed is the same in each competition, then the member will advance to the contest in which he/she achieved a higher average score</li>
            <li>If the member's average score is the same in both contests, then the member will advance to the contest in which he/she achieved a higher score for his/her level 2 component</li>
            <li>If the member's level 2 component score is the same for both contests, then TopCoder will assign the member to one of the contests</li>
            </ul>

            <p>
            Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution
            of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries
            or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or
            persons living in the same household as such persons, are ineligible to enter the tournament.
            </p>

            <p><span class="bodySubtitle">About the component tournament schedule</span><br />
           Each contestant in an online round must submit his or her design and/or development submissions for components as scheduled (Click
           <a href="/?&amp;t=tournaments&amp;c=tco03_comp_sched#sched">here</a> for competition dates and times.).  If a coder does not participate,
           for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition.</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
