<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
    </style>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div align="center"><br><br>
                    <img src="/i/tournament/tchs10/tchs10-logo.png" alt="TopCoder High School" border="0">
                </div>
                <br />
                <div align="center">
                    <%--
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/spotlight_sessions_header.png" alt="Spotlight Sessions" border="0"></a>
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/tchs_spotlightbanner.jpg" alt="Spotlight Sessions" border="0"></a>
                    --%>                
              </div>
                <p align="center">
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=home">Overview</a>&#160;&#160;|&#160;&#160;
                    Rules&#160;&#160;|&#160;&#160;
<a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSSchedule">Schedule</a>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSResults">Results</a>
                </p>
                <br />
                <p><span class="bigTitle">Official Rules &amp; Regulations</span></p>
                <p><strong>No purchase necessary to enter or win. Void where prohibited.</strong></p>
                <p><span class="bigTitle">Overview of the Tournament</span><br />
                  The 2010 TopCoder High School Tournament ("TCHS10" or "Tournament") will take place between February 27, 2010 and March 20, 2010. It will consist of three (3) online elimination rounds ("Online Rounds") and one (1) online Championship round ("Championship Round"). The prize purse for this competition is $10,000 in scholarships and other prizes. Up to fifty (50) competitors will win a scholarship. Up to 500 competitors who compete in round 2 will receive a participatory prize. Up to the 100 highest scoring competitors from Round 3 will advance to the Championship Round, which will be held online on March 20, 2010.         
              <p><span class="bodySubtitle">Eligibility</span><br />
                   <strong>TopCoder members meeting the following criteria are eligible to compete in TCHS10:</strong>
               	  <ul>
                    	<li>Must be a registered for TopCoder High School Competitions at TopCoder; AND</li>
                    	<li>Must be at least 13 years of age; AND</li>
                    	<li>Must be no older than 20 years of age as of March 20, 2010; AND</li>
                    	<li>Must be pursuing a secondary (non university) education at some point during the current tournament</li>
              </ul>
                    TopCoder members who are at least 13 years of age, but not yet 20 years of age by March 20, 2010 are eligible to win scholarships and prizes, unless otherwise prohibited. TCHS10 is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Residents of Cuba, Iran, North Korea, Sudan, or Syria are ineligible to receive cash or prizes. In addition, a TopCoder member is not eligible for the Tournament if the member is on the Specially Designated National list promulgated and amended, from time to time, by the United States Department of the Treasury. 
					<br><br>
                    Employees of TopCoder, Inc. and of all official Tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of this Tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Tournament and members of the immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to enter the Tournament. TopCoder members who are performing internships for any official Tournament sponsor between February 1, 2010 and March 20, 2010 are also ineligible to compete.
					</p>
              <p><span class="bodySubtitle">Registration</span><br />
               	There is no registration as part of the 2010 TopCoder High School Tournament. If you are a registered TopCoder high school member, you will be eligible to participate. If you are a high school student not already registered for TopCoder, please register <a href="http://www.topcoder.com/reg/">here.</a></p>
              <p><span class="bodySubtitle">Online Elimination Rounds</span><br />
                Everyone who competes must register for each round in the TopCoder Competition Arena no later than five (5) minutes prior to the start of the round. TopCoder will communicate each Online Round in TopCoder time Eastern Standard Time (EST) and will be noted as UTC -5.
                <br><br>
                Competitors may be located in and competing from time zones other than EST and must adjust accordingly. If a competitor does not participate, for any reason, in an online round to which he/she has advanced, such competitor shall not advance to the round or be eligible for any prizes or scholarships.
                <br><br>
                All competitors will be randomly assigned to virtual competition rooms. Rooms will be created such that each room has a maximum of 25 competitors. The number of rooms in each round is the # of competitors who advanced to the round divided by 25.
                <br><br>
              The dates and times of the online rounds of competition are as follows:</p>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%" align="center">
                        <tbody>
                            <tr>
                                <td class="title" colspan="4">Schedule</td>
                            </tr>
                            <tr>
                                <td class="header">Round of Competition</td>
                                <td class="header C">Date and Time</td>
                                <td class="header R"># of Competitors</td>
                                <td class="header R"># of Advancers</td>
                            </tr>
                            <tr class="light">
                                <td class="value">Online Round 1</td>
                                <td class="value C">Saturday, February 27, 2010<br />
                                Register: 09:00-11:55 UTC -5<br>
                                START: 12:00 UTC -5</td>
                                <td class="value R"><span class="value C">All eligible competitors</span></td>
                                <td class="R value"><strong>500</strong></td>
                          </tr>
                           <tr class="dark">
                                <td class="value">Online Round 2</td>
                                <td class="value C">Saturday, March 6, 2010<br />
                                    Register: 09:00-11:55 UTC -5<br>
                                    START: 12:00 UTC -5</td>
                                <td class="value R">500<span class="value C"></span></td>
                          <td class="R value"><strong>250</strong></td>
                          </tr>
                            <tr class="light">
                                <td class="value">Online Round 3</td>
                                <td class="value C">Saturday, March 13, 2010<br />
                                    Register: 09:00-11:55 UTC -5<br>
                                    START: 12:00 UTC -5</td>
                              <td class="value R"><span class="value C">Up to 250</span></td>
                              <td class="R value"><strong>100</strong></td>
                          </tr>
                           <tr class="dark">
                                <td class="value">Online Championship Round</td>
                                <td class="value C">Saturday, March 20, 2010<br />
                                    Register: 09:00-11:55 UTC -4<br>
                                    START: 12:00 UTC -4</td>
                                  <td class="value R">Up to 100</td>
                                  <td class="value R">&nbsp;</td>
                          </tr>
                           <tr class="dark">
                             <td colspan="4" class="value"><p>*All times are listed as Eastern  Time and noted as UTC -5 or UTC -4<br>
                               <a href="http://timeanddate.com/worldclock/" target="_blank">Find times in your time zone.</a></p>
                             <p><strong>In the event that a round must be cancelled for any reason, the round will take place the following day at the same time.</strong></p></td>
                           </tr>
                        </tbody>
              </table>

              <p><span class="bodySubtitle">Scoring and Advancing during Online Rounds</span><br />
                    After each Online Round, the highest scorers from across all rooms will be identified and will advance to the next online round. Advancement in all rounds is determined by comparing the total point values from all three phases of the round for each competitor. In order to advance, a competitor must finish each round with a positive (i.e., greater-than-zero) point total. The structure of each Online Round is as follows:
                    <br><br>
                    <strong>Online Round 1</strong><br>
                    All registered competitors will compete and up to 500 will advance.
                    The highest 500 scoring competitors across all rooms will advance to Online Round 2.
                    <br><br>
                    <strong>Online Round 2</strong><br>
                    Up to 500 competitors will compete and up to 250 will advance.
                    The highest 250 scoring competitors across all rooms will advance to Online Round 3.
                    <br><br>
                    <strong>Online Round 3</strong><br>
                    Up to 250 competitors will compete and up to 100 will advance.
                    The highest 100 scoring competitors across all rooms will advance to the Online Championship Round.
                    <br><br>
                    In the event of a tie for any advancing position during the Online Rounds, the tie will be resolved in the following manner:
           	  <ul>
               	  <li>Total points acquired (higher is better) during the previous round of competition.</li>
               	  <li>If a tie still remains, then by best Algorithm rating at the start of the Tournament.</li>
               	  <li>If a tie still remains, then the remaining tied competitors will advance to the next round.</li>
                        </ul>
              <p><span class="bodySubtitle">Competition Round Structure</span><br />
                    Each round of competition consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder High School Single Round Matches. The rules in place for TCHS Single Round Matches as of February 27, 2010 will also apply to the rounds of TCHS10 and are hereby incorporated into these rules.)
                    <br><br>
                    The Coding Phase is a timed event where all competitors are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted.
                    <br><br>
                    The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the challenged competitor, and a 50-point reward for the challenging competitor. Unsuccessful challenging competitors will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition.
                    <br><br>
                    The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.
              </p>
                <p><span class="bodySubtitle">Championship Round</span><br />
                    All competitors will be randomly assigned to virtual competition rooms. Rooms will be created such that each room has a maximum of 25 competitors. The number of rooms in each round is the # of competitors who advanced to the round divided by 25.
                    <br><br>
                    The Championship Round will be a single round of one hundred (100) competitors. The winning competitor in the Championship Round will be the competitor with the highest score in the round.
                    <br><br>
                    In the event of a tie in the Championship Round, the tie will be resolved in the following manner (in order):
           	  <ul>
                        	<li>Total points acquired (higher is better) during Online Rounds #1, #2 and #3 of the 2010 TCHS Tournament.</li>
                        	<li>If a tie still remains in the Championship Round, then the prize will be distributed equally among the remaining tied competitors.</li>
              </ul>
                <p><span class="bodySubtitle">About the Prizes</span><br />
                  The Tournament will award participatory prizes to up to 500 competitors and $10,000 in scholarships and prizes to up to 50 competitors. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner. Prizes will be distributed as follows:</p>
              <table cellpadding="0" cellspacing="0" class="stat" width="100%" align="center">
                  <tbody>
                    <tr>
                      <td class="header">Place</td>
                      <td class="header R">Prize/Scholarship</td>
                    </tr>
                    <tr class="light">
                      <td class="value">1st Place </td>
                      <td class="value R">$3,000</td>
                    </tr>
                    <tr class="dark">
                      <td class="value">2nd Place </td>
                      <td class="value R">$1,500</td>
                    </tr>
                    <tr class="light">
                      <td class="value">3rd Place </td>
                      <td class="value R">$1,000</td>
                    </tr>
                    <tr class="dark">
                      <td class="value">4th Place </td>
                      <td class="value R">$750</td>
                    </tr>
                    <tr class="light">
                      <td class="value">5th Place </td>
                      <td class="value R">$500</td>
                    </tr>
                    <tr class="dark">
                      <td class="value">6th-10th Place</td>
                      <td class="value R">$200 each</td>
                    </tr>
                    <tr class="light">
                      <td class="value">11th-20th Place</td>
                      <td class="value R">$75 each</td>
                    </tr>
                    <tr class="dark">
                      <td class="value">21st-50th Place</td>
                      <td class="value R">$50 each</td>
                    </tr>
                    <tr class="light">
                      <td class="value">Up to 500 competitors who compete in Round 2</td>
                      <td class="value R">Participatory prize which will be sent after the completion of the Tournament</td>
                    </tr>
                    <tr class="dark">
                      <td colspan="2" class="value"><p><em>Prize will be awarded at the conclusion of the Championship Round. TopCoder reserves the right to increase the total prize purse or change the prize breakdown distribution at its sole discretion at any point during the Tournament.</em></p></td>
                    </tr>
                  </tbody>
                </table>
                <p>&nbsp;</p>
                <p><span class="bodySubtitle">Conditions of Participation</span><br />
                    By participating in the Tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.
                    <br><br>
                    <span class="style1">Competitors must not cheat. All ideas for code and/or challenges submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions, an algorithm competition, and/or the Tournament. TopCoder reserves the right, in its sole discretion, to remove any competitor from the Tournament whom it suspects of cheating. </span><br>
                    <br>
                    All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the Tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
                    <br><br>
                    All participatory prizes will be sent via the United States Postal Service. Unclaimed or undeliverable participatory prizes will be forfeited. Prizes will be mailed to the address provided in the TopCoder Profile as of March 1, 2010. Competitors who do not update their TopCoder Profile with correct mailing information by March 1, 2010 will forfeit their participatory prize. Participatory prizes will be mailed within one (1) month after the conclusion of the Championship round. Please allow 6-12 weeks for delivery of your prizes. If your prize is returned, TopCoder will resend your prize to a secondary address provided a request is made by the prizewinning member. TopCoder is not responsible for lost or stolen items and will not send additional prizes due to no receipt.
                    <br><br>
                    As a condition of participation in the Tournament, all information provided by you in your TopCoder High School member profile must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the Tournament. In order to be eligible to participate in the Tournament, you must have completed any and all registration forms required by TopCoder.
                    <br><br>
                    As a condition of winning and redeeming a prize, certain competitors will be required to submit a completed, (i) Affidavit of Eligibility and Liability and Publicity Release, (ii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winning competitor (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder High School member profile, (d) authorizes TopCoder to publicize the Tournament's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the Tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the winning competitor fails to return the Affidavit, W-9 or W-8BEN, as specified, the winning competitor will be disqualified and the prize won by the disqualified winning competitor will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winning competitor.
                    <br><br>
                    By participating in a Tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Tournament, or participation in any Tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.
                    <br><br>
                    In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future Tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including Tournament sponsors, contacts the prizewinner regarding employment opportunities and/or media interest/interview as a result of the prizewinner's participation in the Tournament.
                    <br><br>
                    TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this Tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the Tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
                
                <p><span class="bodySubtitle">Other</span><br />
                  The competition is void in whole or in part where prohibited by law.
                <p><strong>A  list of Tournament winners by TopCoder handles for all competitions will be available on the web site at <a href="http://www.topcoder.com">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the end of the Tournament.</strong>
                
                
                <p>This competition is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.             
                
                </p> </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>