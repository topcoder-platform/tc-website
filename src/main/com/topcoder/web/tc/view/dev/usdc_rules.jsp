<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />


<!-- Tab bar links-->
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="rules"/>
</jsp:include>


<h2>Official Rules</h2>

<p>By participating in the Ultimate Software Development Contest (the "USDC" or the "Contest") you hereby 
agree to comply with the following rules and regulations of the Contest.</p>

<h3>Eligibility</h3>

<p>TopCoder members meeting the following criteria are eligible to compete in the Contest:</p>

	<ul>
	<li>Must be at least 18 years of age (as of May 6, 2004)</li>
	<li>Must not have been permanently suspended from participating in TopCoder Component Development projects</li>
	<li>Must be either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, 
	refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., 
	or (iv) a non-U.S. resident authorized to perform services as an independent contractor.</li>
	</ul>
<p>The Contest is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law.  
Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria. </p>

<p>Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of 
this contest and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or 
affiliates, or any other persons or entities directly associated with the contest and members of the immediate families and/or 
persons living in the same household as such persons, are ineligible to enter the Contest.</p>

<h3>Registration</h3>

<p>All members who are participating in each weekly contest must register for at least one component within 48 hours 
of the weekly posting date to be eligible for that week's prizes.</p>

<h3>Placement Scoring</h3>
<p>Scoring in the USDC is determined based on the placement for each submission. Placement is determined based on the score awarded for a 
particular component. For example, if 3 submissions were received for one Level 1 component and the scores were 93, 89, and 71, the member 
receiving the score of 93 would be in 1st place and would receive 10 points.   In order to receive placement points the submission must 
pass the minimum component score of 70. Placement scoring is as follows: </p>
<table width="400" align="center" border="0" cellpadding="5" cellspacing="2">
	<tr>
		<td class="bodyText">
			<p><strong>Level 1 Components</strong><br/>
			1st Place - 10 Points<br/>
			2nd Place - 7 Points<br/>
			3rd Place - 5 points<br/>
			4th Place - 4 Points<br/>
			5th Place - 0 Points</p>
		</td>
		<td class="bodyText">

			<p><strong>Level 2 Components</strong><br/>
			1st Place - 12 Points<br/>
			2nd Place - 9 Points<br/>
			3rd Place - 7 points<br/>
			4th Place - 6 Points<br/>
			5th Place - 0 Points</p>
		</td>
	</tr>
</table>


<h3>Prizes</h3>
<p>If for any reason a prize is not awarded during the course of the Contest (i.e., the minimum number of submissions was not 
received, the category was not offered, etc.), that prize will be forfeited.</p>


<h3>Reliability Rating</h3>

<p>Member profiles have been modified to reflect a reliability factor for all component design and development competitions. 
The reliability factor is calculated as the percent of projects that a member registers for in which that same 
member presents a timely submission that passes screening.</p>

<p>Members will be eligible to receive a bonus on top of any prize money won if their Reliability Ratings are equal to or exceed 
80%. Winning members with Reliability Ratings equal to or exceeding 80% and less than 90% will receive a bonus equal to 10% 
of the prize. For Reliability Ratings equal to or exceeding 90% and less than 95%, winning members will receive a bonus equal 
to 15% of the prize. And winning members with a Reliability Rating equal to or exceeding of 95% will receive a bonus equal 
to 20% of the prize. The following is an example of payouts based on the member's Reliability Rating:</p>


			<table width="400" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">

                <tr>
                	
                	<td class="sidebarTitle">0% - 79%</td>
                    <td class="sidebarTitle">80% - 89%</td>
                    <td class="sidebarTitle">90% - 94%</td>
                    <td class="sidebarTitle">95 - 100%</td>
                </tr>
                
                
                <tr>
                	
                    <td class="sidebarText">$5,000</td>
                    <td class="sidebarText">$5,500</td>
                    <td class="sidebarText">$5,750</td>
                    <td class="sidebarText">$6,000</td>
                </tr>
                <tr>
                	
                    <td class="sidebarText">$2,000</td>
                    <td class="sidebarText">$2,200</td>
                    <td class="sidebarText">$2,300</td>
                    <td class="sidebarText">$2,400</td>
                </tr>                
                <tr>
                	
                    <td class="sidebarText">$500</td>
                    <td class="sidebarText">$550</td>
                    <td class="sidebarText">$575</td>
                    <td class="sidebarText">$600</td>
                </tr>
               	<tr>
               		
                    <td class="sidebarText">$200</td>
                    <td class="sidebarText">$220</td>
                    <td class="sidebarText">$230</td>
                    <td class="sidebarText">$240</td>
                </tr>
               	<tr>
               		
                    <td class="sidebarText">$100</td>
                    <td class="sidebarText">$110</td>
                    <td class="sidebarText">$115</td>
                    <td class="sidebarText">$120</td>
                </tr> 
                               
            </table>




<h3>Conditions of Participation</h3>

<p>By participating in the Contest, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and 
conclusive in all matters. Contestants must not cheat. All ideas for any component design or development solution submitted must be 
the contestant's alone. All decisions relating to the viability of submissions, the ranking of submissions and all other matters 
pertaining to the Contest shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>

<p>As a condition of participation in the Contest, all information provided in each competitor's TopCoder member profile must be 
comprehensive, accurate and up-to-date. TopCoder may require each competitor to complete an additional registration form to register 
for the contest. In order to be eligible to participate in the Contest, each competitor must have completed any and all 
registration forms required by TopCoder.</p>

<p>As a condition of winning and redeeming a cash prize, winners will be required to return a completed (i) Affidavit of 
Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9, W-8BEN, or W-8ECI, as appropriate, if one is not already on 
file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release (notarized if one is not already 
on file with TopCoder), a winner (i) confirms his/her 
eligibility, (ii) represents and warrants that he/she has not cheated; that the idea for the component design and/or development 
solution submitted is his/hers alone, (iii) verifies the accuracy of the demographic information submitted to, and contained in, 
the TopCoder member database, (iv) authorizes TopCoder to publicize the contest's results, (v) agrees to sign any applicable 
forms required by tax authorities, (vi) assigns to TopCoder all rights to all information submitted during the contest 
(including rights to source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won. 
TopCoder requires contestants to complete the Form W-9, W-8BEN, or W-8ECI for tax reporting purposes. If prize notification is 
returned as undeliverable, or if the winner fails to return the Affidavit, or the appropriate tax form, the winner will be 
disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration 
process or in the required forms described in this paragraph will disqualify a winner.</p>

<p>By participating in this Contest, a winner releases and agrees to hold harmless TopCoder, its affiliates, 
subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, 
employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, 
including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation 
in this contest, or participation in any contest-related activity, or the receipt, use or misuse of a prize. TopCoder specifically 
disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>

<p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This 
includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, 
for this or similar future contests, and to use the statements made by, or attributed to, the winners relating to TopCoder and 
any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a 
third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's 
participation in the Contest.</p>

<p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this Contest, 
and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors 
of cheating, tampering with the entry process, the operation of the Web site, or the contest process, or otherwise being in violation 
of the rules. TopCoder reserves the right to cancel, terminate or modify the Contest if it is not capable of completion as planned for 
any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>

<h3>Other</h3>
<p>The contest is void in whole or in part where prohibited by law.</p>

<p>This contest is brought to you by TopCoder, Inc. (<a href="http://www.topcoder.com/">http://www.topcoder.com/</a>) 95 Glastonbury Blvd, Glastonbury, CT 06033.</p>

<p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
