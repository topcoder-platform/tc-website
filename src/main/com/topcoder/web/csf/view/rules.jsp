<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="rules"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Rules</span>
            </div>

<%-- add when we add assembly rules
<div align="center">
    <div style="width: 300px; border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
        <div style="margin: 5px 0px 5px 0px;">
            <strong><A href="#creative">Creative Competitions</A></strong>
            | <strong><A href="#assembly">Assembly Competitions</A></strong>
            </strong>
        </div>
    </div>
</div>
--%>

<A name="creative"></A>
<h2 align="center">CONNECTED SERVICES FRAMEWORK MASHUP SERVICE DESIGN AND DEVELOPMENT COMPETITION SERIES<br>OFFICIAL RULES</h2>
<p>
<strong>NO PURCHASE NECESSARY TO ENTER OR WIN.  A PURCHASE WILL NOT INCREASE YOUR CHANCE OF WINNING. VOID WHERE PROHIBITED.</strong>
</p>

<h3>GENERAL CONDITIONS</h3>
<p>
Registration and participation in the Connected Services Framework Mashup Service Design and Development Competition Series (the "Contest Series") or any individual Contest (as hereinafter defined) that is part of this Contest Series constitutes agreement to these terms and conditions ("Terms and Conditions" or "Official Rules") between you and TopCoder, Inc. ("TopCoder" or "Administrator"), Microsoft Corporation ("Microsoft"), and the applicable Sponsor (as hereinafter defined).  Further, this Contest Series shall be governed by the laws of the United States and the State of New York, and participants in this Contest Series hereby consent to the exclusive jurisdiction and venue of New York courts (state and federal) for any causes or controversies arising out of participation in this Contest Series.  Unless prohibited by law, each participant waives any and all objections to jurisdiction and venue in these courts.
</p>
<p>
All information is collected in the United States, and the use of any personally identifiable information is subject to the terms set forth in the Microsoft Privacy Statement located here: <A target="_blank" href="http://privacy.microsoft.com/en-us/default.aspx">http://privacy.microsoft.com/en-us/default.aspx</A>.
</p>
<p>
If you do not agree to abide by these Terms and Conditions, please do not participate in this Contest Series or any individual Contest that is a part of this Contest Series.
</p>

<h3>OVERVIEW</h3>
<p>
The Connected Services Framework Mashup Service Design and Development Competition Series (the "Contest Series") is a skill-based competition designed to encourage the development and use of technologies and provide an opportunity for members of the TopCoder and Microsoft Connected Services Framework communities to create a description of an original application utilizing specified technologies.  This Contest Series consists of separate contests, referred to individually herein as "Contests".  Each Contest may have a sponsor ("Sponsor"), which will be identified on the Details Page for the Contest.
</p>
TopCoder, Microsoft and the applicable Sponsors invite participants and participants agree to submit entries for prizes to be awarded based on the decisions of the Contest judging team in accordance with these Terms and Conditions and those set forth on the Contest Details Page.  While each Contest in this Contest Series has unique entry and performance requirements and judging criteria as specified on the Contest Details Page, the overall code of conduct for this Competition Series is governed by these Terms and Conditions.
</p>

<h3>ENTRY DEADLINES AND OTHER IMPORTANT DATES</h3> 
<p>
Registration open and closing dates and other specific deadlines vary for each Contest and are set forth on the applicable Contest Details page.  Please review the Contest Details Page for each Contest before signing up.
</p>

<h3>ELIGIBILITY</h3>
<p>
You are eligible to enter and may sign-up and compete in this Contest Series or any individual Contest if you satisfy the following requirements:
</p>

<ul>
<li>You are 18 years or older at the time of entry; and</li>
<li>You are a registered member of the Microsoft Connected Services Sandbox community in good standing.  (Those wishing to learn more about the Microsoft Connected Services Sandbox community can find more information at <A target="_blank" href="http://www.networkmashups.com">www.networkmashups.com</A>.) </li>
</ul>

