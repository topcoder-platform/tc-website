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
                <jsp:param name="level1" value="help"/>
                <jsp:param name="level2" value="index"/>
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
           <jsp:param name="image" value="help"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Competition Manual"/>  
        </jsp:include>

<h2>Competing in a TopCoder Rated Event</h2>

<p><span class="bodySubtitle">When are the Rated Events?</span><br/>
TopCoder holds two types of rated events.  Single Round Matches (SRMs) are held weekly.  The day and time of SRMs varies from week-to-week.  See the event schedule on the TopCoder's web site (http://www.topcoder.com/?&t=schedule&c=index) for the dates and times of future SRMs.  Please keep in mind that all times on TopCoder's web site are communicated in either Eastern Standard Time (EST / GMT -5) or Eastern Daylight Time (EDT / GMT-4) depending on the time of the year.  The web site will specify for which time zone the time for each match is specified.  In addition, you may elect to receive a reminder email preceding each SRM.  To do so, select to "Next Competition" box under the "Email Notification" heading in your TopCoder profile information.<br/><br/>

In addition to SRMs, TopCoder holds two advancement tournaments (the TopCoder Invitational and the TopCoder Collegiate Challenge) each year.  Advancement tournaments are elimination tournaments and generally have a substantially prize purse involved.  Each round of a tournament will affect the ratings of all participants, so they are also considered "rated events".</p>

<p><span class="bodySubtitle">How does a Rated Event Differ from the Practice Room?</span><br/>
There are a number of differences - the biggest being that participating in a rated event will affect your TopCoder rating, whereas utilizing the practice rooms does not affect your rating.  If you register for a rated event and proceed to open any of the problems during the coding phase, your rating will be affected.  Very few excuses will be accepted.<br/><br/>

