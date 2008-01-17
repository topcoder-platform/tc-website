<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Assembly Competitions</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>


<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="assembly_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<div style="float:left;padding-right:8px;"><img src="/i/development/smAOL.gif" alt="" border="0" /></div>
<div style="padding: 8px 0px 8px 0px;"><span class="bigTitle">AOL XMPP Gateway</span></div>
                  
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span>
<br><br>
<span class="bigRed">The XMPP Gateway project has been re-launched with a full timeline. All of the competition kinks have been worked out, so here is your chance to earn $30,000 and build an exciting enterprise system that could be used by millions of people.</span>
<br><br>
The XMPP Gateway provides a communication interface to the AOL Instant Messenger (AIM) platform that is compliant with eXtensible Messaging and Presence Protocol (XMPP). This allows XMPP and Jabber clients to sign on to the AIM network for instant messaging.
<br><br>
The XMPP Gateway is composed of a series of components built through the TopCoder Component Production methodology. Additionally, a set of components has been developed to utilize the AIM SDK. 
<br><br>
Specific tasks of this application include:
<ul>
<li>Signing on to AIM</li>
<li>Displaying the Buddy List/Roster</li>
<li>Managing Contacts</li>
<li>Sending and Receiving Instant Messages</li>
<li>Sharing Buddy Icons</li>
<li>Hosting and Joining Group Chat</li>
</ul>

The application does <u><b>not</b></u> include:
<ul>
<li>Streaming of Audio or Video</li>
<li>Direct Connect to other clients</li>
</ul>
All code for the application is contained within components. Teams will be responsible for configuration of the components, configuration of the application, conversion of prototype (to content templates) and evaluation/enhancement of components. 
<br><br>
These applications are to be used by a TopCoder client. All application documentation (including an assembly guide) will be available once registered. 
<br><br>
NOTE: Please see eligibility requirements below. Competitors must sign a non-disclosure agreement before being admitted into this competition. 
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of prototype conversion, component integration, and extensive unit testing to ensure correct operation.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java 1.5</li>
<li>Windows XP</li>
<li>Linux</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23729399">here</A>.<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated. Second Milestone: Marked by the completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $30,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $15,000
<br><br>

<div class="sectionHeader">Eligibility</div>
You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories.
<br><br>
If you reside in the United States, you must be either:
<ul>
<li>A US Citizen</li>
<li>A Lawful Permanent Resident of the US</li>
<li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
</ul>
If you do not reside in the United States:
<ul>
<li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li>
</ul>

<div class="sectionHeader">Timeline</div>
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Team Creation:</td><td align="right">10.25.2006</td><td align="right">10.30.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">10.25.2006</td><td align="right">11.15.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">11.15.2006</td><td align="right">11.22.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">11.22.2006</td><td align="right">11.23.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>

<%--
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: AOL XMPP Gateway">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of Assembly Competition project</li>
<li>Position desired (Team Captain or Free Agent)</li>
<li>Team you wish to work with (not necessary for Team Captains and optional for Free Agents)</li>
<li>Percentage of team earnings desired</li>
   <ul>
   <li>Note that for this competition, all team members, including the Team Captain, will receive an equal percentage of the prize money.</li>
   </ul>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: AOL XMPP Gateway">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
<br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td>
   <jsp:include page="/public_right.jsp">
       <jsp:param name="level1" value="default"/>
   </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

