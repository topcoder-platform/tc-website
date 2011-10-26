<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Competition Details</span>
            </div>
            
<div class="linkBox">
    <a href="http://csf.topcoder.com/forums?module=ThreadList&amp;forumID=6">Discuss this</a>
</div>

<div class="breadcrumb">
    <a href="/?module=Static&d1=competitions">Competitions</a>
    > <a href="/?module=Static&d1=assembly&d2=pastContests">Past Assembly Competitions</a>
    > BT Business CSF Mashup Assembly Competition
</div>

<%--
        <div align="center">
        <table class="bodyText" style="margin-top: 20px; margin-bottom: 20px; width: 320px;" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td width="100%">
                        <div class="bigRed" style="border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
                            <div style="float: right; text-align: right;">
                                $6,750.00<br>$2,500.00<br>$750.00<br>04.23.2007
                            </div>
                            <strong>
                                First:<br>
                                Second:<br>
                                Third:<br>
                                Due date:
                            </strong>
                        </div>
                    </td>
                    <td style="padding: 10px 5px 10px 20px;" align="right">
                        <a class="button" style="width: 60px;" href="/?module=SecureStatic&d1=assembly&d2=reg">Register</a>
                    </td>
                    <td style="padding: 10px 0px 10px 5px;" align="right">
                        <a class="button" style="width: 60px;" href="/?module=Static&d1=assembly&d2=orIntro">Submit</a>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <div align="center"><span class="bigRed">Prizes increased!</span></div>
--%>

<h2>Project Overview</h2>

<p align="center"><strong>A Part of the Microsoft Connected Services Framework Mashup Service Design and Development Competition Series</strong></p>

<p align="center"><strong>Official Rules (Supplemental)</strong></p>

<p><strong>NO PURCHASE NECESSARY TO ENTER OR WIN. A PURCHASE WILL NOT INCREASE YOUR CHANCE OF WINNING.  VOID WHERE PROHIBITED.</strong></p> 

<p><strong>For ELIGIBILITY, ENTRANCE and GENERAL CONDITIONS, see the <a href="/?module=Static&d1=rules ">Official Rules for the Contest Series</a>.</strong></p> 

<p><strong>Overview</strong></p>
<p>
BT Group is the largest telecommunications provider in the UK, and one of the largest communications providers globally, providing managed voice and data services to clients in over 150 countries globally. BT is undergoing a complete transformation. At the heart of this transformation is our $20 billion 21st century network (21CN) initiative. An IP-based, multi-service network, 21CN is the driver for a radical change.
</p>
<p>
BT is looking for the best mashup ideas for their ground-breaking project, code-named Web21C, which exposes a number of capabilities to developers as Web Services, allowing applications to harness the power of the networking capabilities of BT. 
</p>
<p>
A core component of BT's Web21C platform will be Microsoft's Connected Services Framework (CSF) which provides the common service capabilities (service creation, deployment, execution, and management) for Microsoft-compliant applications connecting to BT's services and network.
</p>
<p>
For this contest, you are asked to develop a prototype mashup application that was the winner of the 1st CSF Mashup Design Competition.  The prototype mashup must run in within the CSF Sandbox here: <A href="http://www.networkmashups.com">www.networkmashups.com</A>.
</p>
<p>
Mashing together BT services, Microsoft web services/technologies, <A href="http://software.topcoder.com/catalog/c_showroom.jsp?cat=5801777">TopCoder Components</A>, and third party web services and content (as long as it is free and publicly available for commercial use), you can unleash your ideas, your curiosities, and your talents towards prototyping a usable mashup.
</p>

<p><strong>Representing Your Idea</strong></p>
<p>
Your goal for this competition is to prototype the mashup idea in the Specification document below. Think like a user. 
</p>
<p>
Entries must be your original work, and must not infringe on the copyright or licenses of others. 
</p>

<p><strong>Documentation</strong></p>
<p>
Specification: <A href="/i/download/Collaborative_Logistics_Mashup.ppt">Collaborative_Logistics_Mashup.ppt</A><br>
Scorecard: <A href="/pdfs/CSF_Assembly_Scorecard.pdf">CSF_Assembly_Scorecard.pdf</A>
</p>

<h2>Payment</h2>

<p><strong>Selection of Winner</strong></p>
<p>
After the submissions are sent to BT, Microsoft and TopCoder, and carefully reviewed, winners will be chosen. Winners will be announced on May 14, 2007.
</p>
<p><strong>Prize Structure</strong></p>
<p>
The contest will award cash prizes totaling $7,500 to up to three (3) competitors, with a possibility of additional discretionary prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner(s).
</p>
<p>
In addition to the cash prize, the winner of the Business CSF Managed Network Mashup Assembly Contest will be interviewed and featured on the MSDN. 
</p>
<p><strong>Discretionary Prizes</strong></p>
<p>
BT may choose at its discretion to have more winners than the three outlined above. In such cases, the above competition terms would apply and prize monies would be determined within the above range. 
</p>
<p><strong>Final Deliverables From Winner</strong></p>
<p>
The payment will be distributed in one full installment once the final version of the winning submission has been received by TopCoder Studio. 
</p>

<p>
The winner must deliver the following final files: 
</p>

<ul>
<li>Full sources for the mashup implementation.</li>
<li>A VS.NET solution file or NAnt build script set up to fully build the mashup implementation.</li>
<li>A document in RTF format explaining how to set up any dependency services or components, and deploy the application to the CSF sandbox.
    <ul>
    <li>This document should also contain a section listing all (if any) of the TopCoder components that were used in the prototype.</li>
    </ul>
</li>
</ul>

<p><strong>
Refer to the Spec Doc for a full description of the final deliverables required from the winner. 
</strong></p>

<p><strong>
Prize 1: $6,750.00<br>
Prize 2: $2,500.00<br>
Prize 3: $750.00 
</strong></p>

<h2>Eligibility</h2>

<p>
You are eligible to enter and may sign-up and compete in this Contest Series or any individual Contest if you satisfy all of the following requirements: 
</p>

<ul>
<li>You are 18 years or older at the time of entry; and</li>
<li>You are a registered member of the Microsoft Connected Services Sandbox community in good standing. Those wishing to learn more about the Microsoft Connected Services Sandbox community can find more information at <A href="http://www.networkmashups.com">www.networkmashups.com</A>.</li>
</ul>

<p>
You are not eligible to enter this Contest Series or any individual Contest if you are:
</p>

<ul>
<li>Employed by TopCoder, Microsoft, or the applicable Sponsor or any of their respective parent companies, affiliates, subsidiaries, participating vendors or advertising or promotion agencies, or anyone working directly on this program, product and promotion;</li>
<li>An immediate family member of (i.e., parent, sibling, spouse, child), or living in the same household as, any person described in the group described above at the time of entry; or</li>
<li>A resident of the Province of Quebec, Canada, or any of the following countries: Cuba, Iran, Iraq, North Korea, Sudan, and Syria.</li>
</ul>

<p>
All federal, state and local laws and regulations apply. Void where prohibited.
</p>

<h2>Timeline</h2>

<p>
All submissions are required to be submitted by the End Date. 
</p>

<div align="center">
    <table cellpadding="4" cellspacing="0" width="250">
        <tbody>
            <tr>

                <td nowrap="nowrap" valign="top"><strong>Start Date:</strong></td>
                <td>
                    Tuesday, April 10, 2007 at 16:00 EDT
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap" valign="top"><strong>End Date:</strong></td>
                <td>

                    Monday, April 23, 2007 at 17:00 EDT
                </td>
            </tr>
        </tbody>
    </table>
</div>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>