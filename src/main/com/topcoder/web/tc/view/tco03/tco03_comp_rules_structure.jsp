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
   <jsp:param name="selectedContest" value="component"/>
   <jsp:param name="selectedTab" value="component_rules"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="component_rules"/>
   <jsp:param name="selectedTab" value="structure"/>
</jsp:include>

            <h2>Competition Structure</h2>

            <p>ALL SUBMISSIONS MUST BE RECEIVED DURING EACH ROUND'S SUBMISSIONS TIMELINE TO BE CONSIDERED A VIABLE ENTRY.  THERE
            WILL BE NO EXCEPTIONS.  Following the submission deadline, the TopCoder Review Boards will review and score all eligible entries.
            After the Aggregation Phase, the winners will be identified and announced.  Those winners will advance to the next online round. Coder
             advancement in Online Round 1 and 2 will be determined by averaging each member's two highest Review Board scores.  One score
             to be used in calculating the average will be the highest score for a level 2 submission.  The other score will be the highest score of
             any other submission.  The competitors with the highest average scores will automatically advance ("Automatic Advancers").   Other 
             members (Wild Card Pool members defined below) may also be eligible to advance to the onsite final round in the event Automatic 
             Advancers are unable to attend.  The specific structure of the online rounds is as follows:</p>

             <ul>
                <li><strong>Online Round 1</strong><br />
                All eligible rated members may compete in Round 1 and up to ten (10) Automatic Advancers will advance to Round 2.  For the design contest, two of the 10
                advancing positions will be awarded to the winners of the two previous component design bonus contests (Pops and TangentZ).  If
                fewer than 10 people (8 people for the design contest) automatically advance, then a Wild Card Pool will be created.  The Wild Card Pool 
                will consist of the designers and developers who submitted only one component which passed screening and those members who did not 
                submit a level 2 component.  Wild Card Pool members' scores will be the highest Review Board score received for an individual component.</li>

                <li><strong>Online Round 2</strong><br />
               Up to ten (10) Automatic Advancers from Online Round 1 will compete along with members in the Wild Card Pool.  
               Two (2) members will advance.<br/><br/>
               
               Following the completion of Round 2 Reviews, the advancing two designers and developers will be identified.  If there are fewer than two Automatic Advancers who are able to travel to the onsite 
               round, then members in the Wild Card Pool will advance to the Finals. Wild Card Pool members will advance in the following order:
               
               <ol>
               <li>The Wild Card Pool members with the highest Round 2 score, calculated as the average of the highest two component scores, with at least one being a level 2 component.  </li>
               <li>If advancement spots remain, then those Wild Card Pool members and Automatic Advancers from Round 1 who submitted only 
               one component which passed screening, and those who did not submit a level 2 component in Round 2, will be eligible to advance.  
               The member with the highest individual component score in Round 2 will be the first to advance.</li>
               <li>If advancement spots still remain, then the competitor with the highest individual component score from Round 1 will advance.</li>
               </ol>
               
               </li>

                <li><strong>Onsite Championship Round 3</strong><br />
                Two (2) members will compete.  The member with the highest score of the final submission will be declared the winner.</li>
                 </ul>

            <p><strong>Tie-Breakers for Automatic Advancers</strong>:  In the event of a tie for any advancing position in Rounds 1 and 2, the tie will be resolved in
            the following manner (in order): <br/>
            <ol>
            <li>The highest score for the level 2 component submitted during that round</li>
            <li>If a tie still remains, then by averaging the tied members' scores from each round in which all tied participants competed</li>
            <li>If a tie still remains, then by TopCoder rating as of September 2</li>
            <li>If a tie still remains, then all tied members will advance to the next round</li>
            </ol>
            </p>

            <p><b>Tie-Breakers for Wild Card Pool Members</b>: In the event of a tie for an advancing position from the Wild Card Pool to 
            the Final round, the tie will be resolved in the following manner (in order):<br/>

            <ol>
            <li>The highest individual component score submitted during Round 1</li>
            <li>If a tie still remains, then by TopCoder rating as of September 2 </li>
            <li>If a tie still remains, then all tied members will advance to the next round</li>
            </ol>
            </p>
            
            <p><span class="bodySubtitle">Scoring</span><br />
            During each online round of competition, eligible competitors will
            submit design and development solutions for at least two eligible
            components (including at least one level 2 component) by the submission due date.
            Submissions will be scored by the TopCoder Review Boards and will be
            subject to final review and appeal in the same manner as standard
            component design submissions.  Each competitor's score for the round will be the
            average of his/her two highest scores (one score must be a level 2
            component).
            </p>

            <p><span class="bodySubtitle">Onsite Championship Round 3</span><br />
            The two advancers from Round 2 will travel to Mohegan Sun on Thursday, December 4th to compete in the final review stage (see explanation below) of
            Round 3 being held on Friday, December 5th.  All contestants must arrive at Mohegan Sun no later than 4:00 PM on Thursday,
            December 4th.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and
            his/her spot in the tournament will be given to the next highest overall scorer from Round 2.</p>

            <p>The two advancers from Round 2 will have ten days to complete the final project.
            Once the project is completed, the submissions will be submitted to
            TopCoder and reviewed by the TopCoder review board.  The finalists will
            receive the review scorecards at 8:00 am on Friday, December 5th,  as well as an addendum to the original requirements for
            design projects and an additional section of the design for development
            projects.  Each finalist will be scored on the implementation of final
            fixes for the component as well as the additional design or development
            of the addendum.  This portion of the competition will last 4 hours.  (An
            example addendum for an HTTP Listener component would be to design or
            develop an SSL module for the component)</p>

            <p>TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, up to a cost of $1,000 per
            person.  (That is, if a contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between
            the cost of the airfare and $1,000.)  In addition, TopCoder will also provide travel arrangements to and from the airport to the
            Mohegan Sun Casino and accommodations and certain meals for each contestant and his/her guest.  All other expenses are the
            responsibility of the contestant and his/her guest.</p>

            <p>The Championship Round 3 will be a single round of two (2) members.  The winner of Championship Round 3 will be the
            member with the highest score of his/her component submission.</p>


            <p><strong>Championship Tie-Breaker</strong>:  In the event of a tie in the Championship Round, the tie will be resolved
            in the following manner (in order):<br/>
            <ol>
            <li>By averaging the tied members' scores from each round in which all tied participants competed</li>
            <li>If a tie still remains, then by TopCoder rating as of September 2</li>
            <li>If a tie still remains, then the prize money will be distributed equally amongst the tied members</li>
            </ol>
            </p>

<!-- Other -->
            <p><span class="bodySubtitle">Other</span><br />
            The tournament is void in whole or in part where prohibited by law.</p>

            <p>A list of tournament winners by coder handles will be available on the web site at http://www.topcoder.com/, and will be
            displayed for at least 3 months after the end of the tournament.</p>

            <p>This tournament is brought to you by TopCoder, Inc. (http://www.topcoder.com/) 703 Hebron Avenue, Glastonbury, CT 06033.</p>

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
