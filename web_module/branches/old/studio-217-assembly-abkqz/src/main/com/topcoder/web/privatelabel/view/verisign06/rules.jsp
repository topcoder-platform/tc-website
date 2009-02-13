<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

<title>VeriSign Internal Coding Competition, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value="rules"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">


<span class="bigTitle">VeriSign&#174; Internal Coding Competition</span>
<br/><br/>
<span class="bodySubtitle">Official Rules and Regulations</span>
<br/><br/>
<!--<a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="#registration">Registration</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="#qualification">Qualification Round</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="#structure">Round Structure</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="#conditions">Conditions&nbsp;of&nbsp;Participation</a>
<br /><br /> -->

<span class="bigRed">No purchase necessary to enter or win.</span>
<br/><br/>

<span class="bodySubtitle">Eligibility</span>
<br/><br/>
All competitors must have registered as a VeriSign employee, and must have agreed to the rules on this page prior to competing.  Competitors must be 18 years of age or older as of the date of the SRM in which you compete.
<br/><br/>
Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
<br/><br/>

<span class="bodySubtitle">Rooms</span>
<br/><br/>
Each competition room will have a maximum of 20 coders.
<br/><br/>

<!--<a name="eligibility"></a>
<a href="#top"><img src="/i/events/verisign06/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right"></a>-->
<span class="bodySubtitle">About the Matches</span>
<br/><br/>
<b>When to start the Online Single Round Matches</b><br/>
Members must register for the Single Round Matches. Registration is for two (2) hours
and 55 minutes prior to the start of the round. To register, login to the Arena applet,
click on the 'Main' menu, and choose the option for 'Registration'. Members from all over the country
will be participating in this event, but <em>all start times will be communicated as Eastern Time, so 
contestants in different time zones must adjust accordingly</em>. All competitors who have registered
for the round will be assigned to a specific room. TopCoder will perform the room assignments prior to
the start of a round.
<br/><br/>

<b>Upon Entering an Online Single Round Match</b><br/>
Each round consists of three phases: the coding phase, challenge phase, and the testing phase. <br/>
<ol>
    <li><b>The Coding Phase</b> is a timed event where all contestants are presented with the same three
        questions representing three levels of complexity and, accordingly, three levels of point
        earnings potential. Points for a problem are awarded upon submission of any solution that
        successfully compiles. </li>
    <li><b>The Challenge Phase</b> is a timed event wherein each competitor has a chance to challenge
        the functionality of other competitors' code. A successful challenge will award 50 points to the
        challenger, and any points gained by the submitter for the problem will be lost. Unsuccessful
        challenges will cost the challenger 25 points as a penalty, applied to their total score in that
        round of competition. </li>
    <li><b>The Automated Testing Phase</b> is applied to all submitted code that has not already been
        successfully challenged. If TopCoder finds code that is flawed, the author of that code
        submission will lose all of the points they earned for that code submission. The automated
        tester will apply a set of inputs, expecting the output from the code submission to be correct.
        If the output from a coder's submission does not match the expected output, the submission is
        considered flawed. The same set of input/output test cases will be applied to all code
        submissions for a given problem. All successful challenges from the Challenge Phase will be 
        added to the sets of inputs for the System Testing Phase.</li>
</ol>


<b>Scoring During Online Single Round Matches</b><br/>
All contestants, who opened any problem during the round, will have their ratings adjusted up or down to
reflect their performance, based on <a href="/tc?module=Static&d1=help&d2=ratings">TopCoder's rating formula</a>. Contestant ratings play no role in a
Coder's final standing in the competition room.
<br/><br/>

<span class="bodySubtitle">Conditions of Participation</span>
<br/><br/>
By participating in the tournament, you agree to be bound by these rules and to all decisions of
TopCoder, which are final, binding and conclusive in all matters.
<br/><br/>

<span class="bigRed">Contestants must not cheat; all ideas for any code and/or challenge submitted must be the contestant's alone.</span>
<br/><br/>
Winners in each round of competition will be those competitors that score the most points in their
respective rooms. All decisions relating to the viability of submissions, the ranking of submissions and
all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its
designee and shall be final and binding in all respects.
<br/><br/>
VeriSign will distribute prizes for the SRMs that are scheduled for April 25, 2006 and May 17, 2006. Prizes are as follows:
<br/><br/>
         <table width="500" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
            <tr>
               <td class="sidebarTitle" colspan="2">SRM Prizes*</td>
            </tr>
            <tr>
               <td class="sidebarText"><b>1st Place Finisher</b></td>
               <td class="sidebarText"><b>$1,500 and a trip to the VTS finals</b></td>
            </tr>
            <tr>
               <td class="sidebarText">2nd Place Finisher</td>
               <td class="sidebarText">$750 and a trip to the VTS finals</td>
            </tr>
            <tr>
               <td class="sidebarText">3rd Place Finisher</td>
               <td class="sidebarText">$500</td>
            </tr>
            <tr>
               <td class="sidebarText" colspan="2">*VeriSign's first place winner of the 2006 Sponsor Track may participate but is not eligible to win prize money in the VeriSign internal SRMs in April and May, 2006.   The first and second place winners of the VeriSign internal SRM in April, 2006 may participate but are not eligible to win prize money in the internal SRM in May, 2006.</td>
            </tr>
         </table>
<br/>

By participating in these Single Round Matches (SRMs), a winner releases and agrees to hold harmless
TopCoder and VeriSign, their affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize
suppliers, and all of their respective directors, officers, employees, representatives and agents, from
and against any and all liability for any loss, property damage or damage to person, including without
limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of
participation in this tournament, or participation in any tournament-related activity, or the receipt,
use or misuse of a prize.
<br/><br/>
TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry
process, the operation of the Web site, the tournament process, or who is otherwise in violation of the
rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of
completion as planned for any reason, including infection by computer virus, bugs, tampering,
unauthorized intervention or technical failures of any sort.
<br/><br/>

<span class="bodySubtitle">Other</span>
<br/><br/>
The tournament is void in whole or in part where prohibited by law.
<br/><br/>
This tournament is brought to you by <a href="http://www.topcoder.com/">TopCoder, Inc.</a> 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033, and 
<a href="http://www.verisign.com/">VeriSign, Inc.</a> 487 East Middlefield Road, Mountain View, CA 94043.
</div>
</td>


<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
    <jsp:include page="right.jsp"/>

</td>

</tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
