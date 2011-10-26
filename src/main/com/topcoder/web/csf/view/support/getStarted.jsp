<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp"/>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="support"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<table cellpadding="0" cellspacing="0" style="width:740px;">
<tbody>
<tr>
<td valign="top" style="padding-right: 10px;">

<div class="linkBox">
    <csf:forumLink forumID="3"/>
</div>

<h1>Getting Started</h1>

<h3>Creative and exciting projects that pay off big.</h3>
TopCoder Studio is the meeting place for clients who need creative work done and creative
people looking to compete for that work. Here's how it happens:
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step1.gif" alt="Step 1"/>
</div>
<strong>Client contacts TopCoder Studio with project</strong>:
Companies who are in need of creative work for their website or product line contact
TopCoder Studio with their project requirements and timeline. TopCoder Studio works with them to
gather the necessary information and documentation, as well as to ensure that the project fits
our consistent competition model.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step2.gif" alt="Step 2"/>
</div>
<strong>TopCoder Studio posts project as a new contest</strong>:
Once the project documentation has been completed by the client and formatted appropriately by
TopCoder Studio, it is posted on the <A href="/?module=ViewActiveContests">Contests page</A>.
All TopCoder Studio members will be alerted via email when new contests are posted.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step3.gif" alt="Step 3"/>
</div>
<strong>Browse through the posted contests</strong>:
Anyone interested in participating in TopCoder Studio can read through the Contests page - no
prior registration is necessary. If there is a contest that you think a friend, co-worker or
fellow creative type might be interested in, send them a link to the
<A href="/?module=ViewActiveContests">Contests page</A>.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step4.gif" alt="Step 4"/>
</div>
<strong>Registered TopCoder Studio members can download the full Project Specifications</strong>
:
In order to read the specifications provided by the client, you must be a registered TopCoder
Studio member. Registration is free and easy and can be completed
<A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">here</A>.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step5.gif" alt="Step 5"/>
</div>
<strong>Registered TopCoder Studio members can submit their work</strong>:
Once you've read through a Project's overview and specifications, it's time to work on your
submission. Designs can be submitted from the Contest Details page and must conform to the
requirements.
<br><br>
Members can submit more than one concept for each competition, but can only submit one concept at
a time.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step6.gif" alt="Step 6"/>
</div>
<strong>Submissions are screened</strong>:
Throughout each contest, the Contest Administrator will screen each submission to ensure that
the project's specifications are met. Participants will be notified via email if their
submission passes or fails. Failing submissions (i.e., those that do not meet the
specifications) can be modified and resubmitted prior to the contest End Date.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step7.gif" alt="Step 7"/>
</div>
<strong>Submissions that pass screening are sent to client</strong>:
All submissions that pass screening (i.e., conform to the project specifications) will be sent
to the client for their review after the contest End Date.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step8.gif" alt="Step 8"/>
</div>
<strong>Client chooses winning submission</strong>:
In most cases, it is at the client's sole discretion which submission is selected as the contest
winner. Once the client has selected a winner, the member who submitted the winning concept
will be notified via email.
<br><br>

<div style="float:left; margin: 0px 6px 4px 0px;">
    <img src="/i/layout/step9.gif" alt="Step 9"/>
</div>
<strong>Winner is compensated for their work</strong>:
In order for the winner to be compensated for their work, she/he must submit the required file or other deliverables
detailed in the Specification Document. Once TopCoder Studio receives the
required file, the winner will be paid the amount specified in the Project
Details.
<br><br>

Get started now by checking out the current <A href="/?module=ViewActiveContests">Contests</A>!
<br><br>
Questions about the process can be directed to <A href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</A>.
</td>
<td align="center" valign="top" style="padding: 0px 0px 10px 10px; margin: 0px 0px 10px 10px; border-left: 1px dashed #CCCCCC;">
    <img src="/i/layout/banner_easy.png" alt="It's easy to get started"/><br>
    <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/support/banner_register.png" alt="Register"/></A>
    <br>
    <A href="/?module=ViewActiveContests"><img src="/i/support/banner_project.png" alt="Pick a project" style="margin-top: 10px;"/></A>
    <br>
    <img src="/i/support/banner_creative.png" alt="Be creative :)" style="margin-top: 10px;"/>
    <br><br>
    <strong>Be sure to check out our<br><A href="/?module=Static&amp;d1=support&amp;d2=generalFaq">FAQ
        section</A> for more help</strong>
</td>
</tr>
</tbody>
</table>
</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>

<jsp:include page="../foot.jsp"/>

<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>