<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_studio"/>
</jsp:include>
</head>

<body>

<div align="center">
   <div class="contentOut">
   <jsp:include page="../top.jsp">
       <jsp:param name="section" value="default"/>
   </jsp:include>
   <jsp:include page="../topNav.jsp">
       <jsp:param name="node" value="support"/>
   </jsp:include>
      <div class="contentIn">
         <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;" />
         <div class="contentSpacer">

      <div style="float:right; padding: 0px 0px 10px 10px; margin: 0px 0px 10px 10px; border-left: 1px dashed #CCCCCC;">
      <img src="/i/creative/home/bnr_its_easy.png" alt="It's easy to get started" /><br>
      <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/creative/home/bnr_register.png" alt="Register" /></A><br>
      <img src="/i/creative/home/bnr_be_creative.png" alt="Get Creative" style="margin-top: 10px;" /><br>
      <img src="/i/creative/home/bnr_win.png" alt="Win" style="margin-top: 10px;" />
      </div>

<h1>Getting Started</h1>
<h3>Creative and exciting projects that pay off big.</h3>
TopCoder Studio is the meeting place for clients who need creative work done and creative designers looking to compete for that work.  Here's how it happens:
<ol>
<li><strong>Client contacts TopCoder Studio with project</strong><br>
Companies who are in need of graphic design work for their website or product line contact TopCoder Studio with their project requirements and timeline.  TopCoder Studio works with them to gather the necessary information and documentation, as well as to ensure that the project fits our consistent competition model.</li>

<li><strong>TopCoder Studio posts project as a new contest on studio.topcoder.com</strong><br>
Once the project documentation has been completed by the client and formatted appropriately by TopCoder Studio, it is posted on the Active Contest page.  All TopCoder Studio members will be alerted via email when new contests are posted.</li>

<li><strong>Browse through the posted contests</strong><br>
Anyone interested in participating in TopCoder Studio can read through the Active Contest page - no prior registration is necessary.  If there is a contest that you think a friend, co-worker or fellow designer might be interested in, please send them a link to the Active Contests page.</li>

<li><strong>Registered TopCoder Studio members can download the full Project Specifications</strong><br>
In order to read the specifications provided by the client, you must be a registered TopCoder Studio member.  Registration is free and easy and can be completed here.</li>

<li><strong>Registered TopCoder Studio members can submit their design(s)</strong><br>
Once you've read through a Project's overview and specifications, it's time to work on your submission.  Designs can be submitted from the Project Details page and must conform to the requirements:
   <ul>
   <li>The submitted file must be 2MB or smaller in size.</li>
   <li>The submitted file must be a PDF.</li>
   </ul>
Members can submit more than one design for each competition, but can only submit one design at a time.
</li>
<li><strong>Submissions are screened</strong><br>
Throughout each contest, the Contest Administrator will screen each submission to ensure that the project's specifications are met.  Participants will be notified via email if their submission passes or fails.  Failing submissions (i.e., those that do not meet the specifications) can be modified and resubmitted prior to the contest End Date.</li>
<li><strong>Submissions that pass screening are sent to client</strong><br>
All submissions that pass screening (i.e., conform to the project specifications) will be sent to the client for their review after the contest End Date.</li>
<li><strong>Client chooses winning design</strong><br>
It is at the client's sole discretion which design is selected as the contest winner.  Once the client has selected a winner, the designer who submitted the winning design will be notified via email.</li>
<li><strong>Winning designer is compensated for their work</strong><br>
In order for the winning designer to be compensated for their work, she/he must submit to TopCoder Studio a vector-based file of the winning design.  Once TopCoder Studio receives the vector-based file, the winning designer will be paid the amount specified in the Project Details.  Should the client want any changes made to or additional work done for the project, the client will contact the winning designer directly and further compensation will be decided between the client and the winning designer.
</li>
</ol>
Get started now by checking out the current <A href="/?module=ViewActiveContests">Active Contests</A>!
<br><br>
Questions about the process can be directed to <A href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</A>.

            </div>
            <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="../foot.jsp"/>

        <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>