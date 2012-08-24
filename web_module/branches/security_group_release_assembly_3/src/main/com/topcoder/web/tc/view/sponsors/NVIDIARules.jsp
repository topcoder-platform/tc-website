<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Sponsor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="long"/>
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
           
        <div align="center"><img src="/i/events/nvidia_logo.jpg" border="0px" alt="NVIDIA Logo" /></div>
        <br /><br />

        <p align="center">
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NVIDIAOverview">Overview</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NVIDIAInstructions">How to Compete</a>&#160;&#160;|&#160;&#160;
            Rules&#160;&#160;|&#160;&#160;
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
        </p>
        
        <p><span class="bigTitle">Official Rules &amp; Regulations</span></p>
        
        <p>No purchase necessary to enter or win. Void where prohibited.</p>
        
        <p><span class="bodySubtitle">Overview</span><br />
       The NVIDIA CUDA Superhero Challenge("Competition") will take place between September 14, 2009 and December 7, 2009. The Competition will award a total prize purse of $5,000. TopCoder members must register for the Competition.  Registration may occur at any time between the opening of registration to the deadline for submissions. All competitors who have registered for the Competition will be given access to the competition problem statement</p>
        
        <p><span class="bodySubtitle">Eligibility</span><br />
        The Competition is open to all members of the TopCoder website, who have agreed to the terms thereof, and who are at least 18 years of age as of the start date of the Competition. Competitors must be (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., (iv) a non-U.S. resident authorized in the country in which the member resides while participating in the Competition to perform services as an independent contractor; or (v) be in the United States under a valid and current visa issued by the United States government which does not prohibit receiving a cash prize.</p>
        <p>A Competitor is not eligible for the Competition if he/she is a resident of the Quebec province of Canada.  Prizes will not be paid to residents of Iran, Cuba, North Korea, Sudan or Syria. In addition, a Competitor is not eligible for the Competition if the Competitor is on the Specially Designated National list promulgated and amended, from time to time, by the United States Department of the Treasury.</p>
        <p>All Competitors must be registered members of TopCoder, and must have agreed to these Rules prior to and as a condition for registering and participating in the Competition.</p>
        <p>Competitors must abide by the Terms of Use of TopCoder's website at <a href="http://www.topcoder.com">www.topcoder.com</a>. Violation of the Terms of Use may result in disqualification from the Competition, and/or further consequences as determined in TopCoder's sole discretion.</p>
        <p>Current employees of TopCoder and NVIDIA and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of the Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Competition and members of their immediate families and/or persons living in the same household as such persons, are ineligible to enter the Competition.</p>

        <p><span class="bodySubtitle">Match Structure</span><br />
        The format of the Competition is similar to a TopCoder Marathon Match. The rules in place for such competitions as of September 1, 2009, as may be amended by the rules for this Competition, will apply to this Competition.</p>
        <p>The Competition shall consist of two phases: the Coding Phase and the System Testing Phase.</p>
        <p><em>Coding Phase</em><br />
        The Coding Phase is a timed event where all competitors are presented with the same problem statement. The criteria for scoring will be provided in the problem statement and may change in each Round. During each Round, each competitor may submit one of two types of submissions: an Example Submission or a Full Submission.</p>
		<p>Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the competitor. Each Full Submission is run against a more complete set of test cases which are unknown to the competitor and the competitor receives a provisional score only. The duration of the Coding Phase is two weeks.</p>
		
        <p><em>System Testing Phase</em><br />
        The System Testing Phase is applied to the most recent Full Submission for each competitor. During system testing, each Full Submission is run against a large number of sample cases not disclosed previously to the competitors, and is scored according to the criteria specified in the problem statement. Once the system tests are completed, competitors are ranked according to their score on the system test cases. The score a competitor's Full Submission receives is determined solely by the system testing.</p>
		<p>The winning competitor will be the competitor that scores the most points across all competitors.</p>
        
        <p><span class="bodySubtitle">Schedule</span></p>
        <table cellpadding="0" cellspacing="0" class="stat" width="90%" align="center">
            <tbody>
                <tr>
                    <td class="title" colspan="3">Schedule</td>
                </tr>
                <tr>
                    <td class="header">Competition</td>
                    <td class="header C">Registration</td>
                    <td class="header R">Deadline</td>
                </tr>
                <tr class="light">
                    <td class="value">Competition 1</td>
                    <td class="value C">September 14, 2009<br />1:00 PM EDT</td>
                    <td class="value R">September 25, 2009<br />1:00 PM EDT</td>
                </tr>
                <tr class="dark">
                    <td class="value">Competition 2</td>
                    <td class="value C">November 23, 2009<br />1:00 PM EDT</td>
                    <td class="value R">December 7, 2009<br />1:00 PM EDT</td>
                </tr>
                <tr class="light">
                    <!-- <td class="value" colspan="3">*Please note the change in Daylight Saving Time in November for deadlines.</td> -->
                </tr>
            </tbody>
        </table>
        
        <p><span class="bodySubtitle">Prizes</span><br />
        Each competition will award five (5) cash prizes to the top scorers.</p>
        <table cellpadding="0" cellspacing="0" class="stat" width="45%" align="center">
            <tbody>
                <tr>
                    <td class="header">Place</td>
                    <td class="header R">Prize</td>
                </tr>
                <tr class="light">
                    <td class="value">1st Place </td>
                    <td class="value R">$2,500</td>
                </tr>
                <tr class="dark">
                    <td class="value">2nd Place </td>
                    <td class="value R">$1,000</td>
                </tr>
                <tr class="light">
                    <td class="value">3rd Place </td>
                    <td class="value R">$750</td>
                </tr>
                <tr class="dark">
                    <td class="value">4th Place </td>
                    <td class="value R">$500</td>
                </tr>
                <tr class="light">
                    <td class="value">5th Place </td>
                    <td class="value R">$250</td>
                </tr>
            </tbody>
        </table>
        
        <p>In the event of a tied score, the tied competitors will split the award for each place. For example, if 1st and 2nd place are tied, they would both share the prizes for 1st and 2nd place. In other words, each would receive $1,750.00 (($2,500.00+$1,000.00)/2).</p>
        
        <p><span class="bodySubtitle">Conditions of Participation</span><br />
        Competitors must be registered members of TopCoder, and also register for the Competition. By participating in the Competition, you agree to be bound by these Rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. As a condition of participating in this Competition and by submitting a Submission, each Competitor agrees to permit TopCoder to describe, publicize, and link to your entry as described further below.</p>
        <p>Competitors must not cheat; all ideas for Submissions must be solely the Competitor's. Unless otherwise set forth in these Rules, Competitors may not collaborate on a Submission.</p>
        <p>IN ORDER TO BE ELIGIBLE, YOU WARRANT THAT YOUR SUBMISSION:</p>
		<ul>
			<li>Does not include or anticipate the inclusion of any unsuitable or offensive content, including nudity, sexually explicit, disparaging, libelous or other inappropriate content.</li>
			<li>Does not include or anticipate the inclusion of any content that is in violation of or infringes third party intellectual property rights including, but not limited to copyrights, including music copyrights, trademarks, and rights of publicity.</li>
			<li>Has not been entered in previous contests, or won previous awards.</li>
			<li>Has not been published or distributed previously in any media.</li>
			<li>Is suitable for a general audience;</li>
			<li>Does not contain any claims that are not and cannot be substantiated or that would be false and/or misleading to a reasonable consumer.</li>
		</ul>
        <p>All decisions relating to the viability of Submissions, the ranking of Submissions and all other matters pertaining to the Competition are within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>
		
        <p>By participating in the Competition, a winning competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition, or participation in any Competition-related activity, or the receipt, use or misuse of a prize.</p>
        <p>TopCoder reserves the right to limit the participation of any person in the Competition, amend or interpret these Rules or official communications governing the Competition or cancel the Competition for any reason with prior notice. Notices for any such amendment, interpretation or cancellation will be deemed to have been given by posting on the TopCoder website and by virtue of a Competitor's continued participation in the Competition. A Competitor may terminate participation in the Competition upon written notice to TopCoder.</p>
		<p>TopCoder and NVIDIA are not responsible for entries not received due to lost, failed, delayed or interrupted connections or miscommunications, or other electronic malfunctions, or due to lost, late, mutilated, illegible, incomplete, postage due or misdirected mailed entries. TopCoder and NVIDIA are not responsible for incorrect or inaccurate entry information, whether caused by persons entered at the web site or by any of the equipment or programming associated with or utilized in the Competition or by any human error which may occur in the processing of the entries in this Competition.</p>

        <p><span class="bodySubtitle">General Information About Prizes</span><br />
        All Prizes are listed and shall be awarded in USD. All prizes will be awarded in the Competition, provided a qualified number of Submissions are received. If a Competitor cannot or will not accept a prize, then the prize will be forfeited and may be awarded to the next highest scoring Submission.</p>
        <p>Unless otherwise provided herein, by participating in the Competition, a Competitor acknowledges and agrees that if his/her Submission is selected as a winner, the Competitor will receive a cash award only upon verification of all applicable eligibility requirements. Cash prizes will be paid out by TopCoder (or its designee) in the US in US dollars no later than 60 days following the conclusion of the Competition. Taxes, if any, are the sole responsibility of the winner(s). Prizes which remain unclaimed or undeliverable for a period of six (6) months will be forfeited.</p>
		<p>As a condition of winning and redeeming a cash prize, Competitors will be required to submit a completed (i) Affidavit of Eligibility and Liability and Publicity Release, unless a notarized copy is already on file with TopCoder and (ii) all necessary tax forms, as appropriate if one is not already on file with TopCoder.  In completing the Affidavit of Eligibility and Liability and Publicity Release, a Competitor who wins a cash prize (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (d) authorizes TopCoder to publicize the results of the Competition, (e) agrees to sign any applicable forms required by tax authorities, (f) grants TopCoder a license to all information submitted during the Competition, and (g) releases TopCoder from liability arising out of any prize won. Providing false information in the registration process or in the required forms described in this paragraph will result in a forfeiture of a cash prize.</p>
		<p>If a winning Competitor (i) does not reply to such notification or the notification is undeliverable, (ii) does not return the Affidavit of Eligibility/Liability/Publicity release completed and signed within ten (10) days of date of prize notification, or (iii) is not otherwise in compliance with these Rules, the Competitor may be disqualified and forfeit any prize, and TopCoder may, at our discretion, select and notify another Competitor.  Participatory prizes and non-cash prizes (if any) will be mailed within one month following the conclusion of the Competition via the United States Postal Service to the address provided by the Competitor in their TopCoder profile as of the conclusion of the Competition. Unclaimed or undeliverable participatory prizes will be forfeited. Competitors who do not submit the required information by the applicable deadlines forfeit their prizes. Please allow 6-12 weeks for delivery. If your prize is returned, TopCoder will resend your prize to a secondary address provided a request is made by the prizewinning Competitor. TopCoder is not responsible for lost or stolen items and will not send additional prizes in the event a prize is not received.</p>

		<p><span class="bodySubtitle">License to Submissions</span><br />
        As a condition of participation, Competitors hereby grant a perpetual, royalty-free, irrevocable, non-exclusive license to TopCoder (a) to use, reproduce and publish Submissions or material in connection with the Competition; (b) to publicly display, and/or feature your Submission and all its content in connection with the promotion of the Competition in all media (now known or later developed); and (c) store your Submission on TopCoder's servers, for marketing purposes, and/or for the promotion of the Competition. You agree to sign any necessary documentation that may be required by TopCoder or its designees to make use of the rights you granted above. You also understand and acknowledge that TopCoder, any Competition sponsor(s), and/or other Competitors may have developed or commissioned materials similar or identical to your Submission and you waive any claims you may have resulting from any similarities to your Submission.Nothing in these Rules shall be construed as granting you any right or license under any intellectual property right of TopCoder or any Competition sponsor(s) (including any rights they may have in any patents, copyrights, trademarks, service marks or any trade secrets) or in TopCoder's web site, by implication, estoppel or otherwise, except as may be expressly set forth herein.</p>

		<p><span class="bodySubtitle">Indemnification and Release</span><br />
        By submitting a Submission and/or otherwise participating in forum and newsgroup discussions on TopCoder's customer and developer forums, Competitor agrees to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from Competitor's use of TopCoder's website(s) and/or the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that Competitor posts on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, Competitor hereby releases TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that Competitor may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's website(s). Competitor hereby agrees to waive all laws that may limit the efficacy of such releases.</p>
        <p>By registering and/or participating in the Competition, the Competitor agrees to release TopCoder and any Competition sponsor(s), and its affiliates and agents, and the officers, employees, affiliates, advertising and promotions agencies, prize suppliers, and all of their employees, officers, directors, shareholder's and agents (collectively, the "Releasees") from any and all liability or any injuries, loss or damage of any kind arising from or in connection with the Competition, the use of any Submission, or the acceptance or use of any prize won, except where prohibited by law.</p>
		<p>Releasees assume no responsibility for incomplete, misdirected, damaged or illegible entries nor for any delayed Submissions or those not received for whatever reason, including without limitation due to internet or e-mail server failure, telephone, human, or other error or for any technical or other malfunctions that may occur including any injury or damage to Competitor's or any other person's computer relating to or resulting from participation in the Competition or downloading any materials during or for the Competition.</p>

		<p><span class="bodySubtitle">DISCLAIMER</span><br />
        THE MATERIALS AND SERVICES ON TOPCODER'S WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODER'S WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODER'S WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODER'S WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</p>
        <p>Documents, graphics and other materials appearing at TopCoder's website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at Competitor's own risk.</p>

		<p><span class="bodySubtitle">LIMITATION OF LIABILITY</span><br />
        TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER.</p>
       
		<p><span class="bodySubtitle">Choice of Law and Forum</span><br />
        These Rules are governed by the laws of the State of Connecticut. Competitor hereby agrees to submit to the exclusive jurisdiction of the courts of the State of Connecticut. To the extent that applicable laws have mandatory application to these Rules or give Competitor the right to bring action in any other courts, the above limitations may not apply to such Competitor. Use of TopCoder's website(s) and participation in the Competition is unauthorized in any jurisdiction that does not give full effect to all provisions of these Rules.</p>

		<p><span class="bodySubtitle">Severability and Enforceability</span><br />
        If any provision or portion of these Rules are held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Rules.</p>

		<p><span class="bodySubtitle">Privacy</span><br />
        All information is collected in the United States, and the use of any personally identifiable information is subject to the terms of the TopCoder Privacy Statement located <a href="http://www.topcoder.com/tc?module=Static&d1=about&d2=privacy">here</a>.</p>
        <p>By entering or participating in the Competition, the Competitor acknowledges that TopCoder and any Competition sponsor will collect, process and use the personal data provided by the Competitor in connection with and for the purpose of administering of the Competition, including disclosure of names and other information to third parties (e.g., hotels, travel agencies, consulates, etc...).</p>
		
		<p><span class="bodySubtitle">Termination/Exclusion</span><br />
        TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with the Competition, and to take any other action it deems appropriate including but not limited to disqualification of a Submission or terminating or suspending a Competitor's use of <a href="http://www.topcoder.com">www.topcoder.com</a> and/or <a href="http://www.topcodersoftware.com">www.topcodersoftware.com</a> for no reason or any reason whatsoever, including improper use of its website(s) or failure to comply with these Rules, or the Terms of Use of TopCoder's websites, which are incorporated herein by reference.</p>
        <p>If for any reason the Competition is not capable of running as planned due to infection by computer virus, bugs, tampering, unauthorized intervention, fraud, technical failures, uploads of malicious files or viruses, or any other causes beyond the control of TopCoder which corrupt or affect the administration, security, fairness, integrity, or proper conduct of the Competition, TopCoder reserves the right at its sole discretion, to disqualify any entry or any individual who tampers with the entry or judging process, and to cancel, terminate, modify or suspend the Competition and select winners using all eligible, non-suspect Submissions received as of the date of termination. Releasees assume no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, Submissions.</p>

		<p><span class="bodySubtitle">Other</span><br />
        The Competition is void in whole or in part where prohibited by law.</p>

		<p>A list of  winning handles for each Round will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the Competition.</p>
        <p>TopCoder may assign, novate or subcontract any or all of its rights and obligations under these Rules at any time.</p>
        <p>The Competition is brought to you by TopCoder, Inc., 95 Glastonbury Boulevard, Glastonbury, CT 06033 Telephone: (860) 633-5540</p>
        <p>If you have any questions regarding these Rules, contact us at <a href="mailto:service@topcoder.com">service@topcoder.com</a>.</p>
        <p>All trademarks, tradenames, and/or tradestyles used in the Competition are the sole property of the respective owners of such trademarks, tradenames, and/or tradestyles and are used herein solely for identification purposes.</p>
        <p>&nbsp;</p>

            </div>
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