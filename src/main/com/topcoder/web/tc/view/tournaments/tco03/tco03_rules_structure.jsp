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
   <jsp:param name="selectedTab" value="structure"/>
</jsp:include>

            <h2>Competition Structure</h2>

<!-- The Competition Field -->
            <p><span class="bodySubtitle">The Competition Field</span><br />
            A total of 500 TopCoder members will compete in Online Round 1.  The field will be comprised of 100 automatic
            berths and 400 qualification spots.</p>

            <p>Click <a href="/tc?module=Static&d1=tco03&d2=tco03_schedule#berths">here</a> for more details regarding the automatic berths
            and qualification spots.</p><br />

<!-- Online Elimination Rounds -->
            <p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior to
            the start of the online round. (Click <a href="/tc?module=Static&d1=tco03&d2=tco03_schedule#sched">here</a> for competition dates and times.)
            TopCoder members from around the world may be
            participating in these rounds, but all start times will be communicated as Eastern Time, so contestants in different time zones
            must adjust accordingly. If a coder does not participate, for any reason, in an online round they have advanced to, it will be
            treated as an automatic loss in that round of competition.</p>

            <p>All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all
            room assignments prior to the start of each online round in a manner such that the average competitor rating (as of October
            7th) for each room will be similar.</p><br />

<!-- Scoring and Advancing During Online Rounds -->
            <p><span class="bodySubtitle">Scoring and Advancing During Online Rounds</span><br />
            After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next
            online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the
            round (see Round Structure below) for each coder. In order to advance, a coder must finish each round with a
            greater-than-zero point total. The structure of the online rounds is as follows:</p>

            <ul>
                <li><strong>Online Round #1</strong><br />
                A total of 500 coders will compete in Round #1 and a total of 200 will advance.  The winner of each of the 50 rooms will
                automatically advance to Online Round #2.  The remaining 150 spots will be wildcards, and will be awarded based on total
                points across all rooms.  (In the event there are less than 50 room winners in Round #1, the total number of wildcard spots
                will be equal to 200 minus the actual number of room winners.)</li>

                <li><strong>Online Round #2</strong><br />
                200 coders will compete and 100 will advance.  The winner of each of the 20 rooms will automatically advance to Online Round
                #3.  The remaining 80 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there
                are less than 20 room winners in Round #2, the total number of wildcard spots will be equal to 100 minus the actual number
                of room winners.)</li>

                <li><strong>Online Round #3</strong><br />
                100 coders will compete and 50 will advance.  The winner of each of the 10 rooms will automatically advance to Online Round
                #4.  The remaining 40 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there
                are less than 10 room winners in Round #3, the total number of wildcard spots will be equal to 50 minus the actual number of
                room winners.)</li>

                <li><strong>Online Round #4</strong><br />
                50 coders will compete and 16 will advance.  The winner of each of the 5 rooms will automatically advance to the field of
                Semifinalists.  The remaining 11 spots will be wildcards and will be awarded based on total points across all rooms.  (In the
                event there are less than 5 room winners in Round #4, the total number of wildcard spots will be equal to 16 minus the actual
                number of room winners.)</li>
            </ul>

            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br/>
            The sixteen (16) advancers from Online Round #4 will travel to Mohegan Sun on Wednesday, December 3rd to compete 
            in the Semifinal round of the tournament being held on Thursday, December 4th.  All contestants must arrive at Mohegan 
            Sun no later than 4:00 PM on Wednesday, December 3rd.  If a contestant is unable to attend the onsite rounds, he/she will 
            forfeit his/her eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest overall 
            scorer from Online Round #4.  
            <br/><br/>
            TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, up to a cost of $1,000 per 
            person.  (That is, if a contestant's airfare is greater than $1,000, the contestant will be responsible for the difference 
            between the cost of the airfare and $1,000.)  In addition, TopCoder will also provide travel arrangements to and from the 
            airport to the Mohegan Sun Casino and accommodations and certain meals for each contestant and his/her guest.  All other 
            expenses are the responsibility of the contestant and his/her guest.  
            <br/><br/>
            TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a 
            manner such that the average competitor rating (as of October 6th) for each room will be similar.  Click
            <A href="/tc?module=Static&d1=tco03&d2=tco03_schedule">here</A> for the schedule.
            <br/><br/>
            The Semifinal Round will consist of four (4) rooms of four (4) coders each. The winner in each room will advance to the 
            Championship Round.
            <br/><br/>
            The Championship Round will be a single round of four (4) coders. First, second, third and fourth place in the Championship 
            round are determined by comparing the total points of each coder, with the highest point value placing first. The winner of 
            the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Semifinal 
            and/or Championship rounds, the tie will be resolved in the following manner (in order):
            <ul>
            <li>Total points acquired (higher is better) during Online Rounds #1, #2, #3 and #4 of the 2003 TopCoder Open</li>
            <li>If a tie still remains, then by rating (higher is better) as of October 6th </li>
            <ul>
            <li>If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</li>
            <li>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</li>
            </ul>
            </ul>
            </p>
            
            <p><strong>NOTE:</strong>  In the event of a tie for any advancing position (i.e. room winner or
            wildcard spot), the tie will be resolved in the following manner:</p>

            <ul>
                <li>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were
                presented with the same set of problems</li>
                <li>If a tie still remains, then by rating (higher is better) as of October 6, 2003</li>
                <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul><br />

<!-- Round Structure -->
            <p><span class="bodySubtitle">Round Structure</span><br />
            Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase.
            (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)</p>

            <ul>
                <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions
                representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are
                awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time
                the problem was opened to the time it was submitted.</li>

                <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality
                of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the
                defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as
                a penalty, applied against their total score in that round of competition.</li>

                <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully
                challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the
                points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the
                output from the code submission to be correct. If the output from a coder's submission does not match the expected output,
                the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a
                given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing
                Phase.</li>
            </ul><br />

<!-- Other -->
            <p><span class="bodySubtitle">Other</span><br />
            The tournament is void in whole or in part where prohibited by law.</p>

            <p>A list of tournament winners by coder handles will be available on the web site at http://www.topcoder.com/, and will be
            displayed for at least 3 months after the end of the tournament.</p>

            <p>Any appeals as to the outcome of a round of competition must be submitted via email to <A href="mailto:service@topcoder.com" class="bodyText">service@topcoder.com</A> by no later than 11:00 AM Eastern Time on the date following the round for which the appeal is being addressed.</p>
            
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
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
