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
   <jsp:param name="tabLev3" value="structure"/>
</jsp:include>

         <h2>Competition Structure</h2>
         
            <p><span class="bodySubtitle">Online Elimination Rounds</span><br/>
            Everyone who competes in an online round must login to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round. (See below for competition dates and times.) TopCoder members from around the world may be participating in these rounds, but all start times will be communicated as Eastern Time, so contestants in different time zones must adjust accordingly. If a coder does not participate, for any reason, in an online round they have advanced to, it will be treated as an automatic loss in that round of competition.</p>

            <p>All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all room assignments prior to the start of each online round in a manner such that the average competitor rating (as of February 23rd) for each room will be similar.</p>

            <p><span class="bodySubtitle">Scoring and Advancing during Online Rounds</span><br/>
            After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure of the online rounds is as follows:</p>

            <ul>
            <li><b>Online Round #1</b><br/>
            Up to 500 coders will compete in Round #1 and up to 200 will advance.  The winner of each of the 50 rooms will automatically advance to Online Round #2.  The remaining 150 spots will be “wildcards”, and will be awarded based on total points across all rooms.  (In the event there are less than 50 room winners in Round #1, the total number of wildcard spots will be equal to 200 minus the actual number of room winners.)</li>

            <li><b>Online Round #2</b><br/>
            Up to 200 coders will compete and up to 100 will advance.  The winner of each of the 20 rooms will automatically advance to Online Round #3.  The remaining 80 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there are less than 20 room winners in Round #2, the total number of wildcard spots will be equal to 100 minus the actual number of room winners.)</li>

            <li><b>Online Round #3</b><br/>
            Up to 100 coders will compete and up to 50 will advance.  The winner of each of the 10 rooms will automatically advance to Online Round #4.  The remaining 40 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there are less than 10 room winners in Round #3, the total number of wildcard spots will be equal to 50 minus the actual number of room winners.)</li>

            <li><b>Online Round #4</b><br/>
            Up to 50 coders will compete and up to 24 will advance.  The winner of each of the 5 rooms will automatically advance to the field of Semifinalists.  The remaining 19 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there are less than 5 room winners in Round #4, the total number of wildcard spots will be equal to 24 minus the actual number of room winners.)</li>
            </ul>

            <p>NOTE:  In the event of a tie for any advancing position (i.e., room winner or wildcard spot), the tie will be resolved in the following manner:</p>

            <ul>
            <li>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems (excluding the Qualification Round)</li>
            <li>If a tie still remains, then by rating (higher is better) as of February 23, 2004.  Unrated coders as of February 23, 2004 will be assigned a rating of zero for tiebreaker purposes</li>
            <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul>

            <p><span class="bodySubtitle">Competition Round Structure</span><br/>
            With the exception of the Qualification Round, each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)</p>

            <p>The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted.</p>

            <p>The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a penalty, applied against their total score in that round of competition. </p>

            <p>The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</p>

            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br/>
            The twenty-four (24) advancers from Online Round #4 will travel to the Boston Park Plaza Hotel & Towers on Wednesday, April 14th to compete in the Semifinal round of the tournament being held on Thursday, April 15th.  All contestants must arrive at the Boston Park Plaza Hotel & Towers no later than 4:00 PM on Wednesday, April 14th.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest overall scorer from Online Round #4.</p>

            <p>TopCoder will provide travel arrangements for each competitor, up to a cost of $1,000 per person.  (That is, if a contestant’s airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  In addition, TopCoder will also provide travel arrangements to and from the airport to the Boston Park Plaza Hotel & Towers and accommodations and certain meals for each contestant.  All other expenses are the responsibility of the contestant.  TopCoder will not provide travel or lodging accommodations for competitor guests at the 2004 TCCC.</p>

            <p>TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating (as of February 23rd) for each room will be similar.</p>

            <p>The Semifinal Round will consist of four (4) rooms of four (4) coders each. The winner in each room will advance to the Championship Round</p>

            <p>The Championship Round will be a single round of four (4) coders. First, second, third and fourth place in the Championship round are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Semifinal and/or Championship rounds, the tie will be resolved in the following manner (in order):</p>

            <ul>
            <li>Total points acquired (higher is better) during Online Rounds #1, #2, #3 and #4 of the 2004 TopCoder Collegiate Challenge</li>
            <li>If a tie still remains, then by rating (higher is better) as of February 23, 2004.  Unrated coders as of February 23, 2004 will be assigned a rating of zero for tiebreaker purposes</li>
            <li>If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</li>
            <li>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</li>
            </ul>

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
