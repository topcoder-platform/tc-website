<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
}
</SCRIPT>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="charity"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_overview"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                  </tr>
               </table>

<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="rules"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value="rules"/>
   <jsp:param name="selectedTab" value="structure"/>
</jsp:include>



               <blockquote>
            <h2>Competition Structure</h2>

<!-- The Competition Field -->
            <p><span class="bodySubtitle">The Competition Field</span><br />
            Round 1 is open to all members who are 18 years of age or older and who raise a minimum of $25 as of 11:59pm on November 10th.  </p>

            <p>Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior to
            the start of the online round.  (Click <a href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_sched">here</a> for competition dates and times.)
            TopCoder members from around the world may be participating in these rounds,
            <strong>but all start times will be communicated as Eastern Time, so contestants in different time zones must adjust
            accordingly</strong>.  If a coder does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an
            automatic loss in that round of competition. </p>

            <p>All competitors who have qualified for an online round will be assigned to a specific room.  TopCoder will determine all
            room assignments prior to the start of each online round in a manner such that the average competitor rating (as of November
            11th) for each room will be similar. </p><br />

<!-- Scoring and Advancing During Online Rounds -->
            <p><span class="bodySubtitle">Scoring and Advancing During Online Rounds</span><br />
            After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online
            round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see
            Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a greater-than-zero point
            total. The structure of the online rounds is as follows:</p>

            <ul>
                <li><strong>Round 1</strong><br />
                All eligible coders will compete in Round 1 and a total of 100 will advance.  The 100 highest scoring competitors advance to
                Round 2.  Each coder must have positive points to advance.  If less than 100 people score positive points, only those competitors
                with a positive point total will advance.</li>

                <li><strong>Round 2</strong><br />
                Up to 100 coders will compete in Round 2 and up to 50 will advance.  The 50 highest scoring competitors advance to Round
                3.  Each coder must have positive points to advance.  If less than 50 people score positive points, only those competitors with a
                positive point total will advance.</li>

                <li><strong>Round 3</strong><br />
                Up to 50 coders will compete.  The 4 highest scoring competitors will win a grand-prize.</li>

            <p><strong>NOTE:</strong>  In the event of a tie for any advancing position (i.e. room winner or
            wildcard spot), the tie will be resolved in the following manner:</p>

            <ul>
                <li>Total points acquired (higher is better) during all rounds of the tournament</li>
                <li>If a tie still remains, then by rating (higher is better) as of November 11, 2003</li>
                <li>If a tie still remains in Round 1 and/or Round 2, all tied coders will advance to the next round.  If a tie still remains in
                Round 3, both competitors will win a grand-prize.</li>
            </ul><br />
         </ul>

<!-- Round Structure -->
            <p><span class="bodySubtitle">Competition Round Structure</span><br />
            Each round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. (Note: the
            format of these competition rounds is similar to the format of the Single Round Matches.)</p>

            <ul>
                <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions
                representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem
                are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from
                the time the problem was opened to the time it was submitted.</li>

                <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality
                of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the
                defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points
                as a penalty, applied against their total score in that round of competition. </li>

                <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully challenged.
                If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were
                originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code
                submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered
                flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful
                challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
            </ul><br />

           </blockquote>

            <p><br /></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
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