Additionally, a rated event is timed - whereas in a practice room you have unlimited time to submit solutions to a problem (and start over if you'd like).  For example, if you attempt to submit a solution after the coding phase has ended, or a challenge after the challenge phase time has run out, the TopCoder servers will reject it.<br/><br/>

In the practice rooms, you always have the ability to view the source code of other members who have submitted code in that room.  In a rated event, you will not have the option of viewing the source code of other competitors until the start of the challenge phase.<br/><br/>

During a rated event, you must always be cognizant of the amount of time that is remaining in the current phase of competition.</p>

<p><span class="bodySubtitle">Registration for a Single Round Match</span><br/>
In order to participate in a match, you must register for that match from within the TopCoder Arena prior to the start of the match.  The registration period lasts for 2 hours and 55 minutes and starts exactly 3 hours before the match begins.  In order to register, highlight the appropriate match from the "Active Contests" menu and select "Register".  At this point, you will be asked to agree to the terms and rules of the match, as well as answer a brief, multiple choice poll question.  Once you select "I Agree" at the bottom, you will be registered for the match.  It is a good idea to confirm your match registration by selecting "Registrants" for the appropriate match in the Active Contests menu and verifying that your handle is in the list.  The list may be sorted by any of the column headings (by clicking on the heading).  If you are not in this list, you will not be assigned a place in the match.  Please make sure that you register well in advance of the close of registration to ensure that registration does not close while you are in the process of registering.  TopCoder cannot add anyone to the match after the registration period closes.</p>

<p><span class="bodySubtitle">Division One versus Division Two</span><br/>
At TopCoder, there are two divisions of competition.  The specific division that you are in is dependant only on your TopCoder rating.  If your TopCoder rating is 1200 or above, you will be competing in Division One.  Otherwise, you will be competing in Division Two - even if you are non-rated.  The problem set in Division One is harder than the Division Two problem set.  Frequently, one problem from the Division One set will be shared in Division Two - generally as a higher point value problem in Division Two.  A coder will move into Division One immediately upon attaining a rating of 1200 or higher. Likewise, when a coder's rating drops below 1200, they will be placed (and seeded) in Division Two.  The rating calculations that are performed at the end of each match will only consider your comparative performance within the division that you competed in.</p

<p><span class="bodySubtitle">Room Assignments - Getting to Your Room</span><br/>
When the registration period for a match closes (5 minutes before the start of each match), the "room assignments" will be created.  The result of room assignments is that each member who registered for the match will have been assigned to a room in which they will be competing.  The algorithm that is used will attempt to place about 20 coders in each room, with higher rated members having a higher likelihood of being assigned to a lower numbered room.  The room assignments for a match really only matter for the challenge phase (you may only challenge those in your assigned room), since the overall rating adjustments will consider all coders in a given division - not just the room.  The room assignment process will take about 2 minutes.  When it has completed, you will be able to move to your competition room by selecting the appropriate match from the "Active Contests" menu, and selecting "Enter".  Whenever you are assigned to a room in a current match, the "Enter" option will take you to whatever room you are assigned.  If you are not assigned to any room, you will be taken to room one by default.  If you are not in your assigned room when the coding phase begins, you will receive a message notifying you of such - and asking you if you would like to move directly to your assigned room.  If you move to your room early (before the coding phase begins) you will not have the ability to utilize the problem selection.  In other words, you cannot see the problems until the coding phase begins.</p>

The Phases of a Rated Event (Including Scoring and Length of Time)

The Coding Phase

The Challenge Phase

The System-Testing Phase


Code Obfuscation
TopCoder has a policy against any intentional obfuscation of code submissions.  Any code submission that contains obvious and deliberate code obfuscation will be rejected and any points received for that submission would not count towards your final score. For the purpose of this policy TopCoder defines obfuscation as "An obvious and deliberate attempt to disguise the true behavior or nature of the code."  In ALL cases, TopCoder will make the final decision as to whether or not a code submission has been intentionally obfuscated.  In some cases, TopCoder may decide to "nullify" any unsuccessful challenges that have been applied against a code submission that is determined by TopCoder to be obfuscated.  We encourage any TopCoder competitor to notify us in the event that you feel that a code submission during a rated event violates this policy.

<p><span class="bodySubtitle">Broadcast Messages</span><br/>
During a competition, TopCoder may notify participations of important information regarding the competition via the use of broadcast messages.  Broadcast messages, by default, will pop-up on your screen when they are sent.  If the broadcast pop-up is disabled in your Arena, the "Messages" button will blink when a new message arrives.  In either case, it is possible to get a history of recent messages by clicking on the "Messages" button.  These messages may contain important information about changes or additions to the problem statements being used in the match.  Be sure to read any messages that are sent during a match - chances are it's important!  Also, remember to check for new messages every time you log into the Arena during a match - you may have missed a message that was sent while you were disconnected.

<p><span class="bodySubtitle">Getting Help</span><br/>
At some point during your TopCoder experiences you will probably need to get a question answered.  During rated events, there are always administrators available to answer your questions.  The best place to find a TopCoder administrator (identified by their bold, orange handles) is in the "Admin Lobby Room" - which can be found under the "Lobbies" menu option.  Please keep in mind that all chat in the Admin Lobby Room is reserved for questions related to the current rated event that is taking place.  You also may communicate with TopCoder administrators without leaving your assigned competition room.  At any time while in the TopCoder Arena, prefacing a chat message with "admins: " will broadcast the chat message to the Admin Lobby Room, as well as the room that you are in.  The TopCoder Administrators can reply directly to you without leaving the Admin Lobby Room.  If you prefer a private correspondence with the TopCoder Administrators, you may whisper to an individual administrator by prefacing your chat message with "/msg ".  This will allow you to ask a question of the administrators without other in your room being able to see the nature of the question.  All administrators will see your whisper.

<p><span class="bodySubtitle">What if I Get Disconnected from the Arena?</span><br/>
On occasion, we all get disconnected from the Internet by our service providers.  If you get disconnected from TopCoder's servers while you are in the Arena, simply log back in and move to your assigned competition room.  You will not be penalized for logging out - however, the time will always be counting down from when you first opened the problem (or problem(s)).  Once you reopen the problem that you were working on, the latest compiled or saved code should appear in the coding window.  Remember to save your code often!

<p><span class="bodySubtitle">Rating Changes</span><br/>
At the conclusion of the system-testing phase, TopCoder will recalculate the TopCoder ratings of all match participations based on our rating formula.  If you did not open any problem during the coding phase, you will not have your rating adjusted.  Once the rating adjustments are completed, it will be announced via an administrative broadcast message.

Your rating change is essentially a measure of how well you performed compared to others in your division - given how well you were expected to perform based on your previous rating.  Your rating increases when your performance exceeds expectations!

The rating updates are subject to change based on any appeals that TopCoder may receive the day following a match.  If any scores are determined to be incorrect (within the appeals period), TopCoder will re-adjust the ratings based on the correct scores.

<p><span class="bodySubtitle">Web Site Statistics</span><br/>
After each match, you can find comprehensive statistics about almost all aspects of the match on TopCoder's website.  This includes both summary information regarding success rate on each of the problems all the way down to viewing the code submissions of each competitor and the arguments that caused any submission to fail a system test.  In order to view most of the statistical information on the website, you will need to log in to the site with your TopCoder handle and password.  When the statistics have been compiled by our servers and are ready to be viewed (about 15-20 minutes after the system tests are complete), TopCoder will announce the availability of the statistics via an administrative broadcast message.

<p><span class="bodySubtitle">Problems in the Practice Rooms</span><br/>
Both the Division One and the Division Two problem sets are placed into new practice rooms following each match.  The new practice rooms will usually be available within an hour of the match ending. 

<p><span class="bodySubtitle">What if You Do Not Agree with the Results?</span><br/>
In the event that you do not agree with some aspect of the results of a match, you have until 11:00 AM EST/EDT on the day following the match to notify TopCoder of your concerns.  Please send an email to service@topcoder.com explaining in detail what it is that you feel is inaccurate.  We will investigate each appeal and we will determine what, if anything, to do about it.

<p><span class="bodySubtitle">Cheating at TopCoder</span><br/>
Cheating is taken seriously at TopCoder.  There are a number of ways in which you could cheat, and have your account deactivated by TopCoder.
Collaborating in any way with anyone else (member or not) during a rated event is considered cheating.  This includes discussing problem statements or solutions during either the coding phase or the challenge phase.
Using multiple accounts to participate in a rated event is considered cheating.
Registering a new account for the purpose of resetting your rating is considered cheating.
Purposefully performing poorly during a rated event with the intention of artificially lowering your rating is considered very poor sportsmanship - and may result in account deactivation.

<p><span class="bodySubtitle">Using Pre-Written Code</span><br/>
Many TopCoder participants find is useful to create code libraries for situations that commonly arise in TopCoder competitions.  Doing such is perfectly legal - as long as the code used has been entirely authored by you.  Use of any code other than that which has been authored by you is cheating (and you know how we feel about cheating).  Keep in mind, however, that onsite rounds of TopCoder advancements tournaments are handled differently.  On-site finalists of TopCoder advancement tournaments are not allowed to bring anything "on stage" - including code libraries.
        
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
