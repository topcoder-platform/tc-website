<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />

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
                <jsp:param name="level1" value="support"/>
                <jsp:param name="level2" value="guide"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="support"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Algorithm Competition Guide"/>
        </jsp:include>

      <h2>Competing in a TopCoder Rated Event</h2>

      <a name="when"></a>
      <p><span class="bodySubtitle">1 When are the Rated Events?</span><br/>
      TopCoder holds two types of rated events.  Single Round Matches (SRMs) are held weekly.  The day and time of SRMs varies from week-to-week.  See the <A href="/tc?module=Static&d1=calendar&d2=thisMonth">event schedule</A> on the TopCoder's web site for the dates and times of future SRMs.  Please keep in mind that all times on TopCoder's web site are communicated in either Eastern Standard Time (EST / GMT -5) or Eastern Daylight Time (EDT / GMT-4) depending on the time of the year.  The web site will specify for which time zone the time for each match is specified.  In addition, you may elect to receive a reminder email preceding each SRM.  To do so, select to "Next Competition" box under the "Email Notification" heading in your TopCoder profile information.  By checking this option, you will also receive emails regarding upcoming TopCoder tournaments and events.
      <br/><br/>
      In addition to SRMs, TopCoder holds two advancement tournaments (the TopCoder Open and the TopCoder Collegiate Challenge) each year. Advancement tournaments are elimination tournaments and generally have a substantial prize purse involved. Each round of a tournament will affect the ratings of all participants, so they are also considered "rated events".  The details on each of these events are posted to TopCoder's site as they are finalized.  You can also view the information and details of most <A href="/?t=tournaments&c=tourny_index">past tournaments</A>.
      </p>

      <a name="differ"></a>
      <p><span class="bodySubtitle">2 How does a Rated Event Differ from the Practice Room?</span><br/>
      There are a number of differences - the biggest being that participating in a rated event will affect your TopCoder rating, whereas utilizing the practice rooms does not affect your rating.  If you register for a rated event and proceed to open any of the problems during the coding phase, your rating will be affected following the match.
      <br/><br/>
      Additionally, a rated event is timed - whereas in a practice room you have unlimited time to submit solutions to a problem (and start over if you'd like).  For example, if you attempt to submit a solution after the coding phase has ended, or a challenge after the challenge phase time has run out, the TopCoder servers will reject it.
      <br/><br/>
      In the practice rooms, you always have the ability to view the source code of other members who have submitted code in that room.  In a rated event, you will not have the option of viewing the source code of other competitors until the start of the challenge phase.
      <br/><br/>
      During a rated event, you must always be cognizant of the amount of time that is remaining in the current phase of competition.
      </p>

      <a name="registration"></a>
      <p><span class="bodySubtitle">3 Registration for a Single Round Match</span><br/>
      In order to participate in a match, you must register for that match from within the TopCoder Arena prior to the start of the match.  The registration period lasts for 2 hours and 55 minutes and starts exactly 3 hours before the match begins.  In order to register, highlight the appropriate match from the "Active Contests" menu and select "Register".  At this point, you will be asked to agree to the terms and rules of the match, as well as answer a short multiple-choice poll.  Once you select "I Agree" at the bottom, you will be registered for the match.  It is a good idea to confirm your match registration by selecting "Registrants" for the appropriate match in the Active Contests menu and verifying that your handle is in the list.  The list may be sorted by any of the column headings (by clicking on the heading).  If you are not in this list, you will not be assigned a place in the match.  Please make sure that you register well in advance of the close of registration to ensure that registration does not close while you are in the process of registering.  TopCoder cannot add anyone to the match after the registration period closes.
      After you have registered, it is not necessary for you to remain logged into the TopCoder Arena.  When you log back in, you will still be registered for that match.
      </p>

      <a name="divisions"></a>
      <p><span class="bodySubtitle">4 Division One versus Division Two</span><br/>
      At TopCoder, there are two divisions of competition.  The specific division that you are in is dependant only on your TopCoder rating.  If your TopCoder rating is 1200 or above, you will be competing in Division One.  Otherwise, you will be competing in Division Two - even if you are non-rated.  The problem set in Division One is harder than the Division Two problem set.  Frequently, one problem from the Division One set will be shared in Division Two - generally as a higher point value problem in Division Two.  A coder will move into Division One immediately upon attaining a rating of 1200 or higher. Likewise, when a coder's rating drops below 1200, they will be placed (and seeded) in Division Two.  The rating calculations that are performed at the end of each match will only consider your comparative performance within the division that you competed in.
      </p>

      <a name="roomassignments"></a>
      <p><span class="bodySubtitle">5 Room Assignments - Getting to Your Room</span><br/>
      When the registration period for a match closes (5 minutes before the start of each match), the "room assignments" will be created.  The result of room assignments is that each member who registered for the match will have been assigned to a room in which they will be competing.  The algorithm that is used may differ with each match.  The room assignments for a match really only matter for the challenge phase (you may only challenge those in your assigned room), since the overall rating adjustments will consider all coders in a given division - not just the room.  The room assignment process will take about 2 minutes.  When it has completed, you will be able to move to your competition room by selecting the appropriate match from the "Active Contests" menu, and selecting "Enter".  Whenever you are assigned to a room in a current match, the "Enter" option will take you to whatever room you are assigned.  If you are not assigned to any room, you will be taken to room one by default.  If you are not in your assigned room when the coding phase begins, you will receive a message notifying you of such - and asking you if you would like to move directly to your assigned room.  If you move to your room early (before the coding phase begins) you will not have the ability open any problems until the coding phase begins.  In other words, you cannot see the problems until the coding phase begins.  You may, however, see the point values assigned to the problems in the drop-down list prior to the start of the coding phase.
      </p>

      <a name="phases"></a>
      <p><span class="bodySubtitle">6 The Phases of a Rated Event</span><br/>
      All phases of a TopCoder rated event will start and end at the same time for every competitor.  Certain functionality in the Arena will become enabled or disabled based on which phase is taking place.  Each event will consist of the following phases.
      </p>

      <ul>
      <li>
         <a name="coding"></a>
         <p><span class="bodySubtitle">6.1 The Coding Phase</span><br/>
         The Coding Phase is the period during which each competitor attempts to create solutions to three problem statements.  In most cases, the coding phase will last 75 minutes, which is the total time that you have to submit solutions to any or all of the problems.  When the coding phase begins, each competitor will have the opportunity to view the problem statements.  Each problem can be opened by selecting its point value from the "Select One" drop-down box.  The higher the point value assigned, the more difficult the problem will be.  You may open the problems in any order.  As soon as a problem is selected, the submission point value for that problem will begin to decrease.  The longer a problem is open, the lower your score will be should you submit.  You have the option to open more than one problem at a time, however the submission value of each open problem will be counting down.  Closing a problem will not stop that's problem's point value countdown.  Once you open a problem, you will be presented with the <A href="/tc?module=Static&d1=help&d2=codingWindow">Coding Window</A>.  The description of the <A href="/tc?module=Static&d1=help&d2=codingWindow">Coding Window</A> contains information about the features and functionality available to you to allow you to create a solution to the problem, compile the solution, test the solution, and submit the solution.
      </li>
      <li>
         <a name="challenge"></a>
         <p><span class="bodySubtitle">6.2 The Challenge Phase</span><br/>
         The Challenge Phase generally begins five minutes after the end of the Coding Phase (the period in between is an intermission), and will last for 15 minutes.
         <br/><br/>
         During the Challenge Phase, you have the opportunity to view the source code submissions of the other competitors in your competition room.  If you believe that any of the submissions are flawed, you may challenge the submission with a specific test case that you feel will result in that submission returning the wrong result.  If your challenge is successful, and the submission returns the wrong result, you will be awarded 50 points and the competitor will lose the points that were received for the challenged submission.  However, if your challenge is unsuccessful, and the submission returns the correct result for the test case, you will lose 25 points from your score.
         <br/><br/>
         To challenge a competitor's submission, open the <A href="/tc?module=Static&d1=help&d2=roomSummary">Room Summary Window</A> in the competition room by using the "Summary" button.  Double click on any of the point values to view the source code for that submission.  When viewing the source code, you will notice a "Challenge" button at the bottom of the window.  The Challenge button will bring up the <A href="/tc?module=Static&d1=help&d2=problemArguments">Argument Windows</A>, allowing you to enter the test case with which to challenge the submission.
         <br/><br/>
         Challenges may also be used as a way to introduce new test cases into the suite of system test cases.  Any challenge during the challenge phase that is recorded as successful will be added as a system test case - to be run against all remaining submissions during the system-testing phase.
         <br/><br/>
         There are a few restrictions during the challenge phase:
         </p>

         <ul>
         <li>You may only submit a challenge if you have a score of zero or greater at the time of the challenge. Once your score drops below zero, you will no longer have the option / ability to challenge.</li>
         <li>You may only challenge submissions made in the same competition room as your own.</li>
         <li>A given submission may only be successfully challenged once.  If any competitor has already successfully challenged a submission, it may not be further challenged.</li>
         <li>You may not challenge your own submissions.</li>
         </ul>

         <p>
         It is a violation of the rules to discuss any aspect of the problems or any specific submissions with anyone until the challenge phase has ended.
         </p>
      </li>
      <li>
         <a name="systemtesting"></a>
         <p><span class="bodySubtitle">6.3 The System-Testing Phase</span><br/>
         The system-testing phase is non-interactive.  Immediately following the challenge phase, the TopCoder servers will run a number of housekeeping tasks, followed by the system testing.  During the system testing, every problem that is still standing will be subjected to an extensive set of test cases.  The system will check to make sure that each submission returns the correct result in under 2 seconds for each of these test cases.  If any submission fails any of the test cases, the submission will be marked incorrect and the points achieved for that submission would be removed from that coder's total score.
         The system testing will generally take between 10 and 20 minutes - sometimes longer.  You do not need to stay logged into the TopCoder Arena during the system tests - only if you want to see your final score as soon as it is announced.  When the system tests have completed, a message will be sent out to all competitors who are logged in, and the leader board, room summary, and division summary scores will all be updated to reflect the final results.
      </li>
      </ul>

      <a name="codeobfuscation"></a>
      <p><span class="bodySubtitle">7 Code Obfuscation</span><br/>
      TopCoder has a policy against any intentional obfuscation of code submissions.  Any code submission that contains obvious and deliberate code obfuscation will be rejected and any points received for that submission would not count towards your final score. For the purpose of this policy TopCoder defines obfuscation as "An obvious and deliberate attempt to disguise the true behavior or nature of the code."  In ALL cases, TopCoder will make the final decision as to whether or not a code submission has been intentionally obfuscated.  In some cases, TopCoder may decide to "nullify" any unsuccessful challenges that have been applied against a code submission that is determined by TopCoder to be obfuscated.  We encourage any TopCoder competitor to notify us in the event that you feel that a code submission during a rated event violates this policy.
      </p>

      <a name="extracoderule"></a>
      <p><span class="bodySubtitle">8 Excessive / Extra Code Rule</span><br/>
      TopCoder has a policy against including extra content in a submission that is not part of the solution the problem. This includes, but is not limited to the following:
      <ul>
      <li>unused macros</li>
      <li>unused #define's</li>
      <li>unused typedef's</li>
      <li>automatically generated code</li>
      <li>testing code</li>
      <li>unused personal library code</li>
      <li>comments not directly related to the solution</li>
      </ul>
      The following things are excluded from the rule (They are not considered unused):
      <ul>
      <li>Library import statements (#include, imports, using, Imports)</li>
      <li>Comments identifying plugins used</li>
      <li>Comments directly related to the solution (explaining algorithms, etc.)</li>
      </ul>
      In ALL cases, TopCoder will make the final decision as to whether or not a code submission has an
      excessive amount of unused content. If TopCoder determines that a submission violates this policy,
      the competitor will receive 20% of the point value of the problem for that submission. No challenges will be overturned or
      nullified as a result of a violation in this policy. We encourage any TopCoder competitor to notify
      us in the event that you feel that a code submission during a rated event violates this policy.
      <br/><br/>
      In an effort to help competitors determine how much extra content can be contained in a submission and
      still not violate this policy, we provide the following general guideline. You may have a maximum of
      300 non-space characters that are considered extra content or a maximum of 30% of your submission be
      considered extra, whichever is greater.
      </p>

      <a name="broadcastmessages"></a>
      <p><span class="bodySubtitle">9 Broadcast Messages</span><br/>
      During a competition, TopCoder may notify participants of important information regarding the competition via the use of broadcast messages.  Broadcast messages, by default, will pop-up on your screen when they are sent.  If the broadcast pop-up is disabled in your Arena, the "Messages" button will blink when a new message arrives.  In either case, it is possible to get a history of recent messages by clicking on the "Messages" button.  These messages may contain important information about changes or additions to the problem statements being used in the match.  Be sure to read any messages that are sent during a match - chances are it's important!  Also, remember to check for new messages every time you log into the Arena during a match - you may have missed a message that was sent while you were disconnected.
      </p>

      <a name="status"></a>
      <p><span class="bodySubtitle">10 Getting the Status of Other Competitors</span><br/>
      </p>

      <ul>
      <li>
         <a name="leaderboard"></a>
         <p><span class="bodySubtitle">10.1 The Leader Board</span><br/>
         During times when there is at least one TopCoder event taking place in the Arena, you can get an overview of the action by clicking on the "Leader Board" button on the left side of the Arena.  The leader board window contains a list of all rooms for a given event along with the current leader in each room.  Additional information for each room includes 1) the room number, 2) the seed (expected room placement) of the current leader, and 3) the current point total for the leader.  If there are multiple events taking place, you can switch the leader board to a different event using the "Rounds" drop-down list at the bottom of the leader board window.  Clicking on any of the column headings in the leader board will sort the list by the information in the column that was clicked.
         <br/><br/>
         In addition, you have the option of "drilling in" to any of the rooms by double clicking on any of the individual rooms listed in the leader board.  Drilling into a room will open the <A href="/tc?module=Static&d1=help&d2=roomSummary">Room Summary Window</A>, which will display each member who is competing in that room, along with their current point totals and status for each of the problems.
         </p>
      </li>
      <li>
         <a name="roomsummary"></a>
         <p><span class="bodySubtitle">10.2 The <A href="/tc?module=Static&d1=help&d2=roomSummary">Room Summary Window</A></span><br/>
         The <A href="/tc?module=Static&d1=help&d2=roomSummary">Room Summary Window</A> will show information about each competitor within a given room of competition.  The room summary is also the competitor interface for the challenge phase.  View the <A href="/tc?module=Static&d1=help&d2=roomSummary">Room Summary Window</A> explanation for more information.
         </p>
      </li>
      </ul>

      <a name="gettinghelp"></a>
      <p><span class="bodySubtitle">11 Getting Help</span><br/>
      At some point during your TopCoder adventures you will likely need to get a question answered by the administrators.  During rated events, there are always administrators available to answer your questions.  The best place to find a TopCoder administrator (identified by their bold, orange handles) is in the "Admin Lobby Room" - which can be found under the "Lobbies" menu option.  Please keep in mind that all chat in the Admin Lobby Room is reserved for questions related to the current rated event that is taking place.  You also may communicate with TopCoder administrators without leaving your assigned competition room.  At any time while in the TopCoder Arena, prefacing a chat message with "admins: " will broadcast the chat message to the Admin Lobby Room, as well as the room that you are in.  The TopCoder Administrators can reply directly to you without leaving the Admin Lobby Room.  If you prefer a private correspondence with the TopCoder Administrators, you may whisper to an individual administrator by prefacing your chat message with "/msg ".  This will allow you to ask a question of the administrators without other in your room being able to see the nature of the question.  All administrators will see your whisper (as well as all whispered messages).
      </p>


      <a name="score"></a>
      <p><span class="bodySubtitle">12 Determining Score</span><br/>
        The point value of a submission is dependent upon the problem's level of difficulty and the time it took to code a solution.
        The TopCoder server will calculate the time spent on a problem by counting the time between when the coder selects a
        problem and when a solution is submitted. Keep in mind that these times are captured when a problem request or problem
        submission actually gets to our server, so network latency may play a minor role in the competition process.<BR/>
        <br/>
        Total points awarded = <img width="172" height="37" alt="points" src="/i/pts.gif"/><br/>
        <br/>
        Where PT is the time spent coding a problem, TT is the total time allocated for coding all problems,
        and MP is the maximum points available for that problem.<BR/>
        <br/>

        For example:<br/>

        A coder spends 22.7 minutes working on the medium problem before submitting. Given the fact that the total coding
        round is one hour, and the maximum point value for the medium problem is 500, the coder's awarded points for the
        submission will be: <br/>
        <BR/>
        500*(.3 + .7*60^2/(10*22.7^2+60^2))<br/>
        <br/>
        or <br/>
        <br/>
        293.95 points (point calculations are rounded to two decimal places)<br/>
        <br/>
        </p>


      <a name="ratingchanges"></a>
      <p><span class="bodySubtitle">13 Rating Changes</span><br/>
      At the conclusion of the system-testing phase, TopCoder will recalculate the TopCoder ratings of all match participations based on our <A href="/?t=support&c=ratings_cal">rating formula</A>.  If you did not open any problem during the coding phase, you will not have your rating adjusted.  Once the rating adjustments are completed, it will be announced via an administrative broadcast message.
      <br/><br/>
      Your rating change is essentially a measure of how well you performed compared to others in your division - given how well you were expected to perform based on your previous rating.  Your rating increases when your performance exceeds expectations!
      <br/><br/>
      The rating updates are subject to change based on any appeals that TopCoder may receive the day following a match.  If any scores are determined to be incorrect (within the appeals period), TopCoder will re-adjust the ratings based on the correct scores.
      </p>

      <a name="websitestats"></a>
      <p><span class="bodySubtitle">14 Web Site Statistics</span><br/>
      After each match, you can find comprehensive statistics about almost all aspects of the match on TopCoder's website.  This includes both summary information regarding success rate on each of the problems all the way down to viewing the code submissions of each competitor and the arguments that caused any submission to fail a system test.  In order to view most of the statistical information on the website, you will need to log in to the site with your TopCoder handle and password.  When the statistics have been compiled by our servers and are ready to be viewed (about 15-20 minutes after the system tests are complete), TopCoder will announce the availability of the statistics via an administrative broadcast message.  "Statistics / Round Overview" in the left side navigation area of the TopCoder website will take you to the top level of the statistics for the most recent match.  Clicking on the "[*]" symbol next to any entry will drill into the statistics for the given entry.
      </p>

      <a name="problems"></a>
      <p><span class="bodySubtitle">15 Problems in the Practice Rooms</span><br/>
      Both the Division One and the Division Two problem sets are placed into new practice rooms following each match.  The new practice rooms will usually be available within an hour of the match ending.
      </p>

      <a name="donotagree"></a>
      <p><span class="bodySubtitle">16 What if You Do Not Agree with the Results?</span><br/>
      In the event that you do not agree with some aspect of the results of a match, you have until 11:00 AM EST/EDT on the day following the match to notify TopCoder of your concerns.  Please send an email to <A href="mailto:service@topcoder.com">service@topcoder.com</A> explaining in detail what it is that you feel is inaccurate.  We will investigate each appeal and we will determine what, if anything, to do about it.
      </p>

      <a name="problemanalysis"></a>
      <p><span class="bodySubtitle">17 Problem Set Analysis and Discussion</span><br/>
      Following each match, an overviw and analysis of each problem will be posted on TopCoder's site.  You can find an archive of these write-ups <A href="/tc?module=Static&d1=match_editorials&d2=archive">here</A>.  On many occasions, a further discussion will take place on TopCoder's forums (Round Tables), which you can find <A href="/rtables/index.jsp">here</A>.  The TopCoder Round Tables are a great place to get questions answered about algorithms, specific problems, Arena usage, and all other aspects of TopCoder.
      </p>

      <a name="disconnected"></a>
      <p><span class="bodySubtitle">18 Getting Disconnected from the Arena</span><br/>
      On occasion, we will all get disconnected from the Internet for various reasons.  If you get disconnected from TopCoder's servers while you are in the Arena, simply log back in and move to your assigned competition room.  You will not be penalized for logging out - however, the time will always be counting down from when you first opened the problem (or problem(s)).  Once you reopen the problem that you were working on, the latest compiled or saved code should appear in the <A href="/tc?module=Static&d1=help&d2=codingWindow">Coding Window</A>.  Remember to save your code often!
      </p>

      <a name="cheating"></a>
      <p><span class="bodySubtitle">19 Cheating at TopCoder</span><br/>
      Cheating is taken seriously at TopCoder.  There are a number of ways in which you could cheat, and have your account deactivated by TopCoder.
      <br/>
      Collaborating in any way with anyone else (member or not) during a rated event is considered cheating.  This includes discussing problem statements or solutions between the time that the coding phase begins and the time that the challenge phase ends.
      <br/>
      Using multiple accounts to participate in a rated event is considered cheating.
      <br/>
      Registering a new account for the purpose of resetting your rating is considered cheating.
      <br/>
      Purposefully performing poorly during a rated event with the intention of artificially lowering your rating is considered very poor sportsmanship - and may result in account deactivation.
      <br/>
      Obviously, TopCoder cannot identify all malicious behavior (we try hard, though), so we do rely on each member's sportsmanship and integrity.
      </p>

      <a name="prewrittencode"></a>
      <p><span class="bodySubtitle">20 Using Pre-Written Code</span><br/>
      Many TopCoder participants find it useful to create code libraries for situations that commonly arise in TopCoder competitions.  Doing such is perfectly legal - <b>as long as the code used has been entirely authored by you</b>.  Use of any code other than that which has been authored by you is cheating (and you know how we feel about cheating).  Keep in mind, however, that onsite rounds of TopCoder advancements tournaments are handled differently.  On-site finalists of TopCoder advancement tournaments are not allowed to bring anything "on stage" - including code libraries.
      <br/><br/>
      Pasting large libraries of code into each submission with the intent of only using a small percentage (if any) is against the <A href="#extracoderule">Excessive / Extra Code Rule</A>.
      </p>

      <a name="arenaplugins"></a>
      <p><span class="bodySubtitle">21 TopCoder Arena Plug-ins</span><br/>
      The TopCoder Arena supports a "plug-in" architecture that allows additional functionality to be built in.  While the functionality provided by these plug-ins is not initially available to you, you may freely install and configure any of the available plug-ins.  Most plug-ins are designed to create a more efficient and effective competition environment.  There are plug-ins available for feature-rich code editing, automatic example checking, external editor integration, auto code generation, and more.  For a list of available plug-ins and instructions on how to install and use them, check <A href="/?t=arena&c=plugins">here</A>.
      </p>

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
