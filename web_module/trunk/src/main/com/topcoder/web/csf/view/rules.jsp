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
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
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
<h2>Connected Services Framework Mashup Service Design and Development Competitions Official Contest Series Rules</h2>
<p>
<strong>NO PURCHASE NECESSARY TO ENTER OR WIN. VOID WHERE PROHIBITED.</strong>
</p>
<h3>ELIGIBILITY</h3>
<p>
You must be a Microsoft Connected Services Sandbox (<A href="<tc-webtag:linkTracking link='http://www.networkmashups.com' refer='csf_rules'/>">www.networkmashups.com</A>) member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories. 
</p>
<p>
If you reside in the United States, you must be either: 
</p>
<ul>
<li>A US Citizen</li>
<li>A Lawful Permanent Resident of the US</li>
<li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
</ul>
<p>
If you do not reside in the United States: 
<ul>
<li>You must be authorized to perform work in your country of residence.</li>
</ul>
<p>
Employees of Microsoft Corporation ("Microsoft"), British Telecom Group PLC ("BT") and TopCoder, Inc. ("TopCoder"), their affiliated companies, advertising and promotion agencies and immediate family members of each are not eligible. All federal, state and local laws and regulations apply. Void where prohibited. 
</p>
<h3>TO ENTER</h3>
<p>
If not already a member, register for the Connected Services Sandbox electronically at <A href="<tc-webtag:linkTracking link='www.networkmashups.com/signup.aspx' refer='csf_rules'/>">www.networkmashups.com/signup.aspx</A>. Once registered at the Connected Services Sandbox, you must submit designs using the submission functionality at <A href="/">http://csf.topcoder.com</A>. Submissions must be uploaded by the End Date. Submissions received after the End Date or by any other method will not be considered. 
</p>
<h3>GENERAL CONDITIONS</h3>
<p>
By participating in the contest series, you agree to be bound by these rules, to the conditions posted on the Project Details page and to any and all subsequent changes and decisions of Microsoft or TopCoder, which are final, binding and conclusive in all matters. 
</p>
<p>
<span class="bigRed">You must not cheat. All submissions must be fully designed and authored by you solely for the purposes of this contest series.</span>
</p>
<p>
By participating in the contest series and redeeming a prize, you acknowledge and agree that if your submission is selected as the winner, you will receive a monetary award. As consideration for the monetary award, you agree to irrevocably and unconditionally transfer and assign to Microsoft (or to the sponsor at Microsoft's sole discretion) all rights to all designs and information submitted during the contest, and agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in Microsoft or the sponsor the ownership rights granted hereunder. In addition, all participants who submit designs as part of this contest agree to grant Microsoft and TopCoder a perpetual, non-expiring, royalty-free license to display the submissions on the Connected Services Framework Mashup Service Design and Development Competitions website. Neither Microsoft nor TopCoder will gain ownership of this material. 
</p>
<p>
By participating in the contest, you release and agree to hold harmless Microsoft and TopCoder, their affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the contest, or participation in any contest-related activity, or the receipt, use or misuse of a prize. Microsoft and TopCoder specifically disclaim all liability associated with, and make no warranties with regard to, any prize given. 
</p>
<p>
Microsoft and TopCoder reserve the right, in their sole discretion, to revoke any and all privileges associated with competing in the contest series, and to take any other action they deem appropriate, for no reason or any reason whatsoever, including if Microsoft or TopCoder suspect competitors of cheating, tampering with the entry process, the operation of the Web site, or the contest process, or otherwise being in violation of the rules. Microsoft and TopCoder reserve the right to cancel, terminate or modify the contest series if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. 
</p>
<h3>OTHER</h3>
<p>
The contest is void in whole or in part where prohibited by law. This contest series is brought to you by Microsoft Corporation (<A href="<tc-webtag:linkTracking link='http://www.microsoft.com' refer='csf_rules'/>">http://www.microsoft.com</A>), 205 108th Ave. NE, Bellevue, WA 98004 and TopCoder, Inc., (<A href="http://www.topcoder.com">http://www.topcoder.com</A>), 703 Hebron Avenue, Glastonbury, CT 06033.
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