<p>
You are not eligible to enter this Contest Series or any individual Contest if you are:
</p>

<ul>
<li>Employed by TopCoder, Microsoft, or the applicable Sponsor or any of their respective parent companies, affiliates, subsidiaries, participating vendors or advertising or promotion agencies, or anyone working directly on this program, product and promotion.  Notwithstanding the foregoing, employees of British Telecommunications, plc, or any of its affiliates, subsidiaries, or any other company which may be part of the same group (as defined by s.53 Companies Act) as British Telecommunications, plc (collectively the "BT Group") are eligible to participate in the Contest, but are NOT ELIGIBLE to win prizes or collect Placement Points.;</li>
<li>An immediate family member of (i.e., parent, sibling, spouse, child), or living in the same household as, any person described in the group described above (including BT Group) at the time of entry; or</li>
<li>A resident of the Province of Quebec, Canada, or any of the following countries: Cuba, Iran, Iraq, North Korea, Sudan, and Syria.</li>
</ul>

<p>
All federal, state and local laws and regulations apply. Void where prohibited.
</p>

<h3>HOW TO ENTER</h3>

<p>
For purpose of this Contest Series, each original design for an application that you create and submit will be called an "entry".  To submit an entry, you must first be a member of the Microsoft Connected Services Sandbox community for which you may register at <A target="_blank" href="http://www.networkmashups.com/signup.aspx">www.networkmashups.com/signup.aspx</A>. Once registered, you must submit your entry(ies) using the submission functionality at <A target="_blank" href="/">http://csf.topcoder.com</A>.  Your entry(ies) must be uploaded by the End Date specified for the Contest on the Contest Details Page.  If your entry(ies) is received after the End Date or by any other method, it will be disqualified. 
</p>

<h3>ENTRY LIMITATIONS</h3>

<p>
Entry limitations vary by Contest; please see the Contest Details Page for specific requirements.  In the event that multiple entries are submitted in a single-entry Contest, the first entry received will be considered official, and all subsequent entries will be disqualified.
</p>

<h3>GENERAL STANDARDS FOR ENTRIES </h3>

<p>
Entries submitted into this Contest Series must meet the following minimum requirements.  NOTE:  Entry requirements may vary by Contest and additional entry requirements may apply; please see the Contest Details for Specific requirements.  
</p>

<ul>
<li>Unless otherwise set forth on a Contest Details Page, the actual entry and all supporting entry materials must be in English.</li>
<li>Entrants must have created the entire entry themselves, and the right to submit it must not be restricted in any way.  Entries cannot defame or invade publicity rights or privacy of any person, living or deceased, or otherwise infringe upon any third party's personal or proprietary rights.</li>
<li>Entry must not be, in whole or in part, governed by an Excluded License. An Excluded License is any license that requires, as a condition of use, modification and/or distribution of software subject to the Excluded License, that such software and/or other software combined and/or distributed with such software be (a) disclosed or distributed in source code form; (b) licensed for the purpose of making derivative works; or (c) redistributable at no charge.</li>
<li>Entry and all supporting materials must be acceptable for all audiences and must not be or include any material or content that, in the Contest judges' sole opinions is, vulgar, offensive, or inappropriate for public viewing or presents TopCoder, Microsoft and/or the Sponsor in a negative light.</li>
</ul>

<p>
Entries that, in TopCoder's, Microsoft's, applicable Sponsor's and/or the Contest judges' sole opinions, are found to be duplicates, the result of collaborative work, infringe upon the rights of any third party, violate applicable laws or are otherwise not in compliance with these Terms & Conditions, applicable Contest Details, and/or the spirit of this Contest Series, will be disqualified.  By registering for this Contest Series and/or submitting an entry, Participants agree that the decisions of TopCoder, Microsoft, applicable Sponsors and the Contest judges are final and binding in all matters related to this Contest Series and each individual Contest.
</p>

<h3>IMPORTANT INFORMATION ABOUT YOUR ENTRY</h3>

