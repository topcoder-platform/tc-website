<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

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

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="rules"/>
   <jsp:param name="tabLev3" value="eligibility"/>
</jsp:include>

            <h2>Eligibility</h2>

            <p>
            TopCoder members meeting the following eligibility criteria are eligible to compete in the TCCC: 
            </p>
            <ul>
            <li>Must be at least 18 years of age (as of February 23, 2004)</li>
            <li>Must be matriculated full-time at an accredited college or university</li>
            </ul>
            <p>
            TopCoder members who are 18 years of age or older are eligible to win cash prizes, unless otherwise prohibited. The TopCoder Collegiate Challenge is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria.
            </p>
            <p>
            Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
            </p>
            
            <p><span class="bodySubtitle">Registration</span><br/>
            Registration for the 2004 TopCoder Collegiate Challenge will open at 9:00AM EST on Monday, February 1, 2004, and will close at 9:00AM on Monday, February 23, 2004.  In order to be eligible to compete in the TCCC, competitors must be a registered TopCoder member and have registered separately for the TCCC.  Registration for the competition is unlimited, however each individual may only register once.</p>

            <p><span class="bodySubtitle">Qualification Round</span><br/>
            The Qualification Round will be open for 24 hours from 12:00PM EST Monday, February 23 through 12:00PM EST Tuesday, February 24, 2004.  Each competitor may participate in the Qualification Round at any time during the 24 hours.  Competitors can only attempt to qualify one time during the 24 hours.</p>

            <p>The Qualification Round will consist of two phases: the Coding Phase and System Testing Phase.</p>

            <p>The Qualification Round Coding Phase is a timed event where contestants are presented with one of five possible problem sets.  Each problem set contains two questions representing two levels of complexity and, accordingly, two levels of point earnings potential. Points for a question are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the question was opened to the time it was submitted.  Competitors will have 60 minutes to complete the set of two problems.  The 60 minutes will begin to elapse once the first problem is opened.</p>

            <p>The Qualification Round System Testing Phase is applied to all submitted code. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given question.</p>

            <p>The top 100 scorers from each of the five problem sets presented during the Qualification Round will be eligible to compete in Online Round #1 of the TCCC.</p>

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
