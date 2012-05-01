<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge - Rules :: Powered by TopCoder</title>


    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
</head>

<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="learnMore"/>
</jsp:include>
   <div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
        <div class="secondary-body" id="register">
        	<div class="siteBoxHalf">
        		<div style="text-align: justify;">
        			<h2>Ribbit Killer App Challenge Competition</h2>
        			
        			<h3>Official Rules &amp; Regulations</h3>
        			
        			<p class="emphasis">NO PURCHASE NECESSARY TO ENTER OR WIN, A PURCHASE WILL NOT INCREASE YOUR CHANCE OF WINNING.  VOID WHERE PROHIBITED.</p>
        			<p>Registration and participation by individuals in the Ribbit Killer App Challenge Competition (the &ldquo;Competition&rdquo;) constitutes agreement with these terms and conditions (&ldquo;Rules&rdquo; or &ldquo;Terms and Conditions&rdquo;) between you and TopCoder, Inc. (&ldquo;TopCoder&rdquo;).</p>
        			
        			<h3>About the Competition</h3>
        			
        			<h4>Entering the Competition </h4>
        			<p>This skill-based Competition is brought to you by TopCoder, Inc. and sponsored by Ribbit Corporation (Competition Sponsor). This Competition is designed to encourage the development and use of certain technologies, and provides an opportunity for members of the TopCoder Community to create software that integrates The Ribbit Open Telephony Platform into any of our five contest categories: <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media">Media, Advertising and Entertainment</a>, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">Social Networking and Communication</a>, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">Business and Productivity</a>, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a>, and <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">Wildcard</a>. This Competition is open to all participants who meet the criteria outlined herein, who register for the Competition (&ldquo;Competitors&rdquo;).</p>
        			<p>In order to participate in the Competition, you must agree to be bound by these Rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.  Competitors must be registered members of TopCoder, and also register for the Competition.  Competitors also must subscribe to the free Ribbit developer service, and agree to be bound to the Ribbit Developer Terms of Service (available at: <a href="http://developer.ribbit.com/legal/apitou/">http://developer.ribbit.com/legal/apitou/</a>) along with all documents incorporated into such terms by reference.</p>
        			
        			<p>Registration may occur at any time from 12:01 AM EDT on November 17, 2008 through 11:59PM EDT on March 12, 2009. The Competition will begin at 12:01 AM EDT on November 17, 2008 and will end at 11:59PM EDT on March 12, 2009</p>
        			
        			<h4>Submission Requirements</h4>
        			<p>All Competitors registered for the Competition will see a Submit option. Clicking the Submit link will take the Competitor to a page that will allow the Competitor to upload information about their submission to the Competition (&ldquo;Submission&rdquo;).</p>
        			<p>The requirements for submission may vary depending on the category for which the Submission is designed and submitted, so please be sure you check out the specific Category Detail page before submitting.</p> 
        			<p>Once your application is live, you may submit it to the Competition.</p>
        			
        			<div id="register">
						<ol class="sublist">
							<li>A text document containing:
								<ul class="sublist2">
									<li>Your TopCoder handle name</li>
									<li>Your unique Ribbit Developer ID</li>
									<li>The Ribbit AppID (assigned when you create a project for the contest)</li>
									<li>A title and brief overview of the application to be used as an online description</li>
									<li>The Killer App Category to which you are submitting</li>
									<li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
								</ul>
							</li>
							
							<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels)</li>
						</ol>
						<p><em>Note:</em> Please review the Category Detail page(s) for full submission guidelines.</p>
					</div>
        			
        			<p>TopCoder reserves the right to limit the participation of any person in the Competition, amend or interpret these Rules or official communications governing the Competition or cancel the Competition for any reason with prior notice. Notices for any such amendment, interpretation or cancellation will be deemed to have been given by posting on the TopCoder website and by virtue of a Competitor&rsquo;s continued participation in the Competition. A Competitor may terminate participation in the Competition upon written notice to TopCoder.</p>
        			<p>TopCoder reserves the right at any time to disqualify Submissions from the Competition where, acting in good faith, it believes there are reasonable grounds to warrant disqualification, for example, if TopCoder determines that the Submission does not provide the functionality described or required or the Submission appears to be purposely designed to circumvent the Ribbit APIs, Ribbit&rsquo;s Developer Terms of Service, or the spirit of the Competition.</p>
        			
        			<h4>How to participate</h4>
        				<ol>
        					<li>Read the Competition description document at <a href="http://killerappchallenge.ribbit.com/?module=Static&d1=learnMore">http://killerappchallenge.ribbit.com/?module=Static&amp;d1=learnMore</a></li>
        					<li>Develop your Submission. </li>
        					<li>Enter your Submission into the Competition using the functionality at <a href="http://ribbit.com/killerappchallenge">http://ribbit.com/killerappchallenge</a></li>
        					<li>Winners will be selected based on the judging criteria below. The winning Submissions will be announced on or before April 3, 2009.</li>
        				</ol>
        				
        				
					<h3>Conditions of Participation</h3>
        			<p>By participating in the Competition, you agree to be bound by these Rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.  As a condition of participating in this Competition and by submitting a Submission, each Competitor agrees to permit TopCoder and the Competition Sponsor to describe, publicize, and link to your entry as described further below. </p>
        			<p>Competitors must not cheat; all ideas for any apps submitted must be solely the Competitor's. Competitors may use commercially available and publicly available "open source" code, modules and frameworks in their applications if authorized to do so by the owners of such code, modules and frameworks, including full compliance with all license terms. Competitors also may use the Ribbit APIs/Technology and TopCoder's proprietary component catalog when developing their Submissions for the purposes of this Competition subject to the applicable terms. Competitors may not redistribute TopCoder&rsquo;s components in any form.</p>
        			<p class="emphasis">IN ORDER TO BE ELIGIBLE, YOU WARRANT THAT YOUR SUBMISSION:</p>
					
					<ul>
						<li>Does not include or anticipate the inclusion of any unsuitable or offensive content, including nudity, sexually explicit, disparaging, libelous or other inappropriate content.</li>
						<li>Does not include or anticipate the inclusion of any content that is in violation of or infringes third party intellectual property rights including, but not limited to copyrights, including music copyrights, trademarks, and rights of publicity.</li>
						<li>Has not been entered in previous contests, or has not won previous awards. </li> 
						<li>Has not been published or distributed previously in any media.</li>
						<li>Is intended for a family audience and must, in the sole and unfettered discretion of the Sponsor, be suitable for a general audience;</li>
						<li>Does not contain any claims that are not and cannot be substantiated or that would be false and/or misleading to a reasonable consumer.</li>
						<li>Does not contain or anticipate the inclusion of any commercial content that promotes any product or service other than the Competition Sponsor&rsquo;s.</li>
					</ul>

        			<p>Sponsor reserves the right to reject any Submission that it deems, in its sole discretion, to violate any of these content related requirements.  Submissions must also comply with all other representations and warranties indicated in these Rules.</p>
        			<p>At any time during the Competition, TopCoder may require a Competitor to submit a brief (less than 500 words) description of a Submission, including, but not limited to, a summary of the function and architecture of the Submission (&ldquo;Description&rdquo;).  If a Competitor cannot, will not or fails to provide the Description within 10 days of the request, then the Submission will be disqualified.</p>
        			<p>All decisions relating to the viability of Submissions, the ranking of Submissions and all other matters pertaining to the Competition are within the sole discretion of TopCoder or its designee and shall be final and binding in all respects. </p>
        			<p>By participating in this Competition, a Competitor who wins a prize releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition, or participation in any Competition-related activity, or the receipt, use or misuse of a prize. </p>
        			<p>TopCoder, in its sole discretion, reserves the right to disqualify any Competitor tampering with the entry process, the operation of the Web site, the Competition process, or who is otherwise in violation of these Rules. TopCoder reserves the right to cancel, terminate or modify the Competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. </p>
        			
        			<h3>Eligibility</h3>
        			<p>The Competition is open to all members of the TopCoder website, who have subscribed to the free Ribbit developer services and agreed to the terms thereof, and who are at least 18 years of age.  Competitors must be (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) a non-U.S. resident authorized in the country in which the member resides while participating in the competition to perform services as an independent contractor.</p>
        			<p>A Competitor is not eligible for this Competition if he/she is a resident of the Quebec province of Canada, Iran, Cuba, North Korea, Sudan or Syria.  In addition, a Competitor is not eligible for this Competition if the Competitor is on the Specially Designated National list promulgated and amended, from time to time, by the United States Department of the Treasury.</p>
        			<p>All Competitors must be registered members of TopCoder, and must have agreed to these Rules prior to and as a condition for registering for this Competition.</p>
        			<p>Competitors must abide by the Terms of Use of TopCoder's website at <a href="http://www.topcoder.com/">www.topcoder.com</a>.  Violation of the Terms of Use may result in disqualification from this Competition, and/or further consequences as determined in TopCoder&rsquo;s sole discretion.</p>
        			<p>Current employees of TopCoder and the Competition Sponsor and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Competition and members of their immediate families and/or persons living in the same household as such persons, are ineligible to enter the Competition. </p>
        			
        			<h3>Competition Schedule</h3>
        			<p>The Competition consists of a series of 3 checkpoints and a final submission deadline.</p>
        			<p>The Schedule of the Competition is as follows:</p>
        			
        			<%-- HTML Timeline
        			<div align="center" id="schedule">
        				<table border="0" cellpadding="0" cellspacing="0">
        					<tr>
        						<th>Event</th>
        						<th>Date/Time</th>
        					</tr>
        					<tr>
        						<td>Registration / Competition Start</td>
        						<td>November 17, 2008 at 12:01AM EDT</td>
        					</tr>
        					<tr>
        						<td>Checkpoint 1</td>
        						<td>January 5, 2009 at 11:59 PM EDT</td>
        					</tr>
        					<tr>
        						<td>Checkpoint 2</td>
        						<td>February 2, 2009 at 11:59 PM EDT</td>
        					</tr>
        					<tr>
        						<td>Checkpoint 3</td>
        						<td>February 23, 2009 at 11:59 PM EDT</td>
        					</tr>
        					<tr>
        						<td>Competition End</td>
        						<td>March 12, 2009 at 11:59 PM EDT</td>
        					</tr>
        				</table>
        			</div>
        			 --%>
        			 
        			<div id="timeline" align="center"><img src="/images/killerapp/killerapp_timeline.png"></div>
        			
        			<h3>Scoring</h3>
        			<p>All Submissions will be judged by the Ribbit Killer App Challenge judging team consisting of key representatives from Adobe, British Telecom, Ribbit and other industry judges.</p>
        			<p>A panel of judges will score each Submission according to specific criteria in each competition category.</p>
        			<p>The criteria for each Competition category is described in detail on each category page. The category pages are:</p>
        				<ul>
        					<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media">Media, Advertising and Entertainment</a></li>
        					<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">Social Networking and Communication</a></li>
        					<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">Business and Productivity</a></li>
        					<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a></li>
        					<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">Wildcard</a></li>
        				</ul>
        			<p>After each checkpoint, Ribbit will announce and display the checkpoint winners by handle. If there are no submissions or no submissions that meet the minimum criteria in a category, the prizes may be awarded to placewinners in another category, or may not be awarded at all, at TopCoder&rsquo;s and the judges discretion.</p>
        			
        			<h3>Submission Requirements</h3>
        			<p>All Submissions chosen as winners will be reviewed and required to pass judging prior to being declared a winning Submission.</p>
        			
        			<h3>Overall Weighted Judging Criteria</h3>
						<ul>
							<li>Innovation - 40%</li>
							<li>Usage of the Ribbit API/Rich Application Deployment - 20%</li>
							<li>Overall User Value/Usability - 20% </li>
							<li>Potential Audience Reached and Impacted - 20%</li>
						</ul>
					<p><strong>For more information on specific judging criteria, be sure to read the Category Detail page for the category to which you are submitting.</strong></p>
					
        			<p>In the event a Submission does not meet these requirements, such Submission will not be accepted. </p>
        			
        			<h3>Prizes</h3>
        			<p>Five, $15,000 Prizes will be awarded to the Killer Apps that best utilize the Ribbit Platform to captivate, innovate, and have the best overall market potential in each category. From the five category winners, one will be selected as overall winner and receive an additional $15,000 for a total of $30,000. Plus, we'll be awarding $10,000 in prizes to early submitters at three Checkpoints along the way.</p>
        			<p>All Prizes are listed and shall be awarded in USD.</p>
        			<p>All prizes will be awarded, provided a qualified number of Submissions are received. As a requirement of receiving a prize, a winning Competitor shall submit a brief (less than 500 words) description of the Submission, including, but not limited to, the Competitor&rsquo;s strategy in developing the Submission, their methodology, and the functioning of the Submission (&ldquo;Description&rdquo;).  If a Competitor cannot or will not accept a prize, or fails to provide the Description within 10 days of notification, then the prize will be forfeited and may be awarded to the next highest scoring Submission.  </p>
        			<p>Unless otherwise provided herein, by participating in this Competition, a Competitor acknowledges and agrees that if his/her Submission is selected as a winner, the Competitor will receive a cash award only upon verification of all applicable eligibility requirements. All prize values are stated in US dollars. Cash prizes will be paid out by TopCoder (or its designee) in the US in US dollars no later than 60 days following prize notification. Taxes, if any, are the sole responsibility of the winner(s).</p>
        			<p>Winning Competitors will be notified by e-mail; and may be required to sign and return an Affidavit of Eligibility/Liability/Publicity release, unless prohibited by law, within ten (10) days of date of prize notification.</p>
        			<p>If a winning Competitor (i) does not reply to such notification or the notification is undeliverable, (ii) does not return the Affidavit of Eligibility/Liability/Publicity release completed and signed within ten (10) days of date of prize notification, (iii) does not submit the Description or (iv) is not otherwise in compliance with these Rules, the Competitor will be disqualified and forfeit any prize, and TopCoder may, at our discretion, select and notify another Competitor.</p>
        			
        			<h3>Ownership and Rights</h3>
        			<p>Participants retain all ownership rights in their Submissions, subject to the licenses of any software from the TopCoder Catalog and the Ribbit APIs/Technology; provided, however, that as a condition of participation, Competitors hereby grant a perpetual, royalty-free, irrevocable, non-exclusive license to TopCoder and the Competition Sponsor (a) to use, reproduce and publish such Submissions or material in connection with the Competition; (b) to publicly display, and/or feature your Submission and all its content in connection with the promotion of this Competition in all media (now known or later developed); and (c) store your Submission on TopCoder or the Competition Sponsor&rsquo;s servers, for marketing purposes, and/or for the promotion of the Competition.  You agree to sign any necessary documentation that may be required by TopCoder or its designees to make use of the rights you granted above.  You also understand and acknowledge that TopCoder, the Competition Sponsor, and/or other Competitors may have developed or commissioned materials similar or identical to your Submission and you waive any claims you may have resulting from any similarities to your Submission.</p>
        			<p>Nothing in these Rules shall be construed as granting you any right or license under any intellectual property right of TopCoder or the Competition Sponsor (including any rights they may have in any patents, copyrights, trademarks, service marks or any trade secrets) or in TopCoder&rsquo;s or the Competition&rsquo;s Sponsor&rsquo;s web site, by implication, estoppel or otherwise, except as expressly set forth herein.</p>
        			
        			<!--  <h3>Confidential Information</h3>
        			<p>[Describe any restrictions on the APIs]</p>-->
        			
        			<h3>Indemnification and Release</h3>
        			<p>By submitting a Submission and/or otherwise participating in forum and newsgroup discussions on TopCoder's customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of TopCoder's website(s) and/or the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that you post on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's website(s). You hereby agree to waive all laws that may limit the efficacy of such releases. </p>
        			<p>By entering the Competition the Participant agrees to release TopCoder and the Competition Sponsor, and its affiliates and agents, and the officers, employees, affiliates, advertising and promotions agencies, prize suppliers, and all of their employees, officers, directors, shareholder's and agents (collectively, the "Releasees") from any and all liability or any injuries, loss or damage of any kind arising from or in connection with this Competition, the use of any entry, or the acceptance or use of any prize won, except where prohibited by law.</p>
        			<p>Releasees assume no responsibility for incomplete, misdirected, damaged or illegible entries nor for any delayed entries or those not received for whatever reason, including without limitation due to internet or e-mail server failure, telephone, human, or other error or for any technical or other malfunctions that may occur including any injury or damage to your or any other person's computer relating to or resulting from participation in this Competition or downloading any materials in this Competition.</p>
        			<p>If for any reason this Competition is not capable of running as planned due to infection by computer virus, bugs, tampering, unauthorized intervention, fraud, technical failures, uploads of malicious files or viruses, or any other causes beyond the control of TopCoder which corrupt or affect the administration, security, fairness, integrity, or proper conduct of this Competition, TopCoder reserves the right at its sole discretion, to disqualify any entry or any individual who tampers with the entry or judging process, and to cancel, terminate, modify or suspend the Competition and select winners using all eligible, non-suspect entries received as of the date of termination. Releasees assume no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, entries.</p>
        			
        			<h3>DISCLAIMER</h3>
        			
        			<p>THE MATERIALS AND SERVICES ON TOPCODER'S WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODER'S WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODER'S WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODER'S WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU. </p>
        			<p>Documents, graphics and other materials appearing at TopCoder's website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk. </p>
        			
        			<h3>LIMITATION OF LIABILITY</h3>
        			<p>TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER.</p>
        			
        			<h3>Choice of Law and Forum</h3>
        			<p>These Rules are governed by the laws of the State of Connecticut. You hereby agree to submit to the exclusive jurisdiction of the courts of the State of Connecticut. To the extent that applicable laws have mandatory application to these Rules or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoder's website(s) and participation in the Competition is unauthorized in any jurisdiction that does not give full effect to all provisions of these Rules. </p>
        			
        			<h3>Severability and Enforceability</h3>
        			<p>If any provision or portion of these Rules are held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Rules. </p>
        			
        			<h3>Privacy</h3>
        			<p>All information is collected in the United States, and the use of any personally identifiable information is subject to the terms of the TopCoder Privacy Statement located at: <a href=" http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy">http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy</a> </p>
        			<p>By entering the Competition, the Competitor acknowledges that TopCoder and the Competition Sponsor will collect, process and use the personal data provided by the Competitor in connection with and for the purpose of administering of the Competition. Data about usage of the Ribbit APIs and services will also be collected. Ribbit may use third party providers for processing purposes and Ribbit will ensure that appropriate arrangements are in place with such third parties to ensure that the security of the Competitor&rsquo;s personal data is adequately safeguarded. Competitors&rsquo; personal data will be transferred to Ribbit, located in the US. </p>
        			
        			<h3>Termination/Exclusion</h3>
        			<p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with the Competition, and to take any other action it deems appropriate including but not limited to disqualification of a Submission or terminating or suspending a Competitor&rsquo;s use of <a href="http://www.topcoder.com/">www.topcoder.com</a> and/or <a href="http://software.topcoder.com/"> www.topcodersoftware.com</a> for no reason or any reason whatsoever, including improper use of its website(s) or failure to comply with these Rules or the Terms of Use of TopCoder's websites, which are incorporated herein by reference. </p>
        			<p>If for any reason this Competition is not capable of running as planned due to infection by computer virus, bugs, tampering, unauthorized intervention, fraud, technical failures, uploads of malicious files or viruses, or any other causes beyond the control of TopCoder which corrupt or affect the administration, security, fairness, integrity, or proper conduct of this Competition, TopCoder reserves the right at its sole discretion, to disqualify any entry or any individual who tampers with the entry or judging process, and to cancel, terminate, modify or suspend the Competition and select winners using all eligible, non-suspect Submissions received as of the date of termination. Releasees assume no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, Submissions.</p>
        			<p>CAUTION: ANY ATTEMPT TO DELIBERATELY DAMAGE ANY WEBSITE OR UNDERMINE THE LEGITIMATE OPERATION OF THIS COMPETITION IS A VIOLATION OF CRIMINAL AND CIVIL LAWS AND SHOULD SUCH AN ATTEMPT BE MADE, TOPCODER RESERVES THE RIGHT TO SEEK DAMAGES TO THE FULLEST EXTENT PERMITTED BY LAW.</p>
        			
        			<h3>Other</h3>
        			<p>The Competition is void in whole or in part where prohibited by law. </p>
        			<p>A list of winners by handles for the Competition will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the Competition.</p>
        			<p>TopCoder may assign, novate or subcontract any or all of its rights and obligations under these Rules and Regulations at any time.</p>
        			
        			<p>This Competition is brought to you by TopCoder, Inc., 95 Glastonbury Boulevard, Glastonbury, CT 06033  Telephone: (860) 633-5540</p>
        			<p>If you have any questions regarding these Rules, contact us at <a href="mailto:service@topcoder.com">service@topcoder.com</a>.</p>

					<p>All trademarks, tradenames, and/or tradestyles used in this Competition are the sole property of the respective owners of such trademarks, tradenames, and/or tradestyles and are used herein solely for identification purposes.</p>
				</div>
			</div>

<jsp:include page="tcFoot.jsp"/>
</div>
</body>
</html>