<p>
By submitting an entry, you warrant that it, including all its content and any associated materials, is original, that you are the creator and owner of the submitted entry, that you have the unencumbered right to submit the entry, that it does not infringe any proprietary, intellectual property, personal rights or other third party rights including copyright, trademark, patent, trade secret or confidentiality obligation and is in compliance with all applicable laws.
</p>
<p>
By submitting an entry, you agree that you are granting an irrevocable, royalty free, fully paid up, worldwide license to TopCoder, Microsoft (and to the Sponsor, at Microsoft's sole discretion) and their designees to use, review, assess, test and otherwise analyze your entry, all its content and any associated materials in connection with this Contest Series; provided, however, that your participation in this Contest Series and grant of these rights does not confer any license or rights in the intellectual property of TopCoder, Microsoft, or the Sponsor.  Also by submitting any entry, you are giving TopCoder, Microsoft (and to the Sponsor, at Microsoft's sole discretion) and their designees permission to feature your entry, all its content and any associated materials in any medium including, but not limited to, website, television, radio and/or printed materials as necessary to administer and execute the Contest and to promote the Contest Series and TopCoder's, Microsoft's and the Sponsor's products.  You acknowledge that you will not receive any compensation or credit for use of your entry, other than what is described in these Official Rules.  
</p>
<p>
Participants agree to be bound by all applicable terms and conditions governing access to TopCoder's, Microsoft's, the Sponsor's or any other third party's services.  All technologies and Contest Series related functionality, media and promotional materials are the intellectual property of TopCoder, Microsoft, or the Sponsor and are protected by applicable copyright, trademark, patent and related proprietary laws.
</p>
<p>
Unless otherwise provided herein, by participating in this Contest Series, you acknowledge and agree that others, including Microsoft and the Sponsor, may independently develop applications with similar function, appearance, action, name, character, or that may in other ways resemble your contest entry, and that such similarity between your submitted entry and any other application independently developed by others shall in no way, other than if your entry is a winning entry, entitle you to any compensation from TopCoder, Microsoft, the Sponsor, or any third party.
</p>

