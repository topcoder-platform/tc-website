<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="contests"/>
               <jsp:param name="level3" value="ultimate"/>
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


<h2>Rules</h2>

<h3>Placement Scoring</h3>
<p>Scoring in the USDC is determined based on the placement for each submission. Placement is determined based on the score awarded 
for a particular component.  For example, if 3 submissions were received for 1 component and the scores were 93, 89, and 71, the 
member receiving the score of 93 would be in 1st place and would receive 10 points. Placement scoring is as follows: </p>
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

<h3>Contest Parameters</h3>

<p><strong>Registration</strong><br/>
All members who are participating in the weekly contest must register for a component within 24 hours of the weekly posting date.  
Failure to register for one component will result in disqualification for that weekly contest.</p>

<p><strong>Reliability Rating</strong><br/>
Member profiles will be modified to reflect a reliability factor for component design and development competitions. 
The reliability factor will be calculated as the percent of projects that a member registers for in which that same 
member presents a timely submission that achieves the minimum passing component score of 70.</p>

<p>Members will be eligible to receive a bonus on top of the prize money if their Reliability Ratings are equal to or 
exceed 80%.  Winning members with Reliability Ratings ranging from 80% to 89% will receive a bonus equal to 10% of the prize.  
For Reliability Ratings ranging from 90% to 94%, winning members will receive a bonus equal to 15% of the prize.  And 
winning members with a Reliability Rating of 95% to 100% will receive a bonus equal to 20% of the prize.  The following is an 
example of payouts based on the member's Reliability Rating:</p>


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


<h3>Eligibility</h3>

<p>TopCoder members meeting the following criteria are eligible to compete in the Contest:</p>

	<ul>
	<li>Must be at least 18 years of age (as of May 6, 2004)</li>
	<li>Must not have been permanently suspended from participating in TopCoder Component Development projects</li>
	<li>Must not be otherwise prohibited from performing independent software development services as an independent contractor</li>
	</ul>
<p>The Contest is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law.  
Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria. </p>

<p>Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of 
this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or 
affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or 
persons living in the same household as such persons, are ineligible to enter the tournament.</p>

<p><strong>Conditions of Participation</strong><br/>
By participating in the contest, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and 
conclusive in all matters.Contestants must not cheat. All ideas for any component design or development solution submitted must be 
the contestant's alone. All decisions relating to the viability of submissions, the ranking of submissions and all other matters 
pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>

<p>As a condition of participation in the tournament, all information provided in each competitor's TopCoder member profile must be 
comprehensive, accurate and up-to-date. TopCoder may require each competitor to complete an additional registration form to register 
for the tournament. In order to be eligible to participate in the tournament, each competitor must have completed any and all 
registration forms required by TopCoder.</p>

<p>As a condition of winning and redeeming a cash prize, winners will be required to return a completed (i) notarized Affidavit of 
Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9, W-8BEN, or W-8ECI, as appropriate, if one is not already on 
file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winner (i) confirms his/her 
eligibility, (ii) represents and warrants that he/she has not cheated; that the idea for the component design and/or development 
solution submitted is his/hers alone, (iii) verifies the accuracy of the demographic information submitted to, and contained in, 
the TopCoder member database, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable 
forms required by tax authorities, (vi) assigns to TopCoder all rights to all information submitted during the tournament 
(including rights to source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won. 
TopCoder requires contestants to complete the Form W-9, W-8BEN, or W-8ECI for tax reporting purposes. If prize notification is 
returned as undeliverable, or if the winner fails to return the Affidavit, or the appropriate tax form, the winner will be 
disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration 
process or in the required forms described in this paragraph will disqualify a winner.</p>

<p>By participating in this contest and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, 
subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, 
employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, 
including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation 
in this tournament, or participation in any contest-related activity, or the receipt, use or misuse of a prize. TopCoder specifically 
disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>

<p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This 
includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, 
for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and 
any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a 
third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's 
participation in the contest.</p>

<p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this contest, 
and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors 
of cheating, tampering with the entry process, the operation of the Web site, or the contest process, or otherwise being in violation 
of the rules. TopCoder reserves the right to cancel, terminate or modify the contest if it is not capable of completion as planned for 
any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.  
The initial term of the contest shall be 1 month, after which the contest will automatically continue, unless otherwise terminated by TopCoder.</p>

<h3>Other</h3>
<p>The contest is void in whole or in part where prohibited by law.</p>

<p>This contest is brought to you by TopCoder, Inc. (<a href="http://www.topcoder.com/">http://www.topcoder.com/</a>) 703 Hebron Avenue, Glastonbury, CT 06033.</p>

<p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="right.jsp"/>
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
