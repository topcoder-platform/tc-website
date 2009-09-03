<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");

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
<%if(rsr.getIntItem("round_id") == 13793 || rsr.getIntItem("round_id") == 13796 || rsr.getIntItem("round_id") == 13797 || rsr.getIntItem("round_id") == 13798
     || rsr.getIntItem("round_id") == 13799 || rsr.getIntItem("round_id") == 13800 || rsr.getIntItem("round_id") == 13801) {%>
       <%-- BRANDING --%>
        <h2>${row.map['contest_name']} &gt; ${row.map['round_name']}</h2>

        <h3>Official Contest Rules</h3>

        <div class="sectionHeader">ELIGIBILITY</div>
		<p align="justify">
        The TopCoder Marathon Experimental Series is a contest (the "Contest") open to individual, registered members of the TopCoder website, who are at 
		least 18 years old and who are lawful residents of the 50 U.S. states, the District of Columbia or Canada (excluding Quebec) and can speak, read 
		and understand English ("Contestant").  The Contest is also open to English-speaking persons, at least 18 years old (or the age of majority in 
		jurisdictions where the age of majority is over 18 years and where such Contest is legal), and resident in a country which the United States has 
		not embargoed such activities.  Competitors must be (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, 
		asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) a non-U.S. 
		resident authorized in the country in which the member resides while participating in the Contest to perform services as an independent contractor.

		A Contestant must have legal access to the Internet and means to create and upload an entry to the TopCoder web site.  
		An individual is not eligible for the Contest if he is on the Specially Designated Nationals list promulgated and amended, from time to time, by 
		the Office of Foreign Assets Control of the United States Department of the Treasury. Contestants must further abide by the TopCoder website Terms 
		of Use.  Violation of the TopCoder Terms of Use or these Rules may result in disqualification from the Contest.  The Contest is void wherever 
		restricted or prohibited by law. The Contest may only be entered from and in eligible jurisdictions. 
        </p>
		
		<div class="sectionHeader">TOPCODER</div>
		<p align="justify">
		The Contest is sponsored by TopCoder, Inc., 95 Glastonbury Blvd., Glastonbury, CT 06033 ("TopCoder") and Harvard University ("Sponsors").  Employees of TopCoder and Sponsors, its parents and subsidiaries, advertising and promotion agencies and all other entities participating in the design, promotion, marketing, advertising, administration or fulfillment of this Contest and their immediate families and persons living in the same household are ineligible to participate in this Contest.
		</p>
		
		<div class="sectionHeader">CONTEST PERIOD</div>
		<p align="justify">
		Registration for the Contest ends at 8:59:59 a.m. U.S. EDT on April 13, 2009. The Contest begins at 1:00 p.m. U.S. Eastern Daylight Time ("US EDT") on April 13, 2009 and ends at 1:59:59 p.m. U.S. EDT on April 27, 2009 ("Contest Period"). The Winners will be announced on or about May 1, 2009. <b>ALL ENTRIES MUST BE SUBMITTED DURING THE CONTEST PERIOD</b>.  Entries submitted before or after Contest Period will not be considered or judged.  Participation constitutes Contestant's full and unconditional agreement to and acceptance of these Official Rules. All federal, state, and local laws and regulations apply.
		</p>
		
		<div class="sectionHeader">CONTEST DESCRIPTION</div>
		<p align="justify">
		The Contest is designed to encourage the development of software ("Algorithm") that solves the stated computational problem, and also tests the collaboration strategy that is most effective for solving computational problems.  There will be two phases, with prizes awarded for submissions in the first phase, and additional prizes for submissions in the second phase. 
		<br><br>
		After the close of registration, Contestants will be assigned to one of three Groups based on their Marathon Match rating, so as to evenly allocate skill levels among the Groups.  Contestants who do not have a Marathon Match rating will be treated as having a rating of zero.  Each Group will have different rules regarding the sharing of solution information.  There will be a private forum on the TopCoder web site for each of the Groups to communicate.
		<br><br>
		Group A will not be allowed to collaborate with other Contestants in any way, and will not receive any information of others.  Group C Contestants will be allowed to see other Contestants' Submissions and make use of and improve upon such other Contestant's work.  Group B not be allowed to collaborate with other Contestants during the first phase, but during the second phase will be allowed to see, make use of, and improve upon other Contestant's Submissions.  
		<br><br>
		Competitors in Group A during both phases, and in Group B only during the first phase, will follow typical Marathon Match rules.  Discussion in the competition forums will be limited to questions and general discussion, and should not discuss or share information about solving the problem.  
		<br><br>
		Competitors in Group B only in the second phase, and Competitors in Group C in both phases, will be able to communicate about solving the problem in the Group forum with other Contestants in the same Group, and will be able to see the submissions made by others.  During the second phase, Competitors in Group B will be allowed to see other Contestants' Submissions from the first phase.  If viewing is permitted, submissions will available on the competition page. 
		<br><br>
		Contestants in Group C, and in the second phase Contestants in Group B, are required to maintain a contribution list in the comments at the top of their submissions, in the form of a template that will be provided, allocating the amount of contribution to their solution that they attribute to other Contestants.  
		TopCoder may, at its discretion, reject a contribution list, or modify the allocation in any way if TopCoder in its sole judgment believes that the contribution list was not completed accurately.  Completing the contribution list is a requirement of participation.  Contestants will not receive prizes unless they have submitted the contribution list, and Group C Contestants will not be permitted to participate in the second phase if they neglected to include a contribution list in the first phase.  
		<br><br>
		Depending on the results of the competition, Sponsors may choose to write a scientific paper that highlights the technical accomplishments in the algorithm and code for that field.  The Sponsors have stated that Contestants whose code is featured in the paper will be invited to be co-authors in the publication.
		</p>
		
		<div class="sectionHeader">HOW TO ENTER</div>
		<p align="justify">
		Competition registration takes place on <a href="http://www.topcoder.com/tc?module=MatchDetails&rd=13793">http://www.topcoder.com/tc?module=MatchDetails&rd=13793</a>.  Registration must be completed by 8:59:59 a.m. U.S. EDT on April 13, 2009.  After registration closes, Contestants will be notified by email of their Group placement, and be automatically registered for their Group.  Each Group and each phase will have a separate Marathon Match contest round, including a separate forum area which will be assigned by email.  
		</p>
		
		<div class="sectionHeader">SUBMISSION GUIDELINES</div>
		<p align="justify">
		Registered members will see a Submit option for their event. Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing.  When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly. During the submission phase, overall ranking and provisional score are the only pieces of information that will be made available. A given Contestant will only be allowed to submit once every 2 hours. Additionally, if a Contestant has a pending submission on the testing queue it must finish testing before that Contestant may submit again. 
		<br><br>
		Clicking the Test Examples button will immediately compile and place your Submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Contestants may submit test Submissions once every 15 minutes. The Contestant's rank and overall score will not be updated. 
		<br><br>
		In a Marathon Match, all Contestants are encouraged to improve their solutions and resubmit iteratively throughout the length of the submission phase. The most recent Submission is always the one that counts, so if you enter a Submission that does not score as well as a prior Submission, the most recent will still be the one that counts in the standings. Contestants may submit code written in one of the following languages: Java, C++, C#.NET, VB.NET, or Python.
		<br><br>
		During the Contest, Contestants in each Group must not communicate with Contestants in other Groups about the Contest, and also must follow the rules for communication with other Contestants who are in their Group.  For Group A during both phases and for Group B only during the first phase, all Submissions must be the Contestant's original creation, created solely by the Contestant.  In these Groups/Phases, no collaboration or use of the Submissions or ideas of other Contestants is permitted.  
		<br><br>
		For Group B during the second phase, and for Group C during both phases, Contestants can communicate with other Contestants in their Group in the Group forums, and will have access to the Submissions of other Contestants.  No communication about the problems or solutions outside of the assigned Group forum is permitted. 
		<br><br>
		Contestants must not cheat.  Unless otherwise permitted by the collaboration rules (i.e., in Group B during Phase 2 and in Group C), all ideas for any code submitted must be solely the Contestant's. Unless otherwise permitted by the collaboration rules (i.e., in Group B during Phase 2 and in Group C), Contestant's must use their own independently developed code.  In any case, Contestants shall not copy or include code from any other party other than the Contestants, including publicly available "open source" code that is or may be subject to licensing restrictions.  Your Submission may not have been entered in previous contests, nor won previous awards; Nor may your Submission have been previously published or distributed in any media; Your Submission is intended for a family audience and must, in the sole and unfettered discretion of the TopCoder, be suitable for a general audience. 
		<br><br>
		The content of the Submission must not be subject to the rights of any third parties, other than TopCoder, Sponsor and/or their licensors. Submissions may not promote third party products or services, or incorporate third party intellectual property (unless otherwise permitted by the collaboration rules), including, but not limited to copyright protected software, images, characters, logos, names and trademarks.  The Submission may not be offensive or otherwise unsuitable for use, as determined in TopCoder's sole discretion.  TopCoder shall not be responsible for reviewing Submissions that are unworkable for any reason.  
		<br><br>
		As a condition of participating in this Contest and by submitting an entry(ies), each Contestant agrees to permit TopCoder to describe, publicize, and link to your Submission for public viewing. By participating in the Contest, you are granting TopCoder: (1) The right to place links to your Submission for download/viewing on the Contest web site. (2) The right to host your Submission on the Contest web site and other web sites of TopCoder's choosing. A Contestant may terminate participation in the Contest prior to announcement of the winners upon written notice to TopCoder.
		</p>
		
		<div class="sectionHeader">OWNERSHIP AND RIGHTS</div>
		<p align="justify">
		As a condition of participation, all Competitors hereby grant a perpetual, royalty-free, irrevocable, non-exclusive license to TopCoder and the Sponsors (a) to use, reproduce and publish such Submissions or material in connection with the Contest; (b) to permit TopCoder, Sponsors, and other Contestants to copy, modify, prepare derivative works of, make and use your Submissions in their Submissions and in the Group forums as permitted in these Rules, with the understanding that your Submissions, portions of your Submissions, or derivative works of your Submissions may be part of the winning Submission; (c) to publicly display, and/or feature your Submission and all its content in connection with the promotion of this Contest in all media (now known or later developed); and (d) store your Submission on TopCoder or the Contest's TopCoder's servers, for marketing purposes, and/or for the promotion of the Contest.  You agree to sign any necessary documentation that may be required by TopCoder or its designees to make use of the rights you granted above. 
		<br><br>
		As a condition of participation, Contestants agree that all Submissions will be licensed for use and/or assigned to TopCoder for unrestricted use by TopCoder and the Sponsor to the extent that they are or are incorporated into winning Submissions.  Contestants agree to assign, grant, transfer, and set over to, TopCoder upon request all right, title and interest throughout the world, along with any and all copyright, patent, trade secret, moral right, and other intellectual property rights, in and to such Submissions. To the extent any rights in a Submission are not assigned or assignable, each Contestant grants and agrees to grant to TopCoder under any and all such rights an irrevocable, paid-up, royalty free, perpetual, exclusive, sublicensable (directly or indirectly through multiple tiers), transferable, and worldwide license to use and permit others to use such Submission in any manner desired by TopCoder (and/or the Sponsors) without restriction or accounting to competitor, including, without limitation, the right to make, have made, sell, offer for sale, use, rent, lease, import, copy, prepare derivative works, publicly display, publicly perform, and distribute all or any part of such Submission and modifications and combinations thereof and to sublicense (directly or indirectly through multiple tiers) or transfer any and all such rights. Further, each Contestant waives and agrees to waive in favor of TopCoder any moral right or other right or claim that is contrary to the intent of a complete transfer of rights to TopCoder.  Contestants agree to promptly execute such documents and perform such acts as TopCoder may reasonably require to perfect TopCoder's entire right, title, and interest in and to each and every Covered Submission as defined in the Assignment 2.0 document.  Contest winners must submit TopCoder's Assignment 2.0 document prior to payment.  
		<br><br>
		For winning submissions, code designated in code comments as "Library Code" will not be assigned, but will be licensed under the non-exclusive license above. The Library Code designation is for code that was written by the submitter, was in substantial part written prior to the competition, and is not specific to the problem solution. It is expected that the Library Code designation will be used appropriately and in good faith. At TopCoder's sole discretion, TopCoder may disqualify a submission for abuse of the "Library Code" designation. 
		<br><br>
		At a time after the competition, which will include time for writing and submission to academic publication(s) if appropriate, the winning submissions will be released under the Apache License Version 2.0
		<br><br>
		You also understand and acknowledge that TopCoder, and/or other Contestants may have developed or commissioned materials similar or identical to your Submission and you waive any claims you may have resulting from any similarities to your Submission.  Nothing in these Rules shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights they may have in any patents, copyrights, trademarks, service marks or any trade secrets) or in TopCoder's web site, by implication, estoppel or otherwise, except as expressly set forth herein.
		</p>
		
		<div class="sectionHeader">SUBMISSION DEADLINES</div>
		<p align="justify">
		The Contest Period is divided into two phases, namely one phase ending 12:59:59 p.m. U.S. EDT on April 20, 2009 and a second phase ending on 1:59:59 on April 27, 2009.  During each phase, all Submissions submitted will be judged for performance.  Each Contest phase is an independent event.  Being chosen a winner or runner-up in one Contest phase is not a prediction of your score and/or results in any subsequent phase.  
		<br><br>
		All Submissions will be judged according to the judging criteria below. After each phase, TopCoder will announce and display each phase winner and runners-up by handle. 
		</p>
		
		<div class="sectionHeader">JUDGING CRITERIA</div>
		<p align="justify">
		All Submissions will be judged according to the criteria provided in the problem statement.  In addition, in Group B and Group C, all Contestants' Submissions will be judged by the other Contestants in that Group, as described further below.  
		<br><br>
		A trip to the TopCoder Open 2009 will be awarded to one winner of Group A, and one winner in each of Group B and Group C.  The Group A TCO trip winner will be determined based on performance score.  The Group B and Group C TCO trip winner will be the Contestant in each respective Group with the highest average ranking in Phase 2 of (i) individual results and (ii) contribution list results.  
		<br><br>
		In Group B in phase 2, and in Group C in both phases, Contestants will complete a contribution list in their submissions attributing contributions to their Submission made by other Contestants, for example, from discussions in the forums, or from review of other Contestants' submissions.  The attributions from the 5 submissions with the highest performance score will be totaled to obtain a contribution list score.  The contestants with the highest contribution list scores will be the contribution list result winners.  If more than 5 submissions have the same highest performance score, the contribution list from all of those submissions will be used. 
		<br><br>
		In the unlikely event of a tie in the award of a prize, the sum of the prize money for all tied positions will be distributed equally among the tied Contestants.  With respect to the TCO trips, the highest phase 2 contribution list score, the highest phase 2 performance score, the highest phase 1 contribution list score (if applicable for that Group), the highest phase 1 performance score, and the highest Marathon Match rating will be used to break the tie, in that order. 
		<br><br>
		All judges' decisions are final and binding in all respects.  
		</p>
		
		<div class="sectionHeader">PRIZES</div>
		<p align="justify">
		Cash prizes and trips to the TopCoder Open 2009 will be awarded as follows:
		
		<table class="bodyText" cellspacing="0" cellpadding="0" border="1">
			<tr>
				<td class="bodyText" align="center"><b>Group</b></td>
				<td class="bodyText" align="center"><b>Summary</b></td>
				<td class="bodyText" align="center"><b>Phase One Prizes</b></td>
				<td class="bodyText" align="center"><b>Phase Two Prizes</b></td>
			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group A</td>
				<td class="bodyText" align="left" valign="top">Performance Prizes in both Phases</td>
				<td class="bodyText" align="left" valign="top">
					$400 to highest scoring submission.<br>
					$250 to the second highest scoring submission.<br>
					$200 to the third highest scoring submission.<br>
					$100 to the fourth highest scoring submission.<br>
					$50 to the fifth highest scoring submission.
				</td>
				<td class="bodyText" align="left" valign="top">
					$400 to highest scoring submission.<br>
					$250 to the second highest scoring submission.<br>
					$200 to the third highest scoring submission.<br>
					$100 to the fourth highest scoring submission.<br>
					$50 to the fifth highest scoring submission.<br><br>
					TCO trip to highest scoring submission in Phase 2.
				</td>
			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group B</td>
				<td class="bodyText" align="left" valign="top">Performance Prizes during Phase 1 <br><br>
				  Performance and Collaboration Prizes during Phase 2
				</td>
				<td class="bodyText" align="left" valign="top">
					$400 to highest scoring submission.<br>
					$250 to the second highest scoring submission.<br>
					$200 to the third highest scoring submission.<br>
					$100 to the fourth highest scoring submission.<br>
					$50 to the fifth highest scoring submission.
				</td>
				<td class="bodyText" align="left" valign="top">
					$200 to highest scoring submission.<br>
					$125 to the second highest scoring submission.<br>
					$100 to the third highest scoring submission.<br>
					$50 to the fourth highest scoring submission.<br>
					$25 to the fifth highest scoring submission.<br><br>
					
					$200 to highest total contribution list score.<br>
					$125 to the second highest total contribution list score.<br>
					$100 to the third highest total contribution list score.<br>
					$50 to the fourth highest total contribution list score.<br>
					$25 to the fifth highest total contribution list score.<br><br>
					
					TCO trip to highest average ranking based on the average in Phase 2 of (i) individual results and (ii) contribution list score results.
				</td>
			</tr>
			<tr>
				<td class="bodyText" nowrap="nowrap" align="left" valign="top">Group C</td>
				<td class="bodyText" align="left" valign="top">Performance and Collaboration Prizes during both Phase 1 and Phase 2</td>
				<td class="bodyText" align="left" valign="top">
					$200 to highest scoring submission.<br>
					$125 to the second highest scoring submission.<br>
					$100 to the third highest scoring submission.<br>
					$50 to the fourth highest scoring submission.<br>
					$25 to the fifth highest scoring submission.<br><br>
					
					$200 to highest total contribution list score.<br>
					$125 to the second highest total contribution list score.<br>
					$100 to the third highest total contribution list score.<br>
					$50 to the fourth highest total contribution list score.<br>
					$25 to the fifth highest total contribution list score.<br><br>
				</td>
				<td class="bodyText" align="left" valign="top">
					$200 to highest scoring submission.<br>
					$125 to the second highest scoring submission.<br>
					$100 to the third highest scoring submission.<br>
					$50 to the fourth highest scoring submission.<br>
					$25 to the fifth highest scoring submission.<br><br>
					
					$200 to highest total contribution list score.<br>
					$125 to the second highest total contribution list score.<br>
					$100 to the third highest total contribution list score.<br>
					$50 to the fourth highest total contribution list score.<br>
					$25 to the fifth highest total contribution list score.<br><br>
					
					TCO trip to highest average ranking based on the average in Phase 2 of (i) individual results and (ii) contribution list score results.
				</td>
			</tr>

		</table>
		<br><br>
		No prize substitution is allowed except at the discretion of TopCoder.  Contest prize winners and runners-up cannot assign or transfer their prize to another person.  If the winner of the TCO trip has already won a TCO trip, no prize will be awarded.  If a prize cannot be awarded due to circumstances beyond the control of TopCoder, a substitute prize of equal or greater retail value may be awarded.  Prizes will be awarded, subject to the limitations stated in these official rules. Any costs or fees not specifically listed herein are the responsibility of Contest winners and runners-up. Taxes, if any, are the sole responsibility of Contest winners and runners-up, and Contestants may be issued an IRS Form 1099. This Contest is void where prohibited or restricted by law, and subject to applicable federal, state provincial and local laws.
		
		</p>
		
		<div class="sectionHeader">REQUIREMENTS OF WINNER/PUBLICITY</div>
		<p align="justify">
		Contest prize winners and runners-up must provide TopCoder with the required tax forms prior to the awarding of any prize.  Winners and runners-up in the United States must provide a Taxpayer Identification Number ("TIN").  In the event of a dispute as to authorship of a Submission, TopCoder reserves the right to disqualify any Submission, Contestant, or winner or runner-up; TopCoder's eligibility decisions are final. In addition, Contest prize winners and runners-up will be required to sign and return releases of liability, declarations of eligibility, and where lawful, publicity consent agreements, within five (5) days of acknowledged notification. By agreeing to become Contest prize winners or runner-up, Contestant agrees to the use of his or her name, voice and/or likeness, and entry, for the purpose of advertising, trade, or promotion without further compensation, unless prohibited by law. If a selected Contest prize winners or runner-up cannot be contacted, is ineligible (under these rules or due to a failure to comply with any of the other applicable policies, licenses, rules, and terms of service, fails to claim a prize, or fails to timely return the completed and executed releases/agreements as required), prize may be forfeited and an alternate potential winner and/or runner-up may, at TopCoder's discretion, be selected.
		</p>
		
		<div class="sectionHeader">CONDITIONS</div>
		<p align="justify">
		Contest is subject to these Official Rules. By participating, Contestant agrees: (i) to be bound by these complete Official Rules and the decisions of TopCoder which shall be final and binding; and (ii) to waive any right to claim ambiguity in the Contest or these Official Rules, except where prohibited by law. TopCoder reserves the right to cancel or suspend the Contest, in its sole discretion, should it receive fewer than 20 entries, or due to circumstances beyond its control, including natural disasters. TopCoder may, in its sole discretion, cancel, modify or suspend the Contest should a virus, bug, computer problem, unauthorized intervention or other causes beyond TopCoder's control, corrupt the administration, security or proper play of the Contest. TopCoder may prohibit a Contestant from participating in the Contest or winning a prize if, in its sole discretion, it determines such Contestant is attempting to undermine the legitimate operation of the Contest by cheating, deception, or any other unfair playing practices of intending to annoy, abuse, threaten, undermine or harass any other Contestants or TopCoder representatives. 
		<br><br>
		By participating in the Contest, Contestant agrees that under no circumstances, including, but not limited to, negligence, shall TopCoder or its licensors, its and their respective officers, directors, employees, shareholders, agents, successors, and assigns, and all prize providers (the "Released Parties") be liable for any direct, indirect, incidental, special, or consequential damages arising out participation in the Contest, even if any or all of the Released Parties have been advised of the possibility of such damages. Some jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, therefore such exclusions may not apply to you. TopCoder and TopCoders' parent companies, affiliates, subsidiaries, licensors, advertising, promotion, and fulfillment agencies, and legal advisors, and prize providers, and the respective employees, officers, directors, shareholders, agents, and representatives of each, are not responsible for and shall not be liable for: (i) any errors in Contest-related materials, or late, lost, delayed, damaged, misdirected, stolen, incomplete, illegible, or unintelligible, notices, releases, forms, affidavits, or other correspondence; (ii) telephone, electronic, hardware or software program, network, Internet, or computer malfunctions, failures, interruptions or difficulties of any kind; (iii) failed, incomplete, garbled, or delayed computer transmissions; (iv) any condition caused by events beyond the control of the TopCoder that may cause the Contest to be disrupted or corrupted; (v) any injuries, losses, or damages of any kind arising in connection with or as a result of the prizes, or acceptance, possession, or use of the prizes, or from participation in the Contest or arising from the Contestant's access to and use of the Internet site http://www.topcoder.com, including without limitation, personal injury, death, and property damage, and claims based on publicity rights, defamation, or invasion of privacy, to the extent permitted by law; or (vi) any errors in any materials associated with the Contest. TopCoder reserves the right to cancel, suspend and/or modify the Contest if any problem corrupts the administration, security, or operation of the Contest, as determined by TopCoder in its sole discretion. TopCoder reserves the right in its sole discretion to disqualify any Contestant it finds to be tampering with the entry process or the operation of the Contest or to be acting in violation of these Official Rules or in an unsportsmanlike or disruptive manner. Any attempt by any person to undermine the legitimate operation of the Contest may be a violation of criminal and civil law, and, should such an attempt be made, TopCoder reserves the right to seek damages from any such person to the fullest extent permitted by law. TopCoder's failure to enforce any term of these Official Rules shall not constitute a waiver of that provision.
		</p>
		
		<div class="sectionHeader">PRIVACY</div>
		<p align="justify">
		<b>All Contest data will be shared with Sponsor for use in research and may be published.  Members will be identified by handle in such Contest data.</b>  All information is collected in the United States, and the use of any personally identifiable information is subject to the terms of the TopCoder Privacy Statement 
		located at: <a href="http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy">http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy</a> . By entering the Contest, the Contestant acknowledges that TopCoder will collect, process and use the personal data provided by the Contestant in connection with and for the purpose of administering of the Contest. Data about usage of the Contest also will be collected. 
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
            Competitors may submit test examples once every 15 minutes. The competitor's 
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
    <%if(rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13569 || 
	  rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 ) {%>
    <div class="sectionHeader">Prizes</div>
    <p align="justify">There will be $5000 in total prize money.  The 5 highest scorers in the round will receive prizes as follows:</p>

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

    <p align="justify">
       
    </p>

        <div class="sectionHeader">Conditions of Participation</div>

        <p align="justify">
        By participating in the competition round, you agree to be bound by these rules and to all decisions
        of TopCoder,
        which are final, binding and conclusive in all matters.
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
	     rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681 || rsr.getIntItem("round_id") == 13934) {%>
    <p align="justify">
    Competitors must not cheat; all ideas for any code submitted must be the contestant's alone. Competitors must use their own independently developed code, and shall not copy or include code from any other party, including publicly available "open source" code that is or may be subject to licensing restrictions.
    </p>
    <%} else { %>
        <p align="justify">
        Contestants must not cheat; all ideas for any code submitted must be the contestant's alone.
        </p>
    <% } %>

        <p align="justify">
        The winner in each Marathon Match will be the competitor that scores the most points across all 
        competitors who participate in that match. All decisions relating to the viability of submissions, 
        the ranking of submissions and all other matters pertaining to the competition shall be within 
        the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
        </p>

        <p align="justify">
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, 
        its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, 
        and all of their respective directors, officers, employees, representatives and agents, from and 
        against any and all liability for any loss, property damage or damage to person, including without 
        limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out 
        of participation in this Marathon Match, or participation in any competition-related activity, or 
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
          <%if(rsr.getIntItem("round_id") == 13754 || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13934) {%>

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
    The competition is open to all members who are at least 18 years of age. Competitors must be either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) a non-U.S. resident authorized to perform services as an independent contractor.
    </p>
    <p align="justify">
    To be eligible for this competition, you must not be a resident of the Quebec province of Canada, Iran, Cuba, North Korea, Sudan or Syria. In addition, you are not eligible for this Competition if you are on the Specially Designated National list promulgated and amended, from time to time, by the United States Department of the Treasury.
    </p>
    <%} else { %>
        <p align="justify">
        The competition is open to all members who are at least 13 years of age.
        </p>
    <%}%>
        <p align="justify">
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this
        page prior to
        participating in this competition between the
        <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        to
        <rsc:item name="coding_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        competition submission deadline.
        </p>

    <%if(rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681) {%>
    <p align="justify">
    Competitors must abide by the Terms of Use of TopCoder's website at www.topcoder.com.
    </p>
    <%}%>

        <p align="justify">
        Employees of TopCoder and those involved in the development, production (including 
        prize suppliers and sponsors), implementation and distribution of this tournament 
        and their advertising or promotion agencies, parent companies, service providers, 
        agents, officers, subsidiaries or affiliates, or any other persons or entities 
        directly associated with the competition and members of the immediate families 
        and/or persons living in the same household as such persons, are ineligible to 
        enter the competition. 
        </p>

    <%if(rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13569 || 
	  rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  rsr.getIntItem("round_id") == 13680 || 
	  rsr.getIntItem("round_id") == 13681) {%>
	  
    <div class="sectionHeader">Ownership and Rights</div>
    <p align="justify">
    You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property rights, in and to the information posted on TopCoder's website(s). If TopCoder compensates you for your submission, then you agree to irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, such submission, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder. If TopCoder does not compensate you for your submission, then you retain any and all rights to ownership of such material submitted to TopCoder. TopCoder will not gain ownership of this material. However, by submitting any submission or any other material to TopCoder, you hereby grant a perpetual, royalty-free, irrevocable, non-exclusive right and license to TopCoder to use, reproduce and publish such documents, materials or source code for commercial and/or non-commercial use. 
    </p>
    <p align="justify">You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely and exclusively to TopCoder from the time of their creation. To the extent any such work of authorship may not be deemed to be a work made for hire, you agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work. 
    </p>
    <p align="justify">You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed by your authorized agent. 
    </p>
    <p align="justify">Nothing in these rules and regulations shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel or otherwise, except as expressly set forth herein. 
    </p>

    <div class="sectionHeader">Confidential Information</div>

    <p align="justify">You acknowledge the confidential and proprietary nature of the information you obtain from TopCoder regarding design specifications and functionality and/or development solutions, including, but not limited to, scope documents and source code. You also acknowledge the confidential and proprietary nature of the information contained in the project postings and in the customer and developer forums on TopCoder's website(s). You also agree (i) to hold such information in confidence and to take all reasonable precautions to protect such confidential information (including, without limitation, all precautions you may employ with respect to your own confidential materials), (ii) not to divulge any such confidential information to any third person; and (iii) not to make any use whatsoever of such confidential information except as expressly authorized in these Terms. 
    </p>

    <div class="sectionHeader">Indemnification and Release</div>

    <p align="justify">By submitting design documents and/or source code in response to projects posted on TopCoder's website(s) and/or otherwise participating in forum and newsgroup discussions on TopCoder's customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of TopCoder's website(s) and/or the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that you post on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's website(s). You hereby agree to waive all laws that may limit the efficacy of such releases. 
    </p>

    <div class="sectionHeader">DISCLAIMER</div>

    <p align="justify">THE MATERIALS AND SERVICES ON TOPCODER'S WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODER'S WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODER'S WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODER'S WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU. 
    </p>
    <p align="justify">Documents, graphics and other materials appearing at TopCoder's website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk. 
    </p>

    <div class="sectionHeader">LIMITATION OF LIABILITY</div>

    <p align="justify">TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER. 
    </p>

    <div class="sectionHeader">Choice of Law and Forum</div>

    <p align="justify">These Terms are governed by the laws of the Commonwealth of Massachusetts. You hereby agree to submit to the exclusive jurisdiction of the courts of the Commonwealth of Massachusetts. To the extent that applicable laws have mandatory application to these Terms or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoder's website(s) and participation in projects posted on TopCoder's website(s) are unauthorized in any jurisdiction that does not give full effect to all provisions of these Terms. 
    </p>

    <div class="sectionHeader">Severability and Enforceability</div>

    <p align="justify">If any provision or portion of these rules and regulations are held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Terms. 
    </p>

    <div class="sectionHeader">Termination/Exclusion</div>

    <p align="justify">TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with accessing and/or participating in the projects posted on its website(s), and to take any other action it deems appropriate including but not limited to terminating or suspending your use of www.topcoder.com and/or www.topcodersoftware.com for no reason or any reason whatsoever, including improper use of its website(s) or failure to comply with these Terms or the Terms of Use of TopCoder's websites, which are incorporated herein by reference. 
    </p>
    <%}%>

        <div class="sectionHeader">Other</div>
        
        <p align="justify">
        The competition is void in whole or in part where prohibited by law. 
        </p>
        
        <p align="justify">
        A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com
        displayed for at least 3 months after the end of the competition.
        </p>

    <%if(rsr.getIntItem("round_id") == 13934 || rsr.getIntItem("round_id") == 13754  || rsr.getIntItem("round_id") == 13772 || rsr.getIntItem("round_id") == 13569 || rsr.getIntItem("round_id") == 13570 || rsr.getIntItem("round_id") == 13679 ||  
	  rsr.getIntItem("round_id") == 13680 || rsr.getIntItem("round_id") == 13681) {%>
    <p align="justify">TopCoder may assign, novate or subcontract any or all of its rights and obligations under these rules and regulations at any time.
    </p>
    <%}%>
        
        <p align="justify">
        This tournament is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.
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
