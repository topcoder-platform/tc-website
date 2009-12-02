<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");
	
	long[] experimentalRounds = {13793, 13796, 13797, 13798, 13799, 13800, 13801, 13992};
	Arrays.sort(experimentalRounds);
	
	long[] eligibilityRounds = {13754, 13772, 13793, 13796, 13797, 13798, 13799, 13800, 13801, 13934, 13953, 13992};
	Arrays.sort(eligibilityRounds);
	
	long[] nsaRounds = {14176};
	Arrays.sort(nsaRounds);
	
	long[] assignRounds = {13953,13934,13754,13772,13569,13570,13679,13680,13681};
	Arrays.sort(assignRounds);
	
%>
<c:set var="row" value="<%=rsr%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
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
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

        <jsp:include page="../page_title.jsp">
            <jsp:param name="image" value="long_comps_topcoder"/>
            <jsp:param name="title" value="Contest Details"/>
        </jsp:include>

        <%-- BRANDING --%>
        <c:if test="${row.map['mm_image_path']!=null}">
        <div style="padding: 0px 0px 0px 5px; float: right;">
            <img src="${row.map['mm_image_path']}" alt="Sponsor" border="0">
        </div>
        </c:if>

<%-- FIRST, ALL OF THE EXPERIMENTAL RULES --%>	
<% if (Arrays.binarySearch(experimentalRounds, round_id)>=0) { %>

       <%-- BRANDING --%>
        <h2>${row.map['contest_name']} &gt; ${row.map['round_name']}</h2>

        <h3>Official Contest Rules</h3>

        <div class="sectionHeader">ELIGIBILITY</div>
		<p align="justify">
		The NASA-TopCoder Challenge: A TopCoder Marathon Experimental Invitational Event is a contest (the "Contest") open to individual, registered 
		members of the TopCoder website, who are at least 18 years old and who are lawful residents of the 50 U.S. states, the District of Columbia or 
		Canada (excluding Quebec) and can speak, read and understand English ("Contestant"). The Contest is also open to English-speaking persons, at least 18 
		years old (or the age of majority in jurisdictions where the age of majority is over 18 years and where such Contest is legal), and resident in a country 
		which the United States has not embargoed such activities. Competitors must be (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a 
		temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) 
		a non-U.S. resident authorized in the country in which the member resides while participating in the Contest to perform services as an independent contractor.  
		A Contestant must have legal access to the Internet and means to create and upload an entry to the TopCoder web site. An individual is not eligible for the 
		Contest if he is on the Specially Designated Nationals list promulgated and amended, from time to time, by the Office of Foreign Assets Control of the United 
		States Department of the Treasury. Contestants must further abide by the TopCoder website Terms of Use. Violation of the TopCoder Terms of Use or these 
		Rules may result in disqualification from the Contest. The Contest is void wherever restricted or prohibited by law. The Contest may only be entered from and 
		in eligible jurisdictions. 
        </p>
		
		<div class="sectionHeader">TOPCODER</div>
		<p align="justify">
		The Contest is sponsored by TopCoder, Inc., 95 Glastonbury Blvd., Glastonbury, CT 06033 ("TopCoder") and Professor Karim Lakhani of Harvard Business School and 
		Professor Kevin Boudreau of London Business School 
		("Sponsors"). Employees of TopCoder and Sponsors, its parents and subsidiaries, advertising and promotion agencies and all other entities participating 
		in the design, promotion, marketing, advertising, administration or fulfillment of this Contest and their immediate families and persons living in the same 
		household are ineligible to participate in this Contest. 
		</p>
		
		<div class="sectionHeader">CONTEST PERIOD</div>
		<p align="justify">
		Registration for the Contest ends at 4:59:59 p.m. U.S. Eastern Daylight Savings Time ("EDT") on October 28, 2009.  Invitations and Room assignments 
		will be communicated to Contestants invited by email to participate by the start of the Contest.  The Contest begins at 1:00 p.m. U.S. Eastern Standard 
		Time ("US EST") on November 4, 2009 and ends at 12:59:59 p.m. U.S. EST on November 14, 2009 ("Contest Period"). A Post-Contest survey will be available 
		to be completed November 18-25, 2009.   The Winners will be announced on or about November 25, 2009.  <b>ALL ENTRIES MUST BE SUBMITTED DURING THE CONTEST 
		PERIOD</b>. Entries submitted before or after Contest Period will not be considered or judged. Participation constitutes Contestants full and unconditional 
		agreement to and acceptance of these Official Rules. All federal, state, and local laws and regulations apply. 
		</p>
		
		<div class="sectionHeader">CONTEST DESCRIPTION</div>
		<p align="justify">
		The Contest is designed to encourage the development of software ("Algorithm") that solves the stated computational problem, and also to help TopCoder 
		learn how to improve and evolve in the future.
		<br><br>
		After the close of registration, Contestants invited to participate will be assigned to one of two Groups, and assigned to a Set and Room within the 
		assigned Group, based on the Contestants TopCoder ratings and participation.  TopCoder would like to have active participation in this Competition, 
		and so the numbers are limited.  Contestants who do not have competition history will be treated as having a rating of zero. 
		<br><br>
		Each of Group A and Group B will be subject to different rules for prizes and regarding the sharing of solution information.  If there are 480 Contestants, 
		240 will be in Group A and 240 will be in Group B.  Each Group will be divided into Sets of 20.  If there are less than 480 Contestants, adjustments will be 
		made to the number of Sets in each Group.   
		<br><br>
		In Group A, prizes will be based on performance in the assigned Set.  There will be 20 individuals assigned to each Set, and all members of the Set will be in 
		the same competition Room, competing against the other individuals in that Room for prizes.  In Group B, there will be 20 individuals assigned to each Set, and 
		5 individuals assigned to each Room.  Prizes will be based on the performance of a Room against the other 3 Rooms in that Set.  Within each Set in Group B, 
		there will be 4 Rooms each having 5 Contestants, with the Rooms competing against the other Rooms in that Set for the prizes, and with allocations of the prizes 
		within the winning room based on contribution to the winning solution.
		<br><br>
		Contestants in Group A (Individual) will not be allowed to collaborate with other Contestants in any way, and will not receive any information of others. 
		Contestants in Group A will follow typical Marathon Match rules in that discussion in the competition forums will be limited to questions to the administrator 
		and general discussion, and should not discuss or share information about solving the problem.
		<br><br>
		Contestants in Group B (Teams) will be allowed to share their submissions with other Contestants within their Room using the forums and make use of and 
		improve upon such other Contestants work.  There will be a private forum on the TopCoder web site for each Room in which the members of that Room can communicate 
		with each other.  Competitors for Group B will not be able to see individual scores from other Rooms, but Room scores will be posted once each day. 
		<br><br>
		Contestants in Group B will be able to communicate about solving the problem in their Room forum and will be able to see the submissions posted to the Room 
		forum by others in their Room. 
		<br><br>
		Contestants in Group B, are required to maintain a contribution list in the comments at the top of their submissions, in the form of a template that will be 
		provided, allocating the amount of contribution to their solution that they attribute to other Contestants in their Room.  A final contribution list must be 
		submitted at the end of the Contest.  TopCoder may, at its discretion, reject a contribution list, or modify the allocation in any way if TopCoder in its sole 
		judgment believes that the contribution list was not completed accurately. Completing the contribution list is a requirement of eligibility for all prizes, 
		whether or not Contestants submit code. Contestants will not receive prizes unless they have submitted all contribution lists, including the final contribution 
		list regardless of whether they submitted code during the Contest.
		<br><br>
		Depending on the results of the competition, Sponsors may choose to write a scientific paper that highlights the technical accomplishments in the algorithm and 
		code for that field. The Sponsors have stated that Contestants whose code is featured in the paper will be invited to be co-authors in the publication.  
		In addition to code, and the contribution list for Group B, all submissions must include a written description explaining the approach taken.  
		</p>
		
		<div class="sectionHeader">HOW TO ENTER</div>
		<p align="justify">
		Competition registration takes place on 
		<a href="http://www.topcoder.com/tc?module=MatchDetails&rd=13992">http://www.topcoder.com/tc?module=MatchDetails&rd=13992</a>.  
		Registration must be completed by 4:59:59 p.m. U.S. EST on October 28, 2009.  After registration closes, Contestants will be notified by 
		email of their Group/Room placement, and be automatically registered for their Group/Room.  Each Group/Room will have a separate Marathon Match contest round, 
		including a separate forum area which will be assigned by email.  Contestants may be contacted by competition staff during the registration period, 
		and so should monitor email or any other means of contact provided.  
		</p>
		
		<div class="sectionHeader">SUBMISSION GUIDELINES</div>
		<p align="justify">
		Registered members will see a Submit option for their event. Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly. During the submission phase, overall ranking and provisional score are the only pieces of information that will be made available. A given Contestant will only be allowed to submit once every 2 hours. Additionally, if a Contestant has a pending submission on the testing queue it must finish testing before that Contestant may submit again. 
		<br><br>
		Clicking the Test Examples button will immediately compile and place your Submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Contestants may submit test Submissions once every 15 minutes. The Contestants rank and overall score will not be updated. 
		<br><br>
		In a Marathon Match, all Contestants are encouraged to improve their solutions and resubmit iteratively throughout the length of the submission phase. The most recent Submission is always the one that counts, so if you enter a Submission that does not score as well as a prior Submission, the most recent will still be the one that counts in the standings. Contestants may submit code written in one of the following languages: Java, C++, C#.NET, VB.NET, or Python. 
		<br><br>
		During the Contest, Contestants in each Room must not communicate with Contestants in other Rooms about the Contest, and also must follow the rules for communication with other Contestants who are in their Room. For Group A, all Submissions must be the Contestants original creation, created solely by the Contestant. In Group A, no collaboration or use of the Submissions or ideas of other Contestants is permitted. 
		<br><br>
		For Group B, Contestants can communicate with other Contestants in their Room in the Room forums, and will have access to the Submissions of other Contestants posted in the Room forum. No communication about the problems or solutions outside of the assigned Room forum is permitted. 
		<br><br>
		Contestants must not cheat. Unless otherwise permitted by the collaboration rules (i.e., as described above for Group B, all ideas for any code submitted must be solely the Contestants. Unless otherwise permitted by the collaboration rules (i.e., as described above for Group B), Contestants must use their own independently developed code. In any case, Contestants shall not copy or include code from any other party other than the Contestants in the same Room (if permitted for that group), including publicly available "open source" code that is or may be subject to licensing restrictions. Your Submission may not have been entered in previous contests, nor won previous awards; Nor may your Submission have been previously published or distributed in any media; Your Submission is intended for a family audience and must, in the sole and unfettered discretion of the TopCoder, be suitable for a general audience. 
		<br><br>
		The content of the Submission must not be subject to the rights of any third parties, other than TopCoder, Sponsor and/or their licensors. Submissions may not promote third party products or services, or incorporate third party intellectual property (unless otherwise permitted by the collaboration rules), including, but not limited to copyright protected software, images, characters, logos, names and trademarks. The Submission may not be offensive or otherwise unsuitable for use, as determined in TopCoders sole discretion. TopCoder shall not be responsible for reviewing Submissions that are unworkable for any reason. 
		<br><br>
		As a condition of participating in this Contest and by submitting an entry(ies), each Contestant agrees to permit TopCoder to describe, publicize, and link to your Submission for public viewing. By participating in the Contest, you are granting TopCoder: (1) The right to place links to your Submission for download/viewing on the Contest web site, and (2) The right to host your Submission on the Contest web site and other web sites of TopCoders choosing. A Contestant may terminate participation in the Contest prior to announcement of the winners upon written notice to TopCoder. 

		</p>
		
		<div class="sectionHeader">OWNERSHIP AND RIGHTS</div>
		<p align="justify">
		As a condition of participation, all Competitors hereby grant a perpetual, royalty-free, irrevocable, non-exclusive license to TopCoder and the Sponsors (a) to use, reproduce and publish such Submissions or material in connection with the Contest; (b) to permit TopCoder, Sponsors, and other Contestants to copy, modify, prepare derivative works of, make and use your Submissions in their Submissions and in the Group forums as permitted in these Rules, with the understanding that your Submissions, portions of your Submissions, or derivative works of your Submissions may be part of the winning Submission; (c) to publicly display, and/or feature your Submission and all its content in connection with the promotion of this Contest in all media (now known or later developed); and (d) store your Submission on TopCoder or the Contests TopCoders servers, for marketing purposes, and/or for the promotion of the Contest.  You agree to sign any necessary documentation that may be required by TopCoder or its designees to make use of the rights you granted above. 
		<br><br>
		As a condition of participation, Contestants agree that all Submissions will be licensed for use and/or assigned to TopCoder for unrestricted use by TopCoder and the Sponsor to the extent that they are or are incorporated into winning Submissions.  Contestants agree to assign, grant, transfer, and set over to, TopCoder upon request all right, title and interest throughout the world, along with any and all copyright, patent, trade secret, moral right, and other intellectual property rights, in and to such Submissions. To the extent any rights in a Submission are not assigned or assignable, each Contestant grants and agrees to grant to TopCoder under any and all such rights an irrevocable, paid-up, royalty free, perpetual, exclusive, sublicensable (directly or indirectly through multiple tiers), transferable, and worldwide license to use and permit others to use such Submission in any manner desired by TopCoder (and/or the Sponsors) without restriction or accounting to competitor, including, without limitation, the right to make, have made, sell, offer for sale, use, rent, lease, import, copy, prepare derivative works, publicly display, publicly perform, and distribute all or any part of such Submission and modifications and combinations thereof and to sublicense (directly or indirectly through multiple tiers) or transfer any and all such rights. Further, each Contestant waives and agrees to waive in favor of TopCoder any moral right or other right or claim that is contrary to the intent of a complete transfer of rights to TopCoder.  Contestants agree to promptly execute such documents and perform such acts as TopCoder may reasonably require to perfect TopCoders entire right, title, and interest in and to each and every Covered Submission as defined in the Assignment 2.0 document.  Contest winners must submit TopCoders Assignment 2.0 document prior to payment.  
		<br><br>
		For winning submissions, code designated in code comments as "Library Code" will not be assigned, but will be licensed under the non-exclusive license above. The Library Code designation is for code that was written by the submitter, was in substantial part written prior to the competition, and is not specific to the problem solution. It is expected that the Library Code designation will be used appropriately and in good faith. At TopCoders sole discretion, TopCoder may disqualify a submission for abuse of the "Library Code" designation. 
		<br><br>
		At a time after the competition, which will include time for writing and submission to academic publication(s) if appropriate, the winning submissions will be released under an open source license of the form of the BSD License (http://www.opensource.org/licenses/bsd-license.php).
		<br><br>
		You also understand and acknowledge that TopCoder, and/or other Contestants may have developed or commissioned materials similar or identical to your Submission and you waive any claims you may have resulting from any similarities to your Submission.  Nothing in these Rules shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights they may have in any patents, copyrights, trademarks, service marks or any trade secrets) or in TopCoders web site, by implication, estoppel or otherwise, except as expressly set forth herein.
		</p>
		
		<div class="sectionHeader">SUBMISSION DEADLINES</div>
		<p align="justify">
		The Contest Period ends 12:59:59 p.m. U.S. EST on November 14, 2009.  During the Contest, all Submissions submitted will be judged for performance.  
		<br><br>
		All Submissions will be judged according to the judging criteria below. After the Contest, TopCoder will announce and display each winner and runners-up by handle. 

		</p>
		
		<div class="sectionHeader">JUDGING CRITERIA</div>
		<p align="justify">
		All Submissions will be judged according to the criteria provided in the problem statement. In addition, in Group B, all Contestants Submissions 
		will be judged by the other Contestants in their Room, as described further below. 
		<br><br>
		In Group B, Contestants will complete a contribution list in their submissions attributing contributions to their Submission made by other Contestants 
		in their Room, for example, from discussions in the forums, or from review of other Contestants submissions. The attribution lists from the 5 members 
		of a winning Room (i.e., a Room having the highest performance score of the 4 Rooms in that Set) will be totaled to obtain a contribution list score.  
		The prizes for the winning Room will be allocated based on the ration of the Contestants contribution list score to the total of all Contestants 
		contribution list scores in the winning Room.  For example, if a Contestant in a winning Room received 50% of the Rooms total contribution list score, 
		that Contestant would receive 50% of the Rooms prize, and if a Contestant in a winning Room received 10% of the total contribution list score, that Contestant 
		would receive 10% of the Room’s prize.
		<br><br>
		In Group B, for determining the Grand Prize winners, the score for a Room will be the highest score of the Contestants assigned to that Room.
		<br><br>
		In the unlikely event of a tie in the award of a prize, the sum of the prize money for all tied positions will be distributed equally among the 
		tied Contestants. With respect to the NASA Launch Invitations additional test data may be used to break the tie.  
		<br><br>
		<b>NASA Launch Invitation</b>:  The individuals with the 5 highest scores for Group A will be eligible to receive an invitation from NASA to view a NASA launch 
		as described in this paragraph.  Each active member of the the highest-scoring Room in Group B (there will be up to 5 individuals assigned to a Room) will 
		be eligible to receive an invitation from NASA to view a NASA launch as described in this paragraph.  In all cases, the invitation from NASA to view the 
		NASA launch on NASA premises will be as a courtesy on an as-scheduled and as-possible basis at a date and location to be determined by NASA.  Contestant 
		must complete any paperwork or other requirements of NASA.  <b>It is the sole responsibility of a winning Contestant to arrange and pay for any and all 
		accommodations, expenses, and travel to and from NASAs Kennedy Space Center</b>.  All travel, accommodations, and expenses are at the cost and risk of the 
		Contestant; there is never any promise or guarantee that a launch will take place on a scheduled or invited date. 
		<br><br>
		<b>T-Shirts</b>:  All Contestants who are assigned to a Room and who actively participate are eligible to receive a contest T-shirt. Contestants judged not to 
		have actively participated (as described below) will be disqualified from receiving a T-shirt. T-shirts will be mailed within two months following the 
		conclusion of the Contest via the United States Postal Service to the address provided by the Competitor in their TopCoder profile as of November 4, 2009. 
		Unclaimed or undeliverable T-shirts will be forfeited. Competitors who do not submit the required information by the applicable deadlines forfeit their prizes.  
		Please allow 6-12 weeks for delivery. If your prize is returned, TopCoder will resend your prize to a secondary address provided a request is made by the 
		prizewinning Competitor. TopCoder is not responsible for lost or stolen items and will not send additional T-shirts in the event a T-shirt is not received.    
		<br><br>
		All judges decisions are final and binding in all respects.

		</p>
		
		<div class="sectionHeader">PRIZES</div>
		<p align="justify">
		Cash prizes, an Invitation to View a NASA Launch, and T-shirts will be awarded as follows: 
		
		<table class="bodyText" cellspacing="0" cellpadding="0" border="1">
			<tr>
				<td class="bodyText" align="center"><b>Group</b></td>
				<td class="bodyText" align="center"><b>Summary</b></td>
			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group A</td>
				<td class="bodyText" align="left" valign="top">
					Performance Prizes:  Performance Prizes will be awarded for each Room<br>
					$500 to highest scoring submission.<br>
					$200 to the second highest scoring submission.<br>
					$125 to the third highest scoring submission.<br>
					$100 to the fourth highest scoring submission.<br>
					$75 to the fifth highest scoring submission.<br>
					<br>
					NASA Launch Invitation:  Each of the 5 individuals in Group A with the highest scores will be eligible to receive an invitation from NASA to 
					view a NASA launch as described above. 
					<br><br>
					T-Shirts: All Contestants who are assigned to a Room and who actively participate are eligible to receive a contest T-shirt.
				</td>
			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group B</td>
				<td class="bodyText" align="left" valign="top">
					Performance Prizes: A total of $1000 will be divided among the members of the winning Room in each Set according to the contribution lists 
					submitted by the members of that Room.
					<br><br>
					NASA Launch Invitation: Each of the 5 members (if active) of the highest-scoring Room in Group B will be eligible to receive an invitation 
					from NASA to view a NASA launch as described above.
					<br><br>
					T-Shirts: All Contestants who are assigned to a Room and who actively participate are eligible to receive a contest T-shirt.
				</td>
			</tr>

		</table>
		<br><br>
		In addition, one $1000 cash prize will be awarded to either the individual in Group A or the Room in Group B with the highest score.  
		If this prize is awarded to a Room in Group B it will be divided according to the contribution lists for that Room. 
		<br><br>
		Contestants must be active participants in order to be eligible to receive any prize.  In both Groups A and B, active participation means working on the 
		problem and submitting a reasonable attempt at a solution, including all required parts (e.g., solution description, contribution list in Group B), responding 
		to any email inquiries, and completing all competition-related surveys, including the Post-Competition Survey.  In Group B, active participation includes 
		providing a contribution list as requested, and may include, instead of code submission, productive participation in the Room forums.
		<br><br>
		No prize substitution is allowed except at the discretion of TopCoder. Contest prize winners and runners-up cannot assign or transfer their prize to 
		another person. If a prize cannot be awarded due to circumstances beyond the control of TopCoder, a substitute prize of equal or greater retail value may 
		be awarded. Prizes will be awarded, subject to the limitations stated in these official rules. Any costs or fees not specifically listed herein are the 
		responsibility of Contest winners and runners-up. Taxes, if any, are the sole responsibility of Contest winners and runners-up, and Contestants may be issued 
		an IRS Form 1099. This Contest is void where prohibited or restricted by law, and subject to applicable federal, state provincial and local laws. 

		
		</p>
		
		<div class="sectionHeader">REQUIREMENTS OF WINNER/PUBLICITY</div>
		<p align="justify">
		Contest prize winners and runners-up must provide TopCoder with the required Affidavit of Eligibility and Liability and Publicity Release, unless a 
		notarized copy is already on file with TopCoder, and IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder,, prior to the 
		awarding of any prize. Winners and runners-up in the United States must provide a Taxpayer Identification Number ("TIN"). In the event of a dispute as 
		to authorship of a Submission, TopCoder reserves the right to disqualify any Submission, Contestant, or winner or runner-up; TopCoders eligibility 
		decisions are final. In addition, Contest prize winners and runners-up will be required to sign and return releases of liability, declarations of eligibility, 
		and where lawful, publicity consent agreements, within five (5) days of acknowledged notification. By agreeing to become Contest prize winners or runner-up, 
		Contestant agrees to the use of his or her name, voice and/or likeness, and entry, for the purpose of advertising, trade, or promotion without further 
		compensation, unless prohibited by law. If a selected Contest prize winners or runner-up cannot be contacted, is ineligible (under these rules or due to a 
		failure to comply with any of the other applicable policies, licenses, rules, and terms of service, fails to claim a prize, or fails to timely return the 
		completed and executed releases/agreements as required), prize may be forfeited and an alternate potential winner and/or runner-up may, at TopCoders 
		discretion, be selected. 
		</p>
		
		<div class="sectionHeader">CONDITIONS</div>
		<p align="justify">
		Contest is subject to these Official Rules. By participating, Contestant agrees: (i) to be bound by these complete Official Rules and the decisions of TopCoder which shall be final and binding; and (ii) to waive any right to claim ambiguity in the Contest or these Official Rules, except where prohibited by law. TopCoder reserves the right to cancel or suspend the Contest, in its sole discretion, should it receive fewer than 20 entries, or due to circumstances beyond its control, including natural disasters. TopCoder may, in its sole discretion, cancel, modify or suspend the Contest should a virus, bug, computer problem, unauthorized intervention or other causes beyond TopCoders control, corrupt the administration, security or proper play of the Contest. TopCoder may prohibit a Contestant from participating in the Contest or winning a prize if, in its sole discretion, it determines such Contestant is attempting to undermine the legitimate operation of the Contest by cheating, deception, or any other unfair playing practices of intending to annoy, abuse, threaten, undermine or harass any other Contestants or TopCoder representatives. 
		<br><br>
		By participating in the Contest, Contestant agrees that under no circumstances, including, but not limited to, negligence, shall TopCoder or its licensors, its and their respective officers, directors, employees, shareholders, agents, successors, and assigns, and all prize providers (the "Released Parties") be liable for any direct, indirect, incidental, special, or consequential damages arising out participation in the Contest, even if any or all of the Released Parties have been advised of the possibility of such damages. Some jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, therefore such exclusions may not apply to you. TopCoder and TopCoders parent companies, affiliates, subsidiaries, licensors, advertising, promotion, and fulfillment agencies, and legal advisors, and prize providers, and the respective employees, officers, directors, shareholders, agents, and representatives of each, are not responsible for and shall not be liable for: (i) any errors in Contest-related materials, or late, lost, delayed, damaged, misdirected, stolen, incomplete, illegible, or unintelligible, notices, releases, forms, affidavits, or other correspondence; (ii) telephone, electronic, hardware or software program, network, Internet, or computer malfunctions, failures, interruptions or difficulties of any kind; (iii) failed, incomplete, garbled, or delayed computer transmissions; (iv) any condition caused by events beyond the control of the TopCoder that may cause the Contest to be disrupted or corrupted; (v) any injuries, losses, or damages of any kind arising in connection with or as a result of the prizes, or acceptance, possession, or use of the prizes, or from participation in the Contest or arising from the Contestants access to and use of the Internet site http://www.topcoder.com, including without limitation, personal injury, death, and property damage, and claims based on publicity rights, defamation, or invasion of privacy, to the extent permitted by law; or (vi) any errors in any materials associated with the Contest. TopCoder reserves the right to cancel, suspend and/or modify the Contest if any problem corrupts the administration, security, or operation of the Contest, as determined by TopCoder in its sole discretion. TopCoder reserves the right in its sole discretion to disqualify any Contestant it finds to be tampering with the entry process or the operation of the Contest or to be acting in violation of these Official Rules or in an unsportsmanlike or disruptive manner. Any attempt by any person to undermine the legitimate operation of the Contest may be a violation of criminal and civil law, and, should such an attempt be made, TopCoder reserves the right to seek damages from any such person to the fullest extent permitted by law. TopCoders failure to enforce any term of these Official Rules shall not constitute a waiver of that provision.
		</p>
		
		<div class="sectionHeader">PRIVACY</div>
		<p align="justify">
		<b>All Contest data will be shared with researchers at Harvard Business School and London Business School ("Researchers") for use in research and may be 
		published. Members may be publicly identified by handle in such published research.  Contact information provided by Contestants for this competition 
		may be provided to the Researchers and used by TopCoder or Researchers to contact Contestants during or immediately following the Competition for the purposes 
		of administering the Competition and research.  Contribution lists, competition survey results will be provided to Researchers for use in the research.</b>  
		All information is collected in the United States, and except as set forth in this paragraph, the use of any personally identifiable information is subject 
		to the terms of the TopCoder Privacy Statement located at: 
		<a href="http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy">http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy</a> . By entering the Contest, the 
		Contestant acknowledges that TopCoder will collect, process and use the personal data provided by the Contestant in connection with and for the purpose 
		of administering of the Contest. Data about usage of the Contest also will be collected. 
		</p>
		
		<div class="sectionHeader">DISPUTES</div>
		<p align="justify">
		The laws of the United States and the State of Connecticut govern this Contest. As a condition of participating in the Contest, Contestant agrees that any and all actions or proceedings related to the Contest shall be exclusively brought in Superior Court, State of Connecticut (if under state law), Hartford Judicial District or U.S. District Court in the State of Connecticut (if under Federal law), and the parties agree not to raise in connection therewith, and hereby waive, any defenses based upon the venue, the inconvenience of the forum, the lack of personal jurisdiction, the sufficiency of service of process or the like in any such action or suit brought in the State of Connecticut.
		</p>
		
		<div class="sectionHeader">WINNERS LIST AND OFFICIAL RULES</div>
		<p align="justify">
		A winners list will be posted on the web site http://www.topcoder.com until 90 days after the end of Contest. To obtain a copy of the winners list or a copy of these Official Rules, send your request along with a stamped, self-addressed envelope to: TopCoder, Inc., Attn: Marathon Experimental Series, 95 Glastonbury Boulevard, Glastonbury, CT 06033. Requests must be received no more than 90 days after the end of Contest. To find out more about the Marathon Experimental Series Contest, visit www.topcoder.com. If you have any questions regarding these Rules, contact us at service@topcoder.com.
		</p>
		
		Copyright &copy; 2009,  TopCoder, Inc.  All rights reserved.
		
<%} else { %>
        <%-- BRANDING --%>
        <h2>${row.map['contest_name']} &gt; ${row.map['round_name']}</h2>

        <h3>Official Rules &amp Regulations</h3>

        <p align="justify">
        No purchase necessary to enter or win.
        </p>

        <div class="sectionHeader">About the Competition</div>

        <p align="justify">
            <strong>When to start the Competition Round</strong><br />
            TopCoder members must register for the competition round. Registration may occur at any time
            from.
            <rsc:item name="reg_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            to
            <rsc:item name="reg_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            
            All competitors who have registered for the competition round will immediately be given
            access
            to the competition problem statement for that round. The competition round will begin
            at
            <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            which is the
            earliest time that any member will be given
            access to the problem statement.
        </p>
        <p align="justify">
            <strong>Upon Entering a Marathon Match</strong><br />
            All competitors registered for a specific Marathon Match will see a Submit option 
            for that event. Clicking the Submit link will take you to a page that will 
            allow you to paste in a solution, select the proper language and either submit 
            (for compilation and testing) or save your code. When the Submit button is 
            selected, the code will be immediately compiled. Any compilation messages 
            or errors will be shown in the Messages Area. If the compilation was 
            successful, the submission will then be placed on a queue for automated testing. 
            Example test cases will not be tested. When your submission has been processed,
            you will receive an email indicating such and your place in the standings will 
            be adjusted accordingly. During the submission phase, overall ranking and 
            provisional score are the only pieces of information that will be made 
            available. A given competitor will only be allowed to submit once every 
            2 hours.  Additionally, if a competitor has a pending submission on the 
            testing queue it must finish testing before they may submit again.
        </p>
        <p align="justify">
            Clicking the Test Examples button will immediately compile and place your 
            submission on a queue for automated testing of just the example test cases. 
            Detailed feedback will be made available when the tests are complete, 
            including processing time, score, and any output from the program. 
            Competitors may submit test examples once every 15 minutes. The competitors 
            rank and overall score will not be updated.
        </p>

    <%if(rsr.getIntItem("round_id") == 10834) {%>
        <div class="sectionHeader">Prizes</div>
        <p align="justify">
        There will be $5000 in total prize money. The first and second highest 
        scoring submissions in each of the five languages supported will 
        receive $750 and $250, respectively.
        </p>
        <p align="justify">
        In order to be eligible for prizes, a competitor must be a TopCoder 
        member in good standing, at least 18 years of age, and must not be a 
        resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, 
        the Quebec province of Canada, or anywhere else where this contest is 
        prohibited by applicable law.
        </p>
    <%}%>
	
    <%if(rsr.getIntItem("round_id") == 13953 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13569 || 
	  rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 ) {%>
		<div class="sectionHeader">Prizes</div>
		<p align="justify">There will be up to $5000 in total prize money awarded to the five(5) highest scoring participating members. </p>

		<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
		<tr>
			<td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$2500</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$1000</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$750</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$500</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$250</td>
		</tr>
		</table>
    <%}%>

    <%if(rsr.getIntItem("round_id") == 13772 ) {%>
		<div class="sectionHeader">Prizes</div>
		<p align="justify">There will be $10,000 in total prize money.  The 5 highest scorers in the round will receive prizes as follows:</p>

		<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
		<tr>
			<td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$5,000</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$2,000</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$1,500</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$1,000</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$500</td>
		</tr>
		</table>
    <%}%>
	
	<% if (Arrays.binarySearch(nsaRounds, round_id)>=0) { %>
	
		<div class="sectionHeader">Prizes</div>
		<p align="justify">
			There will be up to $3000 in total prize money awarded to the five (5) highest scoring members who
			are citizens of the United States.
		</p>

		<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
		<tr>
			<td class="bodyText" nowrap="nowrap">1st</td><td class="bodyText" align="right">$1500</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">2nd</td><td class="bodyText" align="right">$750</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">3rd</td><td class="bodyText" align="right">$400</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">4th</td><td class="bodyText" align="right">$250</td>
		</tr>
		<tr>
			<td class="bodyText" nowrap="nowrap">5th</td><td class="bodyText" align="right">$100</td>
		</tr>
		</table>
	
	<% } %>

    <p align="justify">
       
    </p>

    <div class="sectionHeader">Conditions of Participation</div>

    <p align="justify">
        By participating in the competition round, you agree to be bound by these rules and to all decisions
        of TopCoder, which are final, binding and conclusive in all matters.
    </p>

    <%if(rsr.getIntItem("round_id") == 10834) {%>
        <p align="justify">
            By participating in this Competition, you agree to license any code you 
            submit in this Competition under the GNU General Public License as 
            published by the Free Software Foundation, Version 2.0 to all other
            competitors participating in this Competition (the terms and conditions
            of the license may be found at 
            <a href="http://www.opensource.org/licenses/gpl-license.php">http://www.opensource.org/licenses/gpl-license.php</a>.
        </p>
    <%}%>
    
    <%if(rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || 
	     rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 || rsr.getIntItem("round_id") == 13934 ||
		 rsr.getIntItem("round_id") == 13953 || rsr.getIntItem("round_id") == 14000) {%>
		<p align="justify">
			Competitors must not cheat; all ideas for any code submitted must be the contestants alone. Competitors must use their own 
			independently developed code, and shall not copy or include code from any other party, including publicly available "open source" 
			code that is or may be subject to licensing restrictions.
		</p>
    <%} else { %>
        <p align="justify">
			Contestants must not cheat; all ideas for any code submitted must be the contestants alone.
        </p>
    <% } %>

     <p align="justify">		
		The winner of the competition will be the competitor that scores the most points across all competitors 
		who participate. All decisions relating to the viability of submissions, the ranking of submissions and 
		all other matters pertaining to the competition shall be within the sole discretion of TopCoder or its 
		designee and shall be final and binding in all respects.
     </p>

     <p align="justify">
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, 
        its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, 
        and all of their respective directors, officers, employees, representatives and agents, from and 
        against any and all liability for any loss, property damage or damage to person, including without 
        limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out 
        of participation in this competition, or participation in any competition-related activity, or 
        the receipt, use or misuse of a prize.
     </p>

     <p align="justify">
        TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with 
        the entry process, the operation of the Web site, the competition process, or is otherwise 
        in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the 
        competition if it is not capable of completion as planned for any reason, including infection 
        by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
     </p>
        
     <p align="justify">
	 
		<% if (Arrays.binarySearch(assignRounds, round_id)>=0) { %>
		
			As a condition of winning and redeeming a cash prize, Competitors will be required to submit, 
			among other things, a completed TopCoder Competition Assignment Agreement, 
			if one is not already on file with TopCoder and a one-page description explaining how the algorithm for the winning submission works.

		<%} else { %>

			TopCoder does not require assignment of winning submissions in this competition.

		<%}%>

     </p>

    <div class="sectionHeader">Eligibility</div>

    <%if(rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681) {%>

		<p align="justify">
			The competition is open to all members who are at least 18 years of age. Competitors must be either (i) a U.S. citizen, (ii) a lawful permanent 
			resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting 
			unrestricted employment in the U.S., or (iv) a non-U.S. resident authorized to perform services as an independent contractor.
		</p>
		<p align="justify">
			To be eligible for this competition, you must not be a resident of the Quebec province of Canada, Iran, Cuba, North Korea, Sudan or Syria. In addition, you are not eligible for this Competition if you are on the Specially Designated National list promulgated and amended, from time to time, by the United States Department of the Treasury.
		</p>
		
	<%} else if (Arrays.binarySearch(nsaRounds, round_id)>=0) { %>
	
		<p align="justify">
			The competition is open to all members who are at least 18 years of age who are U.S. citizens.
		</p>
		<p align="justify">
			You are not eligible for this Competition if you are on the Specially Designated National list promulgated and 
			amended, from time to time, by the United States Department of the Treasury. 
		</p>
		
    <%} else { %>
	
        <p align="justify">
			The competition is open to all members who are at least 13 years of age.
        </p>
		
    <%}%>
	
    <p align="justify">
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this page prior to
        participating in this competition.
    </p>

    <p align="justify">
        Employees of TopCoder and those involved in the development, production (including 
        prize suppliers and sponsors), implementation and distribution of this competition 
        and their advertising or promotion agencies, parent companies, service providers, 
        agents, officers, subsidiaries or affiliates, or any other persons or entities 
        directly associated with the competition and members of the immediate families 
        and/or persons living in the same household as such persons, are ineligible to 
        enter the competition. 
    </p>


    <div class="sectionHeader">Ownership and Rights</div>
    
	<% if (Arrays.binarySearch(assignRounds, round_id)>=0) { %>
		
		<p align="justify">
			You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property 
			rights, in and to the information posted on TopCoders website(s). If TopCoder compensates you for your submission, then you agree to irrevocably 
			and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, such submission, and you agree 
			to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to 
			vest in TopCoder the ownership rights granted to TopCoder hereunder. If TopCoder does not compensate you for your submission, then you retain any and 
			all rights to ownership of such material submitted to TopCoder. TopCoder will not gain ownership of this material. However, by submitting any submission 
			or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, non-exclusive right and license to TopCoder to use, reproduce 
			and publish such documents, materials or source code for commercial and/or non-commercial use. 
		</p>
		<p align="justify">
			You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed 
			to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely 
			and exclusively to TopCoder from the time of their creation. To the extent any such work of authorship may not be deemed to be a work made for hire, you 
			agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work. 
		</p>

	<%} else { %>

		<p align="justify">
			You retain any and all rights to ownership of your submissions submitted to TopCoder. 
			TopCoder will not gain ownership of this material. However, by submitting any submission 
			or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, non-exclusive right and license to TopCoder to use, reproduce 
			and publish such documents, materials or source code for commercial and/or non-commercial use. 
		</p>
		
	<%}%>
	
    <p align="justify">
		You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue 
		any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder 
		above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, 
		to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the 
		prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed 
		by your authorized agent. 
    </p>
    <p align="justify">
		Nothing in these rules and regulations shall be construed as granting you any right or license under any intellectual property right of TopCoder 
		(including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel 
		or otherwise, except as expressly set forth herein. 
    </p>

    <div class="sectionHeader">Confidential Information</div>

    <p align="justify">You acknowledge the confidential and proprietary nature of the information you obtain from TopCoder regarding design specifications and functionality and/or development solutions, including, but not limited to, scope documents and source code. You also acknowledge the confidential and proprietary nature of the information contained in the project postings and in the customer and developer forums on TopCoders website(s). You also agree (i) to hold such information in confidence and to take all reasonable precautions to protect such confidential information (including, without limitation, all precautions you may employ with respect to your own confidential materials), (ii) not to divulge any such confidential information to any third person; and (iii) not to make any use whatsoever of such confidential information except as expressly authorized in these Terms. 
    </p>

    <div class="sectionHeader">Indemnification and Release</div>

    <p align="justify">By submitting design documents and/or source code in response to projects posted on TopCoders website(s) and/or otherwise participating in forum and newsgroup discussions on TopCoders customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoders officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorneys fees, arising from your use of TopCoders website(s) and/or the materials gained from TopCoders website(s) or directly from TopCoder, including any material (including third party material) that you post on TopCoders website(s) or in any news forums and any services or products available through TopCoders website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoders officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoders website(s). You hereby agree to waive all laws that may limit the efficacy of such releases. 
    </p>

    <div class="sectionHeader">DISCLAIMER</div>

    <p align="justify">THE MATERIALS AND SERVICES ON TOPCODERS WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODERS WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODERS WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODERS WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU. 
    </p>
    <p align="justify">Documents, graphics and other materials appearing at TopCoders website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk. 
    </p>

    <div class="sectionHeader">LIMITATION OF LIABILITY</div>

    <p align="justify">TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER. 
    </p>

    <div class="sectionHeader">Choice of Law and Forum</div>

    <p align="justify">
		These Terms are governed by the laws of the State of Connecticut. You hereby agree to submit to the exclusive jurisdiction 
		of the courts of the State of Connecticut. To the extent that applicable laws have mandatory application to these Terms or 
		give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoders website(s) and 
		participation in projects posted on TopCoders website(s) are unauthorized in any jurisdiction that does not give full effect to all 
		provisions of these Terms. 
    </p>

    <div class="sectionHeader">Severability and Enforceability</div>

    <p align="justify">
		If any provision or portion of these rules and regulations are held illegal, invalid, or unenforceable, in whole or in part, 
		it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as 
		is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability 
		of any other provisions or portions of these Terms. 
    </p>

    <div class="sectionHeader">Termination/Exclusion</div>

    <p align="justify">
		TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with accessing and/or 
		participating in the projects posted on its website(s), and to take any other action it deems appropriate including but not 
		limited to terminating or suspending your use of www.topcoder.com and/or www.topcodersoftware.com for no reason or any reason 
		whatsoever, including improper use of its website(s) or failure to comply with these Terms or the Terms of Use of TopCoders websites, 
		which are incorporated herein by reference. 
    </p>
    

    <div class="sectionHeader">Other</div>
        
    <p align="justify">
        The competition is void in whole or in part where prohibited by law. 
    </p>
        
    <p align="justify">
        A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com
        displayed for at least 3 months after the end of the competition.
    </p>

    <%if(rsr.getIntItem("round_id") == 13953 || rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  
	  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681) {%>

		<p align="justify">
			TopCoder may assign, novate or subcontract any or all of its rights and obligations under these rules and regulations at any time.
		</p>

    <%}%>
        
    <p align="justify">
        This competition is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.
    </p>

    <p align="justify">
    If you have any questions regarding these Terms, contact us at <a href="mailto:service@topcoder.com">service@topcoder.com</a>
    </p>

    <h2 align="center">
        <a href="?<%=Constants.MODULE_KEY%>=MatchDetails&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}" class="bcLink">Back to Contest Details</a>
    </h2>

    </div>
    </td>
		
		
<%-- END OF THE EXPERIMENTAL RULES IF BLOCK --%>
<%}%>	
		
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