<h3>PRIZE CONDITIONS & OBLIGATIONS</h3>
<p>
All prizes will be awarded, provided a qualified number of entries are received.  If a winner cannot or will not accept a prize, then the prize will be forfeited and awarded to the next highest scoring entry.
</p>
<p>
By participating in this Contest Series, you acknowledge and agree that if your submission is selected as a winner, you will receive a cash award, subject to verification of all applicable eligibility requirements.  All prize values are stated in US dollars. Cash prizes will be paid out by TopCoder (or one of its subsidiaries) in the US in US dollars no later than 60 days following prize announcement.  Taxes, if any, are the sole responsibility of the winner(s).
</p>
<p>
As consideration for the monetary award, you agree to irrevocably and unconditionally transfer and assign to TopCoder, Microsoft (or to the Sponsor at Microsoft's sole discretion) all rights to all designs and information submitted during the Contest, and agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder, Microsoft or the Sponsor the ownership rights granted hereunder.  You waive any right to inspect or approve TopCoder's, Microsoft's or the Sponsor's use or modification of your winning entry, as well as any obligation to provide you with any additional payment or compensation, attribution or accounting. Following receipt of the monetary award associated with the winning entry, winners agree that in no event shall they have the right to enjoin or prevent the production, distribution, exhibition, use, advertising or promotion of the submission, Sponsor technology or related and or derivative applications or products.
</p>

<h3>LIMITATIONS OF LIABILITY</h3>

<p>
    By entering, you agree, where legally permitted, to release and hold harmless TopCoder, Microsoft, the Sponsors and their respective subsidiaries, affiliates, advertising and promotions agencies, prize suppliers, and all of their employees, officers, directors, shareholders and agents (collectively "Releasees") from and against any and all liability for any loss, property damage, or damage to any person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Contest Series, or participation in any Contest Series-related activity, or the receipt, use or misuse of any prize.  TopCoder, Microsoft and the Sponsors specifically disclaim all liability associated with, and make no warranties with regard to, any prize given.
</p>
<p>
Releasees assume no responsibility for lost, late, illegible, garbled or misdirected entries, or for any computer, online, telephone, human, or other error or for any technical or other malfunctions that may occur including any injury or damage to your or any other person's computer relating to or resulting from participation in this Contest Series or downloading any materials in connection with this Contest Series.
</p>
<p>
If for any reason this Contest Series or any Contest is not capable of running as planned due to infection by computer virus, bugs, tampering, unauthorized intervention, fraud, technical failures, uploads of malicious files or viruses, or any other causes beyond the control of TopCoder, Microsoft or the Sponsor which corrupt or affect the administration, security, fairness, integrity, or proper conduct of this Contest Series or any Contest, TopCoder, Microsoft and the Sponsor reserve the right at their sole discretion, to disqualify any entry or any individual who tampers with the entry or judging process, and to cancel, terminate, modify or suspend this Contest Series or any Contest and select winners using all eligible, non-suspect entries received as of the date of termination. Releasees assume no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, entries. 
</p>
<p>
If any provision of these Terms and Conditions is held to be invalid or unenforceable, all remaining provisions will remain in full force and effect. This Contest Series and each Contest is subject to and governed by the laws of the United States and the State of New York.
</p>

<h3>CONDUCT</h3>

<p>
TopCoder, Microsoft and the Sponsors reserve the right, in their sole discretion, to revoke any and all privileges associated with competing in this Contest Series, and to take any other action they deem appropriate, for no reason or any reason whatsoever, including if TopCoder, Microsoft, or a Sponsor suspect competitors of cheating, tampering with the entry process, the operation of the Web site, or the Contest process, or otherwise being in violation of the rules.  CAUTION: ANY ATTEMPT TO DELIBERATELY DAMAGE ANY WEBSITE OR UNDERMINE THE LEGITIMATE OPERATION OF THIS CONTEST SERIES OR ANY CONTEST IS A VIOLATION OF CRIMINAL AND CIVIL LAWS AND SHOULD SUCH AN ATTEMPT BE MADE, ORGANIZER RESERVES THE RIGHT TO SEEK DAMAGES TO THE FULLEST EXTENT PERMITTED BY LAW.
</p>

<h3>WINNER SELECTION, NOTIFICATION AND LISTS</h3>

<p>
If you are one of the winners, you (or, if you have not yet reached the age of legal majority in your country or state of residence, your parent or legal guardian):
</p>

<ul>
<li>will be notified by phone or by U.S. mail, overnight mail, or e-mail; and</li>
<li>may be required to sign and return an Affidavit of Eligibility/Liability/Publicity release, unless prohibited by law, within ten (10) days of date of prize notification.</li>
</ul>

<p>
Employees of BT Group are NOT ELIGIBLE to win prizes or collect Placement Points and their participation will not affect the distribution of prize money or allocation of Placement Points.
</p>

<p>
If you are a minor in the country or state in which you reside we will award the prize to your parent or legal guardian, who must sign all documents required under the Official Rules.
</p>
<p>
If you are a winner and you (i) do not reply to such notification or the notification is undeliverable, (ii) do not return the Affidavit of Eligibility/Liability/Publicity release completed and signed within ten (10) days of date of prize notification, or if you (iii) are not otherwise in compliance with these Official Rules, you will be disqualified and, we may, at our discretion, notify a runner-up.
</p>
<p>
Winners will be announced on <A target="_blank" href="/">http://csf.topcoder.com</A>.
</p>

<h3>CONTACTS</h3>

<p>
This Contest Series is brought to you by Microsoft Corporation, One Microsoft Way, Redmond WA 98052 and TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.
</p>

<%--
<div style="border-bottom: 1px solid #999999;">&nbsp;</div>
<A name="assembly"></A>
<h2>Connected Services Framework Assembly Competitions Official Contest Series Rules</h2>
<p align="center">
<strong>Coming soon</strong>
</p>
--%>
        